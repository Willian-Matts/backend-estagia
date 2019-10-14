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
-- Temporary view structure for view `supervisor_view`
--

DROP TABLE IF EXISTS `supervisor_view`;
/*!50001 DROP VIEW IF EXISTS `supervisor_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `supervisor_view` AS SELECT 
 1 AS `idsupervisor`,
 1 AS `nome_supervisor`,
 1 AS `email_supervisor`,
 1 AS `telefone_supervisor`,
 1 AS `data_nascimento_supervisor`,
 1 AS `CPF_supervisor`,
 1 AS `formacao_supervisor`,
 1 AS `nome_empresa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empresa_view`
--

DROP TABLE IF EXISTS `empresa_view`;
/*!50001 DROP VIEW IF EXISTS `empresa_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empresa_view` AS SELECT 
 1 AS `idempresa`,
 1 AS `nome_empresa`,
 1 AS `endereco_empresa`,
 1 AS `bairro_empresa`,
 1 AS `email_empresa`,
 1 AS `CNPJ`,
 1 AS `telefone_empresa`,
 1 AS `idcidade_FK`,
 1 AS `idcidade`,
 1 AS `nome_cidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `supervisor_view`
--

/*!50001 DROP VIEW IF EXISTS `supervisor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supervisor_view` AS select `s`.`idsupervisor` AS `idsupervisor`,`s`.`nome_supervisor` AS `nome_supervisor`,`s`.`email_supervisor` AS `email_supervisor`,`s`.`telefone_supervisor` AS `telefone_supervisor`,`s`.`data_nascimento_supervisor` AS `data_nascimento_supervisor`,`s`.`CPF_supervisor` AS `CPF_supervisor`,`s`.`formacao_supervisor` AS `formacao_supervisor`,`e`.`nome_empresa` AS `nome_empresa` from (`supervisor` `s` join `empresa` `e`) where (`e`.`idempresa` = `s`.`idempresa_FK`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empresa_view`
--

/*!50001 DROP VIEW IF EXISTS `empresa_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empresa_view` AS select `e`.`idempresa` AS `idempresa`,`e`.`nome_empresa` AS `nome_empresa`,`e`.`endereco_empresa` AS `endereco_empresa`,`e`.`bairro_empresa` AS `bairro_empresa`,`e`.`email_empresa` AS `email_empresa`,`e`.`CNPJ` AS `CNPJ`,`e`.`telefone_empresa` AS `telefone_empresa`,`e`.`idcidade_FK` AS `idcidade_FK`,`c`.`idcidade` AS `idcidade`,`c`.`nome_cidade` AS `nome_cidade` from (`empresa` `e` join `cidade` `c`) where (`c`.`idcidade` = `e`.`idcidade_FK`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 17:10:34
