-- Posodobitev uporabnikov za eKonferenca sistem
-- Dodaj Marijo kot učitelja in Urha kot učenca

-- Dodaj Marijo v tabelo Ucitelj
INSERT INTO Ucitelj (idUčitelja, Ime, Priimek, Email, Funkcija)
VALUES (6, 'Marija', 'Črepinšek', 'marija.crepinsek@dijak.sc-celje.si', 'ucitelj')
ON DUPLICATE KEY UPDATE 
    Ime = VALUES(Ime),
    Priimek = VALUES(Priimek),
    Email = VALUES(Email),
    Funkcija = VALUES(Funkcija);

-- Dodaj Urha v tabelo Ucenec
INSERT INTO Ucenec (idUčenca, Ime, Priimek, Email, Funkcija)
VALUES (6, 'Urh', 'Kolar', 'urh.kolar@dijak.sc-celje.si', 'ucenec')
ON DUPLICATE KEY UPDATE 
    Ime = VALUES(Ime),
    Priimek = VALUES(Priimek),
    Email = VALUES(Email),
    Funkcija = VALUES(Funkcija);

-- Posodobi obstoječe zapise
UPDATE Ucitelj 
SET Email = 'marija.crepinsek@dijak.sc-celje.si', 
    Funkcija = 'ucitelj'
WHERE Ime = 'Marija' AND Priimek = 'Črepinšek';

UPDATE Ucenec 
SET Email = 'urh.kolar@dijak.sc-celje.si', 
    Funkcija = 'ucenec'
WHERE Ime = 'Urh' AND Priimek = 'Kolar';



