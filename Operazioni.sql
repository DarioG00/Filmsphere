-- ***********************************************************************************************
-- Operazioni di aggiornamento delle ridondanze introdotte nelle operazioni significative
-- ***********************************************************************************************

-- ----------------------------------
-- procedura per l'aggiornamento
-- della ridondanza RatingFilm
-- ----------------------------------

DROP PROCEDURE IF EXISTS proceduraAggiornaRating;

DELIMITER $$
CREATE PROCEDURE proceduraAggiornaRating()

BEGIN

	DECLARE termine INTEGER DEFAULT 0;
	DECLARE film_attuale VARCHAR(10) DEFAULT '';
	DECLARE nuovo_rating FLOAT DEFAULT 0.5;

-- Dichiarazione cursore per scorrrere i film che si tanno aggiornando
	DECLARE scorriFilm CURSOR FOR
			SELECT Identificatore
			FROM Film;

	DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET termine = 1;

	 OPEN scorriFilm;
	 preleva: LOOP
	 		FETCH scorriFilm INTO film_attuale;
            
            IF termine = 1 THEN
				 LEAVE preleva;
			END IF;
            
			CALL calcoloRating(film_attuale, nuovo_rating);
			UPDATE Film
						 SET RatingFilm = nuovo_rating
						 WHERE Identificatore = film_attuale;
		END LOOP;

		CLOSE scorriFilm;

END $$
DELIMITER ;

-- --------------------------------------
-- Evento che aggiorna la ridondanza
-- RatingFilm 1 volta al giorno
-- --------------------------------------

DROP EVENT IF EXISTS eventoAggiornaRating;

DELIMITER $$
CREATE EVENT eventoAggiornaRating
ON SCHEDULE EVERY 1 DAY
STARTS '2024-04-09-00:00:00'
DO
BEGIN

	CALL proceduraAggiornaRating();

END $$
DELIMITER ;


-- ----------------------------------
-- procedura per l'aggiornamento
-- della ridondanza Punteggio di RatingPersonalizzato
-- ----------------------------------

DROP PROCEDURE IF EXISTS proceduraAggiornaRatingPersonalizzato;

DELIMITER $$
CREATE PROCEDURE proceduraAggiornaRatingPersonalizzato()

BEGIN

	DECLARE termine INTEGER DEFAULT 0;
	DECLARE film_attuale VARCHAR(10) DEFAULT '';
	DECLARE utente_attuale VARCHAR(10) DEFAULT '';
	DECLARE nuovo_punteggio FLOAT DEFAULT 0.5;

-- Dichiarazione cursore per scorrrere i record che si tanno aggiornando
	DECLARE scorriRating CURSOR FOR
			SELECT Film, Utente
			FROM RatingPersonalizzato;

	DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET termine = 1;

	 OPEN scorriRating;
	 preleva: LOOP
	 		FETCH scorriRating INTO film_attuale, utente_attuale;
            
            IF termine = 1 THEN
				 LEAVE preleva;
			END IF;
            
			CALL  calcoloRatingPersonalizzato (utente_attuale, film_attuale, nuovo_punteggio);
			UPDATE RatingPersonalizzato
						 SET Punteggio = nuovo_punteggio
						 WHERE Film = film_attuale AND
						 			 Utente = utente_attuale;
		
		END LOOP;

		CLOSE scorriRating;

END $$
DELIMITER ;

-- --------------------------------------
-- Evento che aggiorna la ridondanza
-- Punteggio di RatingPersonalizzato
-- 1 volta al giorno
-- --------------------------------------

DROP EVENT IF EXISTS eventoAggiornaRatingPersonalizzato;

DELIMITER $$
CREATE EVENT eventoAggiornaRatingPersonalizzato
ON SCHEDULE EVERY 1 DAY
STARTS '2024-04-09-00:00:00'
DO
BEGIN

	CALL proceduraAggiornaRatingPersonalizzato();

END $$
DELIMITER ;



-- --------------------------------------
-- Aggiornamento della ridondanza ScadenzaAbbonamento
-- --------------------------------------

DELIMITER $$

CREATE TRIGGER aggiornaScadenzaAbbonamento
AFTER INSERT ON Pagamento
FOR EACH ROW
BEGIN
	/*
		Aggiorna la scadenza di abbonamento dell'utente interessato nella tabella Utente.
	*/
	UPDATE Utente U
	SET U.ScadenzaAbbonamento = (NEW.DataPagamento + INTERVAL NEW.DurataValidita MONTH)
	WHERE U.Codice = NEW.Utente;

END$$

CREATE TRIGGER aumentaCaricoServer
AFTER INSERT ON Visualizzazione
FOR EACH ROW
BEGIN
	/*
		Aumenta il carico attuale del server (perché inizio visualizzazione) e aggiorna il record che si stava inserendo.
	*/
	DECLARE dimFile FLOAT DEFAULT 0;
    DECLARE caricoServer FLOAT DEFAULT NULL;

	SET dimFile = (
		SELECT FDF.DimensioneFile
		FROM FileDiFilm FDF
		WHERE FDF.Film = NEW.Film AND FDF.Formato = NEW.FormatoFilm
	);
    
    SET caricoServer = (
		SELECT S.CaricoAttuale
		FROM ServerCDN S
        WHERE S.Codice = NEW.ServerSorgente
    );

	UPDATE ServerCDN SCDN
	SET SCDN.CaricoAttuale = caricoServer + dimFile
	WHERE SCDN.Codice = NEW.ServerSorgente;

END$$

CREATE TRIGGER diminuisciCaricoServer
AFTER UPDATE ON Visualizzazione
FOR EACH ROW
BEGIN
	/*
		Diminuisci il carico attuale del server (perché fine visualizzazione) e aggiorna il record che si stava inserendo.
	*/
	DECLARE dimFile FLOAT DEFAULT 0;
    DECLARE caricoServer FLOAT DEFAULT NULL;

	IF NEW.IstanteFine IS NOT NULL THEN
		SET dimFile = (
			SELECT FDF.DimensioneFile
			FROM FileDiFilm FDF
			WHERE FDF.Film = NEW.Film AND FDF.Formato = NEW.FormatoFilm
		);
        
        SET caricoServer = (
			SELECT S.CaricoAttuale
			FROM ServerCDN S
			WHERE S.Codice = NEW.ServerSorgente
		);

		UPDATE ServerCDN SCDN
		SET SCDN.CaricoAttuale = caricoServer - dimFile
		WHERE SCDN.Codice = NEW.ServerSorgente;

	END IF;

END$$

DELIMITER ;



-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- OPERAZIONI SIGNIFICATIVE INDIVIDUATE
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

-- ---------------------------------
-- Operazione per il calcolo dei
-- voti degli utenti
-- ---------------------------------
DROP PROCEDURE IF EXISTS recensioniUtenti;

DELIMITER $$
CREATE PROCEDURE recensioniUtenti(IN _filmato VARCHAR(10), OUT voti_utenti_ FLOAT)
BEGIN

    DECLARE verifica INTEGER DEFAULT 0;
	
    SET verifica = (
					SELECT COUNT(*)
					FROM Recensione R INNER JOIN Utente U
						 ON R.Utente = U.Codice
					WHERE U.Critico = 0 AND
						  R.Film = _filmato
				   );
                   
	IF verifica = 0 THEN 
	   SET voti_utenti_ = 1.5;
	ELSE 
		SET voti_utenti_ = (
							   SELECT AVG(R.Voto)
							   FROM Recensione R INNER JOIN Utente U
									ON R.Utente = U.Codice
							   WHERE U.Critico = 0 AND
									 R.Film = _filmato
							  );
	 END IF;

END $$
DELIMITER ;


-- ---------------------------------
-- Operazione per il calcolo dei
-- voti della critica
-- ---------------------------------
DROP PROCEDURE IF EXISTS recensioniCritica;

DELIMITER $$
CREATE PROCEDURE recensioniCritica(IN _filmato VARCHAR(10), OUT voti_critica_ FLOAT)

BEGIN
	

    DECLARE verifica INTEGER DEFAULT 0;
	
    SET verifica = (
					SELECT COUNT(*)
					FROM Recensione R INNER JOIN Utente U
						 ON R.Utente = U.Codice
					WHERE U.Critico = 1 AND
						  R.Film = _filmato
				   );
                   
	IF verifica = 0 THEN 
	   SET voti_critica_ = 1.5;
	ELSE 
		SET voti_critica_ = (
							   SELECT AVG(R.Voto)
							   FROM Recensione R INNER JOIN Utente U
									ON R.Utente = U.Codice
							   WHERE U.Critico = 1 AND
									 R.Film = _filmato
							  );
	END IF;

END $$
DELIMITER ;


-- ---------------------------------
-- Operazione per il calcolo dei
-- premi vinti dal film e dai suoi artisti
-- ---------------------------------
DROP PROCEDURE IF EXISTS premiFilm;

DELIMITER $$
CREATE PROCEDURE premiFilm(IN _filmato VARCHAR(10), OUT totale_stelle_premi_ FLOAT)

  BEGIN


-- altre variabili utili nella funzione
    DECLARE app_premi_artisti INT DEFAULT 0;
    DECLARE app_premi_film INT DEFAULT 0;
    DECLARE totale_premi INT DEFAULT 0;

-- conteggio dei premi vinti da tutti gli artisti che hanno partecipato al film
    SET app_premi_artisti = (
							 SELECT COUNT(*)
							 FROM PremiazioneArtista PA
							 WHERE PA.Film = _filmato
							);

-- conteggio dei premi vinti dal film stesso
    SET app_premi_film = (
                          SELECT COUNT(*)
                          FROM PremiazioneFilm PF
                          WHERE PF.Film = _filmato
                         );

-- si sommano i premi per ottenere i premi totali del film
    SET totale_premi = app_premi_film + app_premi_artisti;

-- attribuizione punteggio in stelle a seconda dei premi vinti
    CASE
    	WHEN totale_premi BETWEEN 1 AND 3 THEN
    			 SET totale_stelle_premi_ = 2;
    	WHEN totale_premi BETWEEN 4 AND 6 THEN
    			 SET totale_stelle_premi_ = 3;
    	WHEN totale_premi BETWEEN 7 AND 9 THEN
    			 SET totale_stelle_premi_ = 4;
    	WHEN totale_premi > 10 THEN
    			 SET totale_stelle_premi_ = 5;
    END CASE;

  END $$
DELIMITER ;

-- ---------------------------------
-- Operazione per il calcolo della popolarità
-- degli artisti
-- ---------------------------------
DROP PROCEDURE IF EXISTS popolaritaArtisti;

DELIMITER $$
CREATE PROCEDURE popolaritaArtisti(IN _filmato VARCHAR(10), OUT totale_popolarita_ FLOAT)

BEGIN



-- variabile di appoggio
    DECLARE app_popolarita FLOAT DEFAULT 1;

-- calcolo della popolarità degli artisti in base ai premi vinti
    SET app_popolarita = (
						  SELECT COUNT(*)
							FROM PremiazioneArtista PA
							WHERE PA.Artista IN(
												 SELECT C.Artista
												 FROM Cast C
												 WHERE C.Film = _filmato
												) OR
								  PA.Artista = (
												 SELECT F.Regista
												 FROM Film F
												 WHERE F.Identificatore = _filmato
											   )
						 );

-- attribuizione del punteggio in stelle a seconda dei premi vinti
      CASE
        WHEN app_popolarita BETWEEN 1 AND 4 THEN
             SET totale_popolarita_ = 2;
        WHEN app_popolarita BETWEEN 5 AND 8 THEN
             SET totale_popolarita_ = 3;
        WHEN app_popolarita BETWEEN 9 AND 12 THEN
             SET totale_popolarita_ = 4;
        WHEN app_popolarita > 13 THEN
             SET totale_popolarita_ = 5;
        END CASE;

END $$
DELIMITER ;





-- ---------------------------------
-- Operazione per il calcolo delle stelle
-- in base al genere del film
-- ---------------------------------
DROP PROCEDURE IF EXISTS filmRapportoGenere;

DELIMITER $$
CREATE PROCEDURE filmRapportoGenere(IN _genere VARCHAR(10), IN _rating FLOAT, OUT totale_genere_ FLOAT)

BEGIN


-- variabili di appoggio
    DECLARE app_recensioni_genere FLOAT DEFAULT 1;

-- si utilizzano soltanto i voti di utenti e critica
    SET app_recensioni_genere = (
                                 SELECT AVG(R.Voto)
                                 FROM Recensione R INNER JOIN Film F
                                      ON R.Film = F.Identificatore
                                 WHERE F.Genere = _genere
								);

-- attribuizione del punteggio a seconda della media delle stelle del film e delle stelle del genere
      CASE
        WHEN (app_recensioni_genere - _rating) BETWEEN 4.9 AND 3 THEN
             SET totale_genere_ = 2;
        WHEN (app_recensioni_genere - _rating) BETWEEN 2.9 AND 1 THEN
             SET totale_genere_ = 3;
        WHEN (app_recensioni_genere - _rating) BETWEEN 0.9 AND 0 THEN
             SET totale_genere_ = 4;
        WHEN (app_recensioni_genere - _rating) < 0 THEN
             SET totale_genere_ = 5;
        END CASE;

END $$
DELIMITER ;


-- ---------------------------------
-- Operazione significativa #1
-- "Calcolo rating film."
-- ---------------------------------
DROP PROCEDURE IF EXISTS calcoloRating;

DELIMITER $$
CREATE PROCEDURE calcoloRating(IN _film VARCHAR(10), OUT _rating FLOAT)
	BEGIN
		DECLARE stelle_utenti FLOAT DEFAULT 1.5;
		DECLARE stelle_critica FLOAT DEFAULT 1.5;
		DECLARE stelle_premi_film FLOAT DEFAULT 1.5;
		DECLARE stelle_popolarita FLOAT DEFAULT 1.5;

-- calcolo della media dei voti degli utenti
		CALL recensioniUtenti(_film, stelle_utenti);

-- calcolo della media dei voti della critica
		CALL recensioniCritica(_film, stelle_critica);

-- calcolo delle stelle dei premi in base ai apremi vinti dal film
    CALL premiFilm(_film, stelle_premi_film);

-- calcolo della popolarità degli artisti in base ai premi vinti
		CALL popolaritaArtisti(_film, stelle_popolarita);

-- attribuizione del rating alla varibile in uscita
		SET _rating = (((stelle_utenti * 1.5) + (stelle_critica * 2) + (stelle_premi_film * 2.5) + (stelle_popolarita * 1)) / 7);

	END $$
DELIMITER ;

-- -----------------------------
-- Operazione significativa #2
-- "Calcolo rating film personalizzato."
-- -----------------------------
DROP PROCEDURE IF EXISTS calcoloRatingPersonalizzato;

DELIMITER $$
CREATE PROCEDURE calcoloRatingPersonalizzato(IN _utente VARCHAR(10), IN _film VARCHAR(10), OUT rating_personalizzato_ FLOAT)
	BEGIN
		DECLARE conta INT DEFAULT 0;
		DECLARE stelle_recensioni FLOAT DEFAULT 0;
		DECLARE stelle_recensioni_utenti FLOAT DEFAULT 0;
		DECLARE stelle_recensioni_critici FLOAT DEFAULT 0;
		DECLARE stelle_premi FLOAT DEFAULT 0;
		DECLARE stelle_popolarita FLOAT DEFAULT 0;
		DECLARE stelle_genere FLOAT DEFAULT 0;
		DECLARE rating_film_ass FLOAT DEFAULT 1;
		DECLARE genere_film VARCHAR(50) DEFAULT '';

		DECLARE termine INTEGER DEFAULT 0;
		DECLARE fattore_scelto VARCHAR(50) DEFAULT '';

        -- dichiarazione cursore
		DECLARE cursoreScelte CURSOR FOR
				SELECT Tipologia
				FROM Scelta
				WHERE Utente = _utente;

		-- dichiarazione dell'handler
		DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET termine = 1;

		SET genere_film = (
											 SELECT Genere
											 FROM Film
										  );

		SET rating_film_ass = (
												 	 SELECT RatingFilm
												 	 FROM Film
										 		  );


	OPEN cursoreScelte;

-- ciclo che permette di prelevare i fattori scelti
	preleva: LOOP
				FETCH cursoreScelte INTO fattore_scelto;
                
                IF termine = 1 THEN
				 LEAVE preleva;
				END IF;
                
				IF fattore_scelto = 'Recensione' THEN
					 CALL recensioniUtenti(_film, stelle_recensioni_utenti);
					 CALL recensioniCritica(_film, stelle_recensioni_critici);
					 SET stelle_recensioni = (stelle_recensioni_utenti + stelle_recensioni_critici) / 2;
					 SET conta = conta + 1;
				END IF;
				IF fattore_scelto = 'Premio' THEN
					 CALL premiFilm(_film, stelle_premi);
					 SET conta = conta + 1;
				END IF;
				IF fattore_scelto = 'Popolarità' THEN
					 CALL popolaritaArtisti(_film, stelle_popolarita);
					 SET conta = conta + 1;
				END IF;
				IF fattore_scelto = 'Genere' THEN
					 CALL filmRapportoGenere(genere_film, rating_film_ass, stelle_genere);
					 SET conta = conta + 1;
				END IF;

		END LOOP preleva;
		CLOSE cursoreScelte;

		SET rating_personalizzato_ = (stelle_recensioni + stelle_premi + stelle_popolarita + stelle_genere) / conta;

	END $$
	DELIMITER ;

-- -----------------------------
-- Operazione significativa #3
-- "Raccomandazione contenuti."
-- -----------------------------


CREATE TABLE IF NOT EXISTS ContenutiConsigliati(
													Utente VARCHAR(10) NOT NULL,
													Film VARCHAR(10) NOT NULL,
                                                    Titolo VARCHAR(100) DEFAULT '',
													PRIMARY KEY (Utente, Film)
											   )ENGINE = InnoDB DEFAULT CHARSET = latin1;


DROP PROCEDURE IF EXISTS raccomandazioneContenuti;

DELIMITER $$
CREATE PROCEDURE raccomandazioneContenuti(IN _utente VARCHAR(10))
	BEGIN

		DECLARE indirizzo_IP_attuale VARCHAR(16) DEFAULT '';
		DECLARE area_geografica_attuale VARCHAR(20) DEFAULT '';
		DECLARE genere_preferito_utente VARCHAR(20) DEFAULT '';


-- seleziono l'indirizzo ip attuale dell'utente per trovare l'area geografica in cui è l'utente
		SET indirizzo_IP_attuale = (
																SELECT IndirizzoIP
																FROM Connessione
																WHERE Utente = _utente AND
																			IstanteFine IS NULL
															 );

-- si trova l'area geografica
		SET area_geografica_attuale = (
										SELECT D.Nazione
										FROM (SELECT AG.Nazione, STRCMP(AG.MinIndirizzoIP, indirizzo_IP_attuale) AS ConfrMinIP,
																 STRCMP(AG.MaxIndirizzoIP, indirizzo_IP_attuale) AS ConfrMaxIP
													FROM AreaGeografica AG) AS D
										WHERE (D.ConfrMaxIP = 0 OR D.ConfrMaxIP = 1) AND (D.ConfrMinIP = 0 OR D.ConfrMinIP = -1)
									  );

		CALL generePreferito(_utente, genere_preferito_utente);



REPLACE INTO ContenutiConsigliati


-- CTE per selezionare i film che un utente ha visto
		WITH film_visti_utente as (
									 SELECT V.Film
									 FROM Visualizzazione V
									 WHERE V.Utente = _utente AND
												 V.IstanteFine IS NOT NULL
								  ),

-- CTE per identificare i formati non disponibili nell'area in cui è l'utente
		 formati_limitati as (
								SELECT FDF.Formato
								FROM RestrizioneFormato RFO NATURAL JOIN FileDiFilm FDF
								WHERE RFO.AreaGeografica = area_geografica_attuale
							 ),

-- CTE per selezionare i film che un utente non ha ancora visto
		 film_non_visti as (
							 SELECT F.Identificatore, F.Genere, F.Regista, F.RatingFilm, F.Titolo
							 FROM Film F
							 WHERE F.Identificatore NOT IN (
															 SELECT *
															 FROM film_visti_utente
													   )AND
							F.Identificatore NOT IN (
														SELECT RF.Film
														FROM RestrizioneFilm RF
														WHERE RF.AreaGeografica = area_geografica_attuale
												  ) AND
							F.Identificatore IN (
											 SELECT FDF.Film
											 FROM FileDiFilm FDF
											 WHERE FDF.Formato NOT IN (
																	   SELECT *
																	   FROM formati_limitati
																	 )
										 )
							 ),


-- CTE che seleziona il/i regista/i che un utente preferisce, tra i film che ha visualizzato, contando le visualizzazioni che ha fatto
		  registi_preferiti as (
								  SELECT F.Regista AS RegistaPreferito
									FROM Visualizzazione V INNER JOIN Film F
											 ON V.Film = F.Identificatore
									WHERE V.Utente = _utente
									GROUP BY F.Regista
									HAVING COUNT(V.Film) = (
															SELECT MAX(D.FilmRegistaVisti)
															FROM (
																		SELECT F2.Regista, COUNT(V2.Film) AS FilmRegistaVisti
																		FROM Visualizzazione V2 INNER JOIN Film F2
																				 ON V2.Film = F2.Identificatore
																		WHERE V2.Utente = _utente
																		GROUP BY F2.Regista
																	 ) AS D
														 )
							  )


	SELECT U.Codice, FNV.Identificatore, FNV.Titolo
	FROM film_non_visti FNV CROSS JOIN Utente U
	WHERE U.Codice = _utente AND
		  FNV.Genere = genere_preferito_utente OR
		  FNV.Regista IN(
						 SELECT RP.RegistaPreferito
						 FROM registi_preferiti RP
						) AND
		  FNV.RatingFilm >= 4;
	END $$
DELIMITER ;


-- ----------------------------------------
-- Operazione significativa #4
-- "Inserimento di una nuova recensione."
-- ----------------------------------------
DROP PROCEDURE IF EXISTS nuovaRecensione;

DELIMITER $$
CREATE PROCEDURE nuovaRecensione(IN _film VARCHAR(10), IN _utente VARCHAR(10), IN _voto FLOAT, IN _testo VARCHAR(100))
	BEGIN
		DECLARE recensione_esistente INT DEFAULT 0;
		DECLARE visione_film INT DEFAULT 0;


-- si controlla che l'utente abbia visualizzato il film almeno una volta prima di inserire la recensione
		SET visione_film = (
												SELECT COUNT(*)
												FROM Visualizzazione
												WHERE Film = _film AND
															Utente = _utente AND
															IstanteFine IS NOT NULL
											 );

-- si controlla che non ci sia già una recensione per il film dello stesso utente
		SET recensione_esistente = (
																SELECT COUNT(*)
																FROM Recensione R
																WHERE R.Utente = _utente AND
																 			R.Film = _film
															 );


		IF visione_film = 0 THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'La recensione non può essere inserita perché l\'utente non ha visionato il film';
		ELSE
		-- se non c'è si inserisce un nuovo record con i valori passati
				IF recensione_esistente = 0 THEN
					 INSERT INTO Recensione values(_film, _utente, _voto, _testo);
				ELSE
					 UPDATE Recensione
					 SET Voto = _voto,
							 Commento = _testo
					 WHERE Film = _film AND
								 Utente = _utente;
				END IF;
		END IF;


	END $$
DELIMITER ;


-- ---------------------------------------------------------------
-- Operazione significativa #5
-- "Verifica della validità dell'ultimo pagamento di un utente."
-- ---------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE verificaPagamento(IN _utente CHAR(50), OUT res_ BOOLEAN)
BEGIN
	DECLARE dataScadenzaAbb DATE DEFAULT NULL;

	SET dataScadenzaAbb = (
		SELECT U.ScadenzaAbbonamento
		FROM Utente U
		WHERE U.Codice = _utente
	);

	IF dataScadenzaAbb < CURRENT_DATE THEN
		SET res_ = TRUE;
	ELSE
		SET res_ = FALSE;
	END IF;

END$$

DELIMITER ;

-- ---------------------------------------------
-- Operazione significativa #6
-- "Calcolo del genere preferito di un utente."
-- ---------------------------------------------

DELIMITER $$

CREATE PROCEDURE generePreferito(IN _utente CHAR(50), OUT res_ CHAR(50))
BEGIN

	SET res_ = (
		SELECT D.Genere
		FROM (
			SELECT F.Genere, COUNT(*) AS NumeroRecensioni
			FROM Recensione R INNER JOIN Film F ON R.Film = F.Identificatore
			WHERE R.Voto BETWEEN 4 AND 5
			AND R.Utente = _utente
			GROUP BY F.Genere
		) AS D
		ORDER BY D.NumeroRecensioni DESC
		LIMIT 1
    );

END$$

DELIMITER ;

-- -----------------------------------------------------------------
-- Operazione significativa #7
-- "Calcolo del carico di traffico attuale di un certo server CDN."
-- -----------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE calcoloCaricoAttuale(IN _server CHAR(50), OUT caricoServer_ INTEGER)
BEGIN

	SET caricoServer_ = (
		SELECT SCDN.CaricoAttuale
		FROM ServerCDN SCDN
		WHERE SCDN.Codice = _server
	);

END$$

DELIMITER ;

-- ----------------------------------------------------------------
-- Operazione significativa #8
-- "Inserimento di una visualizzazione di un utente connesso."
-- ----------------------------------------------------------------

DELIMITER $$

CREATE TRIGGER inserimentoVisualizzazione
BEFORE INSERT ON Visualizzazione
FOR EACH ROW
BEGIN
	DECLARE serverAdatto CHAR(50) DEFAULT '';
	DECLARE formatoFilmAdatto CHAR(50) DEFAULT NULL;
	DECLARE IndirizzoIPUtente CHAR(50) DEFAULT '';
	DECLARE areaGeograficaUtente CHAR(50) DEFAULT '';
	DECLARE abbonamentoUtente CHAR(50) DEFAULT '';

	-- Lettura abbonamento attivo dell'utente
	SET abbonamentoUtente = (
		SELECT P.Abbonamento
		FROM Pagamento P
		INNER JOIN Utente U ON P.Utente = U.Codice
		WHERE U.ScadenzaAbbonamento = P.DataPagamento + INTERVAL P.DurataValidita MONTH
        LIMIT 1
	);

	-- Geolocalizzazione dell'utente
	SET IndirizzoIPUtente = (
		SELECT C.IndirizzoIP
		FROM Connessione C
		WHERE C.IstanteInizio = NEW.TSConnessioneUtente AND C.Utente = NEW.Utente
        LIMIT 1
	);

	SET areaGeograficaUtente = (
		SELECT D.Nazione
		FROM (
			SELECT AG.Nazione, STRCMP(AG.MinIndirizzoIP, IndirizzoIPUtente) AS ConfrMinIP,
							   STRCMP(AG.MaxIndirizzoIP, IndirizzoIPUtente) AS ConfrMaxIP
			FROM AreaGeografica AG
        ) AS D
		WHERE (D.ConfrMaxIP = 0 OR D.ConfrMaxIP = 1) AND (D.ConfrMinIP = 0 OR D.ConfrMinIP = -1)
        LIMIT 1
	);

	SET formatoFilmAdatto = (
		SELECT F.Codice
		FROM Abbonamento A
		INNER JOIN Video V ON A.QualitaVideo = V.Risoluzione
		INNER JOIN Formato F ON V.Nome = F.CodecVideo
		WHERE A.Nome = abbonamentoUtente AND F.Codice IN (
											SELECT FDF.Formato
											FROM FileDiFilm FDF
											WHERE FDF.Film = NEW.Film
									)
		LIMIT 1
	);
    
    IF formatoFilmAdatto IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'File di film richiesto non disponibile nella qualità offerta dall\'abbonamento utente';
    END IF;

	-- Selezione del server più adatto all'utente che ha il file di film richiesto
	CALL selezionaServerConFilm(NEW.Film, formatoFilmAdatto, areaGeograficaUtente, serverAdatto);

	-- Scrittura dei campi mancanti di una occorrenza di visualizzazione
	SET NEW.FormatoFilm = formatoFilmAdatto;
	SET NEW.ServerSorgente = serverAdatto;
END$$

DELIMITER ;
