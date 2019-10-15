CREATE DATABASE  IF NOT EXISTS `estagia` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estagia`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: estagia
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `idaluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(200) NOT NULL,
  `email_aluno` varchar(200) NOT NULL,
  `endereco_aluno` varchar(200) NOT NULL,
  `telefone_aluno` varchar(200) NOT NULL,
  `data_nascimento_aluno` date NOT NULL,
  `CPF_aluno` varchar(14) NOT NULL,
  `bairro_aluno` varchar(50) NOT NULL,
  `matricula_aluno` varchar(20) NOT NULL,
  `periodo_aluno` int(11) NOT NULL,
  `nome_orientador_aluno` varchar(200) NOT NULL,
  `idcidade_FK` int(11) NOT NULL,
  PRIMARY KEY (`idaluno`),
  KEY `fk_aluno_cidade1_idx` (`idcidade_FK`),
  CONSTRAINT `fk_aluno_cidade1` FOREIGN KEY (`idcidade_FK`) REFERENCES `cidade` (`idcidade`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (79,'Matteus','teste@teste','teste','99999999999','2019-10-30','999.999.999-99','teste','99999999999',8,'testando',1),(80,'testado','teste@teste','teste','99999999999','2019-10-16','999.999.999-99','teste','99999999999',8,'testando',1),(82,'Willian Wallace','teste@teste','teste','99999999999','2019-10-29','999.999.999-99','teste','99999999999',8,'testando',1),(83,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(84,'willian','teste@teste','teste','99999999999','2019-10-24','999.999.999-99','teste','99999999999',8,'testando',1),(85,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(86,'willian','wwms_rtb@hotmail.com','1','1111111111','2019-10-30','111.111.111-11','1','123123',1,'123123',1);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-15 15:00:00
