-- Legt alle Tabellen und Beziehungen der Vereinsdatenbank fest.

-- Erstellen der Tabelle Status
CREATE TABLE Status (
    StatID INTEGER PRIMARY KEY,
    Bezeichner VARCHAR(20) NOT NULL,
    Beitrag DECIMAL(5,2)
);

-- Erstellen der Tabelle Person
CREATE TABLE Person (
    PersID INTEGER PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Vorname VARCHAR(15) NOT NULL,
    Strasse_Nr VARCHAR(20) NOT NULL,
    PLZ CHAR(4) NOT NULL,
    Ort VARCHAR(20) NOT NULL,
    bezahlt CHAR(1) NOT NULL,
    Bemerkungen VARCHAR(25),
    Eintritt DATE NOT NULL,
    Austritt DATE,
    StatID INTEGER,
    MentorID INTEGER,
    FOREIGN KEY (StatID) REFERENCES Status(StatID),
    FOREIGN KEY (MentorID) REFERENCES Person(PersID)
);

-- Erstellen der Tabelle Funktion
CREATE TABLE Funktion (
    FunkID INTEGER PRIMARY KEY,
    Bezeichner VARCHAR(20) NOT NULL
);

-- Erstellen der Tabelle Funktionsbesetzung
CREATE TABLE Funktionsbesetzung (
    Antritt DATE NOT NULL,
    Ruecktritt DATE,
    FunkID INTEGER NOT NULL,
    PersID INTEGER NOT NULL,
    PRIMARY KEY (Antritt, FunkID, PersID),
    FOREIGN KEY (FunkID) REFERENCES Funktion(FunkID),
    FOREIGN KEY (PersID) REFERENCES Person(PersID)
);

-- Erstellen der Tabelle Sponsor
CREATE TABLE Sponsor (
    SponID INTEGER PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Strasse_Nr VARCHAR(20) NOT NULL,
    PLZ CHAR(4) NOT NULL,
    Ort VARCHAR(20) NOT NULL,
    Spendentotal DECIMAL(8,2) NOT NULL
);

-- Erstellen der Tabelle Sponsorenkontakt
CREATE TABLE Sponsorenkontakt (
    PersID INTEGER NOT NULL,
    SponID INTEGER NOT NULL,
    PRIMARY KEY (PersID, SponID),
    FOREIGN KEY (PersID) REFERENCES Person(PersID),
    FOREIGN KEY (SponID) REFERENCES Sponsor(SponID)
);

-- Erstellen der Tabelle Anlass
CREATE TABLE Anlass (
    AnalID INTEGER PRIMARY KEY,
    Bezeichner VARCHAR(20) NOT NULL,
    Ort VARCHAR(20) NOT NULL,
    Datum DATE NOT NULL,
    Kosten DECIMAL(8,2),
    OrgID INTEGER NOT NULL,
    FOREIGN KEY (OrgID) REFERENCES Person(PersID)
);

-- Erstellen der Tabelle Teilnehmer
CREATE TABLE Teilnehmer (
    PersID INTEGER NOT NULL,
    AnalID INTEGER NOT NULL,
    PRIMARY KEY (PersID, AnalID),
    FOREIGN KEY (PersID) REFERENCES Person(PersID),
    FOREIGN KEY (AnalID) REFERENCES Anlass(AnalID)
);

-- Erstellen der Tabelle Spende
CREATE TABLE Spende (
    SpenID INTEGER PRIMARY KEY,
    Bezeichner VARCHAR(20),
    Datum DATE NOT NULL,
    Betrag DECIMAL(8,2) NOT NULL,
    SponID INTEGER NOT NULL,
    AnalID INTEGER,
    FOREIGN KEY (SponID) REFERENCES Sponsor(SponID),
    FOREIGN KEY (AnalID) REFERENCES Anlass(AnalID)
);