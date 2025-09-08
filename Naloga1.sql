CREATE TABLE Predmet (
  idPredmeta INTEGER IDENTITY NOT NULL,
  Ime_predmeta VARCHAR(45) NULL,
  PRIMARY KEY(idPredmeta)
);

CREATE TABLE Uèenec (
  idUèenca INTEGER IDENTITY NOT NULL,
  Ime VARCHAR(45) NULL,
  Priimek VARCHAR(45) NULL,
  PRIMARY KEY(idUèenca)
);

CREATE TABLE Uèitelj (
  idUèitelja INTEGER IDENTITY NOT NULL,
  Ime VARCHAR(45) NULL,
  Priimek VARCHAR(45) NULL,
  PRIMARY KEY(idUèitelja)
);

CREATE TABLE Uèenec_Predmet (
  Predmet_idPredmeta INTEGER NOT NULL,
  Uèenec_idUèenca INTEGER NOT NULL,
  idUèenca INT NOT NULL,
  idPredmeta INT NOT NULL,
  FOREIGN KEY(Uèenec_idUèenca)
    REFERENCES Uèenec(idUèenca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Gradivo (
  idGradiva INTEGER IDENTITY NOT NULL,
  Uèitelj_idUèitelja INTEGER NOT NULL,
  Predmet_idPredmeta INTEGER NOT NULL,
  Naslov VARCHAR(255) NULL,
  Vsebina TEXT NULL,
  Datum_nalaganja DATE NULL,
  idUèitelja INT NULL,
  idPredmeta INT NULL,
  PRIMARY KEY(idGradiva),
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Uèitelj_idUèitelja)
    REFERENCES Uèitelj(idUèitelja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Uèitelj_Predmet (
  Predmet_idPredmeta INTEGER NOT NULL,
  Uèitelj_idUèitelja INTEGER NOT NULL,
  idUèitelja INT NOT NULL,
  idPredmeta INT NOT NULL,
  FOREIGN KEY(Uèitelj_idUèitelja)
    REFERENCES Uèitelj(idUèitelja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Naloga (
  idNaloge INTEGER IDENTITY NOT NULL,
  Predmet_idPredmeta INTEGER NOT NULL,
  Uèitelj_idUèitelja INTEGER NOT NULL,
  Uèenec_idUèenca INTEGER NOT NULL,
  Naslov VARCHAR(255) NULL,
  Vsebina TEXT NULL,
  Datum_oddaje DATE NULL,
  Ocena INT NULL,
  idUèenca INT NULL,
  idUèitelja INT NULL,
  idPredmeta INT NULL,
  PRIMARY KEY(idNaloge),
  FOREIGN KEY(Uèenec_idUèenca)
    REFERENCES Uèenec(idUèenca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Uèitelj_idUèitelja)
    REFERENCES Uèitelj(idUèitelja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);
--vnos podatkov
INSERT INTO Uèitelj VALUES (1, 'Valentina', 'Hrastnik');
INSERT INTO Uèitelj VALUES (2, 'Borut', 'Slemenšek');
INSERT INTO Uèitelj VALUES (3, 'Rosana', 'Breznik');
INSERT INTO Uèitelj VALUES (4, 'Jaka', 'Koren');
INSERT INTO Uèitelj VALUES (5, 'Boštjan', 'Resinoviè');

INSERT INTO Predmet VALUES (1, 'Slovenšèina');
INSERT INTO Predmet VALUES (2, 'VVO');
INSERT INTO Predmet VALUES (3, 'RPR');
INSERT INTO Predmet VALUES (4, 'Anglešèina');
INSERT INTO Predmet VALUES (5, 'SMV');

INSERT INTO Uèenec VALUES (1, 'Ana', 'Kovaè');
INSERT INTO Uèenec VALUES (2, 'Miha', 'Novak');
INSERT INTO Uèenec VALUES (3, 'Mojca', 'Podkrižnik');
INSERT INTO Uèenec VALUES (4, 'Peter', 'Malik');
INSERT INTO Uèenec VALUES (5, 'Rok', 'Urni');

INSERT INTO Uèitelj_Predmet VALUES (1,1), (2,2), (2,3), (2,5), (3,4), (4,3), (5,5);

INSERT INTO Uèenec_Predmet VALUES (1,1), (1,5), (2,1), (2,2), (2,3), (3,1), (3,4), (4,1), (4,3), (4,5), (5,1), (5,3), (5,5);

INSERT INTO Gradivo VALUES (1, 'Moderna na Slovenskem', 'Wordov dokument s predstavniki in deli', '2025-04-25', 1,1);
INSERT INTO Gradivo VALUES (2, 'IP naslovi', 'PPT datoteka o verzijah IP naslovov', '2024-09-01', 2,2);
INSERT INTO Gradivo VALUES (3, 'Irregular verbs', 'Wordov dokument z nepravilnimi glagoli', '2020-12-12', 3,3);
INSERT INTO Gradivo VALUES (4, 'Obdelava zvoka', 'PPT datoteka z opisom orodja Adobe Audition', '2024-09-12', 4,4);
INSERT INTO Gradivo VALUES(5, 'Predstavitev WindowsForms', 'Videoposnetek z razlago snovi', '2021-02-05', 5,5);

INSERT INTO Naloga VALUES (1, 'Aktualizacija odnosa otroci-starši', 'Primerjava današnjih odnosov med starši in otroci s Tino in Matkom','2025-09-06', 4,1,1,1);
INSERT INTO Naloga VALUES (2, 'Aktualizacija odnosa otroci-starši', 'Primerjava današnjih odnosov med starši in otroci s Tino in Matkom','2025-09-06', 3,2,1,1);
INSERT INTO Naloga VALUES (3, 'Aktualizacija odnosa otroci-starši', 'Primerjava današnjih odnosov med starši in otroci s Tino in Matkom','2025-09-05', 5,3,1,1);
INSERT INTO Naloga VALUES (4, 'Aktualizacija odnosa otroci-starši', 'Primerjava današnjih odnosov med starši in otroci s Tino in Matkom','2025-09-05', 4,4,1,1);
INSERT INTO Naloga VALUES (5, 'Aktualizacija odnosa otroci-starši', 'Primerjava današnjih odnosov med starši in otroci s Tino in Matkom','2025-09-06', 3,5,1,1);

--Poizvedbe
--pregled gradiv za slovenšèino po naslovih
SELECT Naslov FROM Gradivo
WHERE idPredmeta = 1;

--prof. Valentina Hrastnik pregleda naloge za slovenšèino
SELECT Naslov, Ocena FROM Naloga
WHERE idUèitelja = 1 AND idPredmeta = 1;

--dijakinja Ana Kovaè preveri svoje ocene
SELECT Naslov, Ocena FROM Naloga
WHERE idUèenca = 1;

--Prikaz predmetov, ki jih pouèuje uèitelj z id 2
SELECT p.Ime_predmeta
FROM Predmet p
JOIN Uèitelj_Predmet up ON p.idPredmeta = up.idPredmeta
WHERE up.idUèitelja = 2;

--Seznam uèencev, ki obiskujejo predmet z id 5
SELECT u.Ime, u.Priimek
FROM Uèenec u
JOIN Uèenec_Predmet up ON u.idUèenca = up.idUèenca
WHERE up.idPredmeta = 5;

--Gradiva, ki jih je naložil uèitelj z id = 3 za predmet 4
SELECT g.Naslov, g.Datum_nalaganja
FROM Gradivo g
WHERE g.idUèitelja = 3 AND g.idPredmeta = 4;

--Povpreèna ocena nalog, ki jih je ocenil uèitelj z id 1
SELECT AVG(n.Ocena) AS povprecna_ocena
FROM Naloga n
WHERE n.idUèitelja = 1;

