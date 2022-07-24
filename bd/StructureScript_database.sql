-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: fackulty
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriasEventos`
--

DROP TABLE IF EXISTS `CategoriasEventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoriasEventos` (
  `idEvento` int NOT NULL,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`idEvento`,`idCategoria`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `categoriaseventos_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `Eventos` (`idEvento`) ON DELETE RESTRICT,
  CONSTRAINT `categoriaseventos_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `Categorias` (`idCategoria`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriasEventos`
--

LOCK TABLES `CategoriasEventos` WRITE;
/*!40000 ALTER TABLE `CategoriasEventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriasEventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriasPropuestas`
--

DROP TABLE IF EXISTS `CategoriasPropuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoriasPropuestas` (
  `idPropuesta` int NOT NULL,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`idPropuesta`,`idCategoria`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `categoriaspropuestas_ibfk_1` FOREIGN KEY (`idPropuesta`) REFERENCES `Propuestas` (`idPropuesta`) ON DELETE RESTRICT,
  CONSTRAINT `categoriaspropuestas_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `Categorias` (`idCategoria`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriasPropuestas`
--

LOCK TABLES `CategoriasPropuestas` WRITE;
/*!40000 ALTER TABLE `CategoriasPropuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriasPropuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComentariosEventos`
--

DROP TABLE IF EXISTS `ComentariosEventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ComentariosEventos` (
  `idComentarioEvento` int NOT NULL AUTO_INCREMENT,
  `idEvento` int NOT NULL,
  `idUsuario` int NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `numLikes` smallint DEFAULT NULL,
  PRIMARY KEY (`idComentarioEvento`),
  KEY `idEvento` (`idEvento`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `comentarioseventos_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `ParticipantesEventos` (`idEvento`) ON DELETE RESTRICT,
  CONSTRAINT `comentarioseventos_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `ParticipantesEventos` (`idUsuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComentariosEventos`
--

LOCK TABLES `ComentariosEventos` WRITE;
/*!40000 ALTER TABLE `ComentariosEventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComentariosEventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComentariosPropuestas`
--

DROP TABLE IF EXISTS `ComentariosPropuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ComentariosPropuestas` (
  `idComentarioPropuesta` int NOT NULL AUTO_INCREMENT,
  `idPropuesta` int NOT NULL,
  `idUsuario` int NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `numLikes` smallint DEFAULT NULL,
  PRIMARY KEY (`idComentarioPropuesta`),
  KEY `idPropuesta` (`idPropuesta`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `comentariospropuestas_ibfk_1` FOREIGN KEY (`idPropuesta`) REFERENCES `ParticipantesPropuestas` (`idPropuesta`) ON DELETE RESTRICT,
  CONSTRAINT `comentariospropuestas_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `ParticipantesPropuestas` (`idUsuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComentariosPropuestas`
--

LOCK TABLES `ComentariosPropuestas` WRITE;
/*!40000 ALTER TABLE `ComentariosPropuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComentariosPropuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Eventos`
--

DROP TABLE IF EXISTS `Eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eventos` (
  `idEvento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  `fechaEvento` date NOT NULL,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCreador` int NOT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `idCreador` (`idCreador`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`idCreador`) REFERENCES `Usuarios` (`idUsuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eventos`
--

LOCK TABLES `Eventos` WRITE;
/*!40000 ALTER TABLE `Eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipantesEventos`
--

DROP TABLE IF EXISTS `ParticipantesEventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParticipantesEventos` (
  `idUsuario` int NOT NULL,
  `idEvento` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idEvento`),
  KEY `idEvento` (`idEvento`),
  CONSTRAINT `participanteseventos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuario`) ON DELETE RESTRICT,
  CONSTRAINT `participanteseventos_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `Eventos` (`idEvento`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipantesEventos`
--

LOCK TABLES `ParticipantesEventos` WRITE;
/*!40000 ALTER TABLE `ParticipantesEventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParticipantesEventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipantesPropuestas`
--

DROP TABLE IF EXISTS `ParticipantesPropuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParticipantesPropuestas` (
  `idUsuario` int NOT NULL,
  `idPropuesta` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idPropuesta`),
  KEY `idPropuesta` (`idPropuesta`),
  CONSTRAINT `participantespropuestas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuario`) ON DELETE RESTRICT,
  CONSTRAINT `participantespropuestas_ibfk_2` FOREIGN KEY (`idPropuesta`) REFERENCES `Propuestas` (`idPropuesta`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipantesPropuestas`
--

LOCK TABLES `ParticipantesPropuestas` WRITE;
/*!40000 ALTER TABLE `ParticipantesPropuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParticipantesPropuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Propuestas`
--

DROP TABLE IF EXISTS `Propuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Propuestas` (
  `idPropuesta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCreador` int NOT NULL,
  PRIMARY KEY (`idPropuesta`),
  KEY `idCreador` (`idCreador`),
  CONSTRAINT `propuestas_ibfk_1` FOREIGN KEY (`idCreador`) REFERENCES `Usuarios` (`idUsuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Propuestas`
--

LOCK TABLES `Propuestas` WRITE;
/*!40000 ALTER TABLE `Propuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Propuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Universidades`
--

DROP TABLE IF EXISTS `Universidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Universidades` (
  `idUniversidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `sede` varchar(50) NOT NULL,
  `comunidadAutonoma` varchar(50) NOT NULL,
  `fundacion` smallint NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idUniversidad`),
  CONSTRAINT `universidades_chk_1` CHECK ((`tipo` in (_utf8mb4'Pública',_utf8mb4'Privada')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Universidades`
--

LOCK TABLES `Universidades` WRITE;
/*!40000 ALTER TABLE `Universidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `Universidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `idUniversidad` int NOT NULL,
  `facultad` varchar(50) NOT NULL,
  `curso` tinyint NOT NULL,
  `clase` char(1) NOT NULL,
  `edad` tinyint DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idUniversidad` (`idUniversidad`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idUniversidad`) REFERENCES `Universidades` (`idUniversidad`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-23 23:31:03
