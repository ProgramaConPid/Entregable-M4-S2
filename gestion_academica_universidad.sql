-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_academica_universidad
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cursos`
--

DROP TABLE IF EXISTS `Cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo` int NOT NULL,
  `creditos` int NOT NULL,
  `semestre` int NOT NULL,
  `id_docente` int NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `Cursos_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `Docentes` (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cursos`
--

LOCK TABLES `Cursos` WRITE;
/*!40000 ALTER TABLE `Cursos` DISABLE KEYS */;
INSERT INTO `Cursos` VALUES (1,'Desarrollo Web',1025,500,5,3),(2,'Manipulacio de Alimentos',1026,200,2,2),(3,'Ciberseguridad',1027,350,7,1),(4,'Manejo de Herramientas Ofimaticas',1028,200,1,3);
/*!40000 ALTER TABLE `Cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Docentes`
--

DROP TABLE IF EXISTS `Docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Docentes` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_institucional` varchar(100) NOT NULL,
  `departamento_academico` varchar(50) NOT NULL,
  `anios_experiencia` int NOT NULL,
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Docentes`
--

LOCK TABLES `Docentes` WRITE;
/*!40000 ALTER TABLE `Docentes` DISABLE KEYS */;
INSERT INTO `Docentes` VALUES (1,'Sebastian Agudelo','sebasTL@riwi.io','Software',6),(2,'Lina Beltran','linabeltran@riwi.io','Ciencias Aplicadas',3),(3,'David Heano','deiviheanofront@riwi.io','Ciencias Exactas',7);
/*!40000 ALTER TABLE `Docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiantes`
--

DROP TABLE IF EXISTS `Estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `identificacion` int NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiantes`
--

LOCK TABLES `Estudiantes` WRITE;
/*!40000 ALTER TABLE `Estudiantes` DISABLE KEYS */;
INSERT INTO `Estudiantes` VALUES (1,'Pedro Lopez','pedritolopez@gmail.com','Masculino',1000410512,'Ing. Sistemas','2000-05-24','2020-02-10'),(2,'Juancho Marin','juanitopro@gmail.com','Masculino',42410638,'Biologia','1995-03-12','2018-02-18'),(3,'Andrea Jhamile','jhamile123@gmail.com','Femenino',28095940,'Derecho Penal','2001-07-20','2021-03-15'),(4,'Samuel Monsalve','lovegays@gmail.com','No Binario',10058290,'Ciencias Filosoficas','2005-01-26','2022-01-20'),(5,'Kevin Londoño','diñocrack12@gmail.com','Masculino',210821590,'Negocios Internacionales','2003-04-10','2020-01-26');
/*!40000 ALTER TABLE `Estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inscripciones`
--

DROP TABLE IF EXISTS `Inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_curso` int NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `calificacion_final` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `Inscripciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `Estudiantes` (`id_estudiante`),
  CONSTRAINT `Inscripciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `Cursos` (`id_curso`),
  CONSTRAINT `Inscripciones_chk_1` CHECK ((`id_estudiante` between 1 and 5)),
  CONSTRAINT `Inscripciones_chk_2` CHECK ((`id_curso` between 1 and 4))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inscripciones`
--

LOCK TABLES `Inscripciones` WRITE;
/*!40000 ALTER TABLE `Inscripciones` DISABLE KEYS */;
INSERT INTO `Inscripciones` VALUES (1,2,4,'2020-05-15',7),(2,4,1,'2022-06-20',4),(3,2,3,'2020-08-04',6),(4,1,2,'2022-04-28',10),(5,5,1,'2023-05-10',3),(6,3,4,'2020-06-16',5),(7,3,2,'2021-07-14',6),(8,1,1,'2023-03-22',8);
/*!40000 ALTER TABLE `Inscripciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 11:21:01
