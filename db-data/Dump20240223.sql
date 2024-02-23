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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (6,'Agatha Christie'),(11,'Alice Walker'),(16,'Dan Brown'),(13,'Ernest Hemingway'),(9,'Gabriel García Márquez'),(2,'George R.R. Martin'),(4,'Haruki Murakami'),(17,'Isabel Allendel'),(1,'J.K. Rowling'),(5,'J.R.R. Tolkien'),(7,'Jane Austen'),(19,'Jodi Picoult'),(12,'John Grisham'),(18,'Kazuo Ishiguro'),(15,'Margaret Atwood'),(20,'Michael Crichton'),(8,'Neil Gaiman'),(10,'Philip Roth'),(3,'Stephen King'),(28,'teste aqui hahaha'),(29,'TESTE DE PAGINAÇÂO'),(14,'Toni Morrison');
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
  `synopsis` text,
  `cover` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `author_id` (`author_id`),
  KEY `bookshelve_id` (`bookshelve_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`bookshelve_id`) REFERENCES `bookshelves` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Harry Potter e a Pedra Filosofal',336,50,1,1,'Um jovem descobre que é um bruxo e é convidado a estudar na Escola de Magia e Bruxaria de Hogwarts. Ele faz novos amigos e descobre segredos sobre sua própria história, enquanto enfrenta desafios perigosos no mundo mágico. O primeiro livro da série \"Harry Potter\" introduz os leitores ao mundo mágico criado por J.K. Rowling, repleto de aventura, amizade e magia.','https://ca.slack-edge.com/TDXF8CRAL-U067N5PNEQ7-1413f24d9992-512'),(2,'A Guerra dos Tronos',694,30,2,2,'Uma saga de famílias nobres lutando pelo controle do Trono de Ferro em Westeros. Enquanto a guerra se intensifica, alianças são formadas e traídas, e segredos obscuros vêm à tona. Baseado na série de livros \"As Crônicas de Gelo e Fogo\" de George R.R. Martin, \"A Guerra dos Tronos\" é uma história épica de política, intriga e fantasia.',NULL),(3,'O Iluminado',447,40,3,3,'Um homem assume o cargo de zelador em um hotel isolado e enfrenta visões terríveis de seu passado. Conforme o inverno se aproxima, o hotel se torna cada vez mais sinistro, e os horrores do passado começam a assombrar o presente. \"O Iluminado\" é um clássico do horror psicológico, explorando os limites da sanidade e da realidade.',NULL),(4,'Norwegian Wood',296,20,4,4,'Um jovem universitário se envolve com uma garota problemática e enfrenta questões de amor e morte. Conforme seu relacionamento se intensifica, ele é forçado a confrontar seus próprios demônios interiores e as complexidades do amor e da perda. \"Norwegian Wood\" é uma obra-prima da literatura contemporânea japonesa, explorando temas de solidão, desejo e crescimento.',NULL),(5,'O Hobbit',310,60,5,5,'Um hobbit chamado Bilbo Bolseiro é recrutado por um mago e um grupo de anões para uma jornada épica. Eles enfrentam trolls, goblins e dragões enquanto buscam recuperar o tesouro perdido dos anões, guardado pelo terrível dragão Smaug. \"O Hobbit\" é uma aventura clássica de fantasia que cativou gerações de leitores com sua narrativa envolvente e personagens inesquecíveis.',NULL),(6,'Assassinato no Expresso do Oriente',274,35,6,6,'Um detetive belga investiga um assassinato a bordo do luxuoso trem Expresso do Oriente. Com um elenco de suspeitos que inclui aristocratas, artistas e empresários, ele precisa resolver o crime antes que o assassino ataque novamente. \"Assassinato no Expresso do Oriente\" é um mistério clássico de Agatha Christie, repleto de reviravoltas surpreendentes e suspense.',NULL),(7,'Orgulho e Preconceito',279,25,7,7,'O romance narra os conflitos sociais e amorosos das irmãs Bennet em meados do século XIX na Inglaterra. Enquanto buscam encontrar maridos adequados, elas enfrentam os desafios da sociedade patriarcal e lutam por sua independência e felicidade. \"Orgulho e Preconceito\" é uma obra-prima da literatura inglesa, celebrada por sua sátira social e romance cativante.',NULL),(8,'Deuses Americanos',635,15,8,8,'Um ex-presidiário se vê envolvido em uma guerra entre os deuses antigos e os novos deuses da América. Enquanto viaja pelos Estados Unidos, ele encontra seres míticos e deidades poderosas, aprendendo sobre a natureza da crença e da identidade americana. \"Deuses Americanos\" é uma obra provocativa de Neil Gaiman, explorando mitologia e modernidade de maneiras inovadoras.',NULL),(9,'Cem Anos de Solidão',417,45,9,9,'A história da família Buendía em uma cidade fictícia da América Latina, com elementos de realismo mágico. Ao longo de várias gerações, a família enfrenta tragédias, amores proibidos e lutas políticas, enquanto a cidade ao seu redor passa por transformações dramáticas. \"Cem Anos de Solidão\" é uma obra-prima de Gabriel García Márquez, explorando temas de memória, identidade e destino.',NULL),(10,'Complexo de Portnoy',274,30,10,10,'O psicanalista Alexander Portnoy reflete sobre sua vida e sua relação complicada com a família. Em uma série de monólogos interiores, ele explora suas obsessões sexuais, conflitos étnicos e busca por identidade em meio à pressão cultural. \"Complexo de Portnoy\" é uma narrativa provocativa e divertida sobre os dilemas da vida moderna.',NULL),(11,'A Cor Púrpura',295,20,11,11,'Uma história sobre a vida de uma mulher negra nos Estados Unidos durante o século XX. Ela enfrenta a opressão racial, a violência doméstica e a busca por sua própria identidade em meio a uma sociedade segregada e hostil. \"A Cor Púrpura\" é um romance poderoso de Alice Walker, celebrado por sua honestidade brutal e sua mensagem de esperança.',NULL),(12,'A Firma',421,25,12,12,'Um jovem advogado é atraído para uma firma de advocacia misteriosa e perigosa em Memphis. Conforme ele mergulha mais fundo nos segredos da empresa, ele descobre corrupção, chantagem e conspiração que ameaçam sua própria vida. \"A Firma\" é um thriller legal de John Grisham, cheio de reviravoltas emocionantes e suspense.',NULL),(13,'O Velho e o Mar',127,30,13,13,'Um pescador idoso enfrenta um desafio épico ao lutar contra um peixe gigante no mar. Sozinho em seu barco, ele luta contra a natureza e sua própria determinação enquanto tenta capturar sua presa. \"O Velho e o Mar\" é uma obra-prima de Ernest Hemingway, celebrada por sua simplicidade e profundidade temática.',NULL),(14,'Amada',324,22,14,14,'Uma escrava americana luta por sua liberdade e pelo amor de sua família após a Guerra Civil. Enquanto enfrenta traumas do passado e desafios do presente, ela encontra força e resiliência para superar todas as adversidades. \"Amada\" é uma poderosa meditação sobre memória, trauma e redenção, escrita por Toni Morrison.',NULL),(15,'O Conto da Aia',311,18,15,15,'Numa sociedade distópica, mulheres são subjugadas e forçadas a servir como \"aia\" para reprodução. Uma mulher chamada Offred luta para sobreviver e encontrar esperança em meio à opressão e ao controle totalitário. \"O Conto da Aia\" é uma obra-prima distópica de Margaret Atwood, relevante e provocativa até os dias de hoje.',NULL),(16,'O Código Da Vinci',454,40,16,16,'Um professor de simbologia de Harvard se envolve em uma conspiração religiosa enquanto investiga um assassinato. Ele segue pistas ocultas e símbolos antigos, desvendando segredos que podem abalar as estruturas da sociedade e da igreja. \"O Código Da Vinci\" é um thriller intelectual de Dan Brown, cheio de reviravoltas e revelações surpreendentes.',NULL),(17,'A Casa dos Espíritos',433,28,17,17,'Uma saga familiar que narra eventos políticos e sociais no Chile durante o século XX. A história segue três gerações da família Trueba, enquanto enfrentam turbulências políticas, conflitos sociais e dramas pessoais. \"A Casa dos Espíritos\" é uma obra-prima de Isabel Allende, rica em imaginação e profundidade histórica.',NULL),(18,'Nunca Me Deixe Ir',288,25,18,18,'Dois amigos crescem juntos em um internato inglês e lidam com questões de identidade e liberdade. Conforme enfrentam desafios acadêmicos e emocionais, eles desenvolvem uma amizade complexa e duradoura que molda o curso de suas vidas. \"Nunca Me Deixe Ir\" é um romance comovente de Kazuo Ishiguro, repleto de nostalgia e melancolia.',NULL),(19,'Para Sempre Alice',423,20,19,19,'Uma professora universitária é diagnosticada com Alzheimer e luta para manter sua identidade. Conforme sua memória se desvanece, ela luta para se conectar com seu passado e seus entes queridos, enquanto enfrenta o inevitável declínio. \"Para Sempre Alice\" é uma história emocionante sobre amor, família e aceitação, escrita por Lisa Genova.',NULL),(20,'Parque dos Dinossauros',399,35,20,20,'Um parque temático de dinossauros é inaugurado em uma ilha remota, mas as coisas rapidamente dão errado. Quando os dinossauros escapam de seus cercados, os visitantes e funcionários do parque se encontram em uma luta desesperada pela sobrevivência. \"Parque dos Dinossauros\" é um thriller de Michael Crichton, cheio de ação e suspense.',NULL),(21,'livro teste',44,3,1,1,NULL,NULL),(25,'a',100,100,20,20,NULL,NULL),(32,'aaaaaaaa',33,3,3,3,NULL,NULL),(33,'as cronicas de fx',3,3,3,3,'fxfxfxfxfx',NULL),(34,'abb',2,2,2,2,'aaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkkaaaaaaaaaaaaaakkkkkkkkkkkkkkkk','');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelves`
--

LOCK TABLES `bookshelves` WRITE;
/*!40000 ALTER TABLE `bookshelves` DISABLE KEYS */;
INSERT INTO `bookshelves` VALUES (1,'A1'),(10,'A10'),(11,'A11'),(12,'A12'),(13,'A13'),(14,'A14'),(15,'A15'),(16,'A16'),(17,'A17'),(18,'A18'),(19,'A19'),(2,'A2'),(20,'A20'),(3,'A3'),(4,'A4'),(5,'A5'),(6,'A6'),(7,'A7'),(8,'A8'),(9,'A9');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Editora Magia','111-111-1111'),(2,'Editora dos Tronos','222-222-2222'),(3,'Editora do Medo','333-333-3333'),(4,'Editora da Floresta','444-444-4444'),(5,'Editora da Aventura','555-555-5555'),(6,'Editora do Mistério','666-666-6666'),(7,'Editora do Amor','777-777-7777'),(8,'Editora dos Deuses','888-888-8888'),(9,'Editora da Solidão','999-999-9999'),(10,'Editora do Complexo','101-101-1010'),(11,'Editora da Cor','202-202-2020'),(12,'Editora da Lei','303-303-3030'),(13,'Editora do Mar','404-404-4040'),(14,'Editora do Encanto','505-505-5050'),(15,'Editora do Conto','606-606-6060'),(16,'Editora do Código','707-707-7070'),(17,'Editora dos Espíritos','808-808-8080'),(18,'Editora do Nunca','909-909-9090'),(19,'Editora do Para Sempre','010-010-1010'),(20,'Editora dos Dinossauros',''),(23,'teste2','kkk');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rents`
--

LOCK TABLES `rents` WRITE;
/*!40000 ALTER TABLE `rents` DISABLE KEYS */;
INSERT INTO `rents` VALUES (1,'2023-01-05',1,1),(2,'2023-02-10',2,2),(3,'2023-03-15',3,3),(4,'2023-04-20',4,4),(5,'2023-05-25',5,5),(6,'2023-06-30',6,6),(7,'2023-07-05',7,7),(8,'2023-08-10',8,8),(9,'2023-09-15',9,9),(10,'2023-10-20',10,10),(11,'2023-11-25',11,11),(12,'2023-12-30',12,12),(13,'2024-01-05',13,13),(14,'2024-02-10',14,14),(15,'2024-03-15',15,15),(16,'2024-04-20',16,16),(17,'2024-05-25',17,17),(19,'2024-07-05',19,19),(20,'2024-08-10',20,20),(21,'2024-02-13',1,19),(22,NULL,1,15),(23,NULL,2,15);
/*!40000 ALTER TABLE `rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book_reviews`
--

DROP TABLE IF EXISTS `user_book_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_book_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_id` (`book_id`),
  KEY `user_book_reviews_ibfk_1` (`user_id`),
  CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `user_book_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book_reviews`
--

LOCK TABLES `user_book_reviews` WRITE;
/*!40000 ALTER TABLE `user_book_reviews` DISABLE KEYS */;
INSERT INTO `user_book_reviews` VALUES (2,3,'mt bomom legal',16,1),(4,2,'aaaaaaaaaaaaaaaaaaaaaaaaa',17,1),(6,7,'opa',14,2),(7,0,'olá',14,1);
/*!40000 ALTER TABLE `user_book_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorite_books`
--

DROP TABLE IF EXISTS `user_favorite_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorite_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_favorites` (`user_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `user_favorite_books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_favorite_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorite_books`
--

LOCK TABLES `user_favorite_books` WRITE;
/*!40000 ALTER TABLE `user_favorite_books` DISABLE KEYS */;
INSERT INTO `user_favorite_books` VALUES (15,14,2);
/*!40000 ALTER TABLE `user_favorite_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `image` text,
  `details` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'admin','admin@mail.com','$2a$12$UtQt7ee5.x9YazLpWUpYSeS/HE/R8fxXbyMsRtB4n69Zcc8AzYYgy',1,'https://img.freepik.com/vetores-premium/ilustracao-em-vetor-de-foto-de-perfil-de-avatar-de-homem_268834-538.jpg?size=338&ext=jpg&ga=GA1.1.1448711260.1707264000&semt=sph',''),(15,'fxzao','fx@mail.com','$2a$12$mNGyy3af2FF7nR4o2Ye4yulRtEJDjh8qxOOXNFZz2MP6XmdaTL5WW',0,'data:image/jpeg;base64,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','meu nome é Felipe Ferrari aaaaaaameu nome é Felipe Ferrari aaaaaaameu nome é Felipe Ferrari aaaaaaameu nome é Felipe Ferrari aaaaaaameu nome é Felipe Ferrari aaaaaaameu nome é Felipe Ferrari aaaaaaameu'),(16,'otavio','otavio@mail.com','$2a$12$30XHZ5nwKW8dh7MX4m4BLOVL2asdLba3LF99o4XRMIKYoRWv2PEMi',0,'',''),(17,'teste','teste@mail.com','$2a$12$27arw2Qrt10.g8a9KlblWON4QaYpzpTuGdS9/3fOX.j14RwvY.Qeq',0,'','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 14:47:09
