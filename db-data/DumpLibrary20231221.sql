CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.K. Rowling'),(2,'George R.R. Martin'),(3,'Stephen King'),(4,'Haruki Murakami'),(5,'J.R.R. Tolkien'),(6,'Agatha Christie'),(7,'Jane Austen'),(8,'Neil Gaiman'),(9,'Gabriel García Márquez'),(10,'Philip Roth'),(11,'Alice Walker'),(12,'John Grisham'),(13,'Ernest Hemingway'),(14,'Toni Morrison'),(15,'Margaret Atwood'),(16,'Dan Brown'),(17,'Isabel Allende'),(18,'Kazuo Ishiguro'),(19,'Jodi Picoult'),(20,'Michael Crichton');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_publishers`
--

DROP TABLE IF EXISTS `book_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `book_publishers_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_publishers_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_publishers`
--

LOCK TABLES `book_publishers` WRITE;
/*!40000 ALTER TABLE `book_publishers` DISABLE KEYS */;
INSERT INTO `book_publishers` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20);
/*!40000 ALTER TABLE `book_publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `page` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `bookshelve_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `bookshelve_id` (`bookshelve_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`bookshelve_id`) REFERENCES `bookshelves` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Harry Potter e a Pedra Filosofal',336,50,1,1),(2,'A Guerra dos Tronos',694,30,2,2),(3,'O Iluminado',447,40,3,3),(4,'Norwegian Wood',296,20,4,4),(5,'O Hobbit',310,60,5,5),(6,'Assassinato no Expresso do Oriente',274,35,6,6),(7,'Orgulho e Preconceito',279,25,7,7),(8,'Deuses Americanos',635,15,8,8),(9,'Cem Anos de Solidão',417,45,9,9),(10,'Complexo de Portnoy',274,30,10,10),(11,'A Cor Púrpura',295,20,11,11),(12,'A Firma',421,25,12,12),(13,'O Velho e o Mar',127,30,13,13),(14,'Amada',324,22,14,14),(15,'O Conto da Aia',311,18,15,15),(16,'O Código Da Vinci',454,40,16,16),(17,'A Casa dos Espíritos',433,28,17,17),(18,'Nunca Me Deixe Ir',288,25,18,18),(19,'Para Sempre Alice',423,20,19,19),(20,'Parque dos Dinossauros',399,35,20,20),(21,'livro teste',44,3,1,1),(25,'a',100,100,20,20),(32,'aaaaaaaa',33,3,3,3);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelves`
--

DROP TABLE IF EXISTS `bookshelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelves`
--

LOCK TABLES `bookshelves` WRITE;
/*!40000 ALTER TABLE `bookshelves` DISABLE KEYS */;
INSERT INTO `bookshelves` VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'A4'),(5,'A5'),(6,'A6'),(7,'A7'),(8,'A8'),(9,'A9'),(10,'A10'),(11,'A11'),(12,'A12'),(13,'A13'),(14,'A14'),(15,'A15'),(16,'A16'),(17,'A17'),(18,'A18'),(19,'A19'),(20,'A20');
/*!40000 ALTER TABLE `bookshelves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `adress` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'João Silva','111-111-1111','Rua A, nº 123, Bairro X'),(2,'Maria Santos','222-222-2222','Avenida B, nº 456, Bairro Y'),(3,'Carlos Oliveira','333-333-3333','Travessa C, nº 789, Bairro Z'),(4,'Ana Pereira','444-444-4444','Rua D, nº 101, Bairro W'),(5,'Pedro Almeida','555-555-5555','Avenida E, nº 202, Bairro V'),(6,'Fernanda Lima','666-666-6666','Rua F, nº 303, Bairro U'),(7,'Ricardo Rocha','777-777-7777','Travessa G, nº 404, Bairro T'),(8,'Camila Costa','888-888-8888','Avenida H, nº 505, Bairro S'),(9,'Luís Santos','999-999-9999','Rua I, nº 606, Bairro R'),(10,'Juliana Pereira','101-101-1010','Travessa J, nº 707, Bairro Q'),(11,'Mariana Oliveira','121-121-1212','Avenida K, nº 808, Bairro P'),(12,'Hugo Santos','232-232-2323','Rua L, nº 909, Bairro O'),(13,'Amanda Costa','343-343-3434','Travessa M, nº 111, Bairro N'),(14,'Rodrigo Almeida','454-454-4545','Avenida N, nº 222, Bairro M'),(15,'Laura Pereira','565-565-5656','Rua O, nº 333, Bairro L'),(16,'Daniel Lima','676-676-6767','Travessa P, nº 444, Bairro K'),(17,'Mariano Rocha','787-787-7878','Avenida Q, nº 555, Bairro J'),(18,'Carolina Silva','898-898-8989','Rua R, nº 666, Bairro I'),(19,'Eduardo Costa','909-909-9090','Travessa S, nº 777, Bairro H'),(20,'Luciana Oliveira','010-010-0101','Avenida T, nº 888, Bairro G'),(34,'Otavio dos Santos','14-99872-3399','Minha Casa - SP');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Editora Magia','111-111-1111'),(2,'Editora dos Tronos','222-222-2222'),(3,'Editora do Medo','333-333-3333'),(4,'Editora da Floresta','444-444-4444'),(5,'Editora da Aventura','555-555-5555'),(6,'Editora do Mistério','666-666-6666'),(7,'Editora do Amor','777-777-7777'),(8,'Editora dos Deuses','888-888-8888'),(9,'Editora da Solidão','999-999-9999'),(10,'Editora do Complexo','101-101-1010'),(11,'Editora da Cor','202-202-2020'),(12,'Editora da Lei','303-303-3030'),(13,'Editora do Mar','404-404-4040'),(14,'Editora do Encanto','505-505-5050'),(15,'Editora do Conto','606-606-6060'),(16,'Editora do Código','707-707-7070'),(17,'Editora dos Espíritos','808-808-8080'),(18,'Editora do Nunca','909-909-9090'),(19,'Editora do Para Sempre','010-010-1010'),(20,'Editora dos Dinossauros',NULL),(23,'teste2','kkk');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `rents_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `rents_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rents`
--

LOCK TABLES `rents` WRITE;
/*!40000 ALTER TABLE `rents` DISABLE KEYS */;
INSERT INTO `rents` VALUES (1,'2023-01-05',1,1),(2,'2023-02-10',2,2),(3,'2023-03-15',3,3),(4,'2023-04-20',4,4),(5,'2023-05-25',5,5),(6,'2023-06-30',6,6),(7,'2023-07-05',7,7),(8,'2023-08-10',8,8),(9,'2023-09-15',9,9),(10,'2023-10-20',10,10),(11,'2023-11-25',11,11),(12,'2023-12-30',12,12),(13,'2024-01-05',13,13),(14,'2024-02-10',14,14),(15,'2024-03-15',15,15),(16,'2024-04-20',16,16),(17,'2024-05-25',17,17),(18,'2024-06-30',18,18),(19,'2024-07-05',19,19),(20,'2024-08-10',20,20);
/*!40000 ALTER TABLE `rents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21 15:23:40
