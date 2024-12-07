INSERT INTO Funktion (funkid, bezeichner) 
VALUES (1, 'Praesidium'), 
       (2, 'Vizepraesidium'), 
       (3, 'Kasse'), 
       (4, 'Beisitz'), 
       (5, 'PR');

INSERT INTO Sponsor (sponid, name, strasse_nr, plz, ort, spendentotal)
VALUES (1, 'Hasler AG', 'Zelgweg 9', '2540', 'Grenchen', 1270), 
       (2, 'Pauker Druck', 'Solothurnstr. 19', '2544', 'Bettlach', 2750), 
       (3, 'Meyer Toni', 'Rothstr. 22', '4500', 'Solothurn', 750);


INSERT INTO Status (statid, bezeichner, beitrag)
VALUES (1, 'Junior', 0), 
       (2, 'Aktiv', 50), 
       (3, 'Ehemalig', NULL), 
       (4, 'Passiv', 30), 
       (5, 'Helfer', NULL), 
       (6, 'Extern', NULL);


INSERT INTO Person (persid, statid, name, vorname, strasse_nr, plz, ort, bezahlt, bemerkungen, eintritt, austritt, mentorid)
VALUES (1, 3, 'Niiranen', 'Ulla', 'Nordstr. 113', '2500', 'Biel', '1', NULL, '2007-11-11', '2011-03-31', NULL),
       (2, 3, 'Wendel', 'Otto', 'Sigriststr. 9', '4500', 'Solothurn', '1', NULL, '2011-01-01', '2014-11-30', NULL),
       (3, 2, 'Meyer', 'Dominik', 'Rainstr. 13', '4528', 'Zuchwil', '1', NULL, '2011-01-01', NULL, NULL),
       (4, 2, 'Meyer', 'Petra', 'Rainstr. 13', '4528', 'Zuchwil', '1', NULL, '2009-02-15', NULL, NULL),
       (5, 2, 'Tamburino', 'Mario', 'Solothurnstr. 96', '2540', 'Grenchen', '0', NULL, '2014-09-30', NULL, 4),
       (6, 2, 'Bregger', 'Beni', 'Sportstr. 2', '2540', 'Grenchen', '1', NULL, '2012-05-21', NULL, 4),
       (7, 5, 'Luder', 'Kevin', 'Forstweg 14', '2545', 'Zuchwil', '1', 'Klaushock', NULL, NULL, NULL),
       (8, 6, 'Frei', 'Barbara', 'Gartenstr.1', '2540', 'Grenchen', '1', NULL, NULL, NULL, NULL),
       (9, 6, 'Huber', 'Felix', 'Eichmatt 7', '2545', 'Selzach', '1', NULL, NULL, NULL, NULL),
       (10, 1, 'Cadola', 'Leo', 'Sportstr. 2', '4500', 'Solothurn', '1', NULL, '2013-10-01', NULL, NULL),
       (11, 1, 'Bart', 'Sabine', 'Bernstr. 15', '2540', 'Grenchen', '1', NULL, '2014-07-12', NULL, 10),
       (12, 2, 'Gruber', 'Romy', 'Gladbaechli 3', '2545', 'Selzach', '0', NULL, '2009-11-29', NULL, NULL);

INSERT INTO Anlass (anlaid, bezeichner, ort, datum, kosten, orgid)
VALUES (1, 'GV', 'Solothurn', '2013-03-31', 200, 2), 
       (2, 'Vorstandssitzung', 'Grenchen', '2014-01-17', NULL, 12), 
       (3, 'GV', 'Bettlach', '2013-03-30', 200, 6), 
       (4, 'Klaushock', 'Bettlach', '2014-12-06', 150, 7),
       (5, 'Vorstandssitzung', 'Grenchen', '2015-01-21', NULL, 12),
       (6, 'Turnier', 'Biel', '2014-02-28', 1020, 10),
       (7, 'GV', 'Grenchenberg', '2015-03-29', 250, 4),
       (8, 'Vorstandssitzung', 'Grenchen', '2015-01-19', NULL, 6);

INSERT INTO Spende (sponid, spenid, anlaid, bezeichner, datum, betrag)
VALUES (1, 5, 6, 'Apéro', '2015-02-02', 720),
       (1, 6, NULL, 'Defizittilgung', '2015-04-13', 550),
       (2, 3, 7, 'Getraenke', '2015-03-05', 600),
       (2, 4, 6, 'Plakate', '2015-03-11', 300),
       (2, 5, NULL, 'Defizittilgung', '2015-04-13', 750),
       (3, 1, 4, 'Gluehwein', '2014-11-29', 200),
       (3, 2, 7, 'Unterhaltungsmusik', '2015-02-23', 550);

INSERT INTO Teilnehmer (persid, anlaid)
VALUES (3, 1),
       (4, 1),
       (6, 1),
       (12, 1),
       (2, 2),
       (3, 2),
       (4, 2),
       (2, 3),
       (4, 3),
       (6, 3),
       (12, 3),
       (3, 5),
       (12, 5),
       (2, 7),
       (3, 7),
       (6, 7),
       (4, 8),
       (12, 8);

INSERT INTO Sponsorenkontakt (persid, sponid)
VALUES (8, 1),
       (4, 2),
       (9, 2),
       (3, 3),
       (4, 3);

INSERT INTO Funktionsbesetzung (persid, funkid, antritt, ruecktritt)
VALUES (1, 1, '2007-11-11', '2010-03-31'),
       (4, 2, '2009-04-01', '2011-03-31'),
       (12, 1, '2010-04-01', '2011-03-31'),
       (4, 1, '2011-04-01', '2013-03-31'),
       (12, 2, '2011-04-01', '2012-03-31'),
       (2, 3, '2011-04-01', '2013-03-31'),
       (3, 2, '2012-04-01', '2013-03-31'),
       (12, 1, '2012-04-01', NULL),
       (6, 3, '2013-04-01', '2014-03-31'),
       (3, 4, '2013-04-01', '2015-03-31'),
       (4, 5, '2013-04-01', '2014-03-31'),
       (6, 2, '2014-04-01', '2029-04-30'),
       (4, 4, '2014-04-01', NULL),
       (2, 5, '2014-04-01', '2028-11-30'),
       (3, 3, '2014-08-01', NULL);