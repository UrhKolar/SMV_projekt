ALTER TABLE Ucenec
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Funkcija ENUM('u�enec', 'u�itelj', 'skrbnik');

ALTER TABLE Ucitelj
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Funkcija ENUM('u�enec', 'u�itelj', 'skrbnik');

INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Tim', 'Kru�i�', 'tim.krusic.19669@dijak.sc-celje.si', 'skrbnik');

INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Marija', '�repin�ek', 'marija.crepinsek@dijak.sc-celje.si', 'u�itelj');
INSERT INTO Ucenec (Ime, Priimek, Email, Funkcija)
VALUES ('Urh', 'Kolar', 'urh.kolar@dijak.sc-celje.si', 'u�enec');
UPDATE Ucenec
SET Email = 'urh.kolar@dijak.sc-celje.si', Funkcija = 'u�enec'
WHERE Ime = 'Urh' 
AND Priimek = 'Kolar';
UPDATE Ucenec
SET Email = 'tim.krusic@dijak.sc-celje.si', Funkcija = 'u�enec'
WHERE Ime = 'Tim' 
AND Priimek='Kru�i�';
UPDATE Ucitelj
SET Email = 'marija.crepinsek@dijak.sc-celje.si', Funkcija = 'u�itelj'
WHERE Ime = 'Marija' AND Priimek = '�repin�ek';