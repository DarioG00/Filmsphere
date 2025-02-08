-- ***********************************************************************************************
-- Funzionalità back-end.
-- ***********************************************************************************************
-- ------------------------------------------------------------------------------------------------------------------
-- Funzionalità gestisce i contenuti che potrebbero insteressare all'utente che crea una connessione
-- ------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER raccomandazioniUtente
AFTER INSERT ON Connessione
FOR EACH ROW
BEGIN
            
    CALL raccomandazioneContenuti(NEW.Utente);

END $$
DELIMITER ;


-- ------------------------------------------------------------------------------------------------------------------
-- Funzionalità "Scelta del server CDN più adatto dato un certo utente che ha richiesto la visualizzazione di un film."
-- ------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE selezionaServerConFilm(IN _film CHAR(50), IN _formatoFilm CHAR(50), IN _areaGeografica CHAR(20), OUT server_ CHAR(50))
BEGIN
	DECLARE nuovoServer CHAR(50) DEFAULT '';

	-- tra tutti i server seleziono quello più vicino geograficamente e che ha il file di film richiesto nella qualità opportuna
	-- ed il migliore in termini di bilanciamento del carico e prestazioni
	SET nuovoServer = (
		SELECT D.Codice
		FROM (
			SELECT SCDN.Codice, SCDN.CapacitaTrasmissione, SCDN.CaricoAttuale
			FROM ServerCDN SCDN
			INNER JOIN Pop PP ON SCDN.Codice = PP.Server
			WHERE PP.Film = _film AND PP.FormatoFilm = _formatoFilm
				AND SCDN.Posizione IN (
									SELECT VV.Confinante
									FROM Vicinanza VV
									WHERE VV.Confine = _areaGeografica
								)
        ) AS D
		WHERE D.CapacitaTrasmissione = (
											SELECT MAX(D.CapacitaTrasmissione)
											FROM (
												SELECT SCDN.Codice, SCDN.CapacitaTrasmissione
												FROM ServerCDN SCDN
												INNER JOIN Pop PP ON SCDN.Codice = PP.Server
												WHERE PP.Film = _film AND PP.FormatoFilm = _formatoFilm
													AND SCDN.Posizione IN (
																		SELECT VV.Confinante
																		FROM Vicinanza VV
																		WHERE VV.Confine = _areaGeografica
																	)
                                            ) AS D2
										)
		ORDER BY D.CaricoAttuale
		LIMIT 1
	);
    
    IF nuovoServer IS NULL THEN
		SET nuovoServer = (
			SELECT SCDN.Codice
			FROM ServerCDN SCDN
			WHERE SCDN.Posizione IN (
								SELECT VV.Confinante
								FROM Vicinanza VV
								WHERE VV.Confine = 'Italia'
							)
			ORDER BY SCDN.CapacitaTrasmissione DESC
            LIMIT 1
        );
    END IF;
    
    SET server_ = nuovoServer;

END$$

DELIMITER ;
