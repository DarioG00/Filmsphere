-- ***********************************************************************************************
-- Funzionalità analytics
-- ***********************************************************************************************

-- ---------------------------
-- Funzionalità 'Classifiche'
-- ---------------------------
-- ----------------------------------------
-- Stila una classifica di tutti i film
-- dal più visto a quello meno
-- ----------------------------------------
DROP PROCEDURE IF EXISTS classificaFilmPiuVisti;

DELIMITER $$
CREATE PROCEDURE classificaFilmPiuVisti()
BEGIN

  WITH VisualizzaFilm as(
                         SELECT V.Film, F.Titolo, F.Genere, COUNT(*) AS visioniFilm
                         FROM Visualizzazione V INNER JOIN Film F
                              ON V.Film = F.Identificatore
                         GROUP BY V.Film
                        )
  SELECT VF.Titolo, VF.Genere, VF.visioniFilm,
         DENSE_RANK() OVER(ORDER BY VF.visioniFilm DESC) AS ClassificaPerVisioni,
         DENSE_RANK() OVER(PARTITION BY VF.Genere
                           ORDER BY VF.visioniFilm DESC) AS ClassificaGeneri
  FROM VisualizzaFilm VF;


END $$
DELIMITER ;


-- ----------------------------------------
-- Data una nazione restituisce la classifica
-- dei film più visti in quella nazione
-- ----------------------------------------
DROP PROCEDURE IF EXISTS classificaNazione;

DELIMITER $$
CREATE PROCEDURE classificaNazione(IN _nazione VARCHAR(20))
BEGIN

  DECLARE min_indirizzo_nazione VARCHAR(16);
  DECLARE max_indirizzo_nazione VARCHAR(16);

  SET min_indirizzo_nazione = (
                               SELECT MinIndirizzoIP
                               FROM AreaGeografica
                               WHERE Nazione = _nazione
                              );

  SET max_indirizzo_nazione = (
                               SELECT MaxIndirizzoIP
                               FROM AreaGeografica
                               WHERE Nazione = _nazione
                              );

  WITH VisualizzazioniArea AS (
                               SELECT V.Film, F.Titolo, COUNT(*) AS visioniFilm
                               FROM Visualizzazione V INNER JOIN Film F
                                    ON V.Film = F.Identificatore INNER JOIN Connessione C
                                    ON V.Utente = C.Utente
                                WHERE (STRCMP(max_indirizzo_nazione, C.IndirizzoIP) = 1 OR STRCMP(max_indirizzo_nazione, C.IndirizzoIP) = 0) AND
                                      (STRCMP(min_indirizzo_nazione, C.IndirizzoIP) = -1 OR STRCMP(max_indirizzo_nazione, C.IndirizzoIP) = 0)
                               GROUP BY V.Film
                             )

  SELECT VF.Titolo, VF.visioniFilm,
         DENSE_RANK() OVER(ORDER BY VF.visioniFilm DESC) AS ClassificaVisioniNazione
  FROM VisualizzaFilm VF;


END $$
DELIMITER ;

-- ----------------------------------------
-- Stila una classifica di tutti i formati
-- dal più usato al meno
-- ----------------------------------------
DROP PROCEDURE IF EXISTS classificaFormatiPiuVisti;

DELIMITER $$
CREATE PROCEDURE classificaFormatiPiuVisti()
BEGIN

  WITH VisualizzaFormati as(
                         SELECT V.Formato, COUNT(*) AS formatiVisti
                         FROM Visualizzazione V
                         GROUP BY V.Formato
                        )
  SELECT VF.Formato, VF.formatiVisti,
         DENSE_RANK() OVER(ORDER BY VF.formatiVisti DESC) AS ClassificaFormati

  FROM VisualizzaFormati VF;


END $$
DELIMITER ;


-- ----------------------------------------
-- Stila una classifica dei film
-- più visti nel mese corrente
-- ----------------------------------------
DROP PROCEDURE IF EXISTS classificaFilmPiuVistiMese;

DELIMITER $$
CREATE PROCEDURE classificaFilmPiuVistiMese()
BEGIN

  WITH VisualizzaFilm as(
                         SELECT V.Film, F.Titolo, COUNT(*) AS visioniFilm
                         FROM Visualizzazione V INNER JOIN Film F
                              ON V.Film = F.Identificatore
                          WHERE YEAR(IstanteInizio) = YEAR(CURRENT_DATE) AND
                                MONTH(IstanteInizio) = MONTH(CURRENT_DATE)
                         GROUP BY V.Film
                        )
  SELECT VF.Titolo, VF.visioniFilm,
         DENSE_RANK() OVER(ORDER BY VF.visioniFilm DESC) AS ClassificaFilmMeseAttuale

  FROM VisualizzaFilm VF;


END $$
DELIMITER ;

-- ------------------------------------
-- Funzionalità 'Bilanciamento carico'
-- ------------------------------------

DELIMITER $$

DROP PROCEDURE IF EXISTS bilanciamentoCarico$$
CREATE PROCEDURE bilanciamentoCarico(OUT filmDaAllocare_ CHAR(200))
BEGIN
	DECLARE serverSorg CHAR(10) DEFAULT '';
	DECLARE filmSpostato CHAR(10) DEFAULT '';
	DECLARE formatoFilmSpostato CHAR(10) DEFAULT '';
	DECLARE serverDest CHAR(10) DEFAULT '';

	DECLARE finito INTEGER DEFAULT 0;

	DECLARE cursorePianoAllocazione CURSOR FOR
	SELECT S1.Server AS ServerSorgente, S1.Film, S1.FormatoFilm, S2.Codice AS ServerDestinatario
	FROM (
		SELECT SCDN.Codice AS Server, P.Film, P.FormatoFilm, SCDN.LarghezzaBanda, SCDN.CaricoAttuale
		FROM ServerCDN SCDN
		INNER JOIN Pop P ON SCDN.Codice = P.Server
		WHERE SCDN.CaricoAttuale > 0.5*(SCDN.LarghezzaBanda)
    ) AS S1
	INNER JOIN ServerCDN S2 ON (S1.Server <> S2.Codice)
	WHERE 	(0.5*(S1.CaricoAttuale) < S2.CaricoAttuale) AND
			(0.5*(S1.CaricoAttuale) < 0.9*(S2.LarghezzaBanda)) AND
			NOT EXISTS (
				SELECT P.*
				FROM Pop P
				WHERE P.Film = S1.Film AND P.FormatoFilm = S1.FormatoFilm AND P.Server = S2.Codice
			)
			AND S1.Posizione IN (
				SELECT V.Confinante
				FROM Vicinanza V
				WHERE V.Confine = S2.Posizione
			)
	LIMIT 50;

	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET finito = 1;

	OPEN cursorePianoAllocazione;

	scan: LOOP
		FETCH cursorePianoAllocazione INTO serverSorg, filmSpostato, formatoFilmSpostato, serverDest;
		IF finito = 1 THEN
			LEAVE scan;
		END IF;
		SET filmDaAllocare_ = CONCAT(filmDaAllocare_, '[',serverSorg,',',filmSpostato,',',formatoFilmSpostato,',',serverDest,'], ');
	END LOOP scan;

	CLOSE cursorePianoAllocazione;
END$$

DELIMITER ;
