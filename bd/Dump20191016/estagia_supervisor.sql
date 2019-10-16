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
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `idsupervisor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_supervisor` varchar(200) NOT NULL,
  `email_supervisor` varchar(200) NOT NULL,
  `telefone_supervisor` varchar(200) NOT NULL,
  `data_nascimento_supervisor` date NOT NULL,
  `CPF_supervisor` varchar(14) NOT NULL,
  `formacao_supervisor` varchar(100) NOT NULL,
  `idempresa_FK` int(11) NOT NULL,
  PRIMARY KEY (`idsupervisor`),
  KEY `fk_supervisor_empresa1_idx` (`idempresa_FK`),
  CONSTRAINT `fk_supervisor_empresa1` FOREIGN KEY (`idempresa_FK`) REFERENCES `empresa` (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (5,'teste','teste@teste','123','2019-10-29','111.111.111-11','TESTE',17),(6,'teste','teste@teste','123','1998-02-28','111.111.111-11','TESTE',4),(7,'teste','teste@teste','123','1998-02-28','111.111.111-11','TESTE',4),(8,'teste','teste@teste','123','1998-02-28','111.111.111-11','TESTE',4),(9,'teste','teste@teste','123','1998-02-28','111.111.111-11','TESTE',4),(11,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(12,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(13,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(14,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(15,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(16,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(17,'wi','wwms_rtb@hotmail.com','123123','2019-10-24','111.111.111-11','SI',4),(19,'Jonathan','asdas@asdas','99999999999','2019-10-29','999.999.999-99','SI',12);
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 17:21:02
