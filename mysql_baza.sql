SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Naloga;
DROP TABLE IF EXISTS Gradivo;
DROP TABLE IF EXISTS Ucenec_Predmet;
DROP TABLE IF EXISTS Ucitelj_Predmet;
DROP TABLE IF EXISTS Ucitelj;
DROP TABLE IF EXISTS Ucenec;
DROP TABLE IF EXISTS Predmet;

CREATE TABLE Predmet (
  idPredmeta INT AUTO_INCREMENT PRIMARY KEY,
  Ime_predmeta VARCHAR(45)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ucenec (
  idUcenca INT AUTO_INCREMENT PRIMARY KEY,
  Ime VARCHAR(45),
  Priimek VARCHAR(45)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ucitelj (
  idUcitelja INT AUTO_INCREMENT PRIMARY KEY,
  Ime VARCHAR(45),
  Priimek VARCHAR(45)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ucenec_Predmet (
  idUcenca INT NOT NULL,
  idPredmeta INT NOT NULL,
  PRIMARY KEY (idUcenca, idPredmeta),
  CONSTRAINT fk_up_ucenec FOREIGN KEY (idUcenca) REFERENCES Ucenec(idUcenca),
  CONSTRAINT fk_up_predmet FOREIGN KEY (idPredmeta) REFERENCES Predmet(idPredmeta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ucitelj_Predmet (
  idUcitelja INT NOT NULL,
  idPredmeta INT NOT NULL,
  PRIMARY KEY (idUcitelja, idPredmeta),
  CONSTRAINT fk_tp_ucitelj FOREIGN KEY (idUcitelja) REFERENCES Ucitelj(idUcitelja),
  CONSTRAINT fk_tp_predmet FOREIGN KEY (idPredmeta) REFERENCES Predmet(idPredmeta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Gradivo (
  idGradiva INT AUTO_INCREMENT PRIMARY KEY,
  Naslov VARCHAR(255),
  Vsebina TEXT,
  Datum_nalaganja DATE,
  idUcitelja INT,
  idPredmeta INT,
  CONSTRAINT fk_g_ucitelj FOREIGN KEY (idUcitelja) REFERENCES Ucitelj(idUcitelja),
  CONSTRAINT fk_g_predmet FOREIGN KEY (idPredmeta) REFERENCES Predmet(idPredmeta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Naloga (
  idNaloge INT AUTO_INCREMENT PRIMARY KEY,
  Naslov VARCHAR(255),
  Vsebina TEXT,
  Datum_oddaje DATE,
  Ocena INT,
  idUcenca INT,
  idUcitelja INT,
  idPredmeta INT,
  CONSTRAINT fk_n_ucenec FOREIGN KEY (idUcenca) REFERENCES Ucenec(idUcenca),
  CONSTRAINT fk_n_ucitelj FOREIGN KEY (idUcitelja) REFERENCES Ucitelj(idUcitelja),
  CONSTRAINT fk_n_predmet FOREIGN KEY (idPredmeta) REFERENCES Predmet(idPredmeta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- seed data (no diacritics in identifiers; data can have diacritics removed too)
INSERT INTO Ucitelj (idUcitelja, Ime, Priimek) VALUES
(1,'Valentina','Hrastnik'),
(2,'Borut','Slemensek'),
(3,'Rosana','Breznik'),
(4,'Jaka','Koren'),
(5,'Bostjan','Resinovic');

INSERT INTO Predmet (idPredmeta, Ime_predmeta) VALUES
(1,'Slovenscina'), (2,'VVO'), (3,'RPR'), (4,'Anglescina'), (5,'SMV');

INSERT INTO Ucenec (idUcenca, Ime, Priimek) VALUES
(1,'Ana','Kovac'),
(2,'Miha','Novak'),
(3,'Mojca','Podkriznik'),
(4,'Peter','Malik'),
(5,'Rok','Urni');

INSERT INTO Ucitelj_Predmet (idUcitelja, idPredmeta) VALUES
(1,1),(2,2),(2,3),(2,5),(3,4),(4,3),(5,5);

INSERT INTO Ucenec_Predmet (idUcenca, idPredmeta) VALUES
(1,1),(1,5),(2,1),(2,2),(2,3),(3,1),(3,4),(4,1),(4,3),(4,5),(5,1),(5,3),(5,5);

INSERT INTO Gradivo (idGradiva, Naslov, Vsebina, Datum_nalaganja, idUcitelja, idPredmeta) VALUES
(1,'Moderna na Slovenskem','Wordov dokument s predstavniki in deli','2025-04-25',1,1),
(2,'IP naslovi','PPT datoteka o verzijah IP naslovov','2024-09-01',2,2),
(3,'Irregular verbs','Wordov dokument z nepravilnimi glagoli','2020-12-12',3,3),
(4,'Obdelava zvoka','PPT datoteka z opisom orodja Adobe Audition','2024-09-12',4,4),
(5,'Predstavitev WindowsForms','Videoposnetek z razlago snovi','2021-02-05',5,5);

INSERT INTO Naloga (idNaloge, Naslov, Vsebina, Datum_oddaje, Ocena, idUcenca, idUcitelja, idPredmeta) VALUES
(1,'Aktualizacija odnosa otroci-starsi','Primerjava danasnjih odnosov ...','2025-09-06',4,1,1,1),
(2,'Aktualizacija odnosa otroci-starsi','Primerjava danasnjih odnosov ...','2025-09-06',3,2,1,1),
(3,'Aktualizacija odnosa otroci-starsi','Primerjava danasnjih odnosov ...','2025-09-05',5,3,1,1),
(4,'Aktualizacija odnosa otroci-starsi','Primerjava danasnjih odnosov ...','2025-09-05',4,4,1,1),
(5,'Aktualizacija odnosa otroci-starsi','Primerjava danasnjih odnosov ...','2025-09-06',3,5,1,1);

SET FOREIGN_KEY_CHECKS=1;

