CREATE TABLE Predmet (
  idPredmeta INTEGER IDENTITY NOT NULL,
  Ime_predmeta VARCHAR(45) NULL,
  PRIMARY KEY(idPredmeta)
);

CREATE TABLE U�enec (
  idU�enca INTEGER IDENTITY NOT NULL,
  Ime VARCHAR(45) NULL,
  Priimek VARCHAR(45) NULL,
  PRIMARY KEY(idU�enca)
);

CREATE TABLE U�itelj (
  idU�itelja INTEGER IDENTITY NOT NULL,
  Ime VARCHAR(45) NULL,
  Priimek VARCHAR(45) NULL,
  PRIMARY KEY(idU�itelja)
);

CREATE TABLE U�enec_Predmet (
  Predmet_idPredmeta INTEGER NOT NULL,
  U�enec_idU�enca INTEGER NOT NULL,
  idU�enca INT NOT NULL,
  idPredmeta INT NOT NULL,
  FOREIGN KEY(U�enec_idU�enca)
    REFERENCES U�enec(idU�enca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Gradivo (
  idGradiva INTEGER IDENTITY NOT NULL,
  U�itelj_idU�itelja INTEGER NOT NULL,
  Predmet_idPredmeta INTEGER NOT NULL,
  Naslov VARCHAR(255) NULL,
  Vsebina TEXT NULL,
  Datum_nalaganja DATE NULL,
  idU�itelja INT NULL,
  idPredmeta INT NULL,
  PRIMARY KEY(idGradiva),
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(U�itelj_idU�itelja)
    REFERENCES U�itelj(idU�itelja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE U�itelj_Predmet (
  Predmet_idPredmeta INTEGER NOT NULL,
  U�itelj_idU�itelja INTEGER NOT NULL,
  idU�itelja INT NOT NULL,
  idPredmeta INT NOT NULL,
  FOREIGN KEY(U�itelj_idU�itelja)
    REFERENCES U�itelj(idU�itelja)
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
  U�itelj_idU�itelja INTEGER NOT NULL,
  U�enec_idU�enca INTEGER NOT NULL,
  Naslov VARCHAR(255) NULL,
  Vsebina TEXT NULL,
  Datum_oddaje DATE NULL,
  Ocena INT NULL,
  idU�enca INT NULL,
  idU�itelja INT NULL,
  idPredmeta INT NULL,
  PRIMARY KEY(idNaloge),
  FOREIGN KEY(U�enec_idU�enca)
    REFERENCES U�enec(idU�enca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(U�itelj_idU�itelja)
    REFERENCES U�itelj(idU�itelja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Predmet_idPredmeta)
    REFERENCES Predmet(idPredmeta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);
--vnos podatkov
INSERT INTO U�itelj VALUES (1, 'Valentina', 'Hrastnik');
INSERT INTO U�itelj VALUES (2, 'Borut', 'Slemen�ek');
INSERT INTO U�itelj VALUES (3, 'Rosana', 'Breznik');
INSERT INTO U�itelj VALUES (4, 'Jaka', 'Koren');
INSERT INTO U�itelj VALUES (5, 'Bo�tjan', 'Resinovi�');

INSERT INTO Predmet VALUES (1, 'Sloven��ina');
INSERT INTO Predmet VALUES (2, 'VVO');
INSERT INTO Predmet VALUES (3, 'RPR');
INSERT INTO Predmet VALUES (4, 'Angle��ina');
INSERT INTO Predmet VALUES (5, 'SMV');

INSERT INTO U�enec VALUES (1, 'Ana', 'Kova�');
INSERT INTO U�enec VALUES (2, 'Miha', 'Novak');
INSERT INTO U�enec VALUES (3, 'Mojca', 'Podkri�nik');
INSERT INTO U�enec VALUES (4, 'Peter', 'Malik');
INSERT INTO U�enec VALUES (5, 'Rok', 'Urni');

INSERT INTO U�itelj_Predmet VALUES (1,1), (2,2), (2,3), (2,5), (3,4), (4,3), (5,5);

INSERT INTO U�enec_Predmet VALUES (1,1), (1,5), (2,1), (2,2), (2,3), (3,1), (3,4), (4,1), (4,3), (4,5), (5,1), (5,3), (5,5);

INSERT INTO Gradivo VALUES (1, 'Moderna na Slovenskem', 'Wordov dokument s predstavniki in deli', '2025-04-25', 1,1);
INSERT INTO Gradivo VALUES (2, 'IP naslovi', 'PPT datoteka o verzijah IP naslovov', '2024-09-01', 2,2);
INSERT INTO Gradivo VALUES (3, 'Irregular verbs', 'Wordov dokument z nepravilnimi glagoli', '2020-12-12', 3,3);
INSERT INTO Gradivo VALUES (4, 'Obdelava zvoka', 'PPT datoteka z opisom orodja Adobe Audition', '2024-09-12', 4,4);
INSERT INTO Gradivo VALUES(5, 'Predstavitev WindowsForms', 'Videoposnetek z razlago snovi', '2021-02-05', 5,5);

INSERT INTO Naloga VALUES (1, 'Aktualizacija odnosa otroci-star�i', 'Primerjava dana�njih odnosov med star�i in otroci s Tino in Matkom','2025-09-06', 4,1,1,1);
INSERT INTO Naloga VALUES (2, 'Aktualizacija odnosa otroci-star�i', 'Primerjava dana�njih odnosov med star�i in otroci s Tino in Matkom','2025-09-06', 3,2,1,1);
INSERT INTO Naloga VALUES (3, 'Aktualizacija odnosa otroci-star�i', 'Primerjava dana�njih odnosov med star�i in otroci s Tino in Matkom','2025-09-05', 5,3,1,1);
INSERT INTO Naloga VALUES (4, 'Aktualizacija odnosa otroci-star�i', 'Primerjava dana�njih odnosov med star�i in otroci s Tino in Matkom','2025-09-05', 4,4,1,1);
INSERT INTO Naloga VALUES (5, 'Aktualizacija odnosa otroci-star�i', 'Primerjava dana�njih odnosov med star�i in otroci s Tino in Matkom','2025-09-06', 3,5,1,1);

--Poizvedbe
--pregled gradiv za sloven��ino po naslovih
SELECT Naslov FROM Gradivo
WHERE idPredmeta = 1;

--prof. Valentina Hrastnik pregleda naloge za sloven��ino
SELECT Naslov, Ocena FROM Naloga
WHERE idU�itelja = 1 AND idPredmeta = 1;

--dijakinja Ana Kova� preveri svoje ocene
SELECT Naslov, Ocena FROM Naloga
WHERE idU�enca = 1;

--Prikaz predmetov, ki jih pou�uje u�itelj z id 2
SELECT p.Ime_predmeta
FROM Predmet p
JOIN U�itelj_Predmet up ON p.idPredmeta = up.idPredmeta
WHERE up.idU�itelja = 2;

--Seznam u�encev, ki obiskujejo predmet z id 5
SELECT u.Ime, u.Priimek
FROM U�enec u
JOIN U�enec_Predmet up ON u.idU�enca = up.idU�enca
WHERE up.idPredmeta = 5;

--Gradiva, ki jih je nalo�il u�itelj z id = 3 za predmet 4
SELECT g.Naslov, g.Datum_nalaganja
FROM Gradivo g
WHERE g.idU�itelja = 3 AND g.idPredmeta = 4;

--Povpre�na ocena nalog, ki jih je ocenil u�itelj z id 1
SELECT AVG(n.Ocena) AS povprecna_ocena
FROM Naloga n
WHERE n.idU�itelja = 1;
