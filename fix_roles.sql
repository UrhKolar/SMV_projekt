-- Popravek vlog z pravilnimi slovenskimi znaki
ALTER TABLE Ucenec
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Funkcija ENUM('ucenec', 'ucitelj', 'skrbnik');

ALTER TABLE Ucitelj
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Funkcija ENUM('ucenec', 'ucitelj', 'skrbnik');

-- Dodaj uporabnike z pravilnimi vlogami
INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Tim', 'Krušič', 'tim.krusic.19669@dijak.sc-celje.si', 'skrbnik');

INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Marija', 'Črepinšek', 'marija.crepinsek@dijak.sc-celje.si', 'ucitelj');

INSERT INTO Ucenec (Ime, Priimek, Email, Funkcija)
VALUES ('Urh', 'Kolar', 'urh.kolar@dijak.sc-celje.si', 'ucenec');

-- Posodobi obstoječe zapise
UPDATE Ucenec
SET Email = 'urh.kolar@dijak.sc-celje.si', Funkcija = 'ucenec'
WHERE Ime = 'Urh' AND Priimek = 'Kolar';

UPDATE Ucenec
SET Email = 'tim.krusic@dijak.sc-celje.si', Funkcija = 'ucenec'
WHERE Ime = 'Tim' AND Priimek='Krušič';

UPDATE Ucitelj
SET Email = 'marija.crepinsek@dijak.sc-celje.si', Funkcija = 'ucitelj'
WHERE Ime = 'Marija' AND Priimek = 'Črepinšek';



