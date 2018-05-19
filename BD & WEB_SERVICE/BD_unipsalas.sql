-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.32 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para unipsalas
CREATE DATABASE IF NOT EXISTS `unipsalas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `unipsalas`;

-- Copiando estrutura para tabela unipsalas.andar
CREATE TABLE IF NOT EXISTS `andar` (
  `codAndar` int(11) NOT NULL AUTO_INCREMENT,
  `nomeAndar` varchar(250) NOT NULL,
  `statusAndar` char(1) NOT NULL,
  PRIMARY KEY (`codAndar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.andar: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `andar` DISABLE KEYS */;
INSERT INTO `andar` (`codAndar`, `nomeAndar`, `statusAndar`) VALUES
	(1, '1º Andar', 'A'),
	(2, '2º Andar', 'A'),
	(3, '3º Andar', 'A');
/*!40000 ALTER TABLE `andar` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.bloco
CREATE TABLE IF NOT EXISTS `bloco` (
  `codBloco` int(11) NOT NULL AUTO_INCREMENT,
  `nomeBloco` varchar(250) NOT NULL,
  `statusBloco` char(1) NOT NULL,
  PRIMARY KEY (`codBloco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.bloco: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `bloco` DISABLE KEYS */;
INSERT INTO `bloco` (`codBloco`, `nomeBloco`, `statusBloco`) VALUES
	(1, 'Bloco 1', 'A'),
	(2, 'Bloco 2', 'A'),
	(3, 'Bloco 3', 'A');
/*!40000 ALTER TABLE `bloco` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.campus
CREATE TABLE IF NOT EXISTS `campus` (
  `codCampus` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCampus` varchar(250) NOT NULL,
  `statusCampus` char(1) NOT NULL,
  `codCidade` int(11) NOT NULL,
  PRIMARY KEY (`codCampus`),
  KEY `codCidade` (`codCidade`),
  CONSTRAINT `campus_ibfk_1` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.campus: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` (`codCampus`, `nomeCampus`, `statusCampus`, `codCidade`) VALUES
	(3, 'Campus Sorocaba', 'A', 1);
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `codCidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCidade` varchar(250) NOT NULL,
  `statusCidade` char(1) NOT NULL,
  PRIMARY KEY (`codCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.cidade: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`codCidade`, `nomeCidade`, `statusCidade`) VALUES
	(1, 'Sorocaba', 'A');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `codCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(250) NOT NULL,
  `statusCurso` char(1) NOT NULL,
  PRIMARY KEY (`codCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.curso: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`codCurso`, `nomeCurso`, `statusCurso`) VALUES
	(1, 'Administração', 'A'),
	(2, 'Análise e Desenvolvimento de Sistemas', 'A'),
	(3, 'Direito', 'A');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `codPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `nomePeriodo` varchar(250) NOT NULL,
  `statusPeriodo` char(1) NOT NULL,
  PRIMARY KEY (`codPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.periodo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` (`codPeriodo`, `nomePeriodo`, `statusPeriodo`) VALUES
	(1, 'Manhã', 'A'),
	(2, 'Tarde', 'A'),
	(3, 'Noite', 'A');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.sala
CREATE TABLE IF NOT EXISTS `sala` (
  `codSala` int(11) NOT NULL AUTO_INCREMENT,
  `nomeSala` varchar(250) NOT NULL,
  `statusSala` char(1) NOT NULL,
  PRIMARY KEY (`codSala`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.sala: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` (`codSala`, `nomeSala`, `statusSala`) VALUES
	(1, 'Sala 1', 'A'),
	(2, 'Sala 2', 'A'),
	(3, 'Sala 3', 'A'),
	(4, 'Sala 4', 'A'),
	(5, 'Sala 5', 'A'),
	(6, 'Sala 6', 'A'),
	(7, 'Sala 7', 'A'),
	(8, 'Sala 8', 'A'),
	(9, 'Sala 9', 'A'),
	(10, 'Sala 10', 'A');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.semestre
CREATE TABLE IF NOT EXISTS `semestre` (
  `codSemestre` int(11) NOT NULL AUTO_INCREMENT,
  `nomeSemestre` varchar(250) NOT NULL,
  `statusSemestre` char(1) NOT NULL,
  PRIMARY KEY (`codSemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.semestre: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` (`codSemestre`, `nomeSemestre`, `statusSemestre`) VALUES
	(1, '1º Semestre', 'A'),
	(2, '2º Semestre', 'A'),
	(3, '3º Semestre', 'A'),
	(4, '4º Semestre', 'A'),
	(5, '5º Semestre', 'A'),
	(6, '6º Semestre', 'A');
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `codTurma` varchar(50) NOT NULL,
  `nomeTurma` varchar(250) DEFAULT NULL,
  `statusTurma` char(1) DEFAULT NULL,
  `codCampus` int(11) DEFAULT NULL,
  `codAndar` int(11) DEFAULT NULL,
  `codBloco` int(11) DEFAULT NULL,
  `codSala` int(11) DEFAULT NULL,
  `codPeriodo` int(11) DEFAULT NULL,
  `codCurso` int(11) DEFAULT NULL,
  `codSemestre` int(11) DEFAULT NULL,
  KEY `codCampus` (`codCampus`),
  KEY `codAndar` (`codAndar`),
  KEY `codBloco` (`codBloco`),
  KEY `codSala` (`codSala`),
  KEY `codPeriodo` (`codPeriodo`),
  KEY `codCurso` (`codCurso`),
  KEY `codSemestre` (`codSemestre`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`codCampus`) REFERENCES `campus` (`codCampus`),
  CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`codAndar`) REFERENCES `andar` (`codAndar`),
  CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`codBloco`) REFERENCES `bloco` (`codBloco`),
  CONSTRAINT `turma_ibfk_4` FOREIGN KEY (`codSala`) REFERENCES `sala` (`codSala`),
  CONSTRAINT `turma_ibfk_5` FOREIGN KEY (`codPeriodo`) REFERENCES `periodo` (`codPeriodo`),
  CONSTRAINT `turma_ibfk_6` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`),
  CONSTRAINT `turma_ibfk_7` FOREIGN KEY (`codSemestre`) REFERENCES `semestre` (`codSemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.turma: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`codTurma`, `nomeTurma`, `statusTurma`, `codCampus`, `codAndar`, `codBloco`, `codSala`, `codPeriodo`, `codCurso`, `codSemestre`) VALUES
	('DS1P17', 'Turma 2', 'A', 3, 2, 2, 5, 3, 2, 4),
	('DS1P18', 'Turma 3', 'A', 3, 1, 1, 2, 1, 1, 1),
	('DS1P16', 'Turma 1', 'A', 3, 3, 3, 8, 3, 3, 5);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `codUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nomeUsuario` varchar(250) NOT NULL,
  `emailUsuario` varchar(100) NOT NULL,
  `statusUsuario` char(1) NOT NULL,
  `senhaUsuario` varchar(20) NOT NULL,
  `codTipo` int(11) NOT NULL,
  `codCampus` int(11) NOT NULL,
  PRIMARY KEY (`codUsuario`),
  KEY `codTipo` (`codTipo`),
  KEY `codCampus` (`codCampus`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codTipo`) REFERENCES `usuario_tipo` (`codTipo`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`codCampus`) REFERENCES `campus` (`codCampus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`codUsuario`, `nomeUsuario`, `emailUsuario`, `statusUsuario`, `senhaUsuario`, `codTipo`, `codCampus`) VALUES
	(1, 'Joao', 'jp_ma_8@hotmail.com', 'A', '1234', 1, 3),
	(2, 'Erisson', 'Erisson@hotmail.com', 'A', '1234', 2, 3),
	(3, 'Ederson', 'Ederson@hotmail.com', 'A', '1234', 3, 3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela unipsalas.usuario_tipo
CREATE TABLE IF NOT EXISTS `usuario_tipo` (
  `codTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeTipo` varchar(250) NOT NULL,
  `statusTipo` char(1) NOT NULL,
  PRIMARY KEY (`codTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela unipsalas.usuario_tipo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_tipo` DISABLE KEYS */;
INSERT INTO `usuario_tipo` (`codTipo`, `nomeTipo`, `statusTipo`) VALUES
	(1, 'Adminstrador ', 'A'),
	(2, 'Supervisor', 'A'),
	(3, 'Comum', 'A');
/*!40000 ALTER TABLE `usuario_tipo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
