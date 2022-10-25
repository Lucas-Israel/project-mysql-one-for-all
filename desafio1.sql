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
  ano_lancamento YEAR NOT NULL,
  CONSTRAINT artista_id
    FOREIGN KEY (artista_id)
    REFERENCES artistas (artista_id)
);

INSERT INTO SpotifyClone.albuns (album, artista_id, ano_lancamento)
VALUES
('Renaissance',1,2022),
('Jazz',2,1978),
('Hot Space',2,1982),
('Falso Brilhante',3,1998),
('Vento de Maio',3,2001),
('QVVJFA?',4,2003),
('Somewhere Far Beyond',5,2007),
('I Put A Spell On You',6,2012);

CREATE TABLE IF NOT EXISTS musicas (
  musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album_id INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  duracao_seconds INT NOT NULL,
  CONSTRAINT album_id
    FOREIGN KEY (album_id)
    REFERENCES albuns (album_id)
);

INSERT INTO SpotifyClone.musicas (album_id, nome, duracao_seconds)
VALUES
(1,'BREAK MY SOUL',279),
(1,'VIRGO’S GROOVE',369),
(1,'ALIEN SUPERSTAR',116),
(2,'Don’t Stop Me Now',203),
(3,'Under Pressure',152),
(4,'Como Nossos Pais',105),
(5,'O Medo de Amar é o Medo de Ser Livre',207),
(6,'Samba em Paris',267),
(7,'The Bard’s Song',244),
(8,'Feeling Good',100);

CREATE TABLE IF NOT EXISTS historico_reproducao (
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  PRIMARY KEY (usuario_id, musica_id),
  CONSTRAINT usuario_id
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios (usuario_id),
  CONSTRAINT musica_id
    FOREIGN KEY (musica_id)
    REFERENCES musicas (musica_id)
 );

INSERT INTO SpotifyClone.historico_reproducao (usuario_id, musica_id, data_reproducao)
VALUES
(1,8,'2022-02-28 10:45:55'),
(1,2,'2020-05-02 05:30:35'),
(1,10,'2020-03-06 11:22:33'),
(2,10,'2022-08-05 08:05:17'),
(2,7,'2020-01-02 07:40:33'),
(3,10,'2020-11-13 16:55:13'),
(3,2,'2020-12-05 18:38:30'),
(4,8,'2021-08-15 17:10:10'),
(5,8,'2022-01-09 01:44:33'),
(5,5,'2020-08-06 15:23:43'),
(6,7,'2017-01-24 00:31:17'),
(6,1,'2017-10-12 12:35:20'),
(7,4,'2011-12-15 22:30:49'),
(8,4,'2012-03-17 14:56:41'),
(9,9,'2022-02-24 21:14:22'),
(10,3,'2015-12-13 08:30:22');

CREATE TABLE IF NOT EXISTS `following` (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  CONSTRAINT usuariof_id
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios (usuario_id),
  CONSTRAINT artistaf_id
    FOREIGN KEY (artista_id)
    REFERENCES artistas (artista_id)
);

INSERT INTO SpotifyClone.following (usuario_id, artista_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,2),
(4,4),
(5,5),
(5,6),
(6,6),
(6,1),
(7,6),
(9,3),
(10,2);