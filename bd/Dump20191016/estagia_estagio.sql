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
-- Table structure for table `estagio`
--

DROP TABLE IF EXISTS `estagio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estagio` (
  `idestagio` int(11) NOT NULL AUTO_INCREMENT,
  `setor_estagio` varchar(100) NOT NULL,
  `data_inicio_estagio` date NOT NULL,
  `data_final_estagio` date NOT NULL,
  `horas_diarias_estagio` float NOT NULL,
  `horas_semanais_estagio` float NOT NULL,
  `horas_totais_estagio` int(11) NOT NULL,
  `idaluno_FK` int(11) NOT NULL,
  `idempresa_FK` int(11) NOT NULL,
  `idsupervisor_FK` int(11) NOT NULL,
  PRIMARY KEY (`idestagio`),
  KEY `fk_estagio_aluno1_idx` (`idaluno_FK`),
  KEY `fk_estagio_empresa1_idx` (`idempresa_FK`),
  KEY `fk_estagio_supervisor1_idx` (`idsupervisor_FK`),
  CONSTRAINT `fk_estagio_aluno1` FOREIGN KEY (`idaluno_FK`) REFERENCES `aluno` (`idaluno`),
  CONSTRAINT `fk_estagio_empresa1` FOREIGN KEY (`idempresa_FK`) REFERENCES `empresa` (`idempresa`),
  CONSTRAINT `fk_estagio_supervisor1` FOREIGN KEY (`idsupervisor_FK`) REFERENCES `supervisor` (`idsupervisor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estagio`
--

LOCK TABLES `estagio` WRITE;
/*!40000 ALTER TABLE `estagio` DISABLE KEYS */;
INSERT INTO `estagio` VALUES (1,'teste','2019-10-20','2019-11-20',6,30,180,82,4,5),(2,'TI','2019-10-20','2019-11-20',6,30,180,82,4,5),(3,'TI','2019-10-20','2019-11-20',6,30,180,79,4,5);
/*!40000 ALTER TABLE `estagio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 17:21:03
