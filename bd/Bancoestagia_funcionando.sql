-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: estagia
-- ------------------------------------------------------
-- Server version	8.0.17

CREATE SCHEMA IF NOT EXISTS `estagia` DEFAULT CHARACTER SET utf8 ;
USE `estagia` ;

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (77,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(78,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(79,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(80,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(81,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(82,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(83,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1),(84,'teste','teste@teste','teste','99999999999','1998-02-17','999.999.999-99','teste','99999999999',8,'testando',1);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_has_curso`
--

DROP TABLE IF EXISTS `aluno_has_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_has_curso` (
  `aluno_idaluno` int(11) NOT NULL,
  `curso_idcurso` int(11) NOT NULL,
  PRIMARY KEY (`aluno_idaluno`,`curso_idcurso`),
  KEY `fk_aluno_has_curso_curso1_idx` (`curso_idcurso`),
  KEY `fk_aluno_has_curso_aluno1_idx` (`aluno_idaluno`),
  CONSTRAINT `fk_aluno_has_curso_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`),
  CONSTRAINT `fk_aluno_has_curso_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_has_curso`
--

LOCK TABLES `aluno_has_curso` WRITE;
/*!40000 ALTER TABLE `aluno_has_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_has_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `idcidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(40) NOT NULL,
  PRIMARY KEY (`idcidade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Ceres');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) NOT NULL,
  `idinstituicao_FK` int(11) NOT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `fk_curso_instituicao1_idx` (`idinstituicao_FK`),
  CONSTRAINT `fk_curso_instituicao1` FOREIGN KEY (`idinstituicao_FK`) REFERENCES `instituicao` (`idinstituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(200) NOT NULL,
  `endereço_empresa` varchar(200) NOT NULL,
  `bairro_empresa` varchar(50) NOT NULL,
  `email_empresa` varchar(100) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  `numero_telefone_empresa` varchar(20) NOT NULL,
  `idcidade_FK` int(11) NOT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `fk_empresa_cidade1_idx` (`idcidade_FK`),
  CONSTRAINT `fk_empresa_cidade1` FOREIGN KEY (`idcidade_FK`) REFERENCES `cidade` (`idcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estagio`
--

LOCK TABLES `estagio` WRITE;
/*!40000 ALTER TABLE `estagio` DISABLE KEYS */;
/*!40000 ALTER TABLE `estagio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(200) NOT NULL,
  `email_funcionario` varchar(200) NOT NULL,
  `telefone_funcionario` varchar(200) NOT NULL,
  `data_nascimento_funcionario` date NOT NULL,
  `CPF_funcionario` varchar(14) NOT NULL,
  `matricula_funcionario` varchar(20) NOT NULL,
  `senha_funcionario` varchar(100) NOT NULL,
  `idinstituicao_FK` int(11) NOT NULL,
  PRIMARY KEY (`idfuncionario`),
  KEY `fk_usuario_instituicao1_idx` (`idinstituicao_FK`),
  CONSTRAINT `fk_usuario_instituicao1` FOREIGN KEY (`idinstituicao_FK`) REFERENCES `instituicao` (`idinstituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instituicao` (
  `idinstituicao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_intituicao` varchar(200) NOT NULL,
  PRIMARY KEY (`idinstituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicao`
--

LOCK TABLES `instituicao` WRITE;
/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
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

-- Dump completed on 2019-10-10 16:40:48
