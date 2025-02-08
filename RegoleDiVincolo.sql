-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
--  REGOLE DI VINCOLO
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

-- -------------------------------------
--  Controllo anno produzione
-- -------------------------------------
DELIMITER $$
CREATE TRIGGER ControlloProduzione
BEFORE INSERT ON Film
FOR EACH ROW
BEGIN
	/*
		Controlla che l'anno di produzione del fim che si sta inserendo
		nel database sia minore o al massimo uguale all'anno corrente.
	*/

	IF New.AnnoProduzione > YEAR(CURRENT_DATE) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Non è possibile inserire un film che ha anno di produzione maggiore dell\'anno corrente';
	END IF;

END $$
DELIMITER ;

-- -------------------------------------
--  Controllo anno premiazione
-- -------------------------------------
DELIMITER $$
CREATE TRIGGER ControlloAnnoPremiazioneFilm
BEFORE INSERT ON PremiazioneFilm
FOR EACH ROW
BEGIN
	/*
		Controlla che, quando si inserisce una nuova premiazione di un film,
		l'anno della data della premiazione sia uguale
		all'anno di produzione del film stesso.
		In caso contrario si blocca l'inserimento.
	*/
	DECLARE annoDiProduzione INTEGER DEFAULT 0;

-- Cerco l'anno di produzione del film premiato e lo salvo all'interno della variabile
	SET annoDiProduzione = (
															SELECT AnnoProduzione
															FROM Film
															WHERE Identificatore = New.Film
													);

-- Controllo che l'anno corrisponda alle regole di cui sopra
	IF (YEAR(New.Data) < annoDiProduzione) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Non è possibile premiare un film che non è stato ancora rilasciato';

	ELSEIF (YEAR(New.Data) > annoDiProduzione) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Non è possibile premiare un film in un anno diverso da quello nel quale è stato prodotto';

	END IF;

END$$
DELIMITER ;

-- -------------------------------------
--  Controllo premiazione artista per un determinato film
-- -------------------------------------
DELIMITER $$
CREATE TRIGGER ControlloPremiazioneArtista
BEFORE INSERT ON PremiazioneArtista
FOR EACH ROW
BEGIN
	/*
		Controlla che, quando si inserisce una nuova premiazione di un artista,
		quell'artista faccia parte del cast di quel film.
		In caso contrario si blocca l'inserimento.
	*/
	DECLARE annoDiProduzione INTEGER DEFAULT 0;
	DECLARE corretto INTEGER DEFAULT 0;
	DECLARE termine INTEGER DEFAULT 0;
	DECLARE comparsa VARCHAR(50) DEFAULT '';

	-- dichiarazione cursore
				DECLARE cursoreCast CURSOR FOR
								SELECT Artista
								FROM Cast
								WHERE Film = New.Film;

	-- dichiarazione dell'handler
				DECLARE CONTINUE HANDLER
				 		FOR NOT FOUND SET termine = 1;

	SET annoDiProduzione = (
															SELECT AnnoProduzione
															FROM Film
															WHERE Identificatore = New.Film
													);

	IF (YEAR(New.Data) < annoDiProduzione) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Non è possibile premiare un film che non è stato ancora rilasciato';

  ELSEIF (YEAR(New.Data) > annoDiProduzione) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Non è possibile premiare un film in un anno diverso da quello nel quale è stato prodotto';

  END IF;

			OPEN cursoreCast;

-- ciclo che permette di prelevare le comparsate dell'attore
			preleva: LOOP
					FETCH cursoreCast INTO comparsa;

                    IF termine = 1 THEN
                    LEAVE preleva;
                    END IF;

					IF New.Artista = comparsa THEN
							SET corretto = 1;
							LEAVE preleva;
					END IF;
			END LOOP preleva;
			CLOSE cursoreCast;

-- condizione di inserimento del record nel database
			IF corretto = 0 THEN
					SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Questo attore non fa parte del cast del film';
			END IF;

END$$
DELIMITER ;

-- -------------------------------------
--  Controllo voto inserito in recensione
-- -------------------------------------
DELIMITER $$
CREATE TRIGGER ControlloVoto
BEFORE INSERT ON Recensione
FOR EACH ROW
BEGIN
	/*
		Controlla che il voto inserito dall'utente sia compreso tra 0.5 e 5.
	*/

	IF New.Voto < 0.5 OR New.Voto > 5 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Il voto inserito non è valido';
	END IF;

END$$
DELIMITER ;


-- -------------------------------------
--  Controllo valori inseriti in Audio
-- -------------------------------------
DELIMITER $$
CREATE TRIGGER SettaggioAudio
BEFORE INSERT ON Audio
FOR EACH ROW
BEGIN
	/*
		Inserisce i valori corretti nella tabella Audio
	*/

    IF (New.Nome <> 'WAV') AND (New.Nome <> 'MP3') AND (New.Nome <> 'AAC') AND (New.Nome <> 'WMA') AND (New.Nome <> 'AIFF') AND (New.Nome <> 'DolbyDigital')
		  AND (New.Nome <> 'DolbyTrueHD') AND (New.Nome <> 'DTSDigitalSurround') THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Il tipo audio inserito non è valido';
	END IF;

	IF New.Nome = 'WAV' THEN
		SET New.Bitrate = 1.411;
		SET New.FattoreCompressione = 0.12;
	END IF;

	IF New.Nome = 'AIFF' THEN
		SET New.Bitrate = 1.411;
		SET New.FattoreCompressione = 0.118;
	END IF;

	IF New.Nome = 'MP3' THEN
		SET New.Bitrate = 0.32;
		SET New.FattoreCompressione = 0.122;
	END IF;

	IF New.Nome = 'AAC' THEN
		SET New.Bitrate = 0.32;
		SET New.FattoreCompressione = 0.125;
	END IF;

	IF New.Nome = 'WMA' THEN
		SET New.Bitrate = 0.128;
		SET New.FattoreCompressione = 0.123;
	END IF;

	IF New.Nome = 'DolbyDigital' THEN
		SET New.Bitrate = 0.54;
		SET New.FattoreCompressione = 0.11;
	END IF;

	IF New.Nome = 'DolbyTrueHD' THEN
		SET New.Bitrate = 15;
		SET New.FattoreCompressione = 0.11;
	END IF;

	IF New.Nome = 'DTSDigitalSurround' THEN
		SET New.Bitrate = 1.5;
		SET New.FattoreCompressione = 0.12;
	END IF;


END$$
DELIMITER ;




-- -------------------------------------
--  Controllo valori inseriti in Video
-- -------------------------------------
DELIMITER $$
CREATE TRIGGER SettaggioVideo
BEFORE INSERT ON Video
FOR EACH ROW
BEGIN
	/*
		Inserisce i valori corretti nella tabella Video
	*/

	IF (New.Nome <> 'H.264') AND (New.Nome <> 'H.265') AND (New.Nome <> 'VP9') AND (New.Nome <> 'AV1') THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Il tipo video inserito non è valido';
	END IF;

    IF New.Nome = 'H.264' THEN
		SET New.Bitrate = 8;
		SET New.Risoluzione = '720p';
		SET New.FattoreCompressione = 0.083;
	END IF;

	IF New.Nome = 'H.265' THEN
		SET New.Bitrate = 10;
		SET New.Risoluzione = '1080p';
		SET New.FattoreCompressione = 0.067;
	END IF;

	IF New.Nome = 'VP9' THEN
		SET New.Bitrate = 30;
		SET New.Risoluzione = '2K';
		SET New.FattoreCompressione = 0.06;
	END IF;

	IF New.Nome = 'AV1' THEN
		SET New.Bitrate = 40;
		SET New.Risoluzione = '4K';
		SET New.FattoreCompressione = 0.07;
	END IF;


END$$
DELIMITER ;



DELIMITER $$
-- "La durata di validità di un pagamento effettuato da un utente può essere solo di 1, 3, 6, 12 mesi."
CREATE TRIGGER regolaDiVincoloDurataValidita
BEFORE INSERT ON Pagamento
FOR EACH ROW
BEGIN
	IF ((NEW.DurataValidita <> 1) AND (NEW.DurataValidita <> 3) AND (NEW.DurataValidita <> 6) AND (NEW.DurataValidita <> 12)) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: la durata di validità di un pagamento può essere solo di 1, 3, 6, 12 mesi.';
	END IF;
END$$
DELIMITER ;

DELIMITER $$
-- "Quando l’abbonamento di un utente è scaduto, l’utente non può più richiedere visualizzazioni di film."
CREATE TRIGGER regolaDiVincoloScadenzaAbbonamento
BEFORE INSERT ON Visualizzazione
FOR EACH ROW
BEGIN
	DECLARE pagamentoScaduto BOOLEAN DEFAULT FALSE;

	CALL verificaPagamento(NEW.Utente, pagamentoScaduto);

	IF (pagamentoScaduto IS TRUE) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: pagamento abbonamento scaduto, non puoi richiedere visualizzazioni di file di film.';
	END IF;
END$$
DELIMITER ;


DELIMITER $$
-- "Una connessione utente non può richiedere un film che ha una restrizione nella sua area geografica."
CREATE TRIGGER regolaDiVincoloRestrizioneGeoFilm
BEFORE INSERT ON Visualizzazione
FOR EACH ROW
BEGIN
	DECLARE IndirizzoIPUtente CHAR(50) DEFAULT '';
	DECLARE areaGeograficaUtente CHAR(50) DEFAULT '';
	DECLARE formatoFilmAdatto CHAR(50) DEFAULT NULL;
    DECLARE filmVietato CHAR(10) DEFAULT NULL;

	SET IndirizzoIPUtente = (
		SELECT C.IndirizzoIP
		FROM Connessione C
		WHERE C.IstanteInizio = NEW.TSConnessioneUtente AND C.Utente = NEW.Utente
        LIMIT 1
	);

	SET areaGeograficaUtente = (
		SELECT D.Nazione
		FROM (SELECT AG.Nazione, STRCMP(AG.MinIndirizzoIP, IndirizzoIPUtente) AS ConfrMinIP,
							   STRCMP(AG.MaxIndirizzoIP, IndirizzoIPUtente) AS ConfrMaxIP
			FROM AreaGeografica AG) AS D
		WHERE (D.ConfrMaxIP = 0 OR D.ConfrMaxIP = 1) AND (D.ConfrMinIP = 0 OR D.ConfrMinIP = -1)
        LIMIT 1
	);

	SET filmVietato = (
		SELECT IF(F.Identificatore IS NULL, FALSE, TRUE)
		FROM Film F
		WHERE F.Identificatore IN 	(SELECT RF.Film
									FROM RestrizioneFilm RF
									WHERE RF.AreaGeografica = areaGeograficaUtente
									AND RF.FIlm = NEW.Film)
		LIMIT 1
	);


	IF (filmVietato IS TRUE) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: film richiesto non disponibile nell\'area geografica dell\'utente.';
	END IF;
END$$
DELIMITER ;


DELIMITER $$
-- Sono state implementate le regole di vincolo sul nome, le ore mensili massime, la qualità offerta, numero di download dei film massimo
-- e la tariffa mensile per le modalità di abbonamento.
CREATE TRIGGER regoleDiVincoloPerAbbonamento
BEFORE INSERT ON Abbonamento
FOR EACH ROW
BEGIN/*
	IF ((NEW.Nome = 'Basic') AND ((NEW.OreMensili <> 50) OR (NEW.NumeroDownload <> 0) OR (NEW.TariffaMensile <> 3.99) OR (NEW.QualitaVideo <> '720p'))) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: occorrenza abbonamento modalità Basic non corretta.';
	END IF;

	IF ((NEW.Nome = 'Premium') AND ((NEW.OreMensili <> 50) OR (NEW.NumeroDownload <> 2) OR (NEW.TariffaMensile <> 6.99) OR (NEW.QualitaVideo <> '1080p'))) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: occorrenza abbonamento modalità Premium non corretta.';
	END IF;

	IF ((NEW.Nome = 'Pro') AND ((NEW.OreMensili <> 90) OR (NEW.NumeroDownload <> 5) OR (NEW.TariffaMensile <> 8.99) OR (NEW.QualitaVideo <> '1080p'))) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: occorrenza abbonamento modalità Pro non corretta.';
	END IF;

	IF ((NEW.Nome = 'Deluxe') AND ((NEW.OreMensili <> 120) OR (NEW.NumeroDownload <> 5) OR (NEW.TariffaMensile <> 10.99) OR (NEW.QualitaVideo <> '2K'))) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: occorrenza abbonamento modalità Deluxe non corretta.';
	END IF;

	IF ((NEW.Nome = 'Ultimate') AND ((NEW.OreMensili <> 120) OR (NEW.NumeroDownload <> 10) OR (NEW.TariffaMensile <> 12.99) OR (NEW.QualitaVideo <> '4K'))) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: occorrenza abbonamento modalità Ultimate non corretta.';
	END IF;*/


    IF (New.Nome <> 'Basic') AND (New.Nome <> 'Premium') AND (New.Nome <> 'Pro') AND (New.Nome <> 'Deluxe') AND (New.Nome <> 'Ultimate') THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Il nome abbonamento inserito non è valido';
	END IF;

    IF New.Nome = 'Basic' THEN
		SET New.TariffaMensile = 3.99;
		SET New.OreMensili = 50;
		SET New.QualitaVideo = '720p';
        SET New.NumeroDownload = 0;
	END IF;

	IF New.Nome = 'Premium' THEN
		SET New.TariffaMensile = 6.99;
		SET New.OreMensili = 50;
		SET New.QualitaVideo = '1080p';
        SET New.NumeroDownload = 2;
	END IF;

	IF New.Nome = 'Pro' THEN
		SET New.TariffaMensile = 8.99;
		SET New.OreMensili = 90;
		SET New.QualitaVideo = '1080p';
        SET New.NumeroDownload = 5;
	END IF;

	IF New.Nome = 'Deluxe' THEN
		SET New.TariffaMensile = 10.99;
		SET New.OreMensili = 120;
		SET New.QualitaVideo = '2K';
        SET New.NumeroDownload = 5;
	END IF;

    IF New.Nome = 'Ultimate' THEN
		SET New.TariffaMensile = 12.99;
		SET New.OreMensili = 120;
		SET New.QualitaVideo = '4K';
        SET New.NumeroDownload = 10;
	END IF;



END$$
DELIMITER ;


DELIMITER $$
-- "L’indirizzo IP assegnato ad una connessione attiva deve essere univoco rispetto le altre connessioni attive di utenti diversi."
CREATE TRIGGER regolaDiVincoloUnivocitaIndirizzoIP
BEFORE INSERT ON Connessione
FOR EACH ROW
BEGIN
	DECLARE indirizzoIPUsato BOOLEAN DEFAULT FALSE;

	SET indirizzoIPUsato = (
		SELECT IF(C.Utente IS NOT NULL, TRUE, FALSE)
		FROM Connessione C
		WHERE C.IndirizzoIP = NEW.IndirizzoIP
			AND C.IstanteFine IS NULL
	);

	IF (indirizzoIPUsato IS TRUE) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: indirizzo IP già utilizzato da un\'altra connessione utente ancora attiva.';
	END IF;

END$$
DELIMITER ;

DELIMITER $$
-- "Implementazione delle regole di vincolo sul controllo del sovraccarico di un server CDN."
CREATE TRIGGER regolaDiVincoloSovraccaricoServer
AFTER UPDATE ON ServerCDN
FOR EACH ROW
BEGIN
	DECLARE altroServer CHAR(50) DEFAULT NULL;
	DECLARE nuovoCarico FLOAT DEFAULT 0;

	IF (NEW.CaricoAttuale >= (0.9*NEW.LarghezzaBanda)) THEN

		SET altroServer = (
			SELECT SCDN.Codice
			FROM ServerCDN SCDN
			WHERE SCDN.Carico < 0.9*SCDN.LarghezzaBanda
				AND SCDN.Posizione IN (
					SELECT VZ.Confinante
					FROM Vicinanza VZ
					WHERE VZ.Confine = NEW.Posizione
				)
			LIMIT 1
		);

		UPDATE Visualizzazione V
		SET V.ServerSorgente = altroServer
		WHERE V.ServerSorgente = NEW.Codice
			AND V.IstanteFine IS NULL
			AND V.IstanteInizio >= CURRENT_TIMESTAMP - INTERVAL 1 HOUR;

		-- Aggiorno il carico attuale del server che era in sovraccarico
		SET nuovoCarico = (
			SELECT SUM(FDF.Dimensione)
			FROM FileDiFilm FDF
			INNER JOIN Visualizzazione V
			WHERE V.ServerSorgente = NEW.Codice
		);

		UPDATE ServerCDN SCDN
		SET SCDN.CaricoAttuale = SCDN.CaricoAttuale + nuovoCarico
		WHERE SCDN.Codice = NEW.Codice;

		-- Aggiorno il carico attuale del nuovo server che "sostituisce" il server in sovraccarico
		SET nuovoCarico = (
			SELECT SUM(FDF.Dimensione)
			FROM FileDiFilm FDF
			INNER JOIN Visualizzazione V
			WHERE V.ServerSorgente = altroServer
		);

		UPDATE ServerCDN SCDN
		SET SCDN.CaricoAttuale = SCDN.CaricoAttuale + nuovoCarico
		WHERE SCDN.Codice = altroServer;


	END IF;

END$$

DELIMITER ;

-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
--  REGOLE DI DERIVAZIONE
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
DELIMITER $$
CREATE TRIGGER CalcolaDimensioneFile
BEFORE INSERT ON FileDiFilm
FOR EACH ROW
BEGIN
	/*
		Calcola dimensione del file e aggiorna il record che si stava inserendo.
	*/

	DECLARE durata INTEGER DEFAULT 0;
    DECLARE durata_60 INTEGER DEFAULT 0;
	DECLARE fattAudio FLOAT DEFAULT 0;
	DECLARE bitrateAudio FLOAT DEFAULT 0;
	DECLARE fattVideo FLOAT DEFAULT 0;
	DECLARE bitrateVideo FLOAT DEFAULT 0;
    DECLARE spazioAudio FLOAT DEFAULT 0;
    DECLARE spazioVideo FLOAT DEFAULT 0;
    DECLARE audioEvideo FLOAT DEFAULT 0;
    DECLARE const FLOAT DEFAULT 1000;

    
    SET durata = (
					SELECT F.Durata
                    FROM Film F
                    WHERE F.Identificatore = NEW.Film
				 );

	SET durata_60 = durata * 60;

    SET fattAudio = (
					 SELECT A.FattoreCompressione
                     FROM Audio A INNER JOIN Formato F
						  ON A.Nome = F.CodecAudio
					 WHERE F.Codice = NEW.Formato 
					);
                    
	SET bitrateAudio = (
						 SELECT A.Bitrate
						 FROM Audio A INNER JOIN Formato F
							  ON A.Nome = F.CodecAudio
						 WHERE F.Codice = NEW.Formato 
						);
                        
	SET spazioAudio = fattAudio * bitrateAudio;
                        
	SET fattVideo = (
					 SELECT V.FattoreCompressione
                     FROM Video V INNER JOIN Formato F
						  ON V.Nome = F.CodecVideo
					 WHERE  F.Codice = NEW.Formato
                     );

	SET bitrateVideo = (
						 SELECT V.Bitrate
						 FROM Video V INNER JOIN Formato F
							  ON V.Nome = F.CodecVideo
						 WHERE F.Codice = NEW.Formato 
						 );
                         
	SET spazioVideo = fattVideo * bitrateVideo;
    
    SET audioEvideo = spazioAudio + spazioVideo;

	SET NEW.DimensioneFile = ((durata_60 * audioEvideo) / const);

END$$
DELIMITER ;


DELIMITER $$

CREATE TRIGGER CalcolaImportoFattura
BEFORE INSERT ON Pagamento
FOR EACH ROW
BEGIN
	/*
		Calcola importo e aggiorna il record che si stava inserendo.
	*/
	DECLARE tariffaMensileAbbonamento INTEGER DEFAULT 0;

	SET tariffaMensileAbbonamento = (
		SELECT A.TariffaMensile
		FROM Abbonamento A
		WHERE A.Nome = NEW.Abbonamento
	);

	SET NEW.ImportoFattura = (NEW.DurataValidita*tariffaMensileAbbonamento);

END$$

DELIMITER ;
