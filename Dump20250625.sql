-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `nakladnaya`
--

DROP TABLE IF EXISTS `nakladnaya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nakladnaya` (
  `idnakladnaya` int NOT NULL,
  `kod_tovara` varchar(255) NOT NULL,
  `kod_provider` varchar(255) NOT NULL,
  `kod_sotrydnika` varchar(255) NOT NULL,
  `Date of manufacture` varchar(255) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `Number of productsl` varchar(255) NOT NULL,
  `tovar_idtovar` int NOT NULL,
  `postavka_idpostavka` int NOT NULL,
  `sotrydniki_idsotrydniki` int NOT NULL,
  PRIMARY KEY (`idnakladnaya`,`tovar_idtovar`,`postavka_idpostavka`,`sotrydniki_idsotrydniki`),
  KEY `fk_nakladnaya_tovar1_idx` (`tovar_idtovar`),
  KEY `fk_nakladnaya_postavka1_idx` (`postavka_idpostavka`),
  KEY `fk_nakladnaya_sotrydniki1_idx` (`sotrydniki_idsotrydniki`),
  CONSTRAINT `fk_nakladnaya_postavka1` FOREIGN KEY (`postavka_idpostavka`) REFERENCES `postavka` (`idpostavka`),
  CONSTRAINT `fk_nakladnaya_sotrydniki1` FOREIGN KEY (`sotrydniki_idsotrydniki`) REFERENCES `sotrydniki` (`idsotrydniki`),
  CONSTRAINT `fk_nakladnaya_tovar1` FOREIGN KEY (`tovar_idtovar`) REFERENCES `tovar` (`idtovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nakladnaya`
--

LOCK TABLES `nakladnaya` WRITE;
/*!40000 ALTER TABLE `nakladnaya` DISABLE KEYS */;
INSERT INTO `nakladnaya` VALUES (1001,'T-001','P-001','S-001','2025-06-24','1500','100',1,1,1),(1002,'T-456','P-789','S-890','2025-06-24','1800','80',2,2,2),(1003,'T-003','P-003','S-003','2025-06-26','1900','60',3,3,3);
/*!40000 ALTER TABLE `nakladnaya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postavka`
--

DROP TABLE IF EXISTS `postavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postavka` (
  `idpostavka` int NOT NULL,
  `name_postavka` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `telephon` varchar(255) NOT NULL,
  PRIMARY KEY (`idpostavka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postavka`
--

LOCK TABLES `postavka` WRITE;
/*!40000 ALTER TABLE `postavka` DISABLE KEYS */;
INSERT INTO `postavka` VALUES (1,'Поставщик АО Ромашка','г. Москва, ул. Примерная, д.10','+7 (495) 123-45-67'),(2,'ООО Новый поставщик','г. Санкт-Петербург, ул. Невская, д. 10','+7-911-123-45-67'),(3,'Поставщик АО Ромашка','г. Москва, ул. Примерная, д.15','+7 (495) 123-65-67');
/*!40000 ALTER TABLE `postavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `idsklad` int NOT NULL,
  `kod_nakladnoi` varchar(255) NOT NULL,
  `current quantity` varchar(255) NOT NULL,
  `nakladnaya_idnakladnaya` int NOT NULL,
  `nakladnaya_tovar_idtovar` int NOT NULL,
  `nakladnaya_postavka_idpostavka` int NOT NULL,
  PRIMARY KEY (`idsklad`,`nakladnaya_idnakladnaya`,`nakladnaya_tovar_idtovar`,`nakladnaya_postavka_idpostavka`),
  KEY `fk_sklad_nakladnaya1_idx` (`nakladnaya_idnakladnaya`,`nakladnaya_tovar_idtovar`,`nakladnaya_postavka_idpostavka`),
  CONSTRAINT `fk_sklad_nakladnaya1` FOREIGN KEY (`nakladnaya_idnakladnaya`, `nakladnaya_tovar_idtovar`, `nakladnaya_postavka_idpostavka`) REFERENCES `nakladnaya` (`idnakladnaya`, `tovar_idtovar`, `postavka_idpostavka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
INSERT INTO `sklad` VALUES (1,'NK-1001','86',1001,1,1),(2,'NK-1002','80',1002,2,2);
/*!40000 ALTER TABLE `sklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sklad_tovar_view`
--

DROP TABLE IF EXISTS `sklad_tovar_view`;
/*!50001 DROP VIEW IF EXISTS `sklad_tovar_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sklad_tovar_view` AS SELECT 
 1 AS `idsklad`,
 1 AS `kod_tovara`,
 1 AS `name_tovar`,
 1 AS `current quantity`,
 1 AS `cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sotrydniki`
--

DROP TABLE IF EXISTS `sotrydniki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sotrydniki` (
  `idsotrydniki` int NOT NULL,
  `post` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Middle name` varchar(255) NOT NULL,
  PRIMARY KEY (`idsotrydniki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sotrydniki`
--

LOCK TABLES `sotrydniki` WRITE;
/*!40000 ALTER TABLE `sotrydniki` DISABLE KEYS */;
INSERT INTO `sotrydniki` VALUES (1,'Администратор','Иванов','Алексей','Петрович'),(2,'Кладовщик','Петрова','Мария','Игоревна'),(3,'Кассир','Сидоров','Дмитрий','Алексеевич');
/*!40000 ALTER TABLE `sotrydniki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torgovlya`
--

DROP TABLE IF EXISTS `torgovlya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torgovlya` (
  `idtorgovlya` int NOT NULL,
  `kod_tovara` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `Number of sales` varchar(255) NOT NULL,
  `sklad_idsklad` int NOT NULL,
  PRIMARY KEY (`idtorgovlya`,`sklad_idsklad`),
  KEY `fk_torgovlya_sklad1_idx` (`sklad_idsklad`),
  CONSTRAINT `fk_torgovlya_sklad1` FOREIGN KEY (`sklad_idsklad`) REFERENCES `sklad` (`idsklad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torgovlya`
--

LOCK TABLES `torgovlya` WRITE;
/*!40000 ALTER TABLE `torgovlya` DISABLE KEYS */;
/*!40000 ALTER TABLE `torgovlya` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_insert_torgovlya` AFTER INSERT ON `torgovlya` FOR EACH ROW BEGIN
  INSERT INTO `mydb`.`torgovlya_log` (`message`)
  VALUES (CONCAT('Продажа товара с кодом ', NEW.kod_tovara, ' зарегистрирована.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tovar`
--

DROP TABLE IF EXISTS `tovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tovar` (
  `idtovar` int NOT NULL,
  `name_tovar` varchar(255) NOT NULL,
  `srok_tovar` varchar(255) NOT NULL,
  `yslovie_tovar` varchar(255) NOT NULL,
  PRIMARY KEY (`idtovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovar`
--

LOCK TABLES `tovar` WRITE;
/*!40000 ALTER TABLE `tovar` DISABLE KEYS */;
INSERT INTO `tovar` VALUES (1,'Молоко 3.2%','7 дней','Хранить при температуре от +2 до +6°C'),(2,'Молоко','7 дней','Хранить в холодильнике'),(3,'Бананы','13 дней','Хранить при температуре от 0 до +10°C');
/*!40000 ALTER TABLE `tovar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `get_existing_full_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_existing_full_name`(
  p_surname VARCHAR(255),
  p_name VARCHAR(255),
  p_middlename VARCHAR(255)
) RETURNS varchar(765) CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(765);

  -- Получаем ФИО
  SELECT CONCAT(surname, ' ', name, ' ', `Middle name`)
  INTO result
  FROM mydb.sotrydniki
  WHERE surname = p_surname AND name = p_name AND `Middle name` = p_middlename
  LIMIT 1;

  -- Если сотрудник не найден, возвращаем сообщение
  IF result IS NULL THEN
    RETURN 'Ошибка: сотрудник с таким ФИО не найден';
  END IF;

  RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_tovar_name_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_tovar_name_by_id`(p_idtovar INT) RETURNS varchar(255) CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE tovar_name VARCHAR(255) DEFAULT NULL;

  -- Пытаемся найти имя товара
  SELECT name_tovar INTO tovar_name
  FROM mydb.tovar
  WHERE idtovar = p_idtovar
  LIMIT 1;

  -- Если товар не найден — возвращаем текст ошибки
  IF tovar_name IS NULL THEN
    RETURN 'Ошибка: товар с таким ID не найден';
  ELSE
    RETURN tovar_name;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sell_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sell_product`(
    IN p_sklad_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE current_qty INT DEFAULT NULL;

    -- Получаем текущее количество
    SELECT CAST(`current quantity` AS UNSIGNED)
    INTO current_qty
    FROM mydb.sklad
    WHERE idsklad = p_sklad_id;

    -- Проверка существования склада
    IF current_qty IS NULL THEN
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Склад с таким ID не найден';
    END IF;

    -- Проверка наличия достаточного количества
    IF current_qty < p_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Недостаточно товара на складе';
    END IF;

    -- Если дошли до сюда — товар есть, выводим сообщение
    SELECT 'Найдено' AS status_message;

    -- Обновляем количество
    UPDATE mydb.sklad
    SET `current quantity` = CAST(current_qty - p_quantity AS CHAR)
    WHERE idsklad = p_sklad_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `sklad_tovar_view`
--

/*!50001 DROP VIEW IF EXISTS `sklad_tovar_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sklad_tovar_view` AS select `s`.`idsklad` AS `idsklad`,`n`.`kod_tovara` AS `kod_tovara`,`t`.`name_tovar` AS `name_tovar`,`s`.`current quantity` AS `current quantity`,`n`.`cost` AS `cost` from ((`sklad` `s` join `nakladnaya` `n` on(((`s`.`nakladnaya_idnakladnaya` = `n`.`idnakladnaya`) and (`s`.`nakladnaya_tovar_idtovar` = `n`.`tovar_idtovar`) and (`s`.`nakladnaya_postavka_idpostavka` = `n`.`postavka_idpostavka`)))) join `tovar` `t` on((`n`.`tovar_idtovar` = `t`.`idtovar`))) */;
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

-- Dump completed on 2025-06-25  3:39:41
