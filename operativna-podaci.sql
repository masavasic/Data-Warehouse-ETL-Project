INSERT INTO operativna_struktura.MESTO (Mesto) VALUES
('Beograd'),
('Novi Sad'),
('Nis'),
('Kragujevac'),
('Gnjilane'),
('Subotica'),
('Kraljevo'),
('Vranje'),
('Sombor'),
('Smederevo'),
('Sabac');

INSERT INTO operativna_struktura.KATEGORIJA (Naziv) VALUES
('Odeca'),
('Obuca'),
('Knjige'),
('Kozmetika'),
('Sminka'),
('Igracke'),
('Aparati'),
('Sport'),
('Hrana'),
('Pekara');


INSERT INTO operativna_struktura.KORISNIK (Ime, Prezime, Mobilni, Email, Godiste, Pol, IdM) VALUES
('Ana','Anic','0641234567','ana@gmail.com',2003,'Z',1),
('Mika','Mikic','0642345678','mika@gmail.com',1997,'M',2),
('Maja','Jovic','0643456789','maja@gmail.com',2001,'Z',3),
('Jova','Jovic','0644567891','jova@gmail.com',2000,'M',4),
('Milica','Stojkovic','0645678912','milica@gmail.com',1998,'Z',5),
('Stefan','Stefanovic','0646789123','stefan@gmail.com',2003,'M',6),
('Jelena','Kostic','0647891234','jelena@gmail.com',1997,'Z',7),
('Luka','Nikolic','0648912345','luka@gmail.com',2002,'M',8),
('Sara','Pavlovic','0649123456','sara@gmail.com',1995,'Z',9),
('Mihajlo','Pavic','064121212','milos@gmail.com',1993,'M',10);


INSERT INTO operativna_struktura.ARTIKAL (Naziv, Opis, Cena, Popust, Kolicina, IdKor, IdKat) VALUES
('Pantalone','Elegantne pantalone',3500.00,10.00,50,1,1),
('Majica','Uska pamucna majica',1200.00,0.00,100,3,1),
('Patike','Sportske patike',5400.00,15.00,40,4,2),
('Roman','Popularni roman',900.00,0.00,60,5,3),
('Krema za lice','Hidratantna krema',1600.00,8.00,80,1,4),
('Karmin','Crveni karmin',6200.00,5.00,30,2,5),
('Lego kockice','Kockice set',4500.00,0.00,25,2,6),
('Sporet','Crni elektricni sporet',20000.00,12.00,20,3,7),
('Teg 1kg','Mali teg',1000.00,0.00,35,4,8),
('Brasno','1kg brasna, tip 400',100.00,0.00,200,5,9),
('Kifla','Kifla sa sunkom',100.00,5.00,30,2,10);

INSERT INTO operativna_struktura.NARUDZBINA (IdKor, Datum, Vreme, Iznos) VALUES
(6,'2026-01-01','10:15:00', 3500.00),
(7,'2026-01-02','12:10:00', 5400.00),
(8,'2026-01-03','09:05:00', 2100.00),
(9,'2026-01-04','14:30:00', 900.00),
(10,'2026-01-05','16:45:00', 1600.00),
(6,'2026-01-10','11:20:00', 6200.00),
(7,'2026-01-11','18:10:00', 20000.00),
(8,'2026-01-12','13:00:00', 2000.00),
(9,'2026-01-13','08:50:00', 200.00),
(10,'2026-01-14','19:40:00', 4600.00);

INSERT INTO operativna_struktura.STAVKA (IdNar, IdArt, Iznos, Kolicina) VALUES
(1, 1, 3500.00, 1),   -- pantalone
(2, 3, 5400.00, 1),   -- patike
(3, 2, 1200.00, 1),   -- majica
(3, 10, 100.00, 9),   -- brasno (9*100)
(4, 4, 900.00, 1),    -- roman
(5, 5, 1600.00, 1),   -- krema
(6, 6, 6200.00, 1),   -- karmin
(7, 8, 20000.00, 1),  -- sporet
(8, 9, 1000.00, 2),   -- teg 1kg (2*1000)
(9, 11, 200.00, 2),   -- kifla (2*100)
(10, 7, 4500.00, 1),  -- lego
(10, 10, 100.00, 1);  -- brasno

INSERT INTO operativna_struktura.KORPA (IdKor, IdArt, Kolicina) VALUES
(6, 2, 1),
(6, 3, 1),
(7, 1, 1),
(7, 5, 2),
(8, 4, 1),
(8, 6, 1),
(9, 7, 1),
(9, 11, 2),
(10, 9, 1),
(10, 10, 3);


INSERT INTO operativna_struktura.RECENZIJA (IdKor, IdArt, Ocena, Opis, Datum, Vreme) VALUES
(6, 1, 5, 'Odlicne pantalone', '2026-01-15', '10:00:00'),
(7, 3, 4, 'Udobne patike', '2026-01-15', '11:00:00'),
(8, 2, 4, 'Majica je super', '2026-01-16', '09:30:00'),
(9, 7, 5, 'Lego top!', '2026-01-16', '12:15:00'),
(10, 8, 3, 'Sporet radi okej', '2026-01-17', '14:10:00'),
(6, 9, 4, 'Teg je dobar', '2026-01-17', '18:05:00'),
(7, 4, 5, 'Roman je odlican', '2026-01-18', '08:20:00'),
(8, 5, 4, 'Krema prijatna', '2026-01-18', '13:40:00'),
(9, 11, 2, 'Kifla nije bila svezа', '2026-01-19', '16:55:00'),
(10, 6, 5, 'Karmin savrsen', '2026-01-19', '20:10:00');
