ALTER TABLE Ucenec
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Funkcija ENUM('uèenec', 'uèitelj', 'skrbnik');

ALTER TABLE Ucitelj
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Funkcija ENUM('uèenec', 'uèitelj', 'skrbnik');

INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Tim', 'Krušiè', 'tim.krusic.19669@dijak.sc-celje.si', 'skrbnik');

INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Marija', 'Èrepinšek', 'marija.crepinsek@dijak.sc-celje.si', 'uèitelj');

INSERT INTO Ucenec (Ime, Priimek, Email, Funkcija)
VALUES ('Urh', 'Kolar', 'urh.kolar@dijak.sc-celje.si', 'uèenec');

UPDATE Ucenec
SET Email = 'urh.kolar@dijak.sc-celje.si', Funkcija = 'uèenec'
WHERE Ime = 'Urh' 
AND Priimek = 'Kolar';

UPDATE Ucenec
SET Email = 'tim.krusic@dijak.sc-celje.si', Funkcija = 'uèenec'
WHERE Ime = 'Tim' 
AND Priimek='Krušiè';

UPDATE Ucitelj
SET Email = 'marija.crepinsek@dijak.sc-celje.si', Funkcija = 'uèitelj'
WHERE Ime = 'Marija' AND Priimek = 'Èrepinšek';



