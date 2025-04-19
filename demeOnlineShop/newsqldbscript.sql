-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshop
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `content` tinytext COLLATE utf8mb3_bin,
  `create_at` datetime(6) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `views` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (2,'Marketers One','This is blog1\'s content ohh mah goshh','2024-07-16 16:06:55.327445','/imagesUpload/446679942_1524024375130574_2441614366087368900_n.jpg',_binary '','blog 1','2024-07-25 18:01:23.122421',24),(3,'Marketers One','this is content of blog 2','2024-07-16 16:27:11.445489','/imagesUpload/trai tim.jpg',_binary '','blog 2 ',NULL,1),(4,'Marketers One','this is blog 3','2024-07-16 16:33:29.913868','/imagesUpload/5.jpg',_binary '','blog 3 ',NULL,0);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,1),(1,3),(2,4),(3,7),(7,8),(5,10),(6,12);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_product_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKf67ig6902so02qgbxfiufjmid` (`product_product_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKf67ig6902so02qgbxfiufjmid` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (89,1,1,NULL,1),(90,1,1,NULL,3);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `category_status` bit(1) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Hoa quả nhập khẩu ',_binary ''),(2,'Hoa quả nội địa ',_binary '');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  KEY `FKlf6f9q956mt144wiv6p1yko16` (`product_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKlf6f9q956mt144wiv6p1yko16` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (47,30,30,6),(48,30,30,7),(49,5,31,6),(50,30,31,7),(51,30,32,6),(52,30,32,7),(53,5,33,6),(54,30,33,7),(55,1,34,1),(56,19,35,6),(57,15,36,6),(58,15,37,7),(59,5,38,7),(60,1,39,2),(61,1,39,3),(62,5,40,6),(63,20,41,6),(64,20,42,6),(65,50,43,2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `delivery_person_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  KEY `FK5ux3vi13eppqkmqu507gh74j` (`delivery_person_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK5ux3vi13eppqkmqu507gh74j` FOREIGN KEY (`delivery_person_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (30,'2024-07-10 10:47:42.319000',3,'CANCELLED','Thanh Hoa','my customer2','0914913696',10),(31,'2024-07-10 10:48:10.320000',4,'PENDING','','my cus3','',10),(32,'2024-07-10 11:15:13.344000',3,'DELIVERING','Thanh Hoa','my customer2','0914913696',10),(33,'2024-07-10 11:15:55.950000',4,'PENDING','','my cus3','',10),(34,'2024-07-10 17:05:37.653000',3,'DELIVERED','Thanh Hoa','my customer2','0914913696',10),(35,'2024-07-11 08:28:42.926000',4,'CANCELLED','','my cus3','',10),(36,'2024-07-11 08:29:08.673000',3,'DELIVERED','Thanh Hoa','my customer2','0914913696',NULL),(37,'2024-07-11 08:32:52.596000',3,'DELIVERED','Thanh Hoa','my customer2','0914913696',NULL),(38,'2024-07-11 08:34:18.975000',3,'DELIVERED','Thanh Hoa','my customer2','0914913696',NULL),(39,'2024-07-11 10:34:17.614000',3,'DELIVERING','Thanh Hoa','my customer2','0914913696',13),(40,'2024-07-11 16:06:09.082000',3,'DELIVERING','Thanh Hoa','my customer2','0914913696',10),(41,'2024-07-11 16:07:57.966000',3,'DELIVERING','Thanh Hoa','my customer2','0914913696',10),(42,'2024-07-11 16:08:13.733000',3,'PENDING','Thanh Hoa','my customer2','0914913696',NULL),(43,'2024-07-12 16:05:22.109000',3,'DELIVERED','Thanh Hoa','my customer2','0914913696',13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_description` text COLLATE utf8mb3_bin,
  `product_image` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  `product_status` bit(1) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'1. Thời vụMùa vụ từ Tháng 3 – Tháng 82. Thông tin sản phầmMàu sắc: Táo Dazzle New Zealand có vỏ căng mịn, đỏ sậm, có vân nhẹ, đôi lúc có pha sắc vàng.Vị đặc trưng: Táo giòn, có vị ngọt xen kẽ vị chua nhẹ, thịt táo dày 3. Tính chất đặc điểmTáo Dazzle có nhiều vitamin A, C, canxi, sắt, cùng với pectin, và những chất tốt cho hệ tiêu hóa.Trung bình một quả táo cung cấp cho cơ...','https://product.hstatic.net/200000863755/product/5_44674fe1aa5246d8928ea491065ba067_large.png','Táo DAZZLE NZL Size L',145000,11,_binary '',1),(2,'1. Thời vụ nho đen Nam PhiMùa vụ của nó bắt đầu từ tháng 1 đến tháng 5 hàng năm.2. Thông tin sản phầmThuộc  giống  sweet joy quả thuôn dài,  nhiều nước,  ăn rất giòn và ngọt thanh. 3. Tính chất đặc điểmTrong nho đen chiếm 75-85% là nước,100g nho đen Nam Phi cung cấp cho con người đến 210 kcal để có những hoạt động ngày dài.Vỏ nho chứa hàm lượng resveratrol - chất chống oxy hóa cực mạnh. Giúp...','https://product.hstatic.net/200000863755/product/4_703f51b102204d00a9b330b89aa7417f_large.png','Nho Đen Không Hạt Sweet Joy - Nam Phi',215000,1170,_binary '',2),(3,'1. Thời vụ Nho xanh Úc có mùa vụ từ tháng 1 đến tháng 6 hàng năm, có thể dao động do thời tiết 2. Thông tin sản phầmCó hình dáng thuôn dài, màu xanh phổ biến bắt mắtChắc chùm, cuống  xanh tươi, chắc quảVị  ngọt mát, có vị thơm khi ăn, không hạt và giòn tan3. Tính chất đặc điểmNho xanh không hạt là kho dinh dưỡng đáng nể với đa dạng các thành phần: vitamin C, A, chất chống oxy...','https://product.hstatic.net/200000863755/product/1_9f8a7a626c4e4baeb9c634d186f3f5e1_large.png','Nho Xanh Không Hạt Autumn Crisp Úc',225000,1164,_binary '',1),(4,'1. Thông tin sản phầmCam Navel ruột vàng Mỹ vỏ màu vàng, ruột màu vàng đậm, vị ngọt thanh, không hạt, mọng nướcQuả tròn đều, Phần cuống trái đặc trưng có hình dạng như cái rốnMỗi trái có thể nặng từ 300gr đến 400gr2. Tính chất đặc điểmCam cung cấp 140% vitamin C và 6% vitamin A cần thiết một ngày cho cơ thể. Vitamin C là một chất chống oxy hóa quan trọng bảo vệ tế bào khỏi hư...','https://product.hstatic.net/200000863755/product/6_ccd42fa43e724be89ee30a64dbac5ff6_large.png','Cam Ruột Vàng Air Chief Mỹ',95000,700,_binary '',1),(5,'1. Thời vụ Lê Nam PhiLê Nam Phi có mùa vụ từ tháng 4 đến tháng 9 dương lịch2. Thông tin sản phầm- Lê có tác dụng hạ huyết áp, bệnh tim, chữa chứng hoa mắt, chóng mặt, ù tai, tim đập nhanh có thể dẫn đến loạn nhịp. Trái Lê chứa nhiều chất dinh dưỡng tốt cho thai nghén, bao gồm axit folic. Lê là một trong những loại trái cây tốt cho bà bầu. Ngoài ra, lê còn chứa...','https://product.hstatic.net/200000863755/product/anh_web__2__d99dac79d2684307a4e692da31b4c2f7_large.png','Lê Má Hồng Nam Phi',99000,800,_binary '',1),(6,'1. Thông tin sản phầmKiwi vàng là giống kiwi lai tạo có màu nâu vàng trơn nhẵn, thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành 1 vòng tròn xung quanh trục dọc của quả.Ăn rất thơm và khi chín sẽ ngọt.2. Tính chất đặc điểmKiwi thường được mệnh danh là “nữ hoàng” vitamin C. Bởi chỉ cần một quả kiwi mỗi ngày là chúng ta đã cung cấp đủ lượng vitamin C cần thiết cho...','https://product.hstatic.net/200000863755/product/15_953f6b5a6b044cd498b12039a982e295_large.png','Kiwi Ruột Vàng Newzealand',195000,5,_binary '',1),(7,'1. Thời vụ Cherry đỏ Mỹ Từ tháng 5 đến giữa cuối tháng 82. Thông tin sản phầm- Cải thiện chức năng não bộ: cherry là \" thực phẩm cho não’’ do chứa chất oxy hoá mạnh. Cải thiện tình trạng mất ngủ, giúp ngủ ngon hơn nhờ hooc-mon melatonin.- Cung cấp hàm lượng calo cao giúp ổn định tinh thần, thúc đẩy tâm trạng vui vẻ, tốt hơn.- Cherry rất tốt cho mắt do chứa carotene và retinol cùng vitamin cao gấp 10 lần...','https://product.hstatic.net/200000863755/product/7_9a84c1913c3344afa886c1c1be25b6e6_large.png','Cherry Đỏ Mỹ S10',300000,0,_binary '',1),(8,'1. Thời vụ Cherry đỏ Mỹ Từ tháng 5 đến giữa cuối tháng 82. Thông tin sản phầm- Cải thiện chức năng não bộ: cherry là \" thực phẩm cho não’’ do chứa chất oxy hoá mạnh. Cải thiện tình trạng mất ngủ, giúp ngủ ngon hơn nhờ hooc-mon melatonin.- Cung cấp hàm lượng calo cao giúp ổn định tinh thần, thúc đẩy tâm trạng vui vẻ, tốt hơn.- Cherry rất tốt cho mắt do chứa carotene và retinol cùng vitamin cao gấp 10 lần...','https://product.hstatic.net/200000863755/product/1_54818d23210941f3bed8521484330cd8_large.png','Cherry Đỏ Mỹ S9.5',450000,659,_binary '',1),(9,'1. Thông tin sản phầmKiwi vàng là giống kiwi lai tạo có màu nâu vàng trơn nhẵn, thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành 1 vòng tròn xung quanh trục dọc của quả.Ăn rất thơm và khi chín sẽ ngọt.2. Tính chất đặc điểmKiwi thường được mệnh danh là “nữ hoàng” vitamin C. Bởi chỉ cần một quả kiwi mỗi ngày là chúng ta đã cung cấp đủ lượng vitamin C cần thiết cho...','https://product.hstatic.net/200000863755/product/thiet_ke_chua_co_ten__5__7180f463d6cd4a17ab02618e9bba60f6_large.jpg','Kiwi Ruột Vàng Organic NZL',200000,799,_binary '',1),(10,'1. Thời vụMùa vụ từ tháng 5 – tháng 12    2. Thông tin sản phầmTáo xanh Mỹ vẻ ngoài có màu xanh bóng bẩy đẹp mắtQuả to cầm chắc tay, size sẽ nhỏ hơn táo xanh NewZealand Táo giòn, thịt trắng, có vị chua nhẹ rất đặc trưngThích hợp ăn kèm với muối ớt - một sự kết hợp tuyệt vời3. Tính chất đặc điểmVới thành phần vô cùng giàu vitamin E và C, loại trái cây này rất tốt để...','https://product.hstatic.net/200000863755/product/1_cbf5557cc3084241a933bddbb855fe61_large.png','Táo Xanh Mỹ',99000,668,_binary '',2),(11,'1. Thông tin sản phầmTáo Envy NewZeland có hình thức rất đẹp, quả to tròn, rất chắc, vỏ quả có màu đỏ xen lẫn sọc vàng rất bắt mắt và sang trọng.Táo Envy NewZeland được đánh giá là giống táo cao cấp nhất trên thị trường hiện nay, phần thịt màu vàng kem, độ giòn rất cao, vị ngọt đậm đà khi xuống đến cổ họng vẫn để lại mùi thơm dịu nhẹ.2. Tính chất đặc điểmTrong 1 quả táo...','https://product.hstatic.net/200000863755/product/thiet_ke_chua_co_ten__5__f805943a4e414422b630fde33aa64792_large.png','TÁO ENVY NEWZEALAND SIZE L (17.5kg)',175000,776,_binary '',2),(12,'1. Thông tin sản phầmĐây là giống nho không hạt, quả dài, vỏ mọng , màu đen đậm, có lớp phấn phủ tự nhiên trên quả, Vỏ mỏng có vị ngọt đậm, ăn rất thơm, và chắc thịt.2. Tính chất đặc điểmCung cấp nhiều chất oxy hóa tốt cho tim mạch và người huyết áp cao.Vỏ nho có nhiều chất tốt cho sức khỏe, tăng cường sức đề kháng, chống lão hóa, có tác dụng thải độc tố.3. Hướng dẫn bảo...','https://product.hstatic.net/200000863755/product/2_2b2f4ce9b06e41e796174f3d817eb10b_large.png','Nho Đen Ngón Tay ÚC',185000,500,_binary '',1),(13,'1. Thông tin sản phầmDưa có  hình dạng thuôn dài với lớp vỏ màu xanh sần sùi và những đường gân vàng Phần ruột bên trong có lớp thịt màu cam mọng nước, hạt nhỏ hình bầu dục màu kem. Điểm đặc biệt của chúng là phần thịt chắc, giòn tan, độ ngọt cao và mọng nước đi kèm với hương thơm ngào ngạt đặc trưng, được giải phóng khi quả đạt độ chín cao nhất.2. Tính chất đặc điểmDưa lưới chứa...','https://product.hstatic.net/200000863755/product/4_b4fc52cc4760483cabd8fb05d6d37852_large.png','Dưa Lưới Giống Đài (TQ)',99000,599,_binary '',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_CUSTOMER'),(5,'ROLE_DELIVER'),(3,'ROLE_MARKETERS'),(4,'ROLE_SALER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `address` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `user_status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','$2a$10$L1uGcSe22Pr.U/gsVZyIueg99RTQjZDEp1dDHzJuaa87OkkFI3xwC','mai  hoang ',NULL,'/imagesUpload/razeFxlDN22aIAAq653.jpg',NULL,_binary ''),(2,'admin2@gmail.com','$2a$10$TH/tyna3qT1cM6eiFlRKJuk.G6wJArCD1DT.iIiXg4kgDNzXIsKYS','le  tu ',NULL,NULL,NULL,_binary ''),(3,'cus2@gmail.com','$2a$10$OlLj.5gFvaz5VG0pKRHSaelgtqjcY5AWgl7CpQ8AqKsYV484Euh3a','my customer2','Thanh Hoa','/imagesUpload/razeFxlDN22aIAAq653.jpg','0914913696',_binary ''),(4,'cus3@gmail.com','$2a$10$wMgodQnEpKrBV3ZfZsFpwucxCeRG0sEk8aoRyORvzyVLa.FrtWPu.','my cus3',NULL,'/imagesUpload/FzqpKQzaMAAbrWs.jpg',NULL,_binary ''),(5,'cus4@gmail.com','$2a$10$i5Hn..nGPTK3F2IR3jwN6O1prGYU3aOryyPZL6vvzqhYRPVpl/SLi','my cus4',NULL,NULL,NULL,_binary ''),(6,'cus5@gmail.com','$2a$10$b7fN.xOSPWY7ajyE3gCp3ezM5Rlyl4A6pK2vn7eqUYhgd22iQZA5G','my cus5',NULL,NULL,NULL,_binary ''),(7,'maihuyhoang0703@gmail.com','$2a$10$.XEKRWVmknZHD5EhPbMjAempPkSa9JdyuRdDY4GCteyJzCLXecyse','Mai Huy  Hoàng',NULL,NULL,NULL,_binary '\0'),(8,'marketers1@gmail.com','$2a$10$YePiOT4xN.XfuQISlxF3AOjiIBhxrZkbli4qZBYo78ckXRWYAFCBq','Marketers One',NULL,'/imagesUpload/trai tim.jpg',NULL,_binary ''),(10,'deliver1@gmail.com','$2a$10$2ognFvpXpUSoKFUdjN/wd.bO6bijyau.G1kMkqoXovbc/Pja0YEPW','Nguoi Giao Hang 1',NULL,NULL,NULL,_binary ''),(11,'salerxx@gmail.com','$2a$10$oWPTJC8DjYjooiCPGH0e8.pbISpF.r56O/cOWI2g7.tKfn2ERNBDK','The Saler xx',NULL,NULL,NULL,_binary '\0'),(12,'saler1@gmail.com','$2a$10$22C9gmlo0ECAPzW2Agu0w.PQ63x823W.HLp34Gm3TilkkNCiBhgcW','The  Saler 1',NULL,NULL,NULL,_binary ''),(13,'deliver2@gmail.com','$2a$10$lwcsIKl2XRnEvgrs6dMzyeZgMtBJtzWbUrUxGyXne982VoTrzyqdG','NGUOI GIAO  HANG 2',NULL,NULL,NULL,_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(3,2),(4,2),(5,2),(6,2),(7,2),(8,3),(10,5),(11,2),(12,4),(13,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-19 16:41:25
