-- MySQL dump 10.13  Distrib 5.5.35, for Linux (x86_64)
--
-- Host: localhost    Database: app_classic
-- ------------------------------------------------------
-- Server version	5.5.35
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `app`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `app` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `app`;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_professor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_professor` (`id_professor`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `fk_alunoo` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_professor` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `assinaturas_ativas`
--

DROP TABLE IF EXISTS `assinaturas_ativas`;
/*!50001 DROP VIEW IF EXISTS `assinaturas_ativas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `assinaturas_ativas` (
  `qtd` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cadastro`
--

DROP TABLE IF EXISTS `cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `cadastros_por_dia`
--

DROP TABLE IF EXISTS `cadastros_por_dia`;
/*!50001 DROP VIEW IF EXISTS `cadastros_por_dia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `cadastros_por_dia` (
  `data` tinyint NOT NULL,
  `count(data)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `compartilhamento`
--

DROP TABLE IF EXISTS `compartilhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compartilhamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `id_planejamento` int(11) NOT NULL,
  `id_folga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_planejament` (`id_planejamento`),
  KEY `data` (`data`),
  KEY `id_folga` (`id_folga`),
  CONSTRAINT `id_planejament` FOREIGN KEY (`id_planejamento`) REFERENCES `planejamento` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id_usuario` int(11) NOT NULL,
  `diarios` tinyint(1) NOT NULL DEFAULT '0',
  `semanais` tinyint(1) NOT NULL DEFAULT '0',
  `avisos` tinyint(1) NOT NULL DEFAULT '1',
  `enviou_assinatura_vencida` tinyint(1) NOT NULL DEFAULT '0',
  `enviou_sem_planejamento` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,1,1,1,0,0);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_enviados`
--

DROP TABLE IF EXISTS `emails_enviados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_enviados` (
  `ano` smallint(6) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `quantidade` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `folga`
--

DROP TABLE IF EXISTS `folga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 NOT NULL,
  `importancia` tinyint(4) DEFAULT NULL,
  `dificuldade` tinyint(4) DEFAULT NULL,
  `ordem` tinyint(4) NOT NULL DEFAULT '0',
  `minutos_planejados` mediumint(8) unsigned DEFAULT '0',
  `minutos_estudados` mediumint(8) unsigned DEFAULT '0',
  `minutos_ciclo` smallint(6) DEFAULT '0',
  `id_planejamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_planejamento` (`id_planejamento`),
  CONSTRAINT `id_planejamento` FOREIGN KEY (`id_planejamento`) REFERENCES `planejamento` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `meses` tinyint(2) unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tipo` varchar(32) NOT NULL,
  `valor` float unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_pagamento_usuario` (`id_usuario`),
  CONSTRAINT `FK_pagamento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `pagamento_mdr`
--

DROP TABLE IF EXISTS `pagamento_mdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento_mdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `meses` tinyint(4) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `minutos_planejados` smallint(6) DEFAULT '0',
  `minutos_estudados` smallint(6) DEFAULT '0',
  `tipo_estudo` tinyint(1) DEFAULT NULL,
  `conteudo` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `anotacoes` varchar(300) COLLATE latin1_bin DEFAULT NULL,
  `id_dia` int(11) NOT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `realocacao` date DEFAULT NULL,
  `descricao1` varchar(10) COLLATE latin1_bin DEFAULT NULL,
  `descricao2` smallint(6) unsigned DEFAULT NULL,
  `id_folga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periodo_dia` (`id_dia`),
  KEY `periodo_materia` (`id_materia`),
  KEY `id_folga` (`id_folga`),
  CONSTRAINT `periodo_dia` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `periodo_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planejamento`
--

DROP TABLE IF EXISTS `planejamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planejamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) CHARACTER SET latin1 NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `data_prova` date NOT NULL,
  `minutos_segunda` smallint(6) DEFAULT '0',
  `minutos_terca` smallint(6) DEFAULT '0',
  `minutos_quarta` smallint(6) DEFAULT '0',
  `minutos_quinta` smallint(6) DEFAULT '0',
  `minutos_sexta` smallint(6) DEFAULT '0',
  `minutos_sabado` smallint(6) DEFAULT '0',
  `minutos_domingo` smallint(6) DEFAULT '0',
  `tipo_grade` tinyint(1) DEFAULT '0',
  `descritor_grade` smallint(6) DEFAULT '0',
  `id_usuario` int(11) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `minutos_planejados` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `minutos_estudados` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `planejamento_usuario` (`id_usuario`),
  CONSTRAINT `planejamento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `planejamentos_sem_dias`
--

DROP TABLE IF EXISTS `planejamentos_sem_dias`;
/*!50001 DROP VIEW IF EXISTS `planejamentos_sem_dias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `planejamentos_sem_dias` (
  `email` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `tipo_grade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `promocao`
--

DROP TABLE IF EXISTS `promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(4) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `desconto` int(11) DEFAULT NULL,
  `descricao` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao`
--

LOCK TABLES `promocao` WRITE;
/*!40000 ALTER TABLE `promocao` DISABLE KEYS */;
INSERT INTO `promocao` VALUES (1,0,'black-friday',40,'BLACK FRIDAY. 40% DE DESCONTO. SOMENTE HOJE!');
/*!40000 ALTER TABLE `promocao` ENABLE KEYS */;
UNLOCK TABLES;

-- Temporary table structure for view `qtd_pagamentos_por_tipo`
--

DROP TABLE IF EXISTS `qtd_pagamentos_por_tipo`;
/*!50001 DROP VIEW IF EXISTS `qtd_pagamentos_por_tipo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `qtd_pagamentos_por_tipo` (
  `tipo` tinyint NOT NULL,
  `count(*)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `qtd_registros_ultima_semana`
--

DROP TABLE IF EXISTS `qtd_registros_ultima_semana`;
/*!50001 DROP VIEW IF EXISTS `qtd_registros_ultima_semana`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `qtd_registros_ultima_semana` (
  `count(distinct u.id)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipo_assinatura`
--

DROP TABLE IF EXISTS `tipo_assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_assinatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qtd_meses` tinyint(4) DEFAULT NULL,
  `valor` smallint(6) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_assinatura`
--

LOCK TABLES `tipo_assinatura` WRITE;
/*!40000 ALTER TABLE `tipo_assinatura` DISABLE KEYS */;
INSERT INTO `tipo_assinatura` VALUES (1,3,42,1),(2,6,65,1),(3,12,98,1),(4,0,165,1);
/*!40000 ALTER TABLE `tipo_assinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) CHARACTER SET latin1 NOT NULL,
  `senha` varchar(45) CHARACTER SET latin1 NOT NULL,
  `codigo_verificacao` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` values (null, 'max171@gmail.com','d4a3da5391796bcf43abcf8b08406734',null,null);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `usuarios_cadastrados_que_nao_assinaram`;
/*!50001 DROP VIEW IF EXISTS `usuarios_cadastrados_que_nao_assinaram`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `usuarios_cadastrados_que_nao_assinaram` (
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `usuarios_que_assinaram_e_nao_utilizam`
--

DROP TABLE IF EXISTS `usuarios_que_assinaram_e_nao_utilizam`;
/*!50001 DROP VIEW IF EXISTS `usuarios_que_assinaram_e_nao_utilizam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `usuarios_que_assinaram_e_nao_utilizam` (
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `valor_total_bruto_cartoes`
--

DROP TABLE IF EXISTS `valor_total_bruto_cartoes`;
/*!50001 DROP VIEW IF EXISTS `valor_total_bruto_cartoes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `valor_total_bruto_cartoes` (
  `sum(valor)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `valor_total_bruto_outros`
--

DROP TABLE IF EXISTS `valor_total_bruto_outros`;
/*!50001 DROP VIEW IF EXISTS `valor_total_bruto_outros`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `valor_total_bruto_outros` (
  `sum(valor)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;