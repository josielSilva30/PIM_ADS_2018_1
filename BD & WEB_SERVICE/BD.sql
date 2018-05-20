-- --------------------------------------------------------
-- Servidor:                     robb0524.locaweb.com.br
-- Versão do servidor:           5.6.37-82.2-log - Percona Server (GPL), Release 82.2, Revision d1eb51005df
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para pimsorocaba_pim
CREATE DATABASE IF NOT EXISTS `pimsorocaba_pim` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pimsorocaba_pim`;

-- Copiando estrutura para tabela pimsorocaba_pim.Campus
CREATE TABLE IF NOT EXISTS `Campus` (
  `codCampus` int(11) NOT NULL AUTO_INCREMENT,
  `Campus` varchar(255) NOT NULL,
  PRIMARY KEY (`codCampus`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pimsorocaba_pim.Campus: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `Campus` DISABLE KEYS */;
INSERT INTO `Campus` (`codCampus`, `Campus`) VALUES
	(1, 'Sorocaba'),
	(233, 'Araçoiaba da Serra'),
	(235, 'Osasco'),
	(236, 'Capela do Alto'),
	(237, 'Itu'),
	(238, 'Campinas'),
	(239, 'Tietê'),
	(242, 'Votorantim'),
	(253, 'Santo Andre'),
	(343, 'Salvador'),
	(344, 'thulio'),
	(345, 'Sorocaba');
/*!40000 ALTER TABLE `Campus` ENABLE KEYS */;

-- Copiando estrutura para tabela pimsorocaba_pim.Curso
CREATE TABLE IF NOT EXISTS `Curso` (
  `codCurso` int(11) NOT NULL AUTO_INCREMENT,
  `Curso` varchar(100) NOT NULL,
  PRIMARY KEY (`codCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pimsorocaba_pim.Curso: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` (`codCurso`, `Curso`) VALUES
	(1, 'Analise e desenvolvimento de sistemas'),
	(2, 'Gestão Ambiental'),
	(3, 'Gastronomia'),
	(4, 'Jogos Digitais'),
	(5, 'Design de Moda'),
	(6, 'Ciência da Computação'),
	(7, 'Engenharia Elétrica'),
	(8, 'Engenharia mecânica');
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;

-- Copiando estrutura para tabela pimsorocaba_pim.Grade
CREATE TABLE IF NOT EXISTS `Grade` (
  `codCampus` int(11) NOT NULL,
  `codCurso` int(11) NOT NULL,
  `codPeriodo` int(11) NOT NULL,
  `codSemestre` int(11) NOT NULL,
  `Ano` varchar(20) NOT NULL,
  `Bloco` varchar(20) NOT NULL,
  `Andar` varchar(30) NOT NULL,
  `Sala` int(11) NOT NULL,
  `codGrade` int(11) NOT NULL,
  `codTeste` int(11) NOT NULL,
  PRIMARY KEY (`codGrade`),
  KEY `CodCampus_fk` (`codCampus`) USING BTREE,
  KEY `CodCurso_fk` (`codCurso`),
  KEY `codPeriodo_fk` (`codPeriodo`),
  KEY `codSemestre` (`codSemestre`),
  CONSTRAINT `codCampus_fk` FOREIGN KEY (`codCampus`) REFERENCES `Campus` (`codCampus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codCurso_fk` FOREIGN KEY (`codCurso`) REFERENCES `Curso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codPeriodo` FOREIGN KEY (`codPeriodo`) REFERENCES `Periodo` (`codPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codSemestre` FOREIGN KEY (`codSemestre`) REFERENCES `Semestre` (`codSemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pimsorocaba_pim.Grade: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `Grade` DISABLE KEYS */;
INSERT INTO `Grade` (`codCampus`, `codCurso`, `codPeriodo`, `codSemestre`, `Ano`, `Bloco`, `Andar`, `Sala`, `codGrade`, `codTeste`) VALUES
	(233, 2, 1, 7, '2015', 'B', '2', 12, 0, 0),
	(1, 1, 3, 3, '2017', 'F', 'Sub-Solo 1', 45, 1, 0),
	(1, 1, 3, 1, '2017', 'A', '1', 22, 2, 0),
	(1, 1, 2, 1, '2017', 'A', '2', 22, 3, 0),
	(1, 1, 1, 1, '2017', 'D', 'Sub-solo 1', 31, 4, 0),
	(1, 1, 1, 5, '2016', 'E', '2', 30, 5, 0),
	(1, 1, 3, 4, '2017', 'F', 'Sub-Solo 1', 45, 6, 0),
	(236, 4, 2, 5, '2015', 'F', '1', 10, 10, 0),
	(237, 8, 3, 8, '2017', 'F', '3', 76, 11, 0),
	(235, 1, 2, 1, '2017', 'H', '0', 7, 12, 0),
	(238, 1, 2, 1, '2017', 'G', '0', 7, 13, 0),
	(239, 6, 3, 10, '2017', 'I', '3', 26, 14, 0),
	(239, 6, 3, 10, '2017', 'I', '3', 26, 15, 0),
	(1, 1, 1, 2, '2017', 'D', 'Sub-Solo 1', 31, 16, 0);
/*!40000 ALTER TABLE `Grade` ENABLE KEYS */;

-- Copiando estrutura para tabela pimsorocaba_pim.Periodo
CREATE TABLE IF NOT EXISTS `Periodo` (
  `codPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `Periodo` varchar(30) NOT NULL,
  PRIMARY KEY (`codPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pimsorocaba_pim.Periodo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `Periodo` DISABLE KEYS */;
INSERT INTO `Periodo` (`codPeriodo`, `Periodo`) VALUES
	(1, 'Manhã'),
	(2, 'Tarde'),
	(3, 'Noite');
/*!40000 ALTER TABLE `Periodo` ENABLE KEYS */;

-- Copiando estrutura para tabela pimsorocaba_pim.Semestre
CREATE TABLE IF NOT EXISTS `Semestre` (
  `codSemestre` int(11) NOT NULL AUTO_INCREMENT,
  `Semestre` varchar(20) NOT NULL,
  PRIMARY KEY (`codSemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pimsorocaba_pim.Semestre: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `Semestre` DISABLE KEYS */;
INSERT INTO `Semestre` (`codSemestre`, `Semestre`) VALUES
	(1, '1'),
	(2, '2'),
	(3, '3'),
	(4, '4'),
	(5, '5'),
	(6, '6'),
	(7, '7'),
	(8, '8'),
	(9, '9'),
	(10, '10');
/*!40000 ALTER TABLE `Semestre` ENABLE KEYS */;

-- Copiando estrutura para tabela pimsorocaba_pim.teste
CREATE TABLE IF NOT EXISTS `teste` (
  `cod_curso` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pimsorocaba_pim.teste: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
INSERT INTO `teste` (`cod_curso`, `curso`) VALUES
	(1, 'web'),
	(2, 'java'),
	(3, 'html'),
	(4, 'digitacao');
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
