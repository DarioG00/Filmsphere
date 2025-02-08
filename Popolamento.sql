-- Popolamento della tabella Genere
INSERT INTO Genere (Nome) VALUES
('Azione'),
('Avventura'),
('Commedia'),
('Crimine'),
('Drammatico'),
('Fantasy'),
('Horror'),
('Mistero'),
('Romantico'),
('Fantascienza'),
('Thriller'),
('Animazione'),
('Biografico'),
('Documentario'),
('Famiglia'),
('Storico');

-- Popolamento tabella Artista
INSERT INTO Artista (Identificativo, Nome, Cognome, Specializzazione)
VALUES
('LEODIC001', 'Leonardo', 'DiCaprio', 'Attore'),
('MERSTR002', 'Meryl', 'Streep', 'Attore'),
('QUETAR003', 'Quentin', 'Tarantino', 'Regista'),
('STESPI004', 'Steven', 'Spielberg', 'Regista'),
('TOMHAN005', 'Tom', 'Hanks', 'Attore'),
('BRAPIT006', 'Brad', 'Pitt', 'Attore'),
('MARSCE007', 'Martin', 'Scorsese', 'Regista'),
('ANJOLI008', 'Angelina', 'Jolie', 'Attore'),
('ROBNEI009', 'Robert', 'De Niro', 'Attore&Regista'),
('ALPPAC010', 'Al', 'Pacino', 'Attore'),
('JONDEP011', 'Johnny', 'Depp', 'Attore'),
('CLIEAS012', 'Clint', 'Eastwood', 'Attore&Regista'),
('NATPOR013', 'Natalie', 'Portman', 'Attore'),
('RIDSCO014', 'Ridley', 'Scott', 'Regista'),
('DENWAS015', 'Denzel', 'Washington', 'Attore'),
('JAMCAM016', 'James', 'Cameron', 'Regista'),
('KATWIN017', 'Kate', 'Winslet', 'Attore'),
('CHRNOL018', 'Christopher', 'Nolan', 'Regista'),
('JENLAW019', 'Jennifer', 'Lawrence', 'Attore'),
('WOOALL020', 'Woody', 'Allen', 'Regista'),
('MATDAM021', 'Matt', 'Damon', 'Attore'),
('TIMBUR022', 'Tim', 'Burton', 'Regista'),
('EMMSTO023', 'Emma', 'Stone', 'Attore'),
('GEOCLO024', 'George', 'Clooney', 'Attore&Regista'),
('PETJAC025', 'Peter', 'Jackson', 'Regista'),
('ANNHAT026', 'Anne', 'Hathaway', 'Attore'),
('MICBAY027', 'Michael', 'Bay', 'Regista'),
('JULROB028', 'Julia', 'Roberts', 'Attore'),
('MARSHE029', 'Martin', 'Sheen', 'Attore&Regista'),
('DAVFIC030', 'David', 'Fincher', 'Regista'),
('ROBDOW031', 'Robert', 'Downey Jr.', 'Attore'),
('STAKUB032', 'Stanley', 'Kubrick', 'Regista'),
('CHATHER033', 'Charlize', 'Theron', 'Attore'),
('STESOD034', 'Steven', 'Soderbergh', 'Regista'),
('EMMWAT035', 'Emma', 'Watson', 'Attore'),
('RONHOW036', 'Ron', 'Howard', 'Regista'),
('NICKID037', 'Nicole', 'Kidman', 'Attore'),
('GEOLUC038', 'George', 'Lucas', 'Regista'),
('FRACOP039', 'Francis', 'Ford Coppola', 'Regista'),
('CATBLA040', 'Cate', 'Blanchett', 'Attore'),
('ANGLEE041', 'Ang', 'Lee', 'Regista'),
('SCAJOH042', 'Scarlett', 'Johansson', 'Attore');

-- ----------------------------
--  Record di `AreaGeografica`
-- ----------------------------
INSERT INTO AreaGeografica (Nazione, MaxIndirizzoIP, MinIndirizzoIP) VALUES
('Italia', '192.168.001.255', '192.168.001.000'),
('Stati Uniti', '192.000.002.255', '192.000.002.000'),
('Germania', '192.168.010.255', '192.168.010.000'),
('Giappone', '192.015.002.255', '192.015.002.000'),
('Messico', '192.000.012.255', '192.000.012.000'),
('Corea del Sud', '192.168.002.255', '192.168.002.000'),

('Regno Unito', '198.051.100.255', '198.051.100.000'),
('Canada', '198.052.100.255', '198.052.100.000'),
('Brasile', '198.054.100.255', '198.054.100.000'),
('India', '198.053.100.255', '198.053.100.000'),
('Sud Africa', '198.055.100.255', '198.055.100.000'),
('Indonesia', '198.056.100.255', '198.056.100.000'),

('Francia', '203.000.113.255', '203.000.113.000'),
('Spagna', '203.001.113.255', '203.001.113.000'),
('Cina', '203.002.113.255', '203.002.113.000'),
('Russia', '203.003.113.255', '203.003.113.000'),
('Argentina', '203.004.113.255', '203.004.113.000'),
('Turchia', '203.005.113.255', '203.005.113.000'),
('Nigeria', '203.006.113.255', '203.006.113.000'),

('Australia', '194.000.002.255', '194.000.002.000'),

('Nuova Zelanda', '202.000.110.255', '202.000.110.000');

-- Popolamento tabella Film
INSERT INTO Film (Identificatore, Titolo, Descrizione, Genere, Durata, Regista, AnnoProduzione, PaeseProduzione, RatingFilm)
VALUES

    ('HAR001', 'Harry Potter e la pietra filosofale', 'Un giovane mago scopre il suo retaggio magico.', 'Fantasy', 152, 'ANGLEE041', 2001, 'Regno Unito', 0.5),
    ('HAR002', 'Harry Potter e la camera dei segreti', 'Harry Potter torna a Hogwarts per il suo secondo anno.', 'Fantasy', 161, 'ANGLEE041', 2002, 'Regno Unito', 0.5),
    ('FF001', 'The Fast and the Furious', 'Un agente di polizia sotto copertura si infiltra in una banda di corridori di strada.', 'Azione', 106, 'RIDSCO014', 2001, 'Stati Uniti', 0.5),
    ('BCK001', 'Ritorno al futuro', 'Un inventore costruisce una macchina del tempo e viaggia indietro.', 'Fantascienza', 116, 'ROBNEI009', 1985, 'Stati Uniti', 0.5),
    ('GLD001', 'Il gladiatore', 'Un ex generale romano diventa un combattente di gladiatori.', 'Storico', 155, 'RIDSCO014', 2000, 'Stati Uniti', 0.5),
    ('FRL001', 'Forrest Gump', 'La vita di Forrest Gump, un uomo con un QI basso ma un cuore grande.', 'Drammatico', 142, 'ROBNEI009', 1994, 'Stati Uniti', 0.5),
    ('TRL001', 'Titanic', 'La tragica storia d''amore tra Rose e Jack a bordo del Titanic.', 'Drammatico', 195, 'JAMCAM016', 1997, 'Stati Uniti', 0.5),
    ('JN001', 'John Wick', 'Un ex assassino viene trascinato indietro nel mondo criminale.', 'Azione', 101, 'DAVFIC030', 2014, 'Stati Uniti', 0.5),
    ('SNT001', 'Il silenzio degli innocenti', 'Un giovane agente dell\'FBI si rivolge a un serial killer incarcerato per catturare un assassino.', 'Thriller', 118, 'DAVFIC030', 1991, 'Stati Uniti', 0.5),
    ('GL001', 'La grande bellezza', 'Un giornalista osserva la vita mondana di Roma mentre riflette sulla bellezza e sulle contraddizioni della vita.', 'Drammatico', 142, 'ROBNEI009', 2013, 'Italia', 0.5),
    ('SW001', 'Star Wars: Episodio I, La minaccia fantasma', 'Anakin Skywalker si unisce a Qui-Gon Jinn e Obi-Wan Kenobi per fermare il Signore dei Sith.', 'Fantascienza', 136, 'GEOLUC038', 1999, 'Stati Uniti', 0.5),
    ('SW002', 'Star Wars: Episodio II, L\'attacco dei cloni', 'Anakin Skywalker e Padmé Amidala devono affrontare una minaccia crescente.', 'Fantascienza', 142, 'GEOLUC038', 2002, 'Stati Uniti', 0.5),
    ('SW003', 'Star Wars: Episodio III, La vendetta dei Sith', 'Anakin Skywalker cade nel lato oscuro e diventa Darth Vader.', 'Fantascienza', 140, 'GEOLUC038', 2005, 'Stati Uniti', 0.5),
    ('PDC001', 'Pirati dei Caraibi, La maledizione della prima luna', 'Il capitano Jack Sparrow cerca di liberare la Perla Nera e la una ciurma da una maledizione.', 'Avventura', 143, 'WOOALL020', 2003, 'Stati Uniti', 0.5),
    ('LOTR001', 'LOTR La compagnia dell\'Anello', 'Frodo intraprende un viaggio con l\'anello.', 'Fantasy', 178, 'PETJAC025', 2001, 'Nuova Zelanda', 0.5),
    ('LOTR002', 'LOTR Le due torri', 'La compagnia dell\'Anello si divide.', 'Fantasy', 179, 'PETJAC025', 2002, 'Nuova Zelanda', 0.5),
    ('LOTR003', 'LOTR Il ritorno del re', 'Frodo e Sam si avventurano verso il Monte Fato.', 'Fantasy', 201, 'PETJAC025', 2003, 'Nuova Zelanda', 0.5),
    ('MCU001', 'Iron Man', 'Il genio miliardario Tony Stark costruisce una potente armatura e diventa Iron Man.', 'Azione', 126, 'TIMBUR022', 2008, 'Stati Uniti', 0.5),
    ('MCU002', 'Thor', 'Thor viene esiliato sulla Terra e deve imparare l\'umiltà mentre protegge il pianeta.', 'Azione', 115, 'TIMBUR022', 2011, 'Stati Uniti', 0.5),
    ('MCU003', 'Captain America, Il primo vendicatore', 'Steve Rogers si trasforma in Captain America lotta contro le forze del male.', 'Azione', 124, 'TIMBUR022', 2011, 'Stati Uniti', 0.5),
    ('MCU004', 'The Avengers', 'Gli eroi più potenti della Terra si uniscono per combattere il malvagio Loki.', 'Azione', 143, 'TIMBUR022', 2012, 'Stati Uniti', 0.5),
    ('MCU005', 'SpiderMan: Homecoming', 'Il giovane Peter Parker cerca di bilanciare la sua vita da studente con quella da eroe.', 'Azione', 133, 'TIMBUR022', 2017, 'Stati Uniti', 0.5),
    ('TDK001', 'Batman Begins', 'Bruce Wayne diventa Batman e inizia la sua crociata contro il crimine a Gotham City.', 'Azione', 140, 'CHRNOL018', 2005, 'Stati Uniti', 0.5),
    ('TDK002', 'Il cavaliere oscuro', 'Batman si scontra con il Joker mentre Harvey Dent si trasforma in Two-Face.', 'Azione', 152, 'CHRNOL018', 2008, 'Stati Uniti', 0.5);

-- Popolamento tabella Cast
INSERT INTO Cast (Artista, Film)
VALUES

    ('LEODIC001', 'HAR001'), ('LEODIC001', 'HAR002'), ('LEODIC001', 'FF001'), ('LEODIC001', 'GLD001'),('LEODIC001','TRL001' ),
    ('MERSTR002','HAR001'), ('MERSTR002', 'HAR002'), ('MERSTR002', 'SW001'),
    ('TOMHAN005','TRL001'),('TOMHAN005', 'SW003'), ('TOMHAN005', 'TDK002'), ('TOMHAN005', 'LOTR002'),
    ('BRAPIT006', 'GL001'),('BRAPIT006', 'SW003'), ('BRAPIT006', 'GLD001'), ('BRAPIT006', 'SW001'),('BRAPIT006', 'LOTR002'),
    ('ANJOLI008', 'SNT001'),('ANJOLI008', 'HAR002'), ('ANJOLI008', 'MCU005'), ('ANJOLI008', 'MCU004'),('ANJOLI008','TDK002'),
    ('ROBNEI009', 'JN001'), ('ROBNEI009', 'LOTR003'), ('ROBNEI009', 'PDC001'),
    ('ALPPAC010', 'FRL001'), ('ALPPAC010', 'SNT001'),
    ('JONDEP011', 'HAR001'), ('JONDEP011', 'FF001'),
    ('CLIEAS012', 'TRL001'), ('CLIEAS012', 'LOTR001'), ('CLIEAS012', 'TDK001'),
    ('NATPOR013', 'BCK001'), ('NATPOR013', 'LOTR001'),
    ('DENWAS015', 'HAR001'), ('DENWAS015','TDK001'),
    ('KATWIN017', 'SW002'), ('KATWIN017', 'LOTR003'),
    ('JENLAW019', 'GL001'), ('JENLAW019', 'FRL001'),
    ('MATDAM021', 'BCK001'), ('MATDAM021', 'JN001'),
    ('EMMSTO023', 'TRL001'), ('EMMSTO023', 'BCK001'),
    ('GEOCLO024', 'MCU001'), ('GEOCLO024', 'FF001'),
    ('ANNHAT026', 'HAR001'), ('ANNHAT026', 'SW001'), ('ANNHAT026', 'MCU004'),
    ('JULROB028', 'SW002'),  ('JULROB028', 'MCU002'),
    ('MARSHE029', 'FF001'),  ('MARSHE029', 'TDK002'),
    ('ROBDOW031', 'MCU001'), ('ROBDOW031', 'MCU002'),('ROBDOW031', 'MCU003');

-- Popolamento tabella Premio
INSERT INTO Premio (Codice, Tipologia, Ambito, Descrizione)
VALUES
    ('OSCAR001', 'Oscar', 'Cinema', 'Miglior film'),
    ('OSCAR002', 'Oscar', 'Cinema', 'Miglior regia'),
    ('OSCAR003', 'Oscar', 'Cinema', 'Miglior attore protagonista'),
    ('OSCAR004', 'Oscar', 'Cinema', 'Miglior attrice protagonista'),
    ('OSCAR005', 'Oscar', 'Cinema', 'Miglior attore non protagonista'),
    ('OSCAR006', 'Oscar', 'Cinema', 'Miglior attrice non protagonista'),
    ('OSCAR007', 'Oscar', 'Cinema', 'Miglior sceneggiatura originale'),
    ('OSCAR008', 'Oscar', 'Cinema', 'Miglior sceneggiatura non originale'),
    ('OSCAR009', 'Oscar', 'Cinema', 'Miglior film straniero'),
    ('OSCAR010', 'Oscar', 'Cinema', 'Miglior film d''animazione'),
    ('OSCAR011', 'Oscar', 'Cinema', 'Miglior fotografia'),
    ('OSCAR012', 'Oscar', 'Cinema', 'Miglior montaggio'),
    ('OSCAR013', 'Oscar', 'Cinema', 'Miglior colonna sonora originale'),
    ('OSCAR014', 'Oscar', 'Cinema', 'Miglior canzone originale'),
    ('OSCAR015', 'Oscar', 'Cinema', 'Miglior scenografia'),
    ('OSCAR016', 'Oscar', 'Cinema', 'Migliori costumi'),
    ('OSCAR017', 'Oscar', 'Cinema', 'Miglior trucco'),
    ('OSCAR018', 'Oscar', 'Cinema', 'Miglior sonoro'),
    ('OSCAR019', 'Oscar', 'Cinema', 'Migliori effetti visivi'),
    ('OSCAR020', 'Oscar', 'Cinema', 'Miglior montaggio sonoro');



-- Popolamento PremiazioneFilm
INSERT INTO PremiazioneFilm (Premio, Film, Data)
VALUES

    ('OSCAR001', 'HAR001', '2001-02-23'),
    ('OSCAR007', 'HAR001', '2001-02-23'),
    ('OSCAR015', 'HAR002', '2002-02-25'),
    ('OSCAR010', 'HAR002', '2002-02-25'),
    ('OSCAR008', 'FF001', '2001-02-23'),
    ('OSCAR018', 'FF001', '2001-02-23'),
    ('OSCAR002', 'BCK001', '1985-02-24'),
    ('OSCAR019', 'BCK001', '1985-02-24'),
    ('OSCAR015', 'GLD001', '2000-02-22'),
    ('OSCAR013', 'GLD001', '2000-02-22'),
    ('OSCAR011', 'FRL001', '1994-02-21'),
    ('OSCAR017', 'FRL001', '1994-02-21'),
    ('OSCAR007', 'TRL001', '1997-02-26'),
    ('OSCAR012', 'TRL001', '1997-02-26'),
    ('OSCAR014', 'JN001', '2014-02-26'),
    ('OSCAR016', 'JN001', '2014-02-26'),
    ('OSCAR008', 'SNT001', '1991-02-20'),
    ('OSCAR020', 'SNT001', '1991-02-20'),
    ('OSCAR009', 'GL001', '2013-02-23'),
    ('OSCAR014', 'GL001', '2013-02-23'),
    ('OSCAR020', 'SW001', '1999-02-21'),
    ('OSCAR010', 'SW001', '1999-02-21'),
    ('OSCAR019', 'SW002', '2002-02-25'),
    ('OSCAR013', 'SW002', '2002-02-25'),
    ('OSCAR001', 'SW003', '2005-02-28'),
    ('OSCAR002', 'SW003', '2005-02-28'),
    ('OSCAR016', 'PDC001', '2003-02-25'),
    ('OSCAR018', 'PDC001', '2003-02-25'),
    ('OSCAR017', 'LOTR001', '2001-02-23'),
    ('OSCAR009', 'LOTR001', '2001-02-23'),
    ('OSCAR019', 'LOTR002', '2002-02-25'),
    ('OSCAR008', 'LOTR002', '2002-02-25'),
    ('OSCAR016', 'LOTR003', '2003-02-25'),
    ('OSCAR020', 'LOTR003', '2003-02-25'),
    ('OSCAR015', 'MCU001', '2008-02-19'),
    ('OSCAR011', 'MCU001', '2008-02-19'),
    ('OSCAR010', 'MCU002', '2011-02-21'),
    ('OSCAR002', 'MCU002', '2011-02-21'),
    ('OSCAR014', 'MCU003', '2011-02-21'),
    ('OSCAR016', 'MCU003', '2011-02-21'),
    ('OSCAR007', 'MCU004', '2012-02-23'),
    ('OSCAR009', 'MCU004', '2012-02-23'),
    ('OSCAR001', 'MCU005', '2017-02-18'),
    ('OSCAR004', 'MCU005', '2017-02-18'),
    ('OSCAR012', 'TDK001', '2005-02-28'),
    ('OSCAR013', 'TDK001', '2005-02-28'),
    ('OSCAR001', 'TDK002', '2008-02-19'),
    ('OSCAR002', 'TDK002', '2008-02-19');


-- Popolamento PremiazioneArtista
INSERT INTO PremiazioneArtista (Premio, Film, Artista, Data)
VALUES
    ('OSCAR004', 'GLD001', 'LEODIC001', '2000-02-22'),
    ('OSCAR003', 'TRL001', 'LEODIC001', '1997-02-26'),
    ('OSCAR005', 'HAR001', 'MERSTR002', '2001-02-23'),
    ('OSCAR006', 'HAR002', 'MERSTR002', '2002-02-25'),
    ('OSCAR003', 'SW001', 'MERSTR002', '1999-02-21'),
    ('OSCAR006', 'TRL001', 'TOMHAN005', '1997-02-26'),
    ('OSCAR005', 'SW003', 'TOMHAN005', '2005-02-28'),
    ('OSCAR004', 'TDK002', 'TOMHAN005', '2008-02-19'),
    ('OSCAR003', 'LOTR002', 'TOMHAN005', '2002-02-25'),
    ('OSCAR006', 'GL001', 'BRAPIT006', '2013-02-23'),
    ('OSCAR004', 'SW003', 'BRAPIT006', '2005-02-28'),
    ('OSCAR005', 'GLD001', 'BRAPIT006', '2000-02-22'),
    ('OSCAR005', 'SW001', 'BRAPIT006', '1999-02-21'),
    ('OSCAR005', 'LOTR002', 'BRAPIT006', '2002-02-25'),
    ('OSCAR005', 'SNT001', 'ANJOLI008', '1991-02-20'),
    ('OSCAR004', 'MCU005', 'ANJOLI008', '2017-02-18'),
    ('OSCAR003', 'MCU004', 'ANJOLI008', '2012-02-23'),
    ('OSCAR004', 'JN001', 'ROBNEI009', '2014-02-26'),
    ('OSCAR003', 'LOTR003', 'ROBNEI009', '2003-02-25'),

    ('OSCAR005', 'FRL001', 'ALPPAC010', '1994-02-21'),
    ('OSCAR006', 'SNT001', 'ALPPAC010', '1991-02-20'),

    ('OSCAR004', 'TRL001', 'CLIEAS012', '1997-02-26'),
    ('OSCAR006', 'TDK001', 'CLIEAS012', '2005-02-28'),
    ('OSCAR004', 'BCK001', 'NATPOR013', '1985-02-24'),

    ('OSCAR003', 'HAR001', 'DENWAS015', '2001-02-23'),
    ('OSCAR005', 'LOTR003', 'KATWIN017', '2003-02-25'),
    ('OSCAR003', 'GL001', 'JENLAW019', '2013-02-23'),
    ('OSCAR004', 'FRL001', 'JENLAW019', '1994-02-21'),
    ('OSCAR003', 'BCK001', 'MATDAM021', '1985-02-24'),
    ('OSCAR006', 'JN001', 'MATDAM021', '2014-02-26'),
    ('OSCAR006', 'BCK001', 'EMMSTO023', '1985-02-24'),
    ('OSCAR005', 'MCU001', 'GEOCLO024', '2008-02-19'),
    ('OSCAR006', 'FF001', 'GEOCLO024', '2001-02-23'),
    ('OSCAR004', 'HAR001', 'ANNHAT026', '2001-02-23'),
    ('OSCAR004', 'SW001', 'ANNHAT026', '1999-02-21'),
    ('OSCAR005', 'MCU004', 'ANNHAT026', '2012-02-23'),
    ('OSCAR005', 'MCU002', 'JULROB028', '2011-02-21'),
    ('OSCAR003', 'MCU001', 'ROBDOW031', '2008-02-19'),
    ('OSCAR003', 'MCU002', 'ROBDOW031', '2011-02-21'),
    ('OSCAR003', 'MCU003', 'ROBDOW031', '2011-02-21');

-- Popolamento tabella Lingua
INSERT INTO Lingua (Nome)
VALUES
    ('Inglese'),
    ('Spagnolo'),
    ('Francese'),
    ('Tedesco'),
    ('Italiano'),
    ('Cinese'),
    ('Giapponese'),
    ('Russo'),
    ('Portoghese'),
    ('Coreano'),
    ('Arabo'),
    ('Olandese'),
    ('Svedese'),
    ('Danese'),
    ('Norvegese'),
    ('Finlandese'),
    ('Polacco'),
    ('Ungherese'),
    ('Greco'),
    ('Turco'),
    ('Ebraico'),
    ('Indonesiano'),
    ('Malese'),
    ('Thai'),
    ('Vietnamita'),
    ('Filippino'),
    ('Hindi'),
    ('Bengalese'),
    ('Swahili');

-- Popolamento Sottotitoli
INSERT INTO Sottotitoli (Film, Lingua)
VALUES

('HAR001', 'Inglese'), ('HAR001', 'Spagnolo'), ('HAR001', 'Francese'), ('HAR001', 'Tedesco'), ('HAR001', 'Italiano'),
('HAR002', 'Cinese'), ('HAR002', 'Giapponese'), ('HAR002', 'Russo'), ('HAR002', 'Portoghese'), ('HAR002', 'Coreano'),('HAR002', 'Olandese'),
('FF001', 'Arabo'), ('FF001', 'Olandese'), ('FF001', 'Svedese'), ('FF001', 'Danese'), ('FF001', 'Norvegese'),
('BCK001', 'Finlandese'), ('BCK001', 'Polacco'), ('BCK001', 'Ungherese'), ('BCK001', 'Greco'), ('BCK001', 'Turco'),
('GLD001', 'Ebraico'), ('GLD001', 'Indonesiano'), ('GLD001', 'Malese'), ('GLD001', 'Thai'), ('GLD001', 'Vietnamita'),('GLD001', 'Norvegese'),
('FRL001', 'Filippino'), ('FRL001', 'Hindi'), ('FRL001', 'Bengalese'), ('FRL001', 'Swahili'), ('FRL001', 'Svedese'), ('FRL001', 'Polacco'),
('TRL001', 'Danese'), ('TRL001', 'Norvegese'), ('TRL001', 'Finlandese'), ('TRL001', 'Polacco'), ('TRL001', 'Ungherese'),
('JN001', 'Greco'), ('JN001', 'Turco'), ('JN001', 'Ebraico'), ('JN001', 'Indonesiano'), ('JN001', 'Malese'),
('LOTR001', 'Bengalese'), ('LOTR002', 'Svedese'), ('LOTR003', 'Turco'), ('MCU001', 'Ungherese'), ('MCU002', 'Ebraico'),
('MCU003', 'Indonesiano'), ('MCU004', 'Vietnamita'), ('MCU005', 'Filippino'), ('TDK001', 'Swahili'), ('TDK002', 'Hindi'),
('SNT001', 'Turco'), ('GL001', 'Ebraico'), ('SW001', 'Indonesiano'), ('SW002', 'Filippino');

-- Popolamento LinguaAudio
INSERT INTO LinguaAudio (Film, Lingua)
VALUES

('HAR001', 'Inglese'), ('HAR001', 'Spagnolo'), ('HAR001', 'Francese'), ('HAR001', 'Italiano'),('HAR002', 'Olandese'),
('HAR002', 'Cinese'), ('HAR002', 'Giapponese'), ('HAR002', 'Russo'), ('HAR002', 'Coreano'),
('FF001', 'Arabo'), ('FF001', 'Olandese'), ('FF001', 'Svedese'), ('FF001', 'Danese'), ('FF001', 'Norvegese'),
('BCK001', 'Finlandese'), ('BCK001', 'Polacco'), ('BCK001', 'Greco'), ('BCK001', 'Turco'),
('GLD001', 'Ebraico'), ('GLD001', 'Indonesiano'), ('GLD001', 'Malese'), ('GLD001', 'Thai'), ('GLD001', 'Vietnamita'),
('FRL001', 'Filippino'), ('FRL001', 'Hindi'), ('FRL001', 'Swahili'), ('FRL001', 'Svedese'),
('TRL001', 'Danese'), ('TRL001', 'Finlandese'), ('TRL001', 'Polacco'),('TRL001', 'Ungherese'),
('JN001', 'Greco'), ('JN001', 'Turco'), ('JN001', 'Ebraico'), ('JN001', 'Indonesiano'), ('JN001', 'Malese'),
('LOTR002', 'Svedese'), ('LOTR003', 'Turco'), ('MCU001', 'Ungherese'), ('MCU002', 'Ebraico'),
('MCU004', 'Vietnamita'), ('MCU005', 'Filippino'), ('TDK001', 'Swahili'), ('TDK002', 'Hindi'),
('SNT001', 'Turco'), ('GL001', 'Ebraico'), ('SW001', 'Indonesiano'), ('SW002', 'Filippino');

-- Popolamento tabella Fattore
INSERT INTO Fattore (Tipologia, Descrizione)
VALUES
    ('Recensione', 'Fattore che rappresenta interesse verso i voti che utenti e critici hanno attribuito al film'),
    ('Premio', 'Fattore che rappresenta interesse verso i premi che il film ha vinto compresi quelli degli artisti'),
    ('Popolarità', 'Fattore che rappresenta intersse verso la popolarità degli artisti che hanno preso parte al film, calcolata in base a quanti premi essi hanno vinto'),
    ('Genere', 'Fattore che rappresenta la votazione del film in base ai film dello stesso genere');


-- Popolamento tabella Audio
INSERT INTO Audio (Nome, FattoreCompressione, Bitrate)
VALUES
    ('MP3', 0.122, 0.320),
    ('AAC', 0.125, 0.256),
    ('AIFF', 0.118, 1411),
    ('WAV', 0.12, 1.411),
    ('WMA', 0.123, 1.128),
    ('DolbyDigital', 0.11, 0.096),
    ('DolbyTrueHD', 0.11, 4.5),
    ('DTSDigitalSurround', 0.12, 1.5);

-- Popolamento tabella Video
INSERT INTO Video (Nome, FattoreCompressione, Bitrate, Risoluzione, RapportoAspetto)
VALUES
    ('H.264', 0.083, 8, '720p', '16:9'),
    ('H.265', 0.067, 6, '1080p', '16:9'),
    ('VP9', 0.07, 40, '2K', '16:9'),
    ('AV1', 0.06, 20, '4K', '16:9');
    -- Popolamento tabella Estensione
INSERT INTO Estensione (Nome, Descrizione)
VALUES
    ('MP4', 'MPEG-4 Part 14, comunemente noto come MP4, è un formato contenitore multimediale utilizzato per memorizzare video e audio, nonché altri dati come sottotitoli e immagini statiche.'),
    ('AVI', 'Audio Video Interleave, noto anche come AVI, è un formato contenitore multimediale sviluppato da Microsoft per memorizzare video e audio.'),
    ('MKV', 'Matroska Video, noto anche come MKV, è un formato contenitore multimediale open source che può contenere video, audio, sottotitoli e altre informazioni, come capitoli e metadati.'),
    ('MOV', 'Apple QuickTime Movie, comunemente noto come MOV, è un formato contenitore multimediale sviluppato da Apple per memorizzare video, audio e altri dati.'),
    ('WMV', 'Windows Media Video, noto anche come WMV, è un formato di compressione video sviluppato da Microsoft.'),
    ('FLV', 'Flash Video, noto anche come FLV, è un formato contenitore multimediale utilizzato per la distribuzione di video su Internet tramite Adobe Flash Player.'),
    ('AVCHD', 'Advanced Video Coding High Definition, noto anche come AVCHD, è un formato di registrazione e riproduzione video ad alta definizione utilizzato principalmente in videocamere digitali.');

-- Popolamento tabella DisponibilitàAudio
INSERT INTO DisponibilitaAudio (Audio, Film)
VALUES

    ('DolbyDigital', 'HAR001'), ('DolbyTrueHD', 'HAR001'),
    ('DolbyDigital', 'HAR002'), ('DolbyTrueHD', 'HAR002'), ('AAC', 'HAR002'),
    ('WAV', 'HAR002'),

    ('DolbyDigital', 'FF001'), ('DolbyTrueHD', 'FF001'), ('AAC', 'FF001'),


    ('DolbyDigital', 'BCK001'), ('DolbyTrueHD', 'BCK001'), ('AAC', 'BCK001'), ('MP3', 'BCK001'),

    ('DolbyDigital', 'GLD001'), ('DolbyTrueHD', 'GLD001'), ('AAC', 'GLD001'), ('MP3', 'GLD001'),

    ('DolbyDigital', 'FRL001'), ('DolbyTrueHD', 'FRL001'), ('AAC', 'FRL001'), ('WAV', 'FRL001'),

    ('DolbyDigital', 'TRL001'), ('DolbyTrueHD', 'TRL001'), ('AAC', 'TRL001'), ('WAV', 'TRL001'),

    ('DolbyDigital', 'JN001'), ('DolbyTrueHD', 'JN001'), ('AAC', 'JN001'),

    ('DolbyDigital', 'SNT001'), ('DolbyTrueHD', 'SNT001'), ('AAC', 'SNT001'), ('WAV', 'SNT001'),

    ('DolbyDigital', 'GL001'), ('DolbyTrueHD', 'GL001'), ('AAC', 'GL001'), ('MP3', 'GL001'),

    ('DolbyDigital', 'SW001'), ('DolbyTrueHD', 'SW001'), ('MP3', 'SW001'),
    ('DolbyDigital', 'SW002'), ('DolbyTrueHD', 'SW002'), ('AAC', 'SW002'),
    ('DolbyDigital', 'SW003'), ('DolbyTrueHD', 'SW003'), ('WAV', 'SW003'),

    ('MP3', 'PDC001'), ('AIFF', 'PDC001'), ('WMA', 'PDC001'),

    ('DolbyTrueHD', 'LOTR001'), ('AAC', 'LOTR001'), ('AIFF', 'LOTR001'),
    ('DolbyDigital', 'LOTR002'), ('MP3', 'LOTR002'), ('WAV', 'LOTR002'),
    ('DolbyTrueHD', 'LOTR003'), ('AAC', 'LOTR003'), ('WMA', 'LOTR003'),


    ('DolbyTrueHD', 'MCU001'), ('AAC', 'MCU001'), ('AIFF', 'MCU001'),
    ('DolbyDigital', 'MCU002'), ('MP3', 'MCU002'), ('WAV', 'MCU002'),
    ('DolbyTrueHD', 'MCU003'), ('AAC', 'MCU003'), ('WMA', 'MCU003'),
    ('DolbyDigital', 'MCU004'), ('AAC', 'MCU004'), ('WAV', 'MCU004'),
    ('DolbyTrueHD', 'MCU005'), ('MP3', 'MCU005'), ('WAV', 'MCU005'),

    ('DolbyTrueHD', 'TDK001'), ('AAC', 'TDK001'), ('WMA', 'TDK001'),
    ('DolbyDigital', 'TDK002'), ('MP3', 'TDK002'), ('AIFF', 'TDK002');

-- Popolamento tabella DisponibilitàVideo
INSERT INTO DisponibilitaVideo (Video, Film)
VALUES

    ('VP9', 'HAR001'), ('H.264', 'HAR001'), ('H.265', 'HAR001'),
    ('AV1', 'HAR002'), ('H.264', 'HAR002'), ('H.265', 'HAR002'),

    ('VP9', 'FF001'), ('H.264', 'FF001'), ('H.265', 'FF001'),

    ('VP9', 'BCK001'), ('H.264', 'BCK001'), ('H.265', 'BCK001'),

    ('H.264', 'GLD001'), ('H.265', 'GLD001'), ('VP9', 'GLD001'),
    ('H.264', 'FRL001'), ('H.265', 'FRL001'),('VP9', 'FRL001'),

    ('H.264', 'TRL001'), ('H.265', 'TRL001'), ('VP9', 'TRL001'),

    ('H.264', 'JN001'), ('H.265', 'JN001'), ('VP9', 'JN001'),

    ('H.264', 'SNT001'), ('H.265', 'SNT001'), ('VP9', 'SNT001'),

    ('H.264', 'GL001'), ('H.265', 'GL001'), ('VP9', 'GL001'),

    ('H.264', 'SW001'), ('H.265', 'SW001'), ('VP9', 'SW001'),
    ('H.264', 'SW002'), ('H.265', 'SW002'), ('VP9', 'SW002'),
    ('H.264', 'SW003'), ('H.265', 'SW003'), ('VP9', 'SW003'),

    ('H.264', 'PDC001'), ('H.265', 'PDC001'), ('VP9', 'PDC001'),
    ('H.264', 'LOTR001'), ('H.265', 'LOTR001'), ('VP9', 'LOTR001'),
    ('H.264', 'LOTR002'), ('H.265', 'LOTR002'), ('VP9', 'LOTR002'),
    ('H.264', 'LOTR003'), ('H.265', 'LOTR003'), ('VP9', 'LOTR003'),


    ('H.264', 'MCU001'), ('VP9', 'MCU001'), ('AV1', 'MCU001'),
    ('H.265', 'MCU002'), ('VP9', 'MCU002'), ('AV1', 'MCU002'),
    ('H.264', 'MCU003'), ('H.265', 'MCU003'), ('AV1', 'MCU003'),
    ('H.264', 'MCU004'), ('H.265', 'MCU004'), ('VP9', 'MCU004'),
    ('H.264', 'MCU005'), ('H.265', 'MCU005'), ('VP9', 'MCU005'), ('AV1', 'MCU005'),

    ('H.264', 'TDK001'), ('H.265', 'TDK001'), ('AV1', 'TDK001'),
    ('H.264', 'TDK002'), ('H.265', 'TDK002'), ('VP9', 'TDK002');

-- Popolamento tabella Formato
INSERT INTO Formato (Codice, QualitaVideo, QualitaAudio, Estensione, CodecVideo, CodecAudio)
VALUES
    ('F001', 'Standard', 'HD', 'MP4', 'H.264', 'AAC'),
    ('F002', 'HD', 'HD', 'MKV', 'H.265', 'MP3'),
    ('F003', '4K', 'HD', 'AVI', 'AV1', 'AIFF'),
    ('F004', 'Standard', 'HD', 'MOV', 'H.265', 'WAV'),
    ('F005', '4K', 'UltraHD', 'WMV', 'AV1', 'DTSDigitalSurround'),
    ('F006', 'Standard', 'HD', 'AVCHD', 'H.265', 'AAC'),
    ('F007', '4K', 'FullHD', 'AVCHD', 'AV1', 'DolbyDigital'),
    ('F008', 'Standard', 'UltraHD', 'MP4', 'H.264', 'DTSDigitalSurround'),
    ('F009', 'HD', 'FullHD', 'MKV', 'H.265', 'DolbyDigital'),
    ('F010', '4K', 'HD', 'AVI', 'AV1', 'MP3'),
    ('F011', '2K', 'FullHD', 'MOV', 'VP9', 'WMA'),
    ('F012', 'HD', 'UltraHD', 'MOV', 'H.265', 'DolbyTrueHD'),
    ('F013', '2K', 'UltraHD', 'MOV', 'VP9', 'DolbyTrueHD');

-- Popolamento tabella FileDiFilm
INSERT INTO FileDiFilm (Film, Formato, DataRilascio, DimensioneFile)
VALUES


    ('HAR001', 'F008', '2020-10-20', NULL),
    ('HAR001', 'F009', '2019-12-19', NULL),
    ('HAR001', 'F010', '2020-11-20', NULL),
    ('HAR001', 'F011', '2019-07-19', NULL),

    ('HAR002', 'F008', '2019-03-31', NULL),
    ('HAR002', 'F009', '2018-04-20', NULL),
    ('HAR002', 'F010', '2019-03-31', NULL),
    ('HAR002', 'F011', '2018-04-20', NULL),

    ('FF001', 'F011', '2021-10-15', NULL),
    ('FF001', 'F001', '2018-01-05', NULL),
    ('FF001', 'F009', '2021-10-15', NULL),
    ('FF001', 'F010', '2018-01-05', NULL),

    ('BCK001', 'F013', '2021-07-18', NULL),
    ('BCK001', 'F009', '2021-07-18', NULL),
    ('BCK001', 'F007', '2021-07-18', NULL),
    ('BCK001', 'F008', '2021-07-18', NULL),

    ('GLD001', 'F001', '2022-05-17', NULL),
    ('GLD001', 'F002', '2021-06-30', NULL),
    ('GLD001', 'F010', '2022-05-17', NULL),
    ('GLD001', 'F011', '2021-06-30', NULL),

    ('FRL001', 'F003', '2019-04-20', NULL),
    ('FRL001', 'F004', '2021-04-30', NULL),
    ('FRL001', 'F008', '2019-04-20', NULL),
    ('FRL001', 'F011', '2021-04-30', NULL),

    ('TRL001', 'F005', '2019-07-21', NULL),
    ('TRL001', 'F006', '2020-08-18', NULL),
    ('TRL001', 'F008', '2019-07-21', NULL),
    ('TRL001', 'F011', '2020-08-18', NULL),

    ('JN001', 'F007', '2014-03-13', NULL),
    ('JN001', 'F008', '2014-03-13', NULL),
    ('JN001', 'F009', '2014-03-13', NULL),
    ('JN001', 'F013', '2014-03-13', NULL),

    ('SNT001', 'F008', '2016-05-16', NULL),
    ('SNT001', 'F009', '2018-01-29', NULL),
    ('SNT001', 'F010', '2016-05-16', NULL),
    ('SNT001', 'F011', '2018-01-29', NULL),


    ('GL001', 'F010', '2022-03-29', NULL),
    ('GL001', 'F011', '2017-07-05', NULL),
    ('GL001', 'F008', '2022-03-29', NULL),
    ('GL001', 'F009', '2017-07-05', NULL),

    ('PDC001', 'F012', '2017-10-07', NULL),
    ('PDC001', 'F013', '2018-01-06', NULL),
    ('PDC001', 'F010', '2017-10-07', NULL),
    ('PDC001', 'F008', '2018-01-06', NULL),

    ('LOTR001', 'F001', '2019-11-10', NULL),
    ('LOTR001', 'F013', '2022-01-10', NULL),
    ('LOTR001', 'F004', '2019-11-10', NULL),
    ('LOTR001', 'F005', '2022-01-10', NULL),

    ('LOTR002', 'F001', '2019-11-10', NULL),
    ('LOTR002', 'F013', '2022-01-10', NULL),
    ('LOTR002', 'F004', '2019-11-10', NULL),
    ('LOTR002', 'F005', '2022-01-10', NULL),

    ('LOTR003', 'F001', '2019-11-10', NULL),
    ('LOTR003', 'F013', '2022-01-10', NULL),
    ('LOTR003', 'F005', '2019-11-10', NULL),
    ('LOTR003', 'F002', '2022-01-10', NULL),

    ('SW001', 'F001', '2020-05-19', NULL),
    ('SW001', 'F013', '2022-07-22', NULL),
    ('SW001', 'F012', '2020-05-19', NULL),
    ('SW001', 'F010', '2022-07-22', NULL),

    ('SW002', 'F001', '2018-05-16', NULL),
    ('SW002', 'F007', '2020-04-11', NULL),
    ('SW002', 'F013', '2018-05-16', NULL),
    ('SW002', 'F012', '2020-04-11', NULL),

    ('SW003', 'F008', '2018-05-19', NULL),
    ('SW003', 'F010', '2019-05-19', NULL),
    ('SW003', 'F011', '2018-05-19', NULL),
    ('SW003', 'F009', '2019-05-19', NULL),

    ('MCU001', 'F011', '2023-10-15', NULL),
    ('MCU001', 'F001', '2020-01-05', NULL),
    ('MCU001', 'F002', '2023-10-15', NULL),
    ('MCU001', 'F010', '2020-01-05', NULL),

    ('MCU002', 'F011', '2023-10-15', NULL),
    ('MCU002', 'F001', '2020-01-05', NULL),
    ('MCU002', 'F009', '2023-10-15', NULL),
    ('MCU002', 'F010', '2020-01-05', NULL),

    ('MCU003', 'F011', '2023-10-15', NULL),
    ('MCU003', 'F001', '2020-01-05', NULL),
    ('MCU003', 'F009', '2023-10-15', NULL),
    ('MCU003', 'F010', '2020-01-05', NULL),

    ('MCU004', 'F011', '2023-10-15', NULL),
    ('MCU004', 'F001', '2020-01-05', NULL),
    ('MCU004', 'F009', '2023-10-15', NULL),
    ('MCU004', 'F010', '2020-01-05', NULL),

    ('MCU005', 'F011', '2023-10-15', NULL),
    ('MCU005', 'F001', '2020-01-05', NULL),
    ('MCU005', 'F009', '2023-10-15', NULL),
    ('MCU005', 'F010', '2020-01-05', NULL),

    ('TDK001', 'F012', '2020-05-07', NULL),
    ('TDK001', 'F013', '2018-06-18', NULL),
    ('TDK001', 'F008', '2020-05-07', NULL),
    ('TDK001', 'F010', '2018-06-18', NULL),

    ('TDK002', 'F012', '2020-05-07', NULL),
    ('TDK002', 'F013', '2018-06-18', NULL),
    ('TDK002', 'F008', '2020-05-07', NULL),
    ('TDK002', 'F010', '2018-06-18', NULL);


-- ----------------------------
--  Record di `Utente`
-- ----------------------------
INSERT INTO Utente (Codice, Nome, Cognome, Email, Password, Critico, ScadenzaAbbonamento) VALUES
('USR001', 'Alice', 'Rossi', 'alice@email.com', 'pwd123', 0, NULL),
('USR002', 'Bob', 'Bianchi', 'bob@email.com', 'pass456', 1, NULL),
('USR003', 'Charlie', 'Verdi', 'charlie@email.com', 'abc123', 0, NULL),
('USR004', 'David', 'Neri', 'david@email.com', 'def456', 1, NULL),
('USR005', 'Emma', 'Gialli', 'emma@email.com', 'xyz789', 0, NULL),
('USR006', 'Federico', 'Marroni', 'federico@email.com', 'pwd987', 1, NULL),
('USR007', 'Giulia', 'Rosa', 'giulia@email.com', 'passabc', 0, NULL),
('USR008', 'Hugo', 'Celesti', 'hugo@email.com', 'pwdxyz', 1, NULL),
('USR009', 'Irene', 'Blu', 'irene@email.com', '123abc', 0, NULL),
('USR010', 'Jack', 'Verdi', 'jack@email.com', 'pass123', 1, NULL),
('USR011', 'Karen', 'Arancioni', 'karen@email.com', 'abc456', 0, NULL),
('USR012', 'Luca', 'Gialli', 'luca@email.com', 'pwd789', 1, NULL),
('USR013', 'Maria', 'Bianchi', 'maria@email.com', '456def', 0, NULL),
('USR014', 'Nicola', 'Rosa', 'nicola@email.com', 'pass789', 1, NULL),
('USR015', 'Olivia', 'Celesti', 'olivia@email.com', 'pwd456', 0, NULL),
('USR016', 'Paolo', 'Arancioni', 'paolo@email.com', 'def789', 1, NULL),
('USR017', 'Quinto', 'Verdi', 'quinto@email.com', 'pwdabc', 0, NULL),
('USR018', 'Rosa', 'Rossi', 'rosa@email.com', '789xyz', 1, NULL),
('USR019', 'Sara', 'Blu', 'sara@email.com', 'abc123', 0, NULL),
('USR020', 'Tommaso', 'Neri', 'tommaso@email.com', 'xyz123', 1, NULL),
('USR021', 'Ugo', 'Gialli', 'ugo@email.com', 'pass789', 0, NULL),
('USR022', 'Valentina', 'Bianchi', 'valentina@email.com', '123def', 1, NULL),
('USR023', 'Walter', 'Celesti', 'walter@email.com', 'def123', 0, NULL),
('USR024', 'Xavier', 'Rosa', 'xavier@email.com', 'pwd456', 1, NULL),
('USR025', 'Ylenia', 'Arancioni', 'ylenia@email.com', '456abc', 0, NULL),
('USR026', 'Zara', 'Verdi', 'zara@email.com', 'pwd789', 1, NULL),
('USR027', 'Alberto', 'Blu', 'alberto@email.com', 'xyz456', 0, NULL),
('USR028', 'Beatrice', 'Neri', 'beatrice@email.com', 'pass123', 1, NULL),
('USR029', 'Carlo', 'Gialli', 'carlo@email.com', 'abc789', 0, NULL),
('USR030', 'Diana', 'Rossi', 'diana@email.com', 'pwd123', 1, NULL);

-- ----------------------------
--  Record di `CartaCredito`
-- ----------------------------
INSERT INTO CartaCredito (Numero, CVV, Scadenza, Proprietario) VALUES
('1111222233334444', '123', '2024-12-01', 'USR001'),
('2222333344445555', '234', '2025-01-01', 'USR002'),
('3333444455556666', '345', '2023-11-01', 'USR003'),
('4444555566667777', '456', '2024-10-01', 'USR004'),
('5555666677778888', '567', '2023-09-01', 'USR005'),
('6666777788889999', '678', '2025-02-01', 'USR006'),
('7777888899990000', '789', '2024-08-01', 'USR007'),
('8888999900001111', '890', '2023-07-01', 'USR008'),
('9999000011112222', '901', '2025-03-01', 'USR009'),
('1010101010101010', '012', '2024-09-01', 'USR010'),
('1212121212121212', '123', '2025-04-01', 'USR011'),
('1313131313131313', '234', '2023-12-01', 'USR012'),
('1414141414141414', '345', '2024-11-01', 'USR013'),
('1515151515151515', '456', '2023-10-01', 'USR014'),
('1616161616161616', '567', '2024-07-01', 'USR015'),
('1717171717171717', '678', '2025-05-01', 'USR016'),
('1818181818181818', '789', '2024-06-01', 'USR017'),
('1919191919191919', '890', '2023-05-01', 'USR018'),
('2020202020202020', '901', '2025-06-01', 'USR019'),
('2121212121212121', '012', '2024-04-01', 'USR020'),
('2222222222222222', '123', '2025-07-01', 'USR021'),
('2323232323232323', '234', '2023-03-01', 'USR022'),
('2424242424242424', '345', '2024-12-01', 'USR023'),
('2525252525252525', '456', '2023-02-01', 'USR024'),
('2626262626262626', '567', '2024-03-01', 'USR025'),
('2727272727272727', '678', '2025-08-01', 'USR026'),
('2828282828282828', '789', '2024-02-01', 'USR027'),
('2929292929292929', '890', '2023-01-01', 'USR028'),
('3030303030303030', '901', '2025-09-01', 'USR029'),
('3131313131313131', '012', '2024-05-01', 'USR030');





-- ----------------------------
--  Record di `Abbonamento`
-- ----------------------------
INSERT INTO Abbonamento (Nome, TariffaMensile, OreMensili, QualitaVideo, NumeroDownload) VALUES
('Basic', 3.99, 50, '720p', 0),
('Premium', 6.99, 50, '1080p', 2),
('Pro', 8.99, 90, '1080p', 5),
('Deluxe', 10.99, 120, '2K', 5),
('Ultimate', 12.99, 120, '4K', 10);




-- ----------------------------
--  Record di `Pagamento`
-- ----------------------------
-- Popolamento della tabella Pagamento con durate valide di 1, 3, 6 e 12 mesi
INSERT INTO Pagamento (Utente, DataPagamento, Abbonamento, DurataValidita, ImportoFattura, CartaUsata) VALUES
('USR001', '2024-01-01', 'Basic', 1, NULL, '1111222233334444'),
('USR001', '2024-03-15', 'Premium', 3, NULL, '1111222233334444'),
('USR001', '2024-06-20', 'Pro', 6, NULL, '1111222233334444'),

('USR002', '2024-02-05', 'Deluxe', 12, NULL, '2222333344445555'),

('USR003', '2024-03-20', 'Basic', 1, NULL, '3333444455556666'),

('USR004', '2024-04-01', 'Premium', 3, NULL, '4444555566667777'),
('USR004', '2024-07-15', 'Pro', 6, NULL, '4444555566667777'),

('USR005', '2024-05-01', 'Ultimate', 12, NULL, '5555666677778888'),

('USR006', '2024-06-10', 'Basic', 1, NULL, '6666777788889999'),
('USR006', '2024-09-15', 'Premium', 3, NULL, '6666777788889999'),

('USR007', '2024-07-20', 'Pro', 6, NULL, '7777888899990000'),

('USR008', '2024-08-05', 'Ultimate', 12, NULL, '8888999900001111'),

('USR009', '2024-09-15', 'Basic', 1, NULL, '9999000011112222'),

('USR010', '2024-10-01', 'Premium', 3, NULL, '1010101010101010'),
('USR010', '2024-12-15', 'Pro', 6, NULL, '1010101010101010'),

('USR011', '2024-11-05', 'Deluxe', 12, NULL, '1212121212121212'),

('USR012', '2025-12-10', 'Ultimate', 12, NULL, '1313131313131313'),

('USR013', '2025-01-01', 'Basic', 1, NULL, '1414141414141414'),

('USR014', '2025-02-15', 'Premium', 3, NULL, '1515151515151515'),

('USR015', '2025-03-20', 'Pro', 6, NULL, '1616161616161616'),

('USR016', '2025-04-05', 'Deluxe', 12, NULL, '1717171717171717'),

('USR017', '2025-05-10', 'Ultimate', 12, NULL, '1818181818181818'),

('USR018', '2025-06-01', 'Basic', 1, NULL, '1919191919191919'),

('USR019', '2025-07-15', 'Premium', 3, NULL, '2020202020202020'),

('USR020', '2025-08-20', 'Pro', 6, NULL, '2121212121212121'),

('USR021', '2025-09-05', 'Deluxe', 12, NULL, '2222222222222222'),

('USR022', '2025-10-10', 'Ultimate', 12, NULL, '2323232323232323'),

('USR023', '2025-11-15', 'Basic', 1, NULL, '2424242424242424'),

('USR024', '2025-12-20', 'Premium', 3, NULL, '2525252525252525'),

('USR025', '2025-01-01', 'Pro', 6, NULL, '2626262626262626'),

('USR026', '2025-02-05', 'Deluxe', 12, NULL, '2727272727272727'),

('USR027', '2025-03-10', 'Ultimate', 12, NULL, '2828282828282828'),

('USR028', '2026-04-15', 'Basic', 1, NULL, '2929292929292929'),

('USR029', '2026-05-20', 'Premium', 3, NULL, '3030303030303030'),

('USR030', '2026-06-01', 'Pro', 6, NULL, '3131313131313131');


-- Popolamento tabella Recensione
INSERT INTO Recensione (Film, Utente, Voto, Commento) VALUES
('TDK001', 'USR001', 4.5, 'Uno dei miei film preferiti di sempre!'),
('TDK001', 'USR002', 5.0, 'Un classico intramontabile.'),
('HAR001', 'USR003', 4.0, 'Fantastico adattamento del libro.'),
('HAR002', 'USR004', 4.5, 'Ancora meglio del primo film.'),
('SW001', 'USR005', 3.5, 'Azione pura e adrenalina.'),
('SW001', 'USR006', 4.0, 'Divertente e pieno di azione.'),
('SW002', 'USR007', 3.0, 'Non male, ma il primo è stato il migliore.'),
('SW003', 'USR008', 3.5, 'Una buona aggiunta alla serie.'),
('PDC001', 'USR009', 4.0, 'Fantastico film d\'azione.'),
('LOTR001', 'USR010', 4.5, 'Azione spettacolare e una buona trama.'),
('LOTR002', 'USR011', 4.0, 'Un degno capitolo della serie.'),
('LOTR003', 'USR012', 3.5, 'Bello ma non eccezionale.'),
('MCU001', 'USR013', 4.0, 'Molto divertente e pieno di azione.'),
('MCU002', 'USR014', 4.5, 'Uno dei migliori film della serie.'),
('MCU003', 'USR015', 5.0, 'Un classico senza tempo.'),
('MCU004', 'USR016', 4.5, 'Un film epico e ben fatto.'),
('MCU005', 'USR017', 5.0, 'Un film che tocca il cuore.'),
('TDK002', 'USR018', 4.0, 'Una storia d\'amore commovente.'),
('TDK002', 'USR019', 4.5, 'Azione avvincente e personaggio carismatico.'),
('SNT001', 'USR020', 4.0, 'Thriller psicologico coinvolgente.');


-- Popolamento Scelta
INSERT INTO Scelta (Fattore, Utente)
VALUES
('Recensione', 'USR001'), ('Premio', 'USR001'), ('Genere', 'USR001'),
('Popolarità', 'USR002'), ('Genere', 'USR002'),
('Recensione', 'USR003'), ('Premio', 'USR003'), ('Genere', 'USR003'),('Popolarità', 'USR003'),
('Popolarità', 'USR004'), ('Genere', 'USR004'),
('Recensione', 'USR005'), ('Premio', 'USR005'),
('Popolarità', 'USR006'), ('Genere', 'USR006'), ('Premio', 'USR006'),
('Recensione', 'USR007'), ('Premio', 'USR007'),
('Popolarità', 'USR008'), ('Genere', 'USR008'),
('Recensione', 'USR009'), ('Premio', 'USR009'),
('Popolarità', 'USR010'), ('Genere', 'USR010'), ('Premio', 'USR010'),
('Recensione', 'USR011'), ('Premio', 'USR011'),
('Popolarità', 'USR012'), ('Genere', 'USR012'), ('Premio', 'USR012'), ('Recensione', 'USR012'),
('Recensione', 'USR013'), ('Premio', 'USR013'),
('Popolarità', 'USR014'), ('Genere', 'USR014'),
('Recensione', 'USR015'), ('Premio', 'USR015'),
('Popolarità', 'USR016'), ('Genere', 'USR016'),
('Recensione', 'USR017'), ('Premio', 'USR017'),
('Popolarità', 'USR018'), ('Genere', 'USR018'),
('Recensione', 'USR019'), ('Premio', 'USR019'),
('Popolarità', 'USR020'), ('Genere', 'USR020'),
('Recensione', 'USR021'), ('Premio', 'USR021'),
('Popolarità', 'USR022'), ('Genere', 'USR022'),
('Recensione', 'USR023'), ('Premio', 'USR023'),
('Popolarità', 'USR024'), ('Genere', 'USR024'),
('Recensione', 'USR025'), ('Premio', 'USR025'),
('Popolarità', 'USR026'), ('Genere', 'USR026'),
('Recensione', 'USR027'), ('Premio', 'USR027'),
('Popolarità', 'USR028'), ('Genere', 'USR028'),
('Recensione', 'USR029'), ('Premio', 'USR029'),
('Popolarità', 'USR030'), ('Genere', 'USR030');

-- Popolamento RatingPersonalizzato
INSERT INTO RatingPersonalizzato (Film, Utente, Punteggio)
VALUES

  ('HAR001', 'USR001', 0), ('HAR002', 'USR001', 0), ('FF001', 'USR001', 0), ('BCK001', 'USR001', 0), ('GLD001', 'USR001', 0), ('FRL001', 'USR001', 0),
  ('TRL001','USR001', 0), ('JN001', 'USR001', 0), ('SNT001', 'USR001', 0), ('GL001', 'USR001', 0), ('SW001', 'USR001', 0), ('SW002', 'USR001', 0),
  ('SW003', 'USR001', 0), ('PDC001', 'USR001', 0), ('LOTR001', 'USR001', 0), ('LOTR002', 'USR001', 0), ('LOTR003', 'USR001', 0), ('MCU001','USR001', 0),
  ('MCU002', 'USR001', 0), ('MCU003', 'USR001', 0), ('MCU004', 'USR001', 0), ('MCU005', 'USR001', 0), ('TDK001', 'USR001', 0), ('TDK002', 'USR001', 0),

  ('HAR001', 'USR002', 0), ('HAR002', 'USR002', 0), ('FF001', 'USR002', 0), ('BCK001', 'USR002', 0), ('GLD001', 'USR002', 0), ('FRL001', 'USR002', 0),
  ('TRL001', 'USR002', 0), ('JN001', 'USR002', 0), ('SNT001', 'USR002', 0), ('GL001', 'USR002', 0), ('SW001', 'USR002', 0), ('SW002', 'USR002', 0),
  ('SW003', 'USR002', 0), ('PDC001', 'USR002', 0), ('LOTR001', 'USR002', 0), ('LOTR002', 'USR002', 0), ('LOTR003', 'USR002', 0), ('MCU001', 'USR002', 0),
  ('MCU002', 'USR002', 0), ('MCU003', 'USR002', 0), ('MCU004', 'USR002', 0), ('MCU005', 'USR002', 0), ('TDK001', 'USR002', 0), ('TDK002', 'USR002', 0),

  ('HAR001', 'USR003', 0), ('HAR002', 'USR003', 0), ('FF001', 'USR003', 0), ('BCK001', 'USR003', 0), ('GLD001', 'USR003', 0), ('FRL001', 'USR003', 0),
  ('TRL001', 'USR003', 0), ('JN001', 'USR003', 0), ('SNT001', 'USR003', 0), ('GL001', 'USR003', 0), ('SW001', 'USR003', 0), ('SW002', 'USR003', 0),
  ('SW003', 'USR003', 0), ('PDC001', 'USR003', 0), ('LOTR001', 'USR003', 0), ('LOTR002', 'USR003', 0), ('LOTR003', 'USR003', 0), ('MCU001', 'USR003', 0),
  ('MCU002', 'USR003', 0), ('MCU003', 'USR003', 0), ('MCU004', 'USR003', 0), ('MCU005', 'USR003', 0), ('TDK001', 'USR003', 0), ('TDK002', 'USR003', 0),

  ('HAR001', 'USR004', 0), ('HAR002', 'USR004', 0), ('FF001', 'USR004', 0), ('BCK001', 'USR004', 0), ('GLD001', 'USR004', 0), ('FRL001', 'USR004', 0),
  ('TRL001', 'USR004', 0), ('JN001', 'USR004', 0), ('SNT001', 'USR004', 0), ('GL001', 'USR004', 0), ('SW001', 'USR004', 0), ('SW002', 'USR004', 0),
  ('SW003', 'USR004', 0), ('PDC001', 'USR004', 0), ('LOTR001', 'USR004', 0), ('LOTR002', 'USR004', 0), ('LOTR003', 'USR004', 0), ('MCU001', 'USR004', 0),
  ('MCU002', 'USR004', 0), ('MCU003', 'USR004', 0), ('MCU004', 'USR004', 0), ('MCU005', 'USR004', 0), ('TDK001', 'USR004', 0), ('TDK002', 'USR004', 0),

  ('HAR001', 'USR005', 0), ('HAR002', 'USR005', 0), ('FF001', 'USR005', 0), ('BCK001', 'USR005', 0), ('GLD001', 'USR005', 0), ('FRL001', 'USR005', 0),
  ('TRL001', 'USR005', 0), ('JN001', 'USR005', 0), ('SNT001', 'USR005', 0), ('GL001', 'USR005', 0), ('SW001', 'USR005', 0), ('SW002', 'USR005', 0),
  ('SW003', 'USR005', 0), ('PDC001', 'USR005', 0), ('LOTR001', 'USR005', 0), ('LOTR002', 'USR005', 0), ('LOTR003', 'USR005', 0), ('MCU001', 'USR005', 0),
  ('MCU002', 'USR005', 0), ('MCU003', 'USR005', 0), ('MCU004', 'USR005', 0), ('MCU005', 'USR005', 0), ('TDK001', 'USR005', 0), ('TDK002', 'USR005', 0),

  ('HAR001', 'USR006', 0), ('HAR002', 'USR006', 0), ('FF001', 'USR006', 0), ('BCK001', 'USR006', 0), ('GLD001', 'USR006', 0), ('FRL001', 'USR006', 0),
  ('TRL001', 'USR006', 0), ('JN001', 'USR006', 0), ('SNT001', 'USR006', 0), ('GL001', 'USR006', 0), ('SW001', 'USR006', 0), ('SW002', 'USR006', 0),
  ('SW003', 'USR006', 0), ('PDC001', 'USR006', 0), ('LOTR001', 'USR006', 0), ('LOTR002', 'USR006', 0), ('LOTR003', 'USR006', 0), ('MCU001', 'USR006', 0),
  ('MCU002', 'USR006', 0), ('MCU003', 'USR006', 0), ('MCU004', 'USR006', 0), ('MCU005', 'USR006', 0), ('TDK001', 'USR006', 0), ('TDK002', 'USR006', 0),

  ('HAR001', 'USR007', 0), ('HAR002', 'USR007', 0), ('FF001', 'USR007', 0), ('BCK001', 'USR007', 0), ('GLD001', 'USR007', 0), ('FRL001', 'USR007', 0),
  ('TRL001', 'USR007', 0), ('JN001', 'USR007', 0), ('SNT001', 'USR007', 0), ('GL001', 'USR007', 0), ('SW001', 'USR007', 0), ('SW002', 'USR007', 0),
  ('SW003', 'USR007', 0), ('PDC001', 'USR007', 0), ('LOTR001', 'USR007', 0), ('LOTR002', 'USR007', 0), ('LOTR003', 'USR007', 0), ('MCU001', 'USR007', 0),
  ('MCU002', 'USR007', 0), ('MCU003', 'USR007', 0), ('MCU004', 'USR007', 0), ('MCU005', 'USR007', 0), ('TDK001', 'USR007', 0), ('TDK002', 'USR007', 0),

  ('HAR001', 'USR008', 0), ('HAR002', 'USR008', 0), ('FF001', 'USR008', 0), ('BCK001', 'USR008', 0), ('GLD001', 'USR008', 0), ('FRL001', 'USR008', 0),
  ('TRL001', 'USR008', 0), ('JN001', 'USR008', 0), ('SNT001', 'USR008', 0), ('GL001', 'USR008', 0), ('SW001', 'USR008', 0), ('SW002', 'USR008', 0),
  ('SW003', 'USR008', 0), ('PDC001', 'USR008', 0), ('LOTR001', 'USR008', 0), ('LOTR002', 'USR008', 0), ('LOTR003', 'USR008', 0), ('MCU001', 'USR008', 0),
  ('MCU002', 'USR008', 0), ('MCU003', 'USR008', 0), ('MCU004', 'USR008', 0), ('MCU005', 'USR008', 0), ('TDK001', 'USR008', 0), ('TDK002', 'USR008', 0),

  ('HAR001', 'USR009', 0), ('HAR002', 'USR009', 0), ('FF001', 'USR009', 0), ('BCK001', 'USR009', 0), ('GLD001', 'USR009', 0), ('FRL001', 'USR009', 0),
  ('TRL001', 'USR009', 0), ('JN001', 'USR009', 0), ('SNT001', 'USR009', 0), ('GL001', 'USR009', 0), ('SW001', 'USR009', 0), ('SW002', 'USR009', 0),
  ('SW003', 'USR009', 0), ('PDC001', 'USR009', 0), ('LOTR001', 'USR009', 0), ('LOTR002', 'USR009', 0), ('LOTR003', 'USR009', 0), ('MCU001', 'USR009', 0),
  ('MCU002', 'USR009', 0), ('MCU003', 'USR009', 0), ('MCU004', 'USR009', 0), ('MCU005', 'USR009', 0), ('TDK001', 'USR009', 0), ('TDK002', 'USR009', 0),

  ('HAR001', 'USR010', 0), ('HAR002', 'USR010', 0), ('FF001', 'USR010', 0), ('BCK001', 'USR010', 0), ('GLD001', 'USR010', 0), ('FRL001', 'USR010', 0),
  ('TRL001', 'USR010', 0), ('JN001', 'USR010', 0), ('SNT001', 'USR010', 0), ('GL001', 'USR010', 0), ('SW001', 'USR010', 0), ('SW002', 'USR010', 0),
  ('SW003', 'USR010', 0), ('PDC001', 'USR010', 0), ('LOTR001', 'USR010', 0), ('LOTR002', 'USR010', 0), ('LOTR003', 'USR010', 0), ('MCU001', 'USR010', 0),
  ('MCU002', 'USR010', 0), ('MCU003', 'USR010', 0), ('MCU004', 'USR010', 0), ('MCU005', 'USR010', 0), ('TDK001', 'USR010', 0), ('TDK002', 'USR010', 0),

  ('HAR001', 'USR011', 0), ('HAR002', 'USR011', 0), ('FF001', 'USR011', 0), ('BCK001', 'USR011', 0), ('GLD001', 'USR011', 0), ('FRL001', 'USR011', 0),
  ('TRL001', 'USR011', 0), ('JN001', 'USR011', 0), ('SNT001', 'USR011', 0), ('GL001', 'USR011', 0), ('SW001', 'USR011', 0), ('SW002', 'USR011', 0),
  ('SW003', 'USR011', 0), ('PDC001', 'USR011', 0), ('LOTR001', 'USR011', 0), ('LOTR002', 'USR011', 0), ('LOTR003', 'USR011', 0), ('MCU001', 'USR011', 0),
  ('MCU002', 'USR011', 0), ('MCU003', 'USR011', 0), ('MCU004', 'USR011', 0), ('MCU005', 'USR011', 0), ('TDK001', 'USR011', 0), ('TDK002', 'USR011', 0),

  ('HAR001', 'USR012', 0), ('HAR002', 'USR012', 0), ('FF001', 'USR012', 0), ('BCK001', 'USR012', 0), ('GLD001', 'USR012', 0), ('FRL001', 'USR012', 0),
  ('TRL001', 'USR012', 0), ('JN001', 'USR012', 0), ('SNT001', 'USR012', 0), ('GL001', 'USR012', 0), ('SW001', 'USR012', 0), ('SW002', 'USR012', 0),
  ('SW003', 'USR012', 0), ('PDC001', 'USR012', 0), ('LOTR001', 'USR012', 0), ('LOTR002', 'USR012', 0), ('LOTR003', 'USR012', 0), ('MCU001', 'USR012', 0),
  ('MCU002', 'USR012', 0), ('MCU003', 'USR012', 0), ('MCU004', 'USR012', 0), ('MCU005', 'USR012', 0), ('TDK001', 'USR012', 0), ('TDK002', 'USR012', 0),

  ('HAR001', 'USR013', 0), ('HAR002', 'USR013', 0), ('FF001', 'USR013', 0), ('BCK001', 'USR013', 0), ('GLD001', 'USR013', 0), ('FRL001', 'USR013', 0),
  ('TRL001', 'USR013', 0), ('JN001', 'USR013', 0), ('SNT001', 'USR013', 0), ('GL001', 'USR013', 0), ('SW001', 'USR013', 0), ('SW002', 'USR013', 0),
  ('SW003', 'USR013', 0), ('PDC001', 'USR013', 0), ('LOTR001', 'USR013', 0), ('LOTR002', 'USR013', 0), ('LOTR003', 'USR013', 0), ('MCU001', 'USR013', 0),
  ('MCU002', 'USR013', 0), ('MCU003', 'USR013', 0), ('MCU004', 'USR013', 0), ('MCU005', 'USR013', 0), ('TDK001', 'USR013', 0), ('TDK002', 'USR013', 0),

  ('HAR001', 'USR014', 0), ('HAR002', 'USR014', 0), ('FF001', 'USR014', 0), ('BCK001', 'USR014', 0), ('GLD001', 'USR014', 0), ('FRL001', 'USR014', 0),
  ('TRL001', 'USR014', 0), ('JN001', 'USR014', 0), ('SNT001', 'USR014', 0), ('GL001', 'USR014', 0), ('SW001', 'USR014', 0), ('SW002', 'USR014', 0),
  ('SW003', 'USR014', 0), ('PDC001', 'USR014', 0), ('LOTR001', 'USR014', 0), ('LOTR002', 'USR014', 0), ('LOTR003', 'USR014', 0), ('MCU001', 'USR014', 0),
  ('MCU002', 'USR014', 0), ('MCU003', 'USR014', 0), ('MCU004', 'USR014', 0), ('MCU005', 'USR014', 0), ('TDK001', 'USR014', 0), ('TDK002', 'USR014', 0),

  ('HAR001', 'USR015', 0), ('HAR002', 'USR015', 0), ('FF001', 'USR015', 0), ('BCK001', 'USR015', 0), ('GLD001', 'USR015', 0), ('FRL001', 'USR015', 0),
  ('TRL001', 'USR015', 0), ('JN001', 'USR015', 0), ('SNT001', 'USR015', 0), ('GL001', 'USR015', 0), ('SW001', 'USR015', 0), ('SW002', 'USR015', 0),
  ('SW003', 'USR015', 0), ('PDC001', 'USR015', 0), ('LOTR001', 'USR015', 0), ('LOTR002', 'USR015', 0), ('LOTR003', 'USR015', 0), ('MCU001', 'USR015', 0),
  ('MCU002', 'USR015', 0), ('MCU003', 'USR015', 0), ('MCU004', 'USR015', 0), ('MCU005', 'USR015', 0), ('TDK001', 'USR015', 0), ('TDK002', 'USR015', 0),

  ('HAR001', 'USR016', 0), ('HAR002', 'USR016', 0), ('FF001', 'USR016', 0), ('BCK001', 'USR016', 0), ('GLD001', 'USR016', 0), ('FRL001', 'USR016', 0),
  ('TRL001', 'USR016', 0), ('JN001', 'USR016', 0), ('SNT001', 'USR016', 0), ('GL001', 'USR016', 0), ('SW001', 'USR016', 0), ('SW002', 'USR016', 0),
  ('SW003', 'USR016', 0), ('PDC001', 'USR016', 0), ('LOTR001', 'USR016', 0), ('LOTR002', 'USR016', 0), ('LOTR003', 'USR016', 0), ('MCU001', 'USR016', 0),
  ('MCU002', 'USR016', 0), ('MCU003', 'USR016', 0), ('MCU004', 'USR016', 0), ('MCU005', 'USR016', 0), ('TDK001', 'USR016', 0), ('TDK002', 'USR016', 0),

  ('HAR001', 'USR017', 0), ('HAR002', 'USR017', 0), ('FF001', 'USR017', 0), ('BCK001', 'USR017', 0), ('GLD001', 'USR017', 0), ('FRL001', 'USR017', 0),
  ('TRL001', 'USR017', 0), ('JN001', 'USR017', 0), ('SNT001', 'USR017', 0), ('GL001', 'USR017', 0), ('SW001', 'USR017', 0), ('SW002', 'USR017', 0),
  ('SW003', 'USR017', 0), ('PDC001', 'USR017', 0), ('LOTR001', 'USR017', 0), ('LOTR002', 'USR017', 0), ('LOTR003', 'USR017', 0), ('MCU001', 'USR017', 0),
  ('MCU002', 'USR017', 0), ('MCU003', 'USR017', 0), ('MCU004', 'USR017', 0), ('MCU005', 'USR017', 0), ('TDK001', 'USR017', 0), ('TDK002', 'USR017', 0),

  ('HAR001', 'USR018', 0), ('HAR002', 'USR018', 0), ('FF001', 'USR018', 0), ('BCK001', 'USR018', 0), ('GLD001', 'USR018', 0), ('FRL001', 'USR018', 0),
  ('TRL001', 'USR018', 0), ('JN001', 'USR018', 0), ('SNT001', 'USR018', 0), ('GL001', 'USR018', 0), ('SW001', 'USR018', 0), ('SW002', 'USR018', 0),
  ('SW003', 'USR018', 0), ('PDC001', 'USR018', 0), ('LOTR001', 'USR018', 0), ('LOTR002', 'USR018', 0), ('LOTR003', 'USR018', 0), ('MCU001', 'USR018', 0),
  ('MCU002', 'USR018', 0), ('MCU003', 'USR018', 0), ('MCU004', 'USR018', 0), ('MCU005', 'USR018', 0), ('TDK001', 'USR018', 0), ('TDK002', 'USR018', 0),

  ('HAR001', 'USR019', 0), ('HAR002', 'USR019', 0), ('FF001', 'USR019', 0), ('BCK001', 'USR019', 0), ('GLD001', 'USR019', 0), ('FRL001', 'USR019', 0),
  ('TRL001', 'USR019', 0), ('JN001', 'USR019', 0), ('SNT001', 'USR019', 0), ('GL001', 'USR019', 0), ('SW001', 'USR019', 0), ('SW002', 'USR019', 0),
  ('SW003', 'USR019', 0), ('PDC001', 'USR019', 0), ('LOTR001', 'USR019', 0), ('LOTR002', 'USR019', 0), ('LOTR003', 'USR019', 0), ('MCU001', 'USR019', 0),
  ('MCU002', 'USR019', 0), ('MCU003', 'USR019', 0), ('MCU004', 'USR019', 0), ('MCU005', 'USR019', 0), ('TDK001', 'USR019', 0), ('TDK002', 'USR019', 0),

  ('HAR001', 'USR020', 0), ('HAR002', 'USR020', 0), ('FF001', 'USR020', 0), ('BCK001', 'USR020', 0), ('GLD001', 'USR020', 0), ('FRL001', 'USR020', 0),
  ('TRL001', 'USR020', 0), ('JN001', 'USR020', 0), ('SNT001', 'USR020', 0), ('GL001', 'USR020', 0), ('SW001', 'USR020', 0), ('SW002', 'USR020', 0),
  ('SW003', 'USR020', 0), ('PDC001', 'USR020', 0), ('LOTR001', 'USR020', 0), ('LOTR002', 'USR020', 0), ('LOTR003', 'USR020', 0), ('MCU001', 'USR020', 0),
  ('MCU002', 'USR020', 0), ('MCU003', 'USR020', 0), ('MCU004', 'USR020', 0), ('MCU005', 'USR020', 0), ('TDK001', 'USR020', 0), ('TDK002', 'USR020', 0),

  ('HAR001', 'USR021', 0), ('HAR002', 'USR021', 0), ('FF001', 'USR021', 0), ('BCK001', 'USR021', 0), ('GLD001', 'USR021', 0), ('FRL001', 'USR021', 0),
  ('TRL001', 'USR021', 0), ('JN001', 'USR021', 0), ('SNT001', 'USR021', 0), ('GL001', 'USR021', 0), ('SW001', 'USR021', 0), ('SW002', 'USR021', 0),
  ('SW003', 'USR021', 0), ('PDC001', 'USR021', 0), ('LOTR001', 'USR021', 0), ('LOTR002', 'USR021', 0), ('LOTR003', 'USR021', 0), ('MCU001', 'USR021', 0),
  ('MCU002', 'USR021', 0), ('MCU003', 'USR021', 0), ('MCU004', 'USR021', 0), ('MCU005', 'USR021', 0), ('TDK001', 'USR021', 0), ('TDK002', 'USR021', 0),

  ('HAR001', 'USR022', 0), ('HAR002', 'USR022', 0), ('FF001', 'USR022', 0), ('BCK001', 'USR022', 0), ('GLD001', 'USR022', 0), ('FRL001', 'USR022', 0),
  ('TRL001', 'USR022', 0), ('JN001', 'USR022', 0), ('SNT001', 'USR022', 0), ('GL001', 'USR022', 0), ('SW001', 'USR022', 0), ('SW002', 'USR022', 0),
  ('SW003', 'USR022', 0), ('PDC001', 'USR022', 0), ('LOTR001', 'USR022', 0), ('LOTR002', 'USR022', 0), ('LOTR003', 'USR022', 0), ('MCU001', 'USR022', 0),
  ('MCU002', 'USR022', 0), ('MCU003', 'USR022', 0), ('MCU004', 'USR022', 0), ('MCU005', 'USR022', 0), ('TDK001', 'USR022', 0), ('TDK002', 'USR022', 0),

  ('HAR001', 'USR023', 0), ('HAR002', 'USR023', 0), ('FF001', 'USR023', 0), ('BCK001', 'USR023', 0), ('GLD001', 'USR023', 0), ('FRL001', 'USR023', 0),
  ('TRL001', 'USR023', 0), ('JN001', 'USR023', 0), ('SNT001', 'USR023', 0), ('GL001', 'USR023', 0), ('SW001', 'USR023', 0), ('SW002', 'USR023', 0),
  ('SW003', 'USR023', 0), ('PDC001', 'USR023', 0), ('LOTR001', 'USR023', 0), ('LOTR002', 'USR023', 0), ('LOTR003', 'USR023', 0), ('MCU001', 'USR023', 0),
  ('MCU002', 'USR023', 0), ('MCU003', 'USR023', 0), ('MCU004', 'USR023', 0), ('MCU005', 'USR023', 0), ('TDK001', 'USR023', 0), ('TDK002', 'USR023', 0),

  ('HAR001', 'USR024', 0), ('HAR002', 'USR024', 0), ('FF001', 'USR024', 0), ('BCK001', 'USR024', 0), ('GLD001', 'USR024', 0), ('FRL001', 'USR024', 0),
  ('TRL001', 'USR024', 0), ('JN001', 'USR024', 0), ('SNT001', 'USR024', 0), ('GL001', 'USR024', 0), ('SW001', 'USR024', 0), ('SW002', 'USR024', 0),
  ('SW003', 'USR024', 0), ('PDC001', 'USR024', 0), ('LOTR001', 'USR024', 0), ('LOTR002', 'USR024', 0), ('LOTR003', 'USR024', 0), ('MCU001', 'USR024', 0),
  ('MCU002', 'USR024', 0), ('MCU003', 'USR024', 0), ('MCU004', 'USR024', 0), ('MCU005', 'USR024', 0), ('TDK001', 'USR024', 0), ('TDK002', 'USR024', 0),

  ('HAR001', 'USR025', 0), ('HAR002', 'USR025', 0), ('FF001', 'USR025', 0), ('BCK001', 'USR025', 0), ('GLD001', 'USR025', 0), ('FRL001', 'USR025', 0),
  ('TRL001', 'USR025', 0), ('JN001', 'USR025', 0), ('SNT001', 'USR025', 0), ('GL001', 'USR025', 0), ('SW001', 'USR025', 0), ('SW002', 'USR025', 0),
  ('SW003', 'USR025', 0), ('PDC001', 'USR025', 0), ('LOTR001', 'USR025', 0), ('LOTR002', 'USR025', 0), ('LOTR003', 'USR025', 0), ('MCU001', 'USR025', 0),
  ('MCU002', 'USR025', 0), ('MCU003', 'USR025', 0), ('MCU004', 'USR025', 0), ('MCU005', 'USR025', 0), ('TDK001', 'USR025', 0), ('TDK002', 'USR025', 0),

  ('HAR001', 'USR026', 0), ('HAR002', 'USR026', 0), ('FF001', 'USR026', 0), ('BCK001', 'USR026', 0), ('GLD001', 'USR026', 0), ('FRL001', 'USR026', 0),
  ('TRL001', 'USR026', 0), ('JN001', 'USR026', 0), ('SNT001', 'USR026', 0), ('GL001', 'USR026', 0), ('SW001', 'USR026', 0), ('SW002', 'USR026', 0),
  ('SW003', 'USR026', 0), ('PDC001', 'USR026', 0), ('LOTR001', 'USR026', 0), ('LOTR002', 'USR026', 0), ('LOTR003', 'USR026', 0), ('MCU001', 'USR026', 0),
  ('MCU002', 'USR026', 0), ('MCU003', 'USR026', 0), ('MCU004', 'USR026', 0), ('MCU005', 'USR026', 0), ('TDK001', 'USR026', 0), ('TDK002', 'USR026', 0),

  ('HAR001', 'USR027', 0), ('HAR002', 'USR027', 0), ('FF001', 'USR027', 0), ('BCK001', 'USR027', 0), ('GLD001', 'USR027', 0), ('FRL001', 'USR027', 0),
  ('TRL001', 'USR027', 0), ('JN001', 'USR027', 0), ('SNT001', 'USR027', 0), ('GL001', 'USR027', 0), ('SW001', 'USR027', 0), ('SW002', 'USR027', 0),
  ('SW003', 'USR027', 0), ('PDC001', 'USR027', 0), ('LOTR001', 'USR027', 0), ('LOTR002', 'USR027', 0), ('LOTR003', 'USR027', 0), ('MCU001', 'USR027', 0),
  ('MCU002', 'USR027', 0), ('MCU003', 'USR027', 0), ('MCU004', 'USR027', 0), ('MCU005', 'USR027', 0), ('TDK001', 'USR027', 0), ('TDK002', 'USR027', 0),

  ('HAR001', 'USR028', 0), ('HAR002', 'USR028', 0), ('FF001', 'USR028', 0), ('BCK001', 'USR028', 0), ('GLD001', 'USR028', 0), ('FRL001', 'USR028', 0),
  ('TRL001', 'USR028', 0), ('JN001', 'USR028', 0), ('SNT001', 'USR028', 0), ('GL001', 'USR028', 0), ('SW001', 'USR028', 0), ('SW002', 'USR028', 0),
  ('SW003', 'USR028', 0), ('PDC001', 'USR028', 0), ('LOTR001', 'USR028', 0), ('LOTR002', 'USR028', 0), ('LOTR003', 'USR028', 0), ('MCU001', 'USR028', 0),
  ('MCU002', 'USR028', 0), ('MCU003', 'USR028', 0), ('MCU004', 'USR028', 0), ('MCU005', 'USR028', 0), ('TDK001', 'USR028', 0), ('TDK002', 'USR028', 0),

  ('HAR001', 'USR029', 0), ('HAR002', 'USR029', 0), ('FF001', 'USR029', 0), ('BCK001', 'USR029', 0), ('GLD001', 'USR029', 0), ('FRL001', 'USR029', 0),
  ('TRL001', 'USR029', 0), ('JN001', 'USR029', 0), ('SNT001', 'USR029', 0), ('GL001', 'USR029', 0), ('SW001', 'USR029', 0), ('SW002', 'USR029', 0),
  ('SW003', 'USR029', 0), ('PDC001', 'USR029', 0), ('LOTR001', 'USR029', 0), ('LOTR002', 'USR029', 0), ('LOTR003', 'USR029', 0), ('MCU001', 'USR029', 0),
  ('MCU002', 'USR029', 0), ('MCU003', 'USR029', 0), ('MCU004', 'USR029', 0), ('MCU005', 'USR029', 0), ('TDK001', 'USR029', 0), ('TDK002', 'USR029', 0),

  ('HAR001', 'USR030', 0), ('HAR002', 'USR030', 0), ('FF001', 'USR030', 0), ('BCK001', 'USR030', 0), ('GLD001', 'USR030', 0), ('FRL001', 'USR030', 0),
  ('TRL001', 'USR030', 0), ('JN001', 'USR030', 0), ('SNT001', 'USR030', 0), ('GL001', 'USR030', 0), ('SW001', 'USR030', 0), ('SW002', 'USR030', 0),
  ('SW003', 'USR030', 0), ('PDC001', 'USR030', 0), ('LOTR001', 'USR030', 0), ('LOTR002', 'USR030', 0), ('LOTR003', 'USR030', 0), ('MCU001', 'USR030', 0),
  ('MCU002', 'USR030', 0), ('MCU003', 'USR030', 0), ('MCU004', 'USR030', 0), ('MCU005', 'USR030', 0), ('TDK001', 'USR030', 0), ('TDK002', 'USR030', 0);

  -- --------------------------------
  --  Record di `RestrizioneFormato`
  -- --------------------------------
  INSERT INTO RestrizioneFormato (Formato, AreaGeografica) VALUES
  ('F001', 'Italia'),
  ('F001', 'Stati Uniti'),
  ('F001', 'Francia'),
  ('F001', 'Spagna'),
  ('F001', 'Regno Unito'),
  ('F002', 'Germania'),
  ('F002', 'Canada'),
  ('F002', 'Australia'),
  ('F002', 'Brasile'),
  ('F002', 'Cina'),
  ('F002', 'Giappone'),
  ('F003', 'Francia'),
  ('F003', 'Spagna'),
  ('F003', 'Regno Unito'),
  ('F003', 'Canada'),
  ('F003', 'Australia'),
  ('F004', 'Italia'),
  ('F004', 'Stati Uniti'),
  ('F004', 'Francia'),
  ('F004', 'Spagna'),
  ('F005', 'Germania'),
  ('F005', 'Canada'),
  ('F005', 'Australia'),
  ('F005', 'Brasile'),
  ('F005', 'Cina'),
  ('F005', 'Giappone'),
  ('F006', 'Italia'),
  ('F006', 'Stati Uniti'),
  ('F006', 'Francia'),
  ('F006', 'Spagna');

  -- ----------------------------
--  Record di `RestrizioneFilm`
-- ----------------------------
INSERT INTO RestrizioneFilm (AreaGeografica, Film)
VALUES
('Italia', 'TRL001'),
('Stati Uniti', 'FRL001'),
('Regno Unito', 'GLD001'),
('Francia', 'TDK001'),
('Germania', 'MCU001'),
('Canada', 'HAR001'),
('Spagna', 'TDK002'),
('Australia', 'HAR001'),
('Brasile', 'HAR002'),
('Cina', 'JN001'),
('Giappone', 'JN001'),
('India', 'SW001'),
('Russia', 'SW002'),
('Messico', 'SW003'),
('Sud Africa', 'FF001'),
('Argentina', 'SNT001'),
('Corea del Sud', 'SNT001'),
('Indonesia', 'PDC001'),
('Turchia', 'PDC001'),
('Nigeria', 'PDC001'),
('Italia', 'MCU002'),
('Stati Uniti', 'TRL001'),
('Regno Unito', 'MCU002'),
('Francia', 'MCU003'),
('Germania', 'TDK001'),
('Canada', 'MCU001'),
('Spagna', 'MCU004'),
('Australia', 'MCU005'),
('Brasile', 'FF001'),
('Cina', 'LOTR001'),
('Giappone', 'LOTR002');

-- ----------------------------
--  Record di `Vicinanza`
-- ----------------------------
INSERT INTO Vicinanza (Confine, Confinante) VALUES
('Italia', 'Stati Uniti'),
('Italia', 'Francia'),
('Italia', 'Germania'),
('Stati Uniti', 'Canada'),
('Stati Uniti', 'Messico'),
('Francia', 'Regno Unito'),
('Francia', 'Spagna'),
('Francia', 'Germania'),
('Germania', 'Regno Unito'),
('Germania', 'Spagna'),
('Canada', 'Stati Uniti'),
('Canada', 'Messico'),
('Spagna', 'Francia'),
('Spagna', 'Germania'),
('Regno Unito', 'Francia'),
('Regno Unito', 'Germania'),
('Messico', 'Stati Uniti'),
('Messico', 'Canada'),
('Australia', 'Nuova Zelanda'),
('Australia', 'Indonesia'),
('Brasile', 'Argentina'),
('Brasile', 'Messico'),
('Argentina', 'Brasile'),
('Cina', 'India'),
('Cina', 'Russia'),
('India', 'Cina'),
('India', 'Giappone'),
('Russia', 'Cina'),
('Russia', 'Corea del Sud');

-- ----------------------------
--  Record di `Connessione`
-- ----------------------------
INSERT INTO Connessione (Utente, IstanteInizio, IndirizzoIP, Dispositivo, IstanteFine) VALUES
('USR001', '2024-01-01 08:00:00', '192.168.001.130', 'Desktop', '2024-01-01 08:30:00'),
('USR001', '2024-01-01 15:00:00', '192.168.001.203', 'Smartphone', '2024-01-01 15:30:00'),
('USR001', '2024-01-02 10:00:00', '192.168.001.120', 'Tablet', NULL),

('USR002', '2024-01-01 09:00:00', '192.168.1.122', 'Laptop', '2024-01-01 09:45:00'),
('USR002', '2024-01-02 12:00:00', '192.168.1.241', 'Smartphone', '2024-01-02 12:45:00'),
('USR002', '2024-01-03 16:00:00', '192.168.1.136', 'Desktop', NULL),

('USR003', '2024-01-01 10:00:00', '192.0.2.5', 'Smart TV', '2024-01-01 10:30:00'),
('USR003', '2024-01-03 14:00:00', '192.0.2.23', 'Laptop', '2024-01-03 14:30:00'),
('USR003', '2024-01-04 11:00:00', '192.0.2.174', 'Tablet', NULL),

('USR004', '2024-01-02 08:00:00', '192.0.2.047', 'Smartphone', '2024-01-02 08:30:00'),
('USR004', '2024-01-03 09:00:00', '192.0.2.189', 'Desktop', '2024-01-03 09:30:00'),
('USR004', '2024-01-04 10:00:00', '192.0.2.190', 'Laptop', NULL),

('USR005', '2024-01-02 10:00:00', '192.168.10.25', 'Smart TV', '2024-01-02 10:30:00'),
('USR005', '2024-01-04 12:00:00', '192.168.10.232', 'Desktop', '2024-01-04 12:30:00'),
('USR005', '2024-01-05 14:00:00', '192.168.10.148', 'Laptop', NULL),

('USR006', '2024-01-03 08:00:00', '192.168.10.17', 'Tablet', '2024-01-03 08:30:00'),
('USR006', '2024-01-05 09:00:00', '192.168.10.183', 'Smartphone', '2024-01-05 09:30:00'),
('USR006', '2024-01-06 11:00:00', '192.168.10.245', 'Desktop', NULL),

('USR007', '2024-01-03 10:00:00', '192.15.2.137', 'Smart TV', '2024-01-03 10:30:00'),
('USR007', '2024-01-05 12:00:00', '192.15.2.56', 'Laptop', '2024-01-05 12:30:00'),
('USR007', '2024-01-06 14:00:00', '192.15.2.6', 'Desktop', NULL),

('USR008', '2024-01-04 08:00:00', '192.15.2.186', 'Smartphone', '2024-01-04 08:30:00'),
('USR008', '2024-01-06 09:00:00', '192.15.2.250', 'Tablet', '2024-01-06 09:30:00'),
('USR008', '2024-01-07 11:00:00', '192.15.2.121', 'Laptop', NULL),

('USR009', '2024-01-04 10:00:00', '192.0.12.1', 'Desktop', '2024-01-04 10:30:00'),
('USR009', '2024-01-06 12:00:00', '192.0.12.27', 'Smartphone', '2024-01-06 12:30:00'),
('USR009', '2024-01-07 14:00:00', '192.0.12.183', 'Tablet', NULL),

('USR010', '2024-01-05 08:00:00', '192.168.2.217', 'Smartphone', '2024-01-05 08:30:00'),
('USR010', '2024-01-06 09:00:00', '192.168.2.104', 'Laptop', '2024-01-06 09:30:00'),
('USR010', '2024-01-07 11:00:00', '192.168.2.252', 'Desktop', NULL),

('USR011', '2024-01-06 10:00:00', '198.51.100.154', 'Smart TV', '2024-01-06 10:30:00'),
('USR011', '2024-01-08 12:00:00', '198.51.100.67', 'Laptop', '2024-01-08 12:30:00'),
('USR011', '2024-01-09 14:00:00', '198.51.100.255', 'Desktop', NULL),

('USR012', '2024-01-07 08:00:00', '203.0.113.32', 'Tablet', '2024-01-07 08:30:00'),
('USR012', '2024-01-09 09:00:00', '203.0.113.121', 'Smartphone', '2024-01-09 09:30:00'),
('USR012', '2024-01-10 11:00:00', '203.0.113.251', 'Laptop', NULL),

('USR013', '2024-01-08 10:00:00', '194.0.2.15', 'Smartphone', '2024-01-08 10:30:00'),
('USR013', '2024-01-10 12:00:00', '194.0.2.182', 'Desktop', '2024-01-10 12:30:00'),
('USR013', '2024-01-11 14:00:00', '194.0.2.216', 'Laptop', NULL),

('USR014', '2024-01-09 08:00:00', '202.0.110.58', 'Smartphone', '2024-01-09 08:30:00'),
('USR014', '2024-01-11 09:00:00', '202.0.110.185', 'Tablet', '2024-01-11 09:30:00'),
('USR014', '2024-01-12 11:00:00', '202.0.110.242', 'Desktop', NULL),

('USR015', '2024-01-10 10:00:00', '203.6.113.3', 'Smart TV', '2024-01-10 10:30:00'),
('USR015', '2024-01-12 12:00:00', '192.168.15.237', 'Laptop', '2024-01-12 12:30:00'),
('USR015', '2024-01-13 14:00:00', '192.168.15.196', 'Desktop', NULL);


-- -----------------------------
--  Record di `ServerCDN`
-- -----------------------------
INSERT INTO ServerCDN (Codice, LarghezzaBanda, CapacitaTrasmissione, Posizione, CaricoAttuale) VALUES
('Server1', 1000, 100, 'Italia', 0),
('Server2', 500, 50, 'Germania', 0),
('Server3', 200, 20, 'Stati Uniti', 0),
('Server4', 100, 10, 'Regno Unito', 0),
('Server5', 800, 80, 'Francia', 0),
('Server6', 600, 60, 'Spagna', 0),
('Server7', 400, 40, 'Giappone', 0),
('Server8', 300, 30, 'Canada', 0),
('Server9', 700, 70, 'Australia', 0),
('Server10', 900, 90, 'Brasile', 0);


-- -----------------------------
--  Record di `Pop`
-- -----------------------------

DELIMITER $$

CREATE TRIGGER inserisciInPop
AFTER INSERT ON Visualizzazione
FOR EACH ROW
BEGIN
	REPLACE INTO Pop VALUES (NEW.ServerSorgente, NEW.Film, NEW.FormatoFilm);
END$$

CREATE TRIGGER eliminaInPop
AFTER UPDATE ON Visualizzazione
FOR EACH ROW
BEGIN
	IF (NEW.IstanteFine IS NOT NULL) THEN
		DELETE FROM Pop P
		WHERE P.Server = NEW.ServerSorgente AND P.Film = NEW.Film AND P.FormatoFilm = NEW.FormatoFilm;
	END IF;
END$$

DELIMITER ;


-- -----------------------------
--  Record di `Visualizzazione`
-- -----------------------------
INSERT INTO Visualizzazione (Codice, Utente, TSConnessioneUtente, IstanteInizio, Film, FormatoFilm, ServerSorgente, IstanteFine)
VALUES

('VIS001', 'USR001', '2024-01-01 08:00:00', '2024-01-01 08:05:00', 'MCU001', 'F012', 'Server1', '2024-01-01 08:25:00'),
('VIS002', 'USR002', '2024-01-01 09:00:00', '2024-01-01 09:10:00', 'GL001', 'F008', 'Server2', '2024-01-01 09:40:00'),
('VIS004', 'USR004', '2024-01-02 08:00:00', '2024-01-02 08:20:00', 'LOTR001', 'F013', 'Server4', '2024-01-02 08:50:00'),
('VIS005', 'USR005', '2024-01-02 10:00:00', '2024-01-02 10:25:00', 'MCU001', 'F001', 'Server5', '2024-01-02 10:55:00'),
('VIS006', 'USR006', '2024-01-03 08:00:00', '2024-01-03 08:30:00', 'SW001', 'F011', 'Server6', '2024-01-03 08:55:00'),
('VIS007', 'USR007', '2024-01-03 10:00:00', '2024-01-03 10:35:00', 'SW002', 'F001', 'Server7', '2024-01-03 10:50:00'),
('VIS008', 'USR008', '2024-01-04 08:00:00', '2024-01-04 08:15:00', 'SW003', 'F008', 'Server8', '2024-01-04 08:35:00'),
('VIS009', 'USR009', '2024-01-04 10:00:00', '2024-01-04 10:20:00', 'MCU001', 'F013', 'Server9', '2024-01-04 10:40:00'),
('VIS010', 'USR010', '2024-01-05 08:00:00', '2024-01-05 08:10:00', 'MCU002', 'F003', 'Server10', '2024-01-05 08:30:00'),
('VIS003', 'USR003', '2024-01-01 10:00:00', '2024-01-01 10:15:00', 'SNT001', 'F011', 'Server3', '2024-01-01 10:45:00'),
('VIS011', 'USR011', '2024-01-06 10:00:00', '2024-01-06 10:30:00', 'MCU003', 'F010', 'Server1', '2024-01-06 10:50:00'),
('VIS012', 'USR012', '2024-01-07 08:00:00', '2024-01-07 08:20:00', 'MCU005', 'F013', 'Server2', '2024-01-07 08:45:00'),
('VIS013', 'USR013', '2024-01-08 10:00:00', '2024-01-08 10:40:00', 'LOTR002', 'F001', 'Server3', '2024-01-08 11:00:00'),
('VIS014', 'USR014', '2024-01-09 08:00:00', '2024-01-09 08:25:00', 'LOTR003', 'F006', 'Server4', '2024-01-09 08:50:00'),
('VIS015', 'USR015', '2024-01-10 10:00:00', '2024-01-10 10:15:00', 'FRL001', 'F010', 'Server5', '2024-01-10 10:40:00'),
('VIS017', 'USR002', '2024-01-02 12:00:00', '2024-01-02 12:30:00', 'PDC001', 'F009', 'Server7', '2024-01-02 13:00:00'),
('VIS018', 'USR003', '2024-01-03 14:00:00', '2024-01-03 14:20:00', 'PDC001', 'F001', 'Server8', '2024-01-03 14:50:00'),
('VIS019', 'USR004', '2024-01-03 09:00:00', '2024-01-03 09:30:00', 'MCU001', 'F002', 'Server9', '2024-01-03 10:00:00'),
('VIS020', 'USR005', '2024-01-04 12:00:00', '2024-01-04 12:10:00', 'JN001', 'F004', 'Server10', '2024-01-04 12:35:00'),
('VIS021', 'USR006', '2024-01-05 09:00:00', '2024-01-05 09:25:00', 'BCK001', 'F005', 'Server1', '2024-01-05 09:50:00'),
('VIS023', 'USR008', '2024-01-06 09:00:00', '2024-01-06 09:15:00', 'HAR001', 'F010', 'Server3', '2024-01-06 09:35:00'),
('VIS025', 'USR010', '2024-01-07 11:00:00', '2024-01-07 11:25:00', 'LOTR003', 'F013', 'Server5', '2024-01-07 11:50:00'),
('VIS026', 'USR011', '2024-01-08 12:00:00', '2024-01-08 12:30:00', 'SW001', 'F013', 'Server6', NULL),
('VIS027', 'USR012', '2024-01-09 09:00:00', '2024-01-09 09:20:00', 'SW002', 'F007', 'Server7', NULL),
('VIS028', 'USR013', '2024-01-10 12:00:00', '2024-01-10 12:25:00', 'SW003', 'F010', 'Server8', NULL),
('VIS029', 'USR014', '2024-01-11 09:00:00', '2024-01-11 09:15:00', 'TDK002', 'F013', 'Server9', NULL),
('VIS030', 'USR015', '2024-01-12 12:00:00', '2024-01-12 12:30:00', 'TDK001', 'F006', 'Server10', NULL);
