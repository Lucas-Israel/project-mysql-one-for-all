DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS planos (
	plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plano VARCHAR(45) NOT NULL,
  preco VARCHAR(45) NOT NULL
);

INSERT INTO SpotifyClone.planos (plano,preco)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99)
;

CREATE TABLE IF NOT EXISTS usuarios (
  usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
  CONSTRAINT plano_id
    FOREIGN KEY (plano_id)
    REFERENCES planos (plano_id)
);

INSERT INTO SpotifyClone.usuarios (nome, idade, plano_id, data_assinatura)
VALUES
('Barbara Liskov',82,1,'2019-10-20'),
('Robert Cecil Martin',58,1,'2017-01-06'),
('Ada Lovelace',37,2,'2017-12-30'),
('Martin Fowler',46,2,'2017-01-17'),
('Sandi Metz',58,2,'2018-04-29'),
('Paulo Freire',19,3,'2018-02-14'),
('Bell Hooks',26,3,'2018-01-05'),
('Christopher Alexander',85,4,'2019-06-05'),
('Judith Butler',45,4,'2020-05-13'),
('Jorge Amado',58,4,'2017-02-17');

CREATE TABLE IF NOT EXISTS artistas (
  artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL
);

INSERT INTO SpotifyClone.artistas (nome)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE IF NOT EXISTS albuns (
  album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artista_id INT NOT NULL,
  album VARCHAR(45) NOT NULL,
  CONSTRAINT artista_id
    FOREIGN KEY (artista_id)
    REFERENCES artistas (artista_id)
);

CREATE TABLE IF NOT EXISTS musicas (
  musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album_id INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  CONSTRAINT album_id
    FOREIGN KEY (album_id)
    REFERENCES albuns (album_id)
);

CREATE TABLE IF NOT EXISTS historico_reproducao (
  hist_repro_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  data_reproducao DATE NOT NULL,
  CONSTRAINT usuario_id
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios (usuario_id),
  CONSTRAINT musica_id
    FOREIGN KEY (musica_id)
    REFERENCES musicas (musica_id)
);

CREATE TABLE IF NOT EXISTS following (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT usuariof_id
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios (usuario_id),
  CONSTRAINT artistaf_id
    FOREIGN KEY (artista_id)
    REFERENCES artistas (artista_id)
);
