-- ***********************************************************************************************
-- Creazione delle tabelle del database 'Filmsphere'
-- ***********************************************************************************************

CREATE DATABASE IF NOT EXISTS Filmsphere;
USE Filmsphere;


-- ------------------------------------
--  Struttura della tabella `Genere`
-- ------------------------------------
DROP TABLE IF EXISTS Genere;
CREATE TABLE Genere
(
	Nome CHAR(30) NOT NULL,
	Descrizione VARCHAR(250),
	PRIMARY KEY (Nome)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Artista`
-- --------------------------------------
DROP TABLE IF EXISTS Artista;
CREATE TABLE Artista
(
	Identificativo CHAR(20) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Cognome VARCHAR(30) NOT NULL,
	Specializzazione VARCHAR(20) NOT NULL,
	PRIMARY KEY (Identificativo)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------
--  Struttura della tabella `Film`
-- ------------------------------------
DROP TABLE IF EXISTS Film;
CREATE TABLE Film
(
	Identificatore CHAR(10) NOT NULL,
	Titolo VARCHAR(100) NOT NULL,
	Descrizione VARCHAR(255) NOT NULL,
	Genere VARCHAR(30) NOT NULL,
	Durata INTEGER NOT NULL,
	Regista VARCHAR(20) NOT NULL,
	AnnoProduzione INTEGER NOT NULL,
	PaeseProduzione VARCHAR(50) NOT NULL,
	RatingFilm FLOAT DEFAULT 0.5,
	PRIMARY KEY (Identificatore),
	FOREIGN KEY (Regista) REFERENCES Artista(Identificativo)
			ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Genere) REFERENCES Genere(Nome)
			ON DELETE CASCADE ON UPDATE CASCADE

)
ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------
--  Struttura della tabella `Cast`
-- --------------------------------------
DROP TABLE IF EXISTS Cast;
CREATE TABLE Cast
(
	Artista CHAR(20) NOT NULL,
	Film CHAR(10) NOT NULL,
	PRIMARY KEY (Artista, Film),
	FOREIGN KEY (Artista) REFERENCES Artista (Identificativo)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Premio`
-- --------------------------------------
DROP TABLE IF EXISTS Premio;
CREATE TABLE Premio
(
	Codice CHAR(10) NOT NULL,
	Tipologia VARCHAR(10) NOT NULL,
	Ambito VARCHAR(30) NOT NULL,
	Descrizione VARCHAR(200) NOT NULL,
	PRIMARY KEY (Codice)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `PremiazioneFilm`
-- --------------------------------------
DROP TABLE IF EXISTS PremiazioneFilm;
CREATE TABLE PremiazioneFilm
(
	Premio CHAR(10) NOT NULL,
	Film CHAR(10) NOT NULL,
	Data DATE NOT NULL,
	PRIMARY KEY (Premio, Film),
	FOREIGN KEY (Premio) REFERENCES Premio (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `PremiazioneArtista`
-- --------------------------------------
DROP TABLE IF EXISTS PremiazioneArtista;
CREATE TABLE PremiazioneArtista
(
	Premio CHAR(10) NOT NULL,
	Film CHAR(10) NOT NULL,
	Artista CHAR(20) NOT NULL,
	Data date NOT NULL,
	PRIMARY KEY (Premio, Film, Artista),
	FOREIGN KEY (Premio) REFERENCES Premio (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Artista) REFERENCES Artista (Identificativo)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Lingua`
-- --------------------------------------
DROP TABLE IF EXISTS Lingua;
CREATE TABLE Lingua
(
	Nome VARCHAR(20) NOT NULL,
	PRIMARY KEY (Nome)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Sottotitoli`
-- --------------------------------------
DROP TABLE IF EXISTS Sottotitoli;
CREATE TABLE Sottotitoli
(
	Film CHAR(10) NOT NULL,
	Lingua CHAR(20) NOT NULL,
	PRIMARY KEY (Film, Lingua),
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Lingua) REFERENCES Lingua (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `LinguaAudio`
-- --------------------------------------
DROP TABLE IF EXISTS LinguaAudio;
CREATE TABLE LinguaAudio
(
	Film CHAR(10) NOT NULL,
	Lingua VARCHAR(20) NOT NULL,
	PRIMARY KEY (Film, Lingua),
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Lingua) REFERENCES Lingua (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------
--  Struttura della tabella `Fattore`
-- --------------------------------------
DROP TABLE IF EXISTS Fattore;
CREATE TABLE Fattore
(
	Tipologia VARCHAR(20) NOT NULL,
	Descrizione VARCHAR(200) NOT NULL,
	PRIMARY KEY (Tipologia)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------
--  Struttura della tabella `Audio`
-- --------------------------------------
DROP TABLE IF EXISTS Audio;
CREATE TABLE Audio
(
	Nome CHAR(30) NOT NULL,
	FattoreCompressione FLOAT NOT NULL,
	Bitrate FLOAT NOT NULL,
	PRIMARY KEY (Nome)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Video`
-- --------------------------------------
DROP TABLE IF EXISTS Video;
CREATE TABLE Video
(
	Nome VARCHAR(30) NOT NULL,
	FattoreCompressione FLOAT NOT NULL,
	Bitrate FLOAT NOT NULL,
	Risoluzione VARCHAR(20) NOT NULL,
	RapportoAspetto VARCHAR(5) NOT NULL,
	PRIMARY KEY (Nome)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Estensione`
-- --------------------------------------
DROP TABLE IF EXISTS Estensione;
CREATE TABLE Estensione
(
	Nome VARCHAR(30) NOT NULL,
	Descrizione VARCHAR(250) NOT NULL,
	PRIMARY KEY (Nome)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Formato`
-- --------------------------------------
DROP TABLE IF EXISTS Formato;
CREATE TABLE Formato
(
	Codice CHAR(30) NOT NULL,
	QualitaVideo VARCHAR(10) NOT NULL,
	QualitaAudio VARCHAR(10) NOT NULL,
	Estensione VARCHAR(10) NOT NULL,
	CodecVideo VARCHAR(30) NOT NULL,
	CodecAudio VARCHAR(30) NOT NULL,
	PRIMARY KEY (Codice),
	FOREIGN KEY (CodecVideo) REFERENCES Video (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CodecAudio) REFERENCES Audio (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Estensione) REFERENCES Estensione (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `DisponibilitàAudio`
-- --------------------------------------
DROP TABLE IF EXISTS DisponibilitaAudio;
CREATE TABLE DisponibilitaAudio
(
	Audio VARCHAR(30) NOT NULL,
	Film CHAR(10) NOT NULL,
	PRIMARY KEY (Audio, Film),
	FOREIGN KEY (Audio) REFERENCES Audio (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `DisponibilitàVideo`
-- --------------------------------------
DROP TABLE IF EXISTS DisponibilitaVideo;
CREATE TABLE DisponibilitaVideo
(
	Video VARCHAR(30) NOT NULL,
	Film CHAR(10) NOT NULL,
	PRIMARY KEY (Video, Film),
	FOREIGN KEY (Video) REFERENCES Video (Nome)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `FileDiFilm`
-- --------------------------------------
DROP TABLE IF EXISTS FileDiFilm;
CREATE TABLE FileDiFilm
(
	Film CHAR(10) NOT NULL,
	Formato VARCHAR(30) NOT NULL,
	DataRilascio DATE NOT NULL,
	DimensioneFile FLOAT DEFAULT 0,
	PRIMARY KEY (Film, Formato),
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Formato) REFERENCES Formato (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------------
--  Struttura della tabella `Utente`
-- ----------------------------------
DROP TABLE IF EXISTS Utente;
CREATE TABLE Utente (
	Codice CHAR(10) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Cognome VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password CHAR(8) NOT NULL,
	Critico TINYINT(1) NOT NULL,
	ScadenzaAbbonamento DATE DEFAULT NULL,

	PRIMARY KEY (Codice)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Recensione`
-- --------------------------------------
DROP TABLE IF EXISTS Recensione;
CREATE TABLE Recensione
(
	Film CHAR(10) NOT NULL,
	Utente CHAR(10) NOT NULL,
	Voto FLOAT DEFAULT 0.5,
	Commento VARCHAR(100) NOT NULL,
	PRIMARY KEY (Film, Utente),
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Utente) REFERENCES Utente (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `Scelta`
-- --------------------------------------
DROP TABLE IF EXISTS Scelta;
CREATE TABLE Scelta
(
	Fattore VARCHAR(20) NOT NULL,
	Utente CHAR(10) NOT NULL,
	PRIMARY KEY (Fattore, Utente),
	FOREIGN KEY (Fattore) REFERENCES Fattore (Tipologia)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Utente) REFERENCES Utente (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `RatingPersonalizzato`
-- --------------------------------------
DROP TABLE IF EXISTS RatingPersonalizzato;
CREATE TABLE RatingPersonalizzato
(
	Film CHAR(10) NOT NULL,
	Utente CHAR(10) NOT NULL,
	Punteggio FLOAT DEFAULT 0.5,
	PRIMARY KEY (Film, Utente),
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Utente) REFERENCES Utente (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------
--  Struttura della tabella `Abbonamento`
-- ---------------------------------------
DROP TABLE IF EXISTS Abbonamento;
CREATE TABLE Abbonamento (
	Nome VARCHAR(15) NOT NULL,
	TariffaMensile FLOAT NOT NULL,
	OreMensili INTEGER NOT NULL,
	QualitaVideo VARCHAR(50) NOT NULL,
	NumeroDownload INTEGER NOT NULL,

	PRIMARY KEY (Nome)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ----------------------------------------
--  Struttura della tabella `CartaCredito`
-- ----------------------------------------
DROP TABLE IF EXISTS CartaCredito;
CREATE TABLE CartaCredito (
	Numero CHAR(16) NOT NULL,
	CVV CHAR(3) NOT NULL,
	Scadenza DATE NOT NULL,
	Proprietario CHAR(10) NOT NULL,

	FOREIGN KEY (Proprietario) REFERENCES Utente (Codice)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Numero)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ------------------------------------
--  Struttura della tabella `Pagamento`
-- ------------------------------------
DROP TABLE IF EXISTS Pagamento;
CREATE TABLE Pagamento (
	Utente CHAR(10) NOT NULL,
	DataPagamento DATE NOT NULL,
	Abbonamento VARCHAR(15) NOT NULL,
	DurataValidita INTEGER NOT NULL,
	ImportoFattura FLOAT DEFAULT NULL,
	CartaUsata CHAR(16) NOT NULL,

	FOREIGN KEY (Utente) REFERENCES Utente (Codice)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Abbonamento) REFERENCES Abbonamento (Nome)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Utente, DataPagamento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ------------------------------------------
--  Struttura della tabella `AreaGeografica`
-- ------------------------------------------
DROP TABLE IF EXISTS AreaGeografica;
CREATE TABLE AreaGeografica (
	Nazione VARCHAR(20) NOT NULL,
	MaxIndirizzoIP VARCHAR(16) NOT NULL,
	MinIndirizzoIP VARCHAR(16) NOT NULL,

	PRIMARY KEY (Nazione)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------
--  Struttura della tabella `RestrizioneFormato`
-- --------------------------------------
DROP TABLE IF EXISTS RestrizioneFormato;
CREATE TABLE RestrizioneFormato
(
	Formato VARCHAR(20) NOT NULL,
	AreaGeografica VARCHAR(20) NOT NULL,

	PRIMARY KEY (Formato, AreaGeografica),

	FOREIGN KEY (Formato) REFERENCES Formato (Codice)
          ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (AreaGeografica) REFERENCES AreaGeografica (Nazione)
          ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------------
--  Struttura della tabella `RestrizioneFilm`
-- ------------------------------------------
DROP TABLE IF EXISTS RestrizioneFilm;
CREATE TABLE RestrizioneFilm
(
	AreaGeografica VARCHAR(20) NOT NULL,
	Film CHAR(10) NOT NULL,

	PRIMARY KEY (AreaGeografica, Film),
	FOREIGN KEY (AreaGeografica) REFERENCES AreaGeografica (Nazione)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film) REFERENCES Film (Identificatore)
    ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- -------------------------------------
--  Struttura della tabella `Vicinanza`
-- -------------------------------------
DROP TABLE IF EXISTS Vicinanza;
CREATE TABLE Vicinanza (
	Confine VARCHAR(20) NOT NULL,
	Confinante VARCHAR(20) NOT NULL,

	FOREIGN KEY (Confine) REFERENCES AreaGeografica (Nazione)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Confinante) REFERENCES AreaGeografica (Nazione)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Confine, Confinante)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------
--  Struttura della tabella `Connessione`
-- --------------------------------------
DROP TABLE IF EXISTS Connessione;
CREATE TABLE Connessione (
	Utente CHAR(10) NOT NULL,
	IstanteInizio TIMESTAMP NOT NULL,
	IndirizzoIP VARCHAR(16) NOT NULL,
	Dispositivo VARCHAR(16) NOT NULL,
	IstanteFine TIMESTAMP DEFAULT NULL,

	FOREIGN KEY (Utente) REFERENCES Utente (Codice)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Utente, IstanteInizio)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------
--  Struttura della tabella `ServerCDN`
-- -------------------------------------
DROP TABLE IF EXISTS ServerCDN;
CREATE TABLE ServerCDN (
	Codice CHAR(10) NOT NULL,
	LarghezzaBanda FLOAT NOT NULL,
	CapacitaTrasmissione INTEGER NOT NULL,
	Posizione VARCHAR(20) NOT NULL,
	CaricoAttuale FLOAT DEFAULT 0,

	FOREIGN KEY (Posizione) REFERENCES AreaGeografica (Nazione)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Codice)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- -------------------------------------
--  Struttura della tabella `Pop`
-- -------------------------------------
DROP TABLE IF EXISTS Pop;
CREATE TABLE Pop (
	Server CHAR(10) NOT NULL,
	Film CHAR(10) NOT NULL,
	FormatoFilm CHAR(10) NOT NULL,

	FOREIGN KEY (Server) REFERENCES ServerCDN (Codice)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film, FormatoFilm) REFERENCES FileDiFilm (Film, Formato)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Server, Film, FormatoFilm)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
--  Struttura della tabella `Visualizzazione`
-- -------------------------------------------
DROP TABLE IF EXISTS Visualizzazione;
CREATE TABLE Visualizzazione (
	Codice CHAR(20) NOT NULL,
	Utente CHAR(10) NOT NULL,
	TSConnessioneUtente TIMESTAMP NOT NULL,
	IstanteInizio TIMESTAMP NOT NULL,
	Film CHAR(10) NOT NULL,
	FormatoFilm CHAR(10) DEFAULT NULL,
	ServerSorgente CHAR(10) DEFAULT NULL,
	IstanteFine TIMESTAMP DEFAULT NULL,

	FOREIGN KEY (Utente, TSConnessioneUtente) REFERENCES Connessione (Utente, IstanteInizio)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Film, FormatoFilm) REFERENCES FileDiFilm (Film, Formato)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ServerSorgente) REFERENCES ServerCDN (Codice)
    ON DELETE CASCADE ON UPDATE CASCADE,

	PRIMARY KEY (Codice)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
