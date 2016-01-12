CREATE DATABASE  IF NOT EXISTS `testsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `testsystem`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: testsystem
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `ANSWER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUESTION_ID` int(11) DEFAULT NULL,
  `answertext` varchar(255) DEFAULT NULL,
  `correct` varchar(10) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`ANSWER_ID`),
  KEY `FKCD7DB875A9996637` (`QUESTION_ID`),
  CONSTRAINT `FKCD7DB875A9996637` FOREIGN KEY (`QUESTION_ID`) REFERENCES `questions` (`QUESTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (89,41,'111','0',0),(90,41,'147','1',1),(91,41,'81','0',0),(92,41,'Ошибка компиляции','0',0),(112,46,'Да, можно','0',0),(113,46,'Нет, нельзя','1',1),(119,50,'Добавить модификатор abstract','0',0),(120,50,'Добавить модификатор final','1',1),(121,50,'Добавить модификатор private','0',0),(122,50,'Не определять конструктор','0',0),(123,50,'Объявить все конструкторы класса private','1',1),(124,50,'Запретить наследование нельзя','0',0),(125,51,'Если при сравнении двух объектов метод equals возращает значение true, то значения, возвращаемые методами hashCode() этих объектов, должны совпадать.','1',1),(126,51,'Если при сравнении двух объектов метод equals возращает значение true, то значения, возвращаемые методами hashCode() этих объектов, могут не совпадать.','0',0),(127,51,'Если при сравнении двух объектов метод equals возращает значение false, то значения, возвращаемые методами hashCode() этих объектов, должны быть различными.','0',0),(128,51,'Если при сравнении двух объектов метод equals возращает значение false, то значения, возвращаемые методом hashCode() этих объектов, могут совпадать.','1',1),(129,51,'Ни одно из вышеперечисленных высказываний','0',0),(142,55,'ClassCastException','0',0),(143,55,'IndexOutOfBoundsException','0',0),(144,55,'OutOfMemoryError','1',1),(145,55,'NullPointerException','1',1),(146,55,'ArithmeticException','0',0),(147,55,'Ни один ответ не верный','0',0),(148,56,'class Pterodactyl extends Crawlable, Flyable{}','0',0),(149,56,'class Pterodactyl implements Crawlable, Flyable{}','1',1),(150,56,'class Pterodactyl extends Flyable implements Crawlable{}','0',0),(151,56,'class Pterodactyl extends Crawlable implements Flyable{}','0',0),(152,57,'class Man extends Dog { }','0',0),(153,57,'class Man implements Dog { }','0',0),(154,57,'class Man { private BestFriend dog; }','0',0),(155,57,'class Man { private Dog bestFriend; }','1',1),(156,57,'class Man { private Dog<BestFriend> instance; }','0',0),(157,57,'class Man { private BestFriend<Dog> instance; }','0',0),(158,58,'WHERE','0',0),(159,58,'HAVING','1',2),(160,58,'И WHERE, и HAVING','0',0),(161,58,'Ни одно из перечисленных','0',0),(162,59,'INSERT INTO students(id, first_name, last_name) VALUES (1, \'Name\', \'Surname\');','1',1),(163,59,'INSERT INTO students(id, first_name) VALUES (2, \'Name\');','0',0),(164,59,'INSERT INTO students VALUES (3, \'Name\', \'Surname\', NULL);','1',1),(165,59,'INSERT INTO students VALUES (4, NULL, \'Surname\', NULL);','0',0),(166,60,'нет','1',2),(167,61,'ListActivity','1',1),(168,61,'AliasActivity','1',1),(169,61,'LauncherActivity','1',1),(170,61,'PreferenceActivity','1',3),(171,61,'TabActivity','1',3),(172,62,'Intent','0',0),(173,62,'Message','1',1),(174,62,'Toast','0',0),(175,62,'Service','0',0),(176,63,'Ошибка компиляции','0',0),(177,63,' Ошибка времени выполнения','0',0),(178,63,'«Object»','0',0),(179,63,'«FileNotFoundException»','1',2),(180,63,'«IOException»','0',0),(181,64,'ArrayList<String> in; List<CharSequence> result;','0',0),(182,64,'List<String> in; List<Object> result;','0',0),(183,64,'ArrayList<String> in; List result;','1',3),(184,64,'List<CharSequence> in; List<CharSequence> result;','0',0),(185,64,'ArrayList<Object> in; List<CharSequence> result;','0',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `QUESTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `questiontext` varchar(1000) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `TEST_ID` int(11) DEFAULT NULL,
  `answers` tinyblob,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (41,'Что выведет на экран следующий код? \r\npublic class Test{ \r\n    public static void main(String[] args){     \r\n        char c1 = \'1\'; \r\n        char c2 = \'\\u0031\'; \r\n        char c3 = 49; \r\n        System.out.println(c1 + c2 + c3); \r\n    } \r\n} ','1',33,NULL,'one'),(46,'Можно ли динамически менять размер массива?','2',33,NULL,'one'),(50,'Каким образом можно запретить наследование класса (речь идет о top-level классах) ?','3',33,NULL,'many'),(51,'Выберите правильные высказывания относительно концепции взаимосвязи методов hashCode() и equals(Object o)','4',33,NULL,'many'),(55,'Какие исключения ПОТЕНЦИАЛЬНО могут возникнуть при присваивании одной переменной объектного типа, другой переменной ЛЮБОГО типа:\r\n\r\na = b;\r\n\r\nпри условии что компиляция прошла успешно.','1',35,NULL,'many'),(56,'Птицы летают, ящерицы ползают. А птеродактили и летают, и ползают. Что наиболее верно по отношению к этим утверждениям?','2',35,NULL,'one'),(57,'Какой из вариантов лучше описывает отношение ','3',35,NULL,'one'),(58,'Какое ключевое слово используется для фильтрации значений, полученных в результате применения агрегирующих функций в результатах запроса с использованием GROUP BY?','1',36,NULL,'one'),(59,'Дана таблица, созданная с помощью SQL-выражения:\r\n\r\nCREATE TABLE STUDENTS ( \r\n    ID INTEGER PRIMARY KEY, \r\n    FIRST_NAME VARCHAR(50) NOT NULL, \r\n    LAST_NAME VARCHAR(50) NOT NULL, \r\n    ADDRESS VARCHAR(100) \r\n) \r\n\r\nКакие запросы позволят добавить запись в эту таблицу?','2',36,NULL,'many'),(60,'Верно ли логически составлен следующий запрос:\r\n\r\n\r\nSELECT EMP_NAME, SUM(SAL) FROM EMPLOYEE;\r\n\r\nНапишите ДА или НЕТ\r\n','3',36,NULL,'open'),(61,'Какие из перечисленных ниже классов являются наследниками android.app.Activity?','1',37,NULL,'many'),(62,'Какой класс используется в Android для отображения пользователю\r\n небольшого всплывающего сообщения?','2',37,NULL,'one'),(63,'Имеется следующий код:\r\npublic class Overload{\r\n  public void method(Object o) {\r\n    System.out.println(','1',38,NULL,'one'),(64,'Дана сигнатура метода:\r\npublic static <E extends CharSequence> List<? super E> doIt(List<E> nums)\r\nКоторый вызывается как-то так:\r\nresult = doIt(in);\r\n\r\nКакого типа должны быть result и in?','2',38,NULL,'one');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `RESULT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_ID` int(11) DEFAULT NULL,
  `TEST_ID` int(11) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `max_result` varchar(45) DEFAULT NULL,
  `question_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`RESULT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (37,2,33,'1','1',NULL),(38,2,36,'3','6',NULL),(39,2,35,'1','4',1),(40,3,37,'10','10',NULL),(41,4,36,'1','6',NULL);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `TEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `ready` varchar(10) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TOPIC_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TEST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (33,'Java - Основы','Тест \"Java - Основы\" освещает следующие темы:\r\n    Общие вопросы\r\n    Синтаксис\r\n    Объекты и классы\r\n    Библиотека классов\r\n    Ход выполнения программы\r\n','true','learn',1,1),(35,'ООП в Java','В тесте встречаются вопросы по следующим темам:\r\n\r\n    Объекты и классы: вопросы этого раздела проверяют понимание таких понятий как класс, экземпляр класса, объект, примитивный тип, ссылка, передача параметров, состояние объекта и многих других.\r\n    Жизненный цикл объектов: данные вопросы посвящены конструированию объектов, конструкторам, инициализации объектов, доступности объектов и их уничтожению.\r\n    Ассоциации между объектами: вопросы данной тематики проверяют понимание зависимостей между объектами.\r\n    Инкапсуляция: вопросы освещают основной смысл инкапсуляции как одной из парадигм объекто-ориентированного программирования. Необходимо четко понимать, что такое сокрытие информации, что такое неизменяемые (immutable) объекты, поле класса и т.д.\r\n    Наследование: вопросы по иерархии классов, дочерним классам и классам-предкам, приведению типов.\r\n    UML диаграммы: вопросы по основам UML (в основном по диаграммам классов).\r\n','false','control',1,1),(36,'SQL - Основы','Все вопросы данного теста условно можно разделить на следующие группы:\r\n\r\n    Структура таблицы: эти вопросы покрывают такие понятия как таблица, колонка, индекс, первичные и внешние ключи. В этом разделе также рассматривается создание таблиц с помощью SQL;\r\n    Выборка данных (select): использование конструкций сравнения (in, like, between), агрегационных функций, и прочих ключевых слов и конструкций (distinct, group by, order by) в выборках из базы данных с помощью оператора select;\r\n    Выражения insert/update/delete: вопросы этой тематики посвящены манипуляциям данными в базах данных;\r\n    Другое: вопросы этой тематики проверяют знание терминологии, аббревиатур и т.д.\r\n','true','learn',1,6),(37,'Android','Тест можно поделить на такие темы:\r\n\r\n    Основные понятия\r\n    Классы и методы\r\n    Работа с данными\r\n    Работа с сетью\r\n    Аппаратное обеспечение\r\n    Интерфейс приложения\r\n','true','control',1,7),(38,'Java-Базовый','Решение большинства задач практически не требует знания API, достаточно логики и фундаментальных основ Java.','true','control',5,1);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Java'),(2,'Java EE'),(6,'Базы данных'),(7,'Android'),(8,'Python');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'vita','Vitaliya','Kozlova','vafelka13@mail.ru','ponypony',1,'1'),(2,'masha','Masha','Barashko','masha@gmail.com','12345678',1,'2'),(3,'Zhur','Дмитрий','Журов','zhur93@mail.ru','zhurzhur',1,'2'),(4,'Ira','Ирина','Селезнева','tsarok@gmail.com','ira',1,'2'),(5,'donatello1488','Валерий Иванович','Иванов','ivanov@gmail.com','1111',1,'1');
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

-- Dump completed on 2015-05-10 18:42:49
