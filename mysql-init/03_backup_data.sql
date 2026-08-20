-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: kh_department
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'ครัวเปิดสอนรายสัปดาห์ & การถ่ายทำสื่อ','อาหาร','images/123.png','2026-08-20 07:42:37'),(2,'การแปรรูป & บรรจุภัณฑ์ขนมไทย','อาหาร','images/213.png','2026-08-20 07:42:37'),(3,'การฝึกปฏิบัติงานโภชนาการ','อาหาร','images/111.png','2026-08-20 07:42:37'),(4,'การจัดเตรียม & คุมคุณภาพอาหาร','อาหาร','images/222.png','2026-08-20 07:42:37'),(5,'การสร้างสรรค์เมนู & ทำงานทีม','อาหาร','images/231.png','2026-08-20 07:42:37'),(6,'ศิลปะการจัดดอกไม้ & งานประดิษฐ์','งานประดิษฐ์','images/f321.png','2026-08-20 07:42:37');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_stats`
--

DROP TABLE IF EXISTS `department_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stat_key` varchar(50) NOT NULL,
  `stat_name` varchar(100) NOT NULL,
  `stat_value` int NOT NULL,
  `unit` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_key` (`stat_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_stats`
--

LOCK TABLES `department_stats` WRITE;
/*!40000 ALTER TABLE `department_stats` DISABLE KEYS */;
INSERT INTO `department_stats` VALUES (1,'students','นักเรียนปัจจุบัน',500,'+'),(2,'years','ปีที่ก่อตั้งแผนก',25,'+'),(3,'awards','รางวัลที่ได้รับ',30,'+'),(4,'employment_rate','% มีงาน/เรียนต่อ',95,'%');
/*!40000 ALTER TABLE `department_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'แผนกคหกรรมศาสตร์','แผนกคหกรรมศาสตร์ — คิดครัว ปักฝัน','2026-08-20 07:42:37');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text,
  `category` varchar(100) DEFAULT 'à¸—à¸±à¹ˆà¸§à¹„à¸›',
  `pin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'เปิดรับสมัครนักเรียนใหม่ ปีการศึกษา 2568','แผนกคหกรรมเปิดรับสมัครนักเรียนใหม่ประจำปีการศึกษา 2568 ตั้งแต่บัดนี้ถึงวันที่ 30 กันยายน 2568 สามารถสมัครได้ทางออนไลน์หรือที่แผนกโดยตรง','ประกาศสำคัญ',1,'2026-07-20 08:00:00'),(3,'เปิดโครงการครัวชุมชน บริการอาหารราคาประหยัดแก่ชุมชน','นักเรียนแผนกคหกรรมออกบริการชุมชน จัดทำอาหารกลางวันสำหรับผู้สูงอายุในชุมชนใกล้เคียง ทุกวันศุกร์ตลอดเดือนสิงหาคม','กิจกรรม',0,'2026-08-05 08:30:00'),(4,'เชิญชวนร่วมงานนิทรรศการผ้าและแฟชั่น ประจำปี 2568','จัดแสดงผลงานนักเรียนสาขาผ้าและเครื่องแต่งกาย พบกับคอลเลกชันพิเศษที่สร้างสรรค์โดยนักเรียนทุกชั้นปี','กิจกรรม',0,'2026-08-04 09:00:00'),(5,'อบรมเชิงปฏิบัติการ ดอกไม้สดสำหรับงานมงคล','เรียนรู้เทคนิคการจัดดอกไม้สำหรับงานมงคลต่างๆ จากผู้เชี่ยวชาญ เปิดรับสมัครบัดนี้ถึง 20 สิงหาคม 2568','อบรม',0,'2026-08-01 09:00:00'),(6,'ประกาศตารางสอบปลายภาค 2/2567','ประกาศตารางสอบปลายภาคเรียนที่ 2 ปีการศึกษา 2567 นักเรียนสามารถตรวจสอบรายละเอียดได้ที่ประกาศนียบัตรแผนก','ประกาศ',0,'2026-08-03 13:00:00');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_content`
--

DROP TABLE IF EXISTS `site_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_content` (
  `id` int NOT NULL DEFAULT '1',
  `content_json` longtext NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_content`
--

LOCK TABLES `site_content` WRITE;
/*!40000 ALTER TABLE `site_content` DISABLE KEYS */;
INSERT INTO `site_content` VALUES (1,'{\"hero-eyebrow\": \"แผนกคหกรรม · House of Craft\", \"nav-brand\": \"แผนกคหกรรม\", \"hero-h1\": \"เรียนรู็กาารเข้าครัว\", \"hero-desc\": \"พื้นที่ที่เปลี่ยนทุกไอเดียให้กลายเป็นอาหารอร่อย งานปักฝีมือ ดอกไม้จัดวางอย่างประณีต และบ้านที่อบอุ่น — ผ่านการลงมือทำจริงทุกวัน\", \"hero-cta1\": \"ดูสาขาที่เปิดสอน\", \"hero-cta1-href\": \"#tracks\", \"hero-cta2\": \"ชมผลงานนักเรียน →\", \"hero-cta2-href\": \"#gallery\", \"hero-scroll\": \"เลื่อนดูชั้นวางไอเดีย\", \"intro-eyebrow\": \"เกี่ยวกับแผนก\", \"intro-h2\": \"ห้องเรียนที่มีกลิ่นอาหาร เสียงจักร และรอยยิ้ม\", \"intro-body\": \"แผนกคหกรรมสอนให้นักเรียนลงมือทำจริง ตั้งแต่หั่น ผัด ปัก จนถึงจัดดอกไม้และดูแลบ้าน โดยผสานความรู้ทางวิทยาศาสตร์อาหาร ศิลปะการออกแบบ และการจัดการ เข้ากับความอดทนและความประณีตที่ฝึกฝนได้ในทุกคาบเรียน\", \"intro-chip1\": \"ลงมือทำจริงทุกสัปดาห์\", \"intro-chip2\": \"ครูผู้เชี่ยวชาญเฉพาะทาง\", \"intro-chip3\": \"ต่อยอดสู่อาชีพได้จริง\", \"intro-img-caption\": \"บรรยากาศการเรียนสาธิตการทำอาหารจริง\", \"tracks-eyebrow\": \"สาขาที่เรียน\", \"tracks-h2\": \"สี่เส้นทาง หนึ่งความตั้งใจ\", \"tracks-desc\": \"เลือกเส้นทางที่ใช่ แล้วฝึกฝนอย่างจริงจัง — ชี้เมาส์ หรือแตะการ์ด เพื่อดูรายละเอียดของแต่ละสาขา\", \"gallery-eyebrow\": \"กิจกรรมเด่น\", \"gallery-h2\": \"ทุกผลงาน เริ่มจากมือของนักเรียน\", \"gallery-desc\": \"ภาพบรรยากาศการเรียนการสอนจริงและการฝึกปฏิบัติตามมาตรฐานวิชาชีพ\", \"footer-brand\": \"แผนกคหกรรม\", \"footer-slogan\": \"คิดครัว ปักฝัน · House of Craft\", \"footer-phone\": \"000-000-0000\", \"footer-email\": \"contact@example.ac.th\", \"footer-addr1\": \"ถนนตัวอย่าง แขวงตัวอย่าง\", \"footer-addr2\": \"กรุงเทพมหานคร\", \"cta-eyebrow\": \"พร้อมหรือยัง\", \"cta-h2\": \"มาเย็บฝันของคุณไปกับเรา\", \"cta-desc\": \"สมัครเรียนแผนกคหกรรม แล้วเริ่มลงมือทำในสิ่งที่คุณรักตั้งแต่วันแรก\", \"cta-btn\": \"สมัครเรียนเลย\", \"cta-href\": \"#\", \"nav-cta-btn\": \"สมัครเรียน\", \"tracks\": [{\"num\": \"01\", \"front\": \"อาหารและโภชนาการ\", \"eyebrow\": \"Food & Nutrition\", \"back\": \"ฝึกปรุงอาหารไทยและนานาชาติ ถนอมอาหาร และวางแผนโภชนาการเพื่อสุขภาพที่ดี\"}, {\"num\": \"02\", \"front\": \"ผ้าและเครื่องแต่งกาย\", \"eyebrow\": \"Textile & Fashion\", \"back\": \"เรียนตัดเย็บ ออกแบบลาย ปักผ้า และสร้างสรรค์เครื่องแต่งกายตั้งแต่แบบร่างจนถึงตัวจริง\"}, {\"num\": \"03\", \"front\": \"งานประดิษฐ์และดอกไม้\", \"eyebrow\": \"Crafts & Floral Design\", \"back\": \"ฝึกจัดดอกไม้ งานฝีมือ และประดิษฐ์ของใช้จากวัสดุเหลือใช้อย่างสร้างสรรค์\"}, {\"num\": \"04\", \"front\": \"การจัดการบ้านและครอบครัว\", \"eyebrow\": \"Home & Family Management\", \"back\": \"เรียนรู้การดูแลบ้าน จัดการงบประมาณครัวเรือน และความเข้าใจด้านครอบครัว\"}], \"gallery_tags\": [\"🍳 ครัวเปิดสอนรายสัปดาห์ & สื่อ\", \"🥧 การแปรรูป & บรรจุภัณฑ์ขนมไทย\", \"👩‍🍳 การฝึกปฏิบัติงานโภชนาการ\", \"🍱 การจัดเตรียม & คุมคุณภาพอาหาร\", \"💡 การสร้างสรรค์เมนู & ทำงานทีม\", \"💐 ศิลปะการจัดดอกไม้ & งานประดิษฐ์\"], \"stats\": [{\"target\": \"500\", \"suffix\": \"+\", \"label\": \"นักเรียนปัจจุบัน\"}, {\"target\": \"25\", \"suffix\": \"+\", \"label\": \"ปีที่ก่อตั้งแผนก\"}, {\"target\": \"30\", \"suffix\": \"+\", \"label\": \"รางวัลที่ได้รับ\"}, {\"target\": \"95\", \"suffix\": \"%\", \"label\": \"มีงาน/เรียนต่อ\"}], \"nav_links\": [{\"text\": \"เกี่ยวกับแผนก\", \"href\": \"#intro\"}, {\"text\": \"สาขาที่เรียน\", \"href\": \"#tracks\"}, {\"text\": \"กิจกรรม\", \"href\": \"#gallery\"}, {\"text\": \"ข่าวสาร\", \"href\": \"#news\"}, {\"text\": \"ติดต่อ\", \"href\": \"#contact\"}]}','2026-08-20 07:08:53');
/*!40000 ALTER TABLE `site_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_applications`
--

DROP TABLE IF EXISTS `student_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `student_applications_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_applications`
--

LOCK TABLES `student_applications` WRITE;
/*!40000 ALTER TABLE `student_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track_code` varchar(20) NOT NULL,
  `title_th` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `track_code` (`track_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'01','อาหารและโภชนาการ','Food & Nutrition','ฝึกปรุงอาหารไทยและนานาชาติ ถนอมอาหาร และวางแผนโภชนาการเพื่อสุขภาพที่ดี','2026-08-20 07:42:37'),(2,'02','ผ้าและเครื่องแต่งกาย','Textile & Fashion','เรียนตัดเย็บ ออกแบบลาย ปักผ้า และสร้างสรรค์เครื่องแต่งกายตั้งแต่แบบร่างจนถึงตัวจริง','2026-08-20 07:42:37'),(3,'03','งานประดิษฐ์และดอกไม้','Crafts & Floral Design','ฝึกจัดดอกไม้ งานฝีมือ และประดิษฐ์ของใช้จากวัสดุเหลือใช้อย่างสร้างสรรค์','2026-08-20 07:42:37'),(4,'04','การจัดการบ้านและครอบครัว','Home & Family Management','เรียนรู้การดูแลบ้าน จัดการงบประมาณครัวเรือน และความเข้าใจด้านครอบครัว','2026-08-20 07:42:37');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-20  7:42:48
