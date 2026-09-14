
CREATE SCHEMA IF NOT EXISTS skladiste_struktura;

DROP TABLE IF EXISTS skladiste_struktura.Recenzija;
DROP TABLE IF EXISTS skladiste_struktura.Prodaja;

DROP TABLE IF EXISTS skladiste_struktura.Artikal;
DROP TABLE IF EXISTS skladiste_struktura.Prodavac;
DROP TABLE IF EXISTS skladiste_struktura.Uzrast;
DROP TABLE IF EXISTS skladiste_struktura.Pol;
DROP TABLE IF EXISTS skladiste_struktura.Mesto;
DROP TABLE IF EXISTS skladiste_struktura.Kategorija;
DROP TABLE IF EXISTS skladiste_struktura.Vreme;

DROP TABLE IF EXISTS skladiste_struktura.Poslednje_Punjenje;


CREATE TABLE skladiste_struktura.Poslednje_Punjenje (
  Id INT PRIMARY KEY,
  PoslednjePunjenje DATETIME NOT NULL
) ENGINE=InnoDB;

INSERT INTO skladiste_struktura.Poslednje_Punjenje (Id, PoslednjePunjenje)
VALUES (1, '1000-01-01 00:00:00');


CREATE TABLE skladiste_struktura.Vreme (
  IdVreme INT AUTO_INCREMENT PRIMARY KEY,
  Datum DATE NOT NULL,
  Dan INT NOT NULL,
  Mesec INT NOT NULL,
  Godina INT NOT NULL,
  UNIQUE (Datum)
) ENGINE=InnoDB;


CREATE TABLE skladiste_struktura.Kategorija (
  IdKategorija INT AUTO_INCREMENT PRIMARY KEY,
  IdKatOper INT NOT NULL,          
  Naziv VARCHAR(80) NOT NULL,
  UNIQUE (IdKatOper)
) ENGINE=InnoDB;


CREATE TABLE skladiste_struktura.Mesto (
  IdMesto INT AUTO_INCREMENT PRIMARY KEY,
  IdMesOper INT NOT NULL,          
  Naziv VARCHAR(80) NOT NULL,
  UNIQUE (IdMesOper)
) ENGINE=InnoDB;


CREATE TABLE skladiste_struktura.Pol (
  IdPol INT AUTO_INCREMENT PRIMARY KEY,
  Pol CHAR(1) NOT NULL,
  UNIQUE (Pol)
) ENGINE=InnoDB;


INSERT INTO skladiste_struktura.Pol (Pol) VALUES ('M'), ('Z');


CREATE TABLE skladiste_struktura.Uzrast (
  IdUzrast INT AUTO_INCREMENT PRIMARY KEY,
  Naziv VARCHAR(30) NOT NULL,
  OdGod INT NOT NULL,
  DoGod INT NOT NULL
) ENGINE=InnoDB;

INSERT INTO skladiste_struktura.Uzrast (Naziv, OdGod, DoGod) VALUES
('0-17', 0, 17),
('18-24', 18, 24),
('25-34', 25, 34),
('35-44', 35, 44),
('45-54', 45, 54),
('55+', 55, 200);


CREATE TABLE skladiste_struktura.Prodavac (
  IdProdavac INT AUTO_INCREMENT PRIMARY KEY,
  IdKorOper INT NOT NULL,        
  Ime VARCHAR(50) NOT NULL,
  Prezime VARCHAR(50) NOT NULL,
  Email VARCHAR(120) NOT NULL,
  UNIQUE (IdKorOper)
) ENGINE=InnoDB;


CREATE TABLE skladiste_struktura.Artikal (
  IdArtikal INT AUTO_INCREMENT PRIMARY KEY,
  IdArtOper INT NOT NULL,          
  Naziv VARCHAR(120) NOT NULL,
  IdKategorija INT NOT NULL,
  IdProdavac INT NOT NULL,
  UNIQUE (IdArtOper),
  CONSTRAINT fk_artikal_kategorija FOREIGN KEY (IdKategorija)
    REFERENCES skladiste_struktura.Kategorija(IdKategorija),
  CONSTRAINT fk_artikal_prodavac FOREIGN KEY (IdProdavac)
    REFERENCES skladiste_struktura.Prodavac(IdProdavac)
) ENGINE=InnoDB;


-- FACT tabele
CREATE TABLE skladiste_struktura.Prodaja (
  IdProdaja BIGINT AUTO_INCREMENT PRIMARY KEY,
  IdKategorija INT NOT NULL,
  IdVreme INT NOT NULL,
  IdPolKupca INT NOT NULL,
  IdUzrastKupca INT NOT NULL,
  IdMestoKupca INT NOT NULL,
  IdMestoProdavca INT NOT NULL,
  Kolicina INT NOT NULL,
  Iznos DECIMAL(12,2) NOT NULL,

  CONSTRAINT fk_prodaja_kategorija FOREIGN KEY (IdKategorija)
    REFERENCES skladiste_struktura.Kategorija(IdKategorija),
  CONSTRAINT fk_prodaja_vreme FOREIGN KEY (IdVreme)
    REFERENCES skladiste_struktura.Vreme(IdVreme),
  CONSTRAINT fk_prodaja_pol FOREIGN KEY (IdPolKupca)
    REFERENCES skladiste_struktura.Pol(IdPol),
  CONSTRAINT fk_prodaja_uzrast FOREIGN KEY (IdUzrastKupca)
    REFERENCES skladiste_struktura.Uzrast(IdUzrast),
  CONSTRAINT fk_prodaja_mesto_kupca FOREIGN KEY (IdMestoKupca)
    REFERENCES skladiste_struktura.Mesto(IdMesto),
  CONSTRAINT fk_prodaja_mesto_prodavca FOREIGN KEY (IdMestoProdavca)
    REFERENCES skladiste_struktura.Mesto(IdMesto)
) ENGINE=InnoDB;


CREATE TABLE skladiste_struktura.Recenzija (
  IdRecenzija BIGINT AUTO_INCREMENT PRIMARY KEY,
  IdVreme INT NOT NULL,
  IdArtikal INT NOT NULL,
  IdKategorija INT NOT NULL,
  IdProdavac INT NOT NULL,
  IdMestoProdavca INT NOT NULL,
  IdPolKupca INT NOT NULL,
  IdUzrastKupca INT NOT NULL,
  IdMestoKupca INT NOT NULL,

  BrojRecenzija INT NOT NULL,   
  Ocena INT NOT NULL,          

  CONSTRAINT fk_recenzija_vreme FOREIGN KEY (IdVreme)
    REFERENCES skladiste_struktura.Vreme(IdVreme),
  CONSTRAINT fk_recenzija_artikal FOREIGN KEY (IdArtikal)
    REFERENCES skladiste_struktura.Artikal(IdArtikal),
  CONSTRAINT fk_recenzija_kategorija FOREIGN KEY (IdKategorija)
    REFERENCES skladiste_struktura.Kategorija(IdKategorija),
  CONSTRAINT fk_recenzija_prodavac FOREIGN KEY (IdProdavac)
    REFERENCES skladiste_struktura.Prodavac(IdProdavac),
  CONSTRAINT fk_recenzija_mesto_prodavca FOREIGN KEY (IdMestoProdavca)
    REFERENCES skladiste_struktura.Mesto(IdMesto),
  CONSTRAINT fk_recenzija_pol FOREIGN KEY (IdPolKupca)
    REFERENCES skladiste_struktura.Pol(IdPol),
  CONSTRAINT fk_recenzija_uzrast FOREIGN KEY (IdUzrastKupca)
    REFERENCES skladiste_struktura.Uzrast(IdUzrast),
  CONSTRAINT fk_recenzija_mesto_kupca FOREIGN KEY (IdMestoKupca)
    REFERENCES skladiste_struktura.Mesto(IdMesto)
) ENGINE=InnoDB;
