
INSERT INTO operativna_struktura.MESTO (Mesto) VALUES
('Valjevo');

INSERT INTO operativna_struktura.KATEGORIJA (Naziv) VALUES
('Kucni ljubimci');

INSERT INTO operativna_struktura.KORISNIK (Ime, Prezime, Mobilni, Email, Godiste, Pol, IdM) VALUES
('Teodora','Radic','064131313','teodora@gmail.com',2003,'Z',11),
('Darko','Stojanovic','064141414','darko@gmail.com',1992,'M',1);

INSERT INTO operativna_struktura.ARTIKAL (Naziv, Opis, Cena, Popust, Kolicina, IdKor, IdKat) VALUES
('Hrana za macke','1kg hrane',850.00,0.00,100,12,11),
('Povodac','Povodac za pse',1200.00,5.00,40,12,11);

INSERT INTO operativna_struktura.NARUDZBINA (IdKor, Datum, Vreme, Iznos) VALUES
(11,'2026-01-20','10:25:00', 2050.00);

INSERT INTO operativna_struktura.STAVKA (IdNar, IdArt, Iznos, Kolicina) VALUES
(11, 12, 850.00, 1),
(11, 13, 1200.00, 1);

INSERT INTO operativna_struktura.KORPA (IdKor, IdArt, Kolicina) VALUES
(11, 13, 1);

INSERT INTO operativna_struktura.RECENZIJA (IdKor, IdArt, Ocena, Opis, Datum, Vreme) VALUES
(11, 13, 5, 'Odlican povodac', '2026-01-20', '12:00:00');


INSERT INTO operativna_struktura.NARUDZBINA (IdKor, Datum, Vreme, Iznos)
VALUES (6, CURDATE(), CURTIME(), 8900.00);

INSERT INTO operativna_struktura.STAVKA (IdNar, IdArt, Iznos, Kolicina) VALUES
(12, 1, 3500.00, 1),
(12, 3, 5400.00, 1);

INSERT INTO operativna_struktura.RECENZIJA (IdKor, IdArt, Ocena, Opis, Datum, Vreme)
VALUES (7, 4, 5, 'Test ink recenzija', CURDATE(), CURTIME());