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
(21,'Valentina','Hrastnik'),
(22,'Borut','Slemensek'),
(23,'Rosana','Breznik'),
(24,'Jaka','Koren'),
(25,'Bostjan','Resinovic'),
(26,'Tanja','Jelenko'),
(27,'Katja','Kolar'),
(28,'Helena','Klepej Viher'),
(29,'Nataša','Besednjak'),
(30,'Andraž','Pušnik'),
(31,'Boštjan','Lubej'),
(32,'Žiga','Pušelc'),
(33,'Oskar','Žvegliè'),
(34,'Tjaša','Verdev'),
(35,'Boštjan','Fidler'),
(36,'Matic','Holobar'),
(37,'Matej','Kališek'),
(38,'Bojan','Herman'),
(39,'Klavdija','Špur Jereb'),
(40,'Tilen','Sirk');
INSERT INTO Predmet (idPredmeta, Ime_predmeta) VALUES
(1,'Slovenscina'), (2,'VVO'), (3,'RPR'), (4,'Anglescina'), (5,'SMV'), (6,'Matematika'), (7,'NRS'), (8,'STE'), (9,'KOM'), (10,'Fizika');

INSERT INTO Ucenec (idUcenca, Ime, Priimek) VALUES
(1,'Ana','Kovac'),
(2,'Miha','Novak'),
(3,'Mojca','Podkriznik'),
(4,'Peter','Malik'),
(5,'Rok','Urni'),
(6,'Ana','Novak'),
(7,'Maja','Kralj'),
(8,'Nina','Horvat'),
(9,'Lara','Zupan'),
(10,'Eva','Mlakar'),
(11,'Luka','Zajc'),
(12,'Marko','Novak'),
(13,'Žan','Kralj'),
(14,'Miha','Horvat'),
(15,'David','Mlakar'),
(16,'Jure','Potoènik'),
(17,'Tomaž','Medved'),
(18,'Peter','Kovaè'),
(19,'Andrej','Rozman'),
(20,'Simon','Bizjak'),
(21,'Gregor','Turk'),
(22,'Matej','Žagar'),
(23,'Alen','Vidmar'),
(24,'Rok','Jerman'),
(25,'Nejc','Košir'),
(26,'Tjaš','Potoènik'),
(27,'Klara','Zajec'),
(28,'Mojca','Medved'),
(29,'Sara','Kovaè'),
(30,'Barbara','Rozman'),
(31,'Jan','Bizjak'),
(32,'Katja','Turek'),
(33,'Urh','Žagar'),
(34,'Alja','Vidmar'),
(35,'Špela','Jeram'),
(36,'Neža','Košir'),
(37,'Denis','Božiènik'),
(38,'Aleš','Rebrnik'),
(39,'Miha','Reberšak'),
(40,'Igor','Kocjan'),
(41,'Boris','Mayer'),
(42,'Sebastijan','Kristan'),
(43,'Kristjan','Zajec'),
(45,'Ivan','Petek'),
(46,'Martin','Knez'),
(47,'Boštjan','Doberšek'),
(48,'Boris','Dolenšek'),
(49,'Žiga','Ribiè'),
(50,'Milanka','Gradišar'),
(51,'Deja','Kocjanèiè'),
(52,'Milan','Gradiè'),
(53,'Filip','Tomšiè'),
(54,'Dejan','Vovk'),
(55,'Francka','Cankar'),
(56,'Sebastian','Hrovat'),
(57,'Tanja','Rajh'),
(58,'Lidija','Vrhunc'),
(59,'Olga','Vidic'),
(60,'Aleš','Vidiènik'),
(61,'Alenka','Zupan'),
(62,'Rok','Zupanèiè'),
(63,'Helena','Pirc'),
(64,'Mark','Kosec'),
(65,'Maša','Bevèiè'),
(66,'Hana','Rajh'),
(67,'Lucija','Ramšak'),
(68,'Tit','Èrni'),
(69,'Krista','Zorèiè'),
(70,'Matej','Zorko'),
(71,'Jasmina','Kocbek'),
(72,'Simona','Prešeren'),
(73,'Elizabeta','Kovaè'),
(74,'Dani','Prešeren'),
(75,'Roman','Bevc'),
(76,'Ivanka','Petriè'),
(77,'Maruša','Knez'),
(78,'Teja','Ribiè'),
(79,'Andrej','Kraljiè'),
(80,'Andrejka','Lonèar'),
(81,'Živa','Tomšiè'),
(82,'Romana','Vovk'),
(83,'Mojmir','Majer'),
(84,'Lea','Božiè'),
(85,'Edvard','Kocmur'),
(86,'Radko','Šubic'),
(87,'Miran','Jereb'),
(88,'Aleš','Vidic'),
(89,'Jan','Pirc'),
(90,'Zoran','Zupanek'),
(91,'Oskar','Križaj'),
(92,'Stanko','Oblak'),
(93,'Tilen','Bojkov'),
(94,'Lovro','Ramšak'),
(95,'Rok','Štrukelj'),
(96,'Zoran','Vrhunc'),
(97,'Primož','Kovaè'),
(98,'Gašper','Oblak'),
(99,'Mare','Kocuvan'),
(100,'Anja','Ribièiè');

INSERT INTO Ucitelj_Predmet (idUcitelja, idPredmeta) VALUES
(1,1),(1,9),(2,2),(2,3),(2,5),(3,4),(4,3),(4,7),(5,5),(5,8),(6,1),(7,4),(8,6),(9,6),(10,5),(11,5),(12,2),(13,3),(13,7),(14,1),(14,9),(15,2),(16,3),(16,7),(17,3),(18,10),(19,4),(19,8),(20,3);

INSERT INTO Ucenec_Predmet (idUcenca, idPredmeta) VALUES
(1,1),(1,5),(2,1),(2,2),(2,3),(3,1),(3,4),(4,1),(4,3),(4,5),(5,1),(5,3),(5,5),(6,1),(6,10),(7,1),(7,2),(7,4),(8,1),(8,3),(8,6),(8,7),(9,1),(9,9),(9,10),(10,1),(10,4),(10,5),(11,1),(11,2),(11,7),(11,8),(12,1),(12,3),(13,1),(13,8),(13,10),(14,1),(14,6),(14,7),(14,8),(15,1),(15,2),(15,5),(16,1),(16,3),(17,1),(17,8),(17,9),(18,1),(18,6),(18,7),(18,10),(19,1),(19,8),(19,9),(19,10),(20,1),(20,2),(20,3),(21,1),(21,4),(21,6),(21,10),(22,1),(22,4),(22,5),(23,1),(23,2),(23,3),(24,1),(24,3),(24,5),(24,10),(25,1),(25,5),(25,8),(26,1),(26,9),(27,1),(27,5),(27,7),(28,1),(28,6),(28,9),(28,10),(29,1),(29,3),(29,4),(30,1),(30,5),(31,1),(31,6),(31,7),(32,1),(32,9),(32,10),(33,1),(33,7),(34,1),(34,4),(35,1),(35,5),(35,8),(36,1),(36,6),(36,7),(37,1),(37,2),(38,1),(38,3),(39,1),(39,4),(39,5),(40,1),(40,3),(40,8),(41,1),(41,4),(41,10),(42,1),(42,3),(42,8),(43,1),(43,10),(44,1),(44,6),(44,8),(45,1),(45,3),(45,5),(45,7),(46,1),(46,2),(47,1),(47,3),(47,4),(48,1),(48,3),(49,1),(49,4),(49,3),(50,1),(50,5),(51,1),(51,6),(52,1),(52,7),(52,8),(53,1),(53,10),(54,1),(54,9),(55,1),(55,5),(55,8),(56,1),(56,2),(56,4),(57,1),(57,3),(57,5),(58,1),(58,4),(58,6),(59,1),(59,6),(59,7),(59,10),(60,1),(60,3),(61,1),(61,5),(61,6),(62,1),(62,2),(63,1),(63,5),(63,8),(63,9),(64,1),(64,7),(65,1),(65,6),(65,10),(66,1),(66,8),(67,1),(67,7),(67,9),(68,1),(68,6),(69,1),(69,3),(70,1),(70,5),(70,10),(71,1),(71,4),(71,6),(71,7),(71,8),(72,1),(72,8),(73,1),(73,2),(73,9),(74,1),(74,4),(74,5),(75,1),(75,6),(75,8),(75,9),(76,1),(76,4),(76,10),(77,1),(77,7),(77,8),(77,9),(78,1),(78,2),(78,8),(79,1),(79,5),(79,6),(79,10),(80,1),(80,2),(81,1),(81,3),(81,5),(82,1),(82,4),(82,6),(83,1),(83,8),(83,9),(83,10),(84,1),(84,4),(85,1),(85,5),(85,6),(86,1),(86,7),(86,8),(86,9),(86,10),(87,1),(87,3),(88,1),(88,2),(88,8),(89,1),(89,4),(90,1),(90,2),(90,3),(90,6),(90,9),(91,1),(91,3),(91,4),(92,1),(92,8),(92,10),(93,1),(93,2),(93,7),(94,1),(94,6),(95,1),(95,7),(95,9),(96,1),(96,3),(96,6),(96,9),(96,10),(97,1),(97,2),(97,8),(98,1),(98,4),(99,1),(99,4),(99,8),(99,9),(99,10),(100,1),(100,5),(100,9),(100,10);

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

