-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gestionespedizione
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `affidamento`
--

DROP TABLE IF EXISTS `affidamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affidamento` (
  `Iva` varchar(50) NOT NULL,
  `Codice` int NOT NULL,
  PRIMARY KEY (`Codice`,`Iva`),
  KEY `partitaiva_idx` (`Iva`),
  CONSTRAINT `c` FOREIGN KEY (`Codice`) REFERENCES `delivery` (`Codice`),
  CONSTRAINT `partitaiva` FOREIGN KEY (`Iva`) REFERENCES `società` (`Iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affidamento`
--

LOCK TABLES `affidamento` WRITE;
/*!40000 ALTER TABLE `affidamento` DISABLE KEYS */;
INSERT INTO `affidamento` VALUES ('738789340789',987),('809734834793',7890);
/*!40000 ALTER TABLE `affidamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisi`
--

DROP TABLE IF EXISTS `analisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisi` (
  `codicefiscale` varchar(45) NOT NULL,
  `stato` varchar(45) NOT NULL,
  `codice` int NOT NULL,
  PRIMARY KEY (`codicefiscale`,`codice`),
  KEY `codicefiscale` (`codicefiscale`),
  KEY `codice` (`codice`),
  CONSTRAINT `codi` FOREIGN KEY (`codice`) REFERENCES `delivery` (`Codice`),
  CONSTRAINT `crt` FOREIGN KEY (`codicefiscale`) REFERENCES `cliente` (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisi`
--

LOCK TABLES `analisi` WRITE;
/*!40000 ALTER TABLE `analisi` DISABLE KEYS */;
INSERT INTO `analisi` VALUES ('gdfg54t45h4','consegnato',987),('jkgsvdhg7fw','in arrivo',7890);
/*!40000 ALTER TABLE `analisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assunzionedipendente`
--

DROP TABLE IF EXISTS `assunzionedipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assunzionedipendente` (
  `tipocontratto` varchar(45) NOT NULL,
  `datacontratto` date NOT NULL,
  `codice` int NOT NULL,
  `codicefiscale` varchar(45) NOT NULL,
  PRIMARY KEY (`codicefiscale`,`codice`),
  KEY `codicefiscale` (`codicefiscale`),
  KEY `codice` (`codice`),
  CONSTRAINT `ccccc` FOREIGN KEY (`codice`) REFERENCES `delivery` (`Codice`),
  CONSTRAINT `fdcf` FOREIGN KEY (`codicefiscale`) REFERENCES `dipendente` (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunzionedipendente`
--

LOCK TABLES `assunzionedipendente` WRITE;
/*!40000 ALTER TABLE `assunzionedipendente` DISABLE KEYS */;
INSERT INTO `assunzionedipendente` VALUES ('determinato','1923-10-10',987,'dfsfdsfsd'),('indeterminato','1923-09-09',7890,'fdnjdfinjdfn');
/*!40000 ALTER TABLE `assunzionedipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assunzioneraider`
--

DROP TABLE IF EXISTS `assunzioneraider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assunzioneraider` (
  `DataAssunzione` date NOT NULL,
  `CodiceFiscale` varchar(45) NOT NULL,
  `Iva` varchar(50) NOT NULL,
  `QuotaOraria` int NOT NULL,
  PRIMARY KEY (`CodiceFiscale`,`Iva`),
  KEY `Iva` (`Iva`),
  KEY `CodiceFiscale` (`CodiceFiscale`),
  CONSTRAINT `cgfd` FOREIGN KEY (`CodiceFiscale`) REFERENCES `raider` (`CodiceFiscale`),
  CONSTRAINT `i` FOREIGN KEY (`Iva`) REFERENCES `società` (`Iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunzioneraider`
--

LOCK TABLES `assunzioneraider` WRITE;
/*!40000 ALTER TABLE `assunzioneraider` DISABLE KEYS */;
INSERT INTO `assunzioneraider` VALUES ('2000-10-08','dvvdvsvdw','738789340789',6),('1999-03-08','regegregdf','809734834793',5);
/*!40000 ALTER TABLE `assunzioneraider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Nordini` int NOT NULL,
  `Via` varchar(45) NOT NULL,
  `NOcivico` varchar(45) NOT NULL,
  `CodiceFiscale` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('franco ','ricciardi','sdasdsadas',5,'via delle cappelle','6','asfsadfsdfsd'),('gerardo','sessa','545344343',7,'via della pace ','67','gdfg54t45h4'),('carmine','citro','45656556',5,'via ministro de falco','46','jkgsvdhg7fw');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consegnadipendente`
--

DROP TABLE IF EXISTS `consegnadipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consegnadipendente` (
  `Orariostabilito` time NOT NULL,
  `Orarioeffettivo` time NOT NULL,
  `nominativo` varchar(45) NOT NULL,
  `tracciabilità` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `scontrino` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `codicefiscale` varchar(45) NOT NULL,
  PRIMARY KEY (`nome`,`scontrino`,`data`),
  CONSTRAINT `gtft` FOREIGN KEY (`nome`, `scontrino`, `data`) REFERENCES `ordine` (`Nome`, `Scontrino`, `Data`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consegnadipendente`
--

LOCK TABLES `consegnadipendente` WRITE;
/*!40000 ALTER TABLE `consegnadipendente` DISABLE KEYS */;
INSERT INTO `consegnadipendente` VALUES ('15:00:00','15:01:00','maria','no','carmine','9','2021-01-15','dfosfdsfsd'),('13:00:00','13:20:00','fdbdg','no','gennaro scapece ','5','2021-01-02','dfsfdsfsd');
/*!40000 ALTER TABLE `consegnadipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consegnaraider`
--

DROP TABLE IF EXISTS `consegnaraider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consegnaraider` (
  `nome` varchar(45) NOT NULL,
  `scontrino` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `orariostabilito` time DEFAULT NULL,
  `orarioeffettivo` time DEFAULT NULL,
  `tracciabilità` varchar(45) NOT NULL,
  `nominativo` varchar(45) NOT NULL,
  `codicefsicale` varchar(45) NOT NULL,
  PRIMARY KEY (`nome`,`scontrino`,`data`),
  CONSTRAINT `erttyu` FOREIGN KEY (`nome`, `scontrino`, `data`) REFERENCES `ordine` (`Nome`, `Scontrino`, `Data`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consegnaraider`
--

LOCK TABLES `consegnaraider` WRITE;
/*!40000 ALTER TABLE `consegnaraider` DISABLE KEYS */;
INSERT INTO `consegnaraider` VALUES ('gennaro scapece ','5','2021-01-02','13:56:00','14:00:00','no','rft','frtgfrtgf');
/*!40000 ALTER TABLE `consegnaraider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Codice` int NOT NULL,
  `Cadenza` varchar(45) NOT NULL,
  `Descrizione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (987,'settimanale ','senza descrizione '),(7890,'weekend','senza descrizione ');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente` (
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Annidiesperienza` int NOT NULL,
  `CodiceFiscale` varchar(45) NOT NULL,
  `Curriculum` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES ('Alfonso','lo piero',6,'dfosfdsfsd','crf.doc'),('giovanni','la gamba',6,'dfsfdsfsd','crf.doc'),('alfredo','mazzi',4,'fdnjdfinjdfn','cr.doc'),('pasquale','salvati',15,'pascenatakl','crf.doc');
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilità`
--

DROP TABLE IF EXISTS `disponibilità`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilità` (
  `Iva` varchar(50) NOT NULL,
  `CodiceFiscale` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceFiscale`),
  CONSTRAINT `cfg` FOREIGN KEY (`CodiceFiscale`) REFERENCES `raider` (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilità`
--

LOCK TABLES `disponibilità` WRITE;
/*!40000 ALTER TABLE `disponibilità` DISABLE KEYS */;
INSERT INTO `disponibilità` VALUES ('738789340789','dvvdvsvdw'),('809734834793','regegregdf');
/*!40000 ALTER TABLE `disponibilità` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `Tipo` varchar(50) NOT NULL,
  `Data` date NOT NULL,
  `Scontrino` varchar(45) NOT NULL,
  `Descrizione` varchar(45) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cfraider` varchar(45) NOT NULL,
  `CFdipendente` varchar(45) NOT NULL,
  `Stato` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Scontrino`,`Nome`,`Data`),
  KEY `Cfraider` (`Cfraider`),
  KEY `Data` (`Data`),
  KEY `Scontrino` (`Scontrino`),
  KEY `Nome` (`Nome`),
  CONSTRAINT `codicefiscale` FOREIGN KEY (`Cfraider`) REFERENCES `raider` (`CodiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES ('pizza','2021-01-02','5','pizza margerita','gennaro scapece ','dvvdvsvdw','dfsfdsfsd','consegnato'),('po','2021-01-15','9','Piatto di oasta','carmine','dvvdvsvdw','dfsfdsfsd','consegnato');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raider`
--

DROP TABLE IF EXISTS `raider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raider` (
  `Nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cognome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Datainizio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CodiceFiscale` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Nsocietà` int NOT NULL,
  `MediaVoti` decimal(4,0) NOT NULL,
  `disponibilità` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=ujis;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raider`
--

LOCK TABLES `raider` WRITE;
/*!40000 ALTER TABLE `raider` DISABLE KEYS */;
INSERT INTO `raider` VALUES ('mirko','muto','23/09/2000','dvvdvsvdw',5,667,'disponibile'),('nino','d\'angelo','19/08/1890','fffffefewff',4,555,'disponibile'),('giovanni ','urla','19/08/1990','regegregdf',7,669,'non disponibile');
/*!40000 ALTER TABLE `raider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrazione`
--

DROP TABLE IF EXISTS `registrazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrazione` (
  `Dataregistrazione` date NOT NULL,
  `nocivico` varchar(45) NOT NULL,
  `codice` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `via` varchar(45) NOT NULL,
  PRIMARY KEY (`nome`,`via`,`nocivico`,`codice`),
  KEY `via` (`via`),
  KEY `nome` (`nome`),
  KEY `codice` (`codice`),
  KEY `nocivico` (`nocivico`),
  CONSTRAINT `iiu` FOREIGN KEY (`codice`) REFERENCES `delivery` (`Codice`),
  CONSTRAINT `ytu` FOREIGN KEY (`nome`, `via`, `nocivico`) REFERENCES `ristorante` (`Nome`, `Via`, `N.Civico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrazione`
--

LOCK TABLES `registrazione` WRITE;
/*!40000 ALTER TABLE `registrazione` DISABLE KEYS */;
INSERT INTO `registrazione` VALUES ('2020-06-06','6',987,'la taverna dei briganti','via della luce'),('2020-05-10','8',7890,'pizzeria dolcevita','via delle madonne');
/*!40000 ALTER TABLE `registrazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `richiesta`
--

DROP TABLE IF EXISTS `richiesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `richiesta` (
  `nome` varchar(45) NOT NULL,
  `scontrino` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `codicefiscale` varchar(45) NOT NULL,
  PRIMARY KEY (`nome`,`scontrino`,`data`),
  KEY `nome` (`nome`),
  KEY `data` (`data`),
  KEY `scontrino` (`scontrino`),
  CONSTRAINT `identificativo` FOREIGN KEY (`nome`, `scontrino`, `data`) REFERENCES `ordine` (`Nome`, `Scontrino`, `Data`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiesta`
--

LOCK TABLES `richiesta` WRITE;
/*!40000 ALTER TABLE `richiesta` DISABLE KEYS */;
INSERT INTO `richiesta` VALUES ('gennaro scapece ','5','2021-01-02','gdfg54t45h4');
/*!40000 ALTER TABLE `richiesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ristorante`
--

DROP TABLE IF EXISTS `ristorante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ristorante` (
  `Nome` varchar(50) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Maxcoda` int DEFAULT NULL,
  `Servizi` varchar(45) NOT NULL,
  `Via` varchar(45) NOT NULL,
  `N.Civico` varchar(45) NOT NULL,
  `coda` int NOT NULL,
  PRIMARY KEY (`Nome`,`Via`,`N.Civico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ristorante`
--

LOCK TABLES `ristorante` WRITE;
/*!40000 ALTER TABLE `ristorante` DISABLE KEYS */;
INSERT INTO `ristorante` VALUES ('la taverna dei briganti','454343445',6,'food delivery','via della luce','6',3),('pizzeria dolcevita','65466363',7,'just eat','via delle madonne','8',4);
/*!40000 ALTER TABLE `ristorante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `società`
--

DROP TABLE IF EXISTS `società`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `società` (
  `Iva` varchar(50) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `CEO` varchar(45) NOT NULL,
  PRIMARY KEY (`Iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `società`
--

LOCK TABLES `società` WRITE;
/*!40000 ALTER TABLE `società` DISABLE KEYS */;
INSERT INTO `società` VALUES ('738789340789','mondofame.srl','franco attivo'),('809734834793','luce.srk','franco allegro');
/*!40000 ALTER TABLE `società` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valutazione`
--

DROP TABLE IF EXISTS `valutazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valutazione` (
  `Score` int DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `codicefiscal` varchar(45) NOT NULL,
  `codicefisc` varchar(45) NOT NULL,
  PRIMARY KEY (`codicefiscal`,`codicefisc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valutazione`
--

LOCK TABLES `valutazione` WRITE;
/*!40000 ALTER TABLE `valutazione` DISABLE KEYS */;
INSERT INTO `valutazione` VALUES (5,'2021-01-01','dvbhdfbhd','ewlkfmfff'),(4,'2021-01-05','dvvdvsvdw','asfsadfsdfsd'),(45,'1989-08-08','dvvdvsvdw','gdfg54t45h4'),(4,'2021-01-05','fffffefewff','asfsadfsdfsd'),(4,'2121-02-02','qsdsadas','grhyj'),(67,'1999-07-07','regegregdf','jkgsvdhg7fw');
/*!40000 ALTER TABLE `valutazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-07 19:03:53
