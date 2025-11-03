-- Popravek vloge za Urha Kolarja
-- Zagotovi, da je Urh učenec, ne učitelj

-- Najprej preveri in popravi vlogo v tabeli Ucenec
UPDATE Ucenec 
SET Email = 'urh.kolar@dijak.sc-celje.si', 
    Funkcija = 'ucenec'
WHERE Ime = 'Urh' AND Priimek = 'Kolar';

-- Če Urh ni v tabeli Ucenec, ga dodaj
INSERT INTO Ucenec (Ime, Priimek, Email, Funkcija)
VALUES ('Urh', 'Kolar', 'urh.kolar@dijak.sc-celje.si', 'ucenec')
ON DUPLICATE KEY UPDATE 
    Email = VALUES(Email),
    Funkcija = VALUES(Funkcija);

-- Preveri, da Urh ni v tabeli Ucitelj
DELETE FROM Ucitelj 
WHERE Email = 'urh.kolar@dijak.sc-celje.si';

-- Zagotovi, da je Marija učitelj
UPDATE Ucitelj 
SET Email = 'marija.crepinsek@dijak.sc-celje.si', 
    Funkcija = 'ucitelj'
WHERE Ime = 'Marija' AND Priimek = 'Črepinšek';

-- Če Marija ni v tabeli Ucitelj, jo dodaj
INSERT INTO Ucitelj (Ime, Priimek, Email, Funkcija)
VALUES ('Marija', 'Črepinšek', 'marija.crepinsek@dijak.sc-celje.si', 'ucitelj')
ON DUPLICATE KEY UPDATE 
    Email = VALUES(Email),
    Funkcija = VALUES(Funkcija);

-- Preveri, da Marija ni v tabeli Ucenec
DELETE FROM Ucenec 
WHERE Email = 'marija.crepinsek@dijak.sc-celje.si';



