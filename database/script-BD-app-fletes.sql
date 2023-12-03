CREATE DATABASE  IF NOT EXISTS `heroku_7a7c020d4b7ebff` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_7a7c020d4b7ebff`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: us-cdbr-east-06.cleardb.net    Database: heroku_7a7c020d4b7ebff
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_citas_usuarios_idx` (`usuarioId`),
  CONSTRAINT `fk_citas_usuarios` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (24,'2023-07-07','03:45:00',2),(34,'2023-07-21','16:40:00',2),(44,'2023-07-16','10:10:00',2),(54,'2023-07-16','10:10:00',3),(64,'2023-10-02','23:45:00',2),(74,'2023-11-15','23:50:00',2),(84,'2023-11-16','15:45:00',2),(104,'2023-11-18','12:10:00',2),(114,'2023-11-22','03:50:00',3);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citasservicios`
--

DROP TABLE IF EXISTS `citasservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citasservicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citaId` int(11) DEFAULT NULL,
  `servicioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_citaId_citaservicios_idx` (`citaId`),
  KEY `fk_servicioId_citaservicios_idx` (`servicioId`),
  CONSTRAINT `fk_citaId_citaservicios` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_servicioId_citaservicios` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citasservicios`
--

LOCK TABLES `citasservicios` WRITE;
/*!40000 ALTER TABLE `citasservicios` DISABLE KEYS */;
INSERT INTO `citasservicios` VALUES (24,NULL,6),(34,NULL,12),(44,NULL,14),(54,24,9),(64,34,14),(74,34,9),(84,44,10),(94,54,24),(104,64,2),(114,64,3),(124,64,10),(134,64,13),(144,74,1),(154,74,9),(164,84,2),(174,84,14),(184,NULL,74),(194,104,1),(204,104,14),(214,114,1),(224,114,10),(234,114,94);
/*!40000 ALTER TABLE `citasservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Cerámica',0.00),(2,'Cemento',0.00),(3,'Ladrillos',0.00),(4,'Insumos alimento balanceado',0.00),(5,'Tubos (extra grandes)',0.00),(6,'Palos',0.00),(7,'Granos',0.00),(8,'Abarrotes',0.00),(9,'Flete Lima -> Trujillo',3000.00),(10,'Flete Lima -> Chiclayo',4000.00),(11,'Flete Lima -> Piura',5400.00),(12,'Flete Lima -> Sullana',5300.00),(13,'Flete Lima -> Talara',6000.00),(14,'Flete Lima -> Tumbes',7000.00),(24,' Flete Sullana -> Trujillo',2500.00),(34,' Flete Lima -> Huamachuco',6500.00),(44,' Flete Lima -> Cajamarca',6500.00),(54,' Flete Trujillo -> Lima',2560.00),(64,' Flete Trujillo -> Cañete',3500.00),(74,' Flete Trujillo -> Chincha',4000.00),(84,' Flete Trujillo -> Ica',4800.00),(94,' Flete Trujillo -> Nazca',5400.00),(114,'Flete Lima -> Chimbote',2800.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,' Simon','Tavara','correo1@correo.com','$2y$10$e535/dRLwqWUhfbZlNdNlOYctXpKHzpFvmRY3Y4Xhb2bEtCkj84fG','963856321',0,1,''),(3,' Maria','Alvarez','correo2@correo.com','$2y$10$zk8PwE5fvl.ueh74mISNHuGiX6djxzCPkvVm1VMlVyCVBMREulEeW','999666323',0,1,''),(4,' Admin','Alfaro','admin@admin.com','$2y$10$Lhv7kmjHjsh0oKZfS8haiufa7vufqrdKDs55/ZhEomEqW2m1L1WgS','963852741',1,1,'');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 13:01:34
