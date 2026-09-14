
CREATE SCHEMA IF NOT EXISTS operativna_struktura;

DROP TABLE IF EXISTS operativna_struktura.RECENZIJA;
DROP TABLE IF EXISTS operativna_struktura.KORPA;
DROP TABLE IF EXISTS operativna_struktura.STAVKA;
DROP TABLE IF EXISTS operativna_struktura.NARUDZBINA;
DROP TABLE IF EXISTS operativna_struktura.ARTIKAL;
DROP TABLE IF EXISTS operativna_struktura.KORISNIK;
DROP TABLE IF EXISTS operativna_struktura.KATEGORIJA;
DROP TABLE IF EXISTS operativna_struktura.MESTO;


CREATE TABLE operativna_struktura.MESTO (
  IdMes INT AUTO_INCREMENT PRIMARY KEY,
  Mesto VARCHAR(80) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE operativna_struktura.KATEGORIJA (
  IdKat INT AUTO_INCREMENT PRIMARY KEY,
  Naziv VARCHAR(80) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE operativna_struktura.KORISNIK (
  IdKor INT AUTO_INCREMENT PRIMARY KEY,
  Ime VARCHAR(50) NOT NULL,
  Prezime VARCHAR(50) NOT NULL,
  Mobilni VARCHAR(50),
  Email VARCHAR(50) NOT NULL,
  Godiste INT NOT NULL,
  Pol ENUM('M','Z') NOT NULL,
  IdM INT NOT NULL,
  CONSTRAINT uq_korisnik_email UNIQUE (Email),
  CONSTRAINT fk_korisnik_mesto FOREIGN KEY (IdM) REFERENCES operativna_struktura.MESTO(IdMes)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE operativna_struktura.ARTIKAL (
  IdArt INT AUTO_INCREMENT PRIMARY KEY,
  Naziv VARCHAR(50) NOT NULL,
  Opis VARCHAR(500),
  Cena DECIMAL(10,2) NOT NULL,
  Popust DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  Kolicina INT NOT NULL,
  IdKor INT NOT NULL,
  IdKat INT NOT NULL,
  CONSTRAINT fk_artikal_prodavac FOREIGN KEY (IdKor) REFERENCES operativna_struktura.KORISNIK(IdKor)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_artikal_kategorija FOREIGN KEY (IdKat) REFERENCES operativna_struktura.KATEGORIJA(IdKat)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ogr_cena CHECK (Cena >= 0),
  CONSTRAINT ogr_popust CHECK (Popust >= 0 AND Popust <= 100),
  CONSTRAINT ogr_kolicina CHECK (Kolicina >= 0)
) ENGINE=InnoDB;

CREATE TABLE operativna_struktura.NARUDZBINA (
  IdNar INT AUTO_INCREMENT PRIMARY KEY,
  IdKor INT NOT NULL,
  Datum DATE NOT NULL,
  Vreme TIME NOT NULL,
  Iznos DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_narudzbina_kupac FOREIGN KEY (IdKor) REFERENCES operativna_struktura.KORISNIK(IdKor)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ogr_iznos CHECK (Iznos >= 0)
) ENGINE=InnoDB;

CREATE TABLE operativna_struktura.STAVKA (
  IdNar INT NOT NULL,
  IdArt INT NOT NULL,
  Iznos DECIMAL(10,2) NOT NULL,
  Kolicina INT NOT NULL,
  PRIMARY KEY (IdNar, IdArt),
  CONSTRAINT fk_stavka_narudzbina FOREIGN KEY (IdNar) REFERENCES operativna_struktura.NARUDZBINA(IdNar)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_stavka_artikal FOREIGN KEY (IdArt) REFERENCES operativna_struktura.ARTIKAL(IdArt)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ogr_stavka_iznos CHECK (Iznos >= 0),
  CONSTRAINT ogr_stavka_kolicina CHECK (Kolicina > 0)
) ENGINE=InnoDB;


CREATE TABLE operativna_struktura.KORPA (
  IdKor INT NOT NULL,
  IdArt INT NOT NULL,
  Kolicina INT NOT NULL,
  PRIMARY KEY (IdKor, IdArt),
  CONSTRAINT fk_korpa_korisnik FOREIGN KEY (IdKor) REFERENCES operativna_struktura.KORISNIK(IdKor)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_korpa_artikal FOREIGN KEY (IdArt) REFERENCES operativna_struktura.ARTIKAL(IdArt)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ogr_korpa_kolicina CHECK (Kolicina > 0)
) ENGINE=InnoDB;


CREATE TABLE operativna_struktura.RECENZIJA (
  IdKor INT NOT NULL,
  IdArt INT NOT NULL,
  Ocena INT NOT NULL,
  Opis VARCHAR(500),
  Datum DATE NOT NULL,
  Vreme TIME NOT NULL,
  PRIMARY KEY (IdKor, IdArt, Datum, Vreme),
  CONSTRAINT fk_recenzija_korisnik FOREIGN KEY (IdKor) REFERENCES operativna_struktura.KORISNIK(IdKor)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_recenzija_artikal FOREIGN KEY (IdArt) REFERENCES operativna_struktura.ARTIKAL(IdArt)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ogr_ocena CHECK (Ocena BETWEEN 1 AND 5)
) ENGINE=InnoDB;
