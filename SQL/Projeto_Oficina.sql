-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `bkp_cliente`
--

DROP TABLE IF EXISTS `bkp_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bkp_cliente` (
  `IDBACKUP` int NOT NULL AUTO_INCREMENT,
  `IDCLIENTE` int DEFAULT NULL,
  `NOME` varchar(30) DEFAULT NULL,
  `SEXO` enum('M','F') DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `DATA_BACKUP` datetime DEFAULT NULL,
  PRIMARY KEY (`IDBACKUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkp_cliente`
--

LOCK TABLES `bkp_cliente` WRITE;
/*!40000 ALTER TABLE `bkp_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `bkp_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `IDCARRO` int NOT NULL AUTO_INCREMENT,
  `MODELO` varchar(30) NOT NULL,
  `PLACA` varchar(10) NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `ID_MARCA` int NOT NULL,
  PRIMARY KEY (`IDCARRO`),
  UNIQUE KEY `PLACA` (`PLACA`),
  KEY `FK_CARRO_CLIENTE` (`ID_CLIENTE`),
  KEY `FK_CARRO_MARCA` (`ID_MARCA`),
  CONSTRAINT `FK_CARRO_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`),
  CONSTRAINT `FK_CARRO_MARCA` FOREIGN KEY (`ID_MARCA`) REFERENCES `marca` (`IDMARCA`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (11,'Gol','ABC1D23',1,1),(12,'Onix','DEF2G34',2,2),(13,'HB20','GHI3J45',3,3),(14,'Corolla','JKL4M56',4,4),(15,'Civic','NOP5Q67',5,5),(16,'Argo','RST6U78',6,6),(17,'Compass','VWX7Y89',7,7),(18,'Kwid','ZAB8C90',8,8),(19,'Onix','DEF9G01',9,2),(20,'Corolla','HIJ0K12',10,4);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro_cor`
--

DROP TABLE IF EXISTS `carro_cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro_cor` (
  `ID_CARRO` int NOT NULL,
  `ID_COR` int NOT NULL,
  PRIMARY KEY (`ID_CARRO`,`ID_COR`),
  KEY `FK_CARRO_COR_COR` (`ID_COR`),
  CONSTRAINT `FK_CARRO_COR_CARRO` FOREIGN KEY (`ID_CARRO`) REFERENCES `carro` (`IDCARRO`),
  CONSTRAINT `FK_CARRO_COR_COR` FOREIGN KEY (`ID_COR`) REFERENCES `cor` (`IDCOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro_cor`
--

LOCK TABLES `carro_cor` WRITE;
/*!40000 ALTER TABLE `carro_cor` DISABLE KEYS */;
INSERT INTO `carro_cor` VALUES (11,1),(13,2),(15,3),(16,4),(14,5),(20,7),(17,8),(19,9),(18,10);
/*!40000 ALTER TABLE `carro_cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IDCLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(30) NOT NULL,
  `SEXO` enum('M','F') NOT NULL,
  PRIMARY KEY (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'João Silva','M'),(2,'Maria Souza','F'),(3,'Carlos Oliveira','M'),(4,'Ana Pereira','F'),(5,'Pedro Santos','M'),(6,'Juliana Lima','F'),(7,'Lucas Ferreira','M'),(8,'Camila Rodrigues','F'),(9,'Rafael Gomes','M'),(10,'Fernanda Alves','F');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cor` (
  `IDCOR` int NOT NULL AUTO_INCREMENT,
  `COR` varchar(30) NOT NULL,
  PRIMARY KEY (`IDCOR`),
  UNIQUE KEY `COR` (`COR`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (8,'Amarelo'),(6,'Azul'),(10,'Bege'),(2,'Branco'),(4,'Cinza'),(9,'Marrom'),(3,'Prata'),(1,'Preto'),(7,'Verde'),(5,'Vermelho');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `IDMARCA` int NOT NULL AUTO_INCREMENT,
  `MARCA` varchar(30) NOT NULL,
  PRIMARY KEY (`IDMARCA`),
  UNIQUE KEY `MARCA` (`MARCA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (2,'Chevrolet'),(6,'Fiat'),(5,'Honda'),(3,'Hyundai'),(7,'Jeep'),(8,'Renault'),(4,'Toyota'),(1,'Volkswagen');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `IDTELEFONE` int NOT NULL AUTO_INCREMENT,
  `TIPO` enum('CEL','RES','COM') NOT NULL,
  `NUMERO` varchar(30) NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  PRIMARY KEY (`IDTELEFONE`),
  KEY `FK_TELEFONE_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `FK_TELEFONE_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'CEL','(11)99876-1001',1),(2,'RES','(11)3456-2002',2),(3,'COM','(11)4002-3003',3),(4,'CEL','(21)99876-4004',4),(5,'RES','(21)3333-5005',5),(6,'COM','(31)4002-6006',6),(7,'CEL','(41)99876-7007',7),(8,'RES','(51)3333-8008',8),(9,'COM','(61)4002-9009',9),(10,'CEL','(71)99876-1010',10);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_carro_cor`
--

DROP TABLE IF EXISTS `v_carro_cor`;
/*!50001 DROP VIEW IF EXISTS `v_carro_cor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_carro_cor` AS SELECT 
 1 AS `MODELO`,
 1 AS `PLACA`,
 1 AS `COR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_relatorio_carros`
--

DROP TABLE IF EXISTS `v_relatorio_carros`;
/*!50001 DROP VIEW IF EXISTS `v_relatorio_carros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_relatorio_carros` AS SELECT 
 1 AS `CLIENTE`,
 1 AS `SEXO`,
 1 AS `MODELO`,
 1 AS `PLACA`,
 1 AS `MARCA`,
 1 AS `COR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_relatorio_oficina`
--

DROP TABLE IF EXISTS `v_relatorio_oficina`;
/*!50001 DROP VIEW IF EXISTS `v_relatorio_oficina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_relatorio_oficina` AS SELECT 
 1 AS `NOME`,
 1 AS `SEXO`,
 1 AS `TIPO`,
 1 AS `NUMERO`,
 1 AS `MODELO`,
 1 AS `PLACA`,
 1 AS `MARCA`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_carro_cor`
--

/*!50001 DROP VIEW IF EXISTS `v_carro_cor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_carro_cor` AS select `ca`.`MODELO` AS `MODELO`,`ca`.`PLACA` AS `PLACA`,`co`.`COR` AS `COR` from ((`carro` `ca` join `carro_cor` `cc` on((`ca`.`IDCARRO` = `cc`.`ID_CARRO`))) join `cor` `co` on((`cc`.`ID_COR` = `co`.`IDCOR`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_relatorio_carros`
--

/*!50001 DROP VIEW IF EXISTS `v_relatorio_carros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_relatorio_carros` AS select `c`.`NOME` AS `CLIENTE`,`c`.`SEXO` AS `SEXO`,`ca`.`MODELO` AS `MODELO`,`ca`.`PLACA` AS `PLACA`,`m`.`MARCA` AS `MARCA`,`co`.`COR` AS `COR` from ((((`cliente` `c` join `carro` `ca` on((`c`.`IDCLIENTE` = `ca`.`ID_CLIENTE`))) join `marca` `m` on((`ca`.`ID_MARCA` = `m`.`IDMARCA`))) join `carro_cor` `cc` on((`ca`.`IDCARRO` = `cc`.`ID_CARRO`))) join `cor` `co` on((`cc`.`ID_COR` = `co`.`IDCOR`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_relatorio_oficina`
--

/*!50001 DROP VIEW IF EXISTS `v_relatorio_oficina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_relatorio_oficina` AS select `c`.`NOME` AS `NOME`,`c`.`SEXO` AS `SEXO`,`t`.`TIPO` AS `TIPO`,`t`.`NUMERO` AS `NUMERO`,`ca`.`MODELO` AS `MODELO`,`ca`.`PLACA` AS `PLACA`,`m`.`MARCA` AS `MARCA` from (((`cliente` `c` join `telefone` `t` on((`c`.`IDCLIENTE` = `t`.`ID_CLIENTE`))) join `carro` `ca` on((`c`.`IDCLIENTE` = `ca`.`ID_CLIENTE`))) join `marca` `m` on((`ca`.`ID_MARCA` = `m`.`IDMARCA`))) */;
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

-- Dump completed on 2026-07-21 14:21:04
