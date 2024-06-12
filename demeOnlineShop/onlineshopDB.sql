CREATE DATABASE  IF NOT EXISTS `onlineshopspringboot` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `onlineshopspringboot`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshopspringboot
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cartid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4teld0nibbe4l2rucr2yybw2e` (`cartid`),
  KEY `FK9pw5b35944xvbr3h8avlakscl` (`productid`),
  CONSTRAINT `FK4teld0nibbe4l2rucr2yybw2e` FOREIGN KEY (`cartid`) REFERENCES `cart` (`cartid`),
  CONSTRAINT `FK9pw5b35944xvbr3h8avlakscl` FOREIGN KEY (`productid`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_description` text COLLATE utf8mb3_bin,
  `product_image` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_quantity` int NOT NULL,
  `product_status` bit(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'1. Thời vụMùa vụ từ Tháng 3 – Tháng 82. Thông tin sản phầmMàu sắc: Táo Dazzle New Zealand có vỏ căng mịn, đỏ sậm, có vân nhẹ, đôi lúc có pha sắc vàng.Vị đặc trưng: Táo giòn, có vị ngọt xen kẽ vị chua nhẹ, thịt táo dày 3. Tính chất đặc điểmTáo Dazzle có nhiều vitamin A, C, canxi, sắt, cùng với pectin, và những chất tốt cho hệ tiêu hóa.Trung bình một quả táo cung cấp cho cơ...','https://product.hstatic.net/200000863755/product/5_44674fe1aa5246d8928ea491065ba067_large.png','Táo DAZZLE NZL Size L',145000,700,_binary ''),(2,2,'1. Thời vụ nho đen Nam PhiMùa vụ của nó bắt đầu từ tháng 1 đến tháng 5 hàng năm.2. Thông tin sản phầmThuộc  giống  sweet joy quả thuôn dài,  nhiều nước,  ăn rất giòn và ngọt thanh. 3. Tính chất đặc điểmTrong nho đen chiếm 75-85% là nước,100g nho đen Nam Phi cung cấp cho con người đến 210 kcal để có những hoạt động ngày dài.Vỏ nho chứa hàm lượng resveratrol - chất chống oxy hóa cực mạnh. Giúp...','https://product.hstatic.net/200000863755/product/4_703f51b102204d00a9b330b89aa7417f_large.png','Nho Đen Không Hạt Sweet Joy - Nam Phi',215000,1001,_binary ''),(5,1,'1. Thời vụ Nho xanh Úc có mùa vụ từ tháng 1 đến tháng 6 hàng năm, có thể dao động do thời tiết 2. Thông tin sản phầmCó hình dáng thuôn dài, màu xanh phổ biến bắt mắtChắc chùm, cuống  xanh tươi, chắc quảVị  ngọt mát, có vị thơm khi ăn, không hạt và giòn tan3. Tính chất đặc điểmNho xanh không hạt là kho dinh dưỡng đáng nể với đa dạng các thành phần: vitamin C, A, chất chống oxy...','https://product.hstatic.net/200000863755/product/1_9f8a7a626c4e4baeb9c634d186f3f5e1_large.png','Nho Xanh Không Hạt Autumn Crisp Úc',225000,1002,_binary ''),(6,1,'1. Thông tin sản phầmCam Navel ruột vàng Mỹ vỏ màu vàng, ruột màu vàng đậm, vị ngọt thanh, không hạt, mọng nướcQuả tròn đều, Phần cuống trái đặc trưng có hình dạng như cái rốnMỗi trái có thể nặng từ 300gr đến 400gr2. Tính chất đặc điểmCam cung cấp 140% vitamin C và 6% vitamin A cần thiết một ngày cho cơ thể. Vitamin C là một chất chống oxy hóa quan trọng bảo vệ tế bào khỏi hư...','https://product.hstatic.net/200000863755/product/6_ccd42fa43e724be89ee30a64dbac5ff6_large.png','Cam Ruột Vàng Air Chief Mỹ',95000,700,_binary ''),(7,1,'1. Thời vụ Lê Nam PhiLê Nam Phi có mùa vụ từ tháng 4 đến tháng 9 dương lịch2. Thông tin sản phầm- Lê có tác dụng hạ huyết áp, bệnh tim, chữa chứng hoa mắt, chóng mặt, ù tai, tim đập nhanh có thể dẫn đến loạn nhịp. Trái Lê chứa nhiều chất dinh dưỡng tốt cho thai nghén, bao gồm axit folic. Lê là một trong những loại trái cây tốt cho bà bầu. Ngoài ra, lê còn chứa...','https://product.hstatic.net/200000863755/product/anh_web__2__d99dac79d2684307a4e692da31b4c2f7_large.png','Lê Má Hồng Nam Phi',99000,800,_binary ''),(8,1,'1. Thông tin sản phầmKiwi vàng là giống kiwi lai tạo có màu nâu vàng trơn nhẵn, thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành 1 vòng tròn xung quanh trục dọc của quả.Ăn rất thơm và khi chín sẽ ngọt.2. Tính chất đặc điểmKiwi thường được mệnh danh là “nữ hoàng” vitamin C. Bởi chỉ cần một quả kiwi mỗi ngày là chúng ta đã cung cấp đủ lượng vitamin C cần thiết cho...','https://product.hstatic.net/200000863755/product/15_953f6b5a6b044cd498b12039a982e295_large.png','Kiwi Ruột Vàng Newzealand',195000,900,_binary ''),(10,2,'1. Thời vụ Cherry đỏ Mỹ Từ tháng 5 đến giữa cuối tháng 82. Thông tin sản phầm- Cải thiện chức năng não bộ: cherry là \" thực phẩm cho não’’ do chứa chất oxy hoá mạnh. Cải thiện tình trạng mất ngủ, giúp ngủ ngon hơn nhờ hooc-mon melatonin.- Cung cấp hàm lượng calo cao giúp ổn định tinh thần, thúc đẩy tâm trạng vui vẻ, tốt hơn.- Cherry rất tốt cho mắt do chứa carotene và retinol cùng vitamin cao gấp 10 lần...','https://product.hstatic.net/200000863755/product/7_9a84c1913c3344afa886c1c1be25b6e6_large.png','Cherry Đỏ Mỹ S10',300000,500,_binary ''),(12,2,'1. Thời vụ Cherry đỏ Mỹ Từ tháng 5 đến giữa cuối tháng 82. Thông tin sản phầm- Cải thiện chức năng não bộ: cherry là \" thực phẩm cho não’’ do chứa chất oxy hoá mạnh. Cải thiện tình trạng mất ngủ, giúp ngủ ngon hơn nhờ hooc-mon melatonin.- Cung cấp hàm lượng calo cao giúp ổn định tinh thần, thúc đẩy tâm trạng vui vẻ, tốt hơn.- Cherry rất tốt cho mắt do chứa carotene và retinol cùng vitamin cao gấp 10 lần...','https://product.hstatic.net/200000863755/product/1_54818d23210941f3bed8521484330cd8_large.png','Cherry Đỏ Mỹ S9.5',450000,659,_binary ''),(13,2,'1. Thông tin sản phầmKiwi vàng là giống kiwi lai tạo có màu nâu vàng trơn nhẵn, thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành 1 vòng tròn xung quanh trục dọc của quả.Ăn rất thơm và khi chín sẽ ngọt.2. Tính chất đặc điểmKiwi thường được mệnh danh là “nữ hoàng” vitamin C. Bởi chỉ cần một quả kiwi mỗi ngày là chúng ta đã cung cấp đủ lượng vitamin C cần thiết cho...','https://product.hstatic.net/200000863755/product/thiet_ke_chua_co_ten__5__7180f463d6cd4a17ab02618e9bba60f6_large.jpg','Kiwi Ruột Vàng Organic NZL',200000,800,_binary ''),(14,2,'1. Thời vụMùa vụ từ tháng 5 – tháng 12    2. Thông tin sản phầmTáo xanh Mỹ vẻ ngoài có màu xanh bóng bẩy đẹp mắtQuả to cầm chắc tay, size sẽ nhỏ hơn táo xanh NewZealand Táo giòn, thịt trắng, có vị chua nhẹ rất đặc trưngThích hợp ăn kèm với muối ớt - một sự kết hợp tuyệt vời3. Tính chất đặc điểmVới thành phần vô cùng giàu vitamin E và C, loại trái cây này rất tốt để...','https://product.hstatic.net/200000863755/product/1_cbf5557cc3084241a933bddbb855fe61_large.png','Táo Xanh Mỹ',99000,688,_binary ''),(15,2,'1. Thông tin sản phầmTáo Envy NewZeland có hình thức rất đẹp, quả to tròn, rất chắc, vỏ quả có màu đỏ xen lẫn sọc vàng rất bắt mắt và sang trọng.Táo Envy NewZeland được đánh giá là giống táo cao cấp nhất trên thị trường hiện nay, phần thịt màu vàng kem, độ giòn rất cao, vị ngọt đậm đà khi xuống đến cổ họng vẫn để lại mùi thơm dịu nhẹ.2. Tính chất đặc điểmTrong 1 quả táo...','https://product.hstatic.net/200000863755/product/thiet_ke_chua_co_ten__5__f805943a4e414422b630fde33aa64792_large.png','TÁO ENVY NEWZEALAND SIZE L (17.5kg)',175000,777,_binary ''),(17,1,'1. Thông tin sản phầmĐây là giống nho không hạt, quả dài, vỏ mọng , màu đen đậm, có lớp phấn phủ tự nhiên trên quả, Vỏ mỏng có vị ngọt đậm, ăn rất thơm, và chắc thịt.2. Tính chất đặc điểmCung cấp nhiều chất oxy hóa tốt cho tim mạch và người huyết áp cao.Vỏ nho có nhiều chất tốt cho sức khỏe, tăng cường sức đề kháng, chống lão hóa, có tác dụng thải độc tố.3. Hướng dẫn bảo...','https://product.hstatic.net/200000863755/product/2_2b2f4ce9b06e41e796174f3d817eb10b_large.png','Nho Đen Ngón Tay ÚC',185000,588,_binary ''),(20,1,'1. Thông tin sản phầmDưa có  hình dạng thuôn dài với lớp vỏ màu xanh sần sùi và những đường gân vàng Phần ruột bên trong có lớp thịt màu cam mọng nước, hạt nhỏ hình bầu dục màu kem. Điểm đặc biệt của chúng là phần thịt chắc, giòn tan, độ ngọt cao và mọng nước đi kèm với hương thơm ngào ngạt đặc trưng, được giải phóng khi quả đạt độ chín cao nhất.2. Tính chất đặc điểmDưa lưới chứa...','https://product.hstatic.net/200000863755/product/4_b4fc52cc4760483cabd8fb05d6d37852_large.png','Dưa Lưới Giống Đài (TQ)',99000,655,_binary ''),(21,1,'Dưa Lưới Ruột Cam','https://product.hstatic.net/200000863755/product/thiet_ke_chua_co_ten_b7c9603f806e481083b1008ca18c8727_large.png','Dưa Lưới Ruột Cam',75000,200,_binary ''),(22,1,'1. Thông tin sản phầmTrọng lượng từ 1.1kg – 1.5kg/ quảHình dáng quả tròn, vỏ xanh, vân lưới dày và đồng đều, ruột vàng cam đậm, hương thơm mát.2. Tính chất đặc điểmQuả dưa lưới chứa nhiều chất chống oxy hóa dạng polyphenol, giúp phòng, chống bệnh ung thư và tăng cường hoạt động miễn dịch. Trong dưa chứa nhiều chất xơ nên tác dụng nhuận trường, chống táo bón. Dưa còn là nguồn phong phú beta-carotene, acid folic, kali và...','https://product.hstatic.net/200000863755/product/1_2a00a1ea84204281ac53017339193277_large.png','Dưa Lưới Taki (VN)',79000,150,_binary '');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `user_status` bit(1) NOT NULL,
  `role` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `cart_cartid` int DEFAULT NULL,
  `roles` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbq7miky53xukmhwi3sgypyskg` (`cart_cartid`),
  CONSTRAINT `FKtqehpu684nrq7ij1dmgaxkmij` FOREIGN KEY (`cart_cartid`) REFERENCES `cart` (`cartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('7c7dffb5-b23c-4f59-a246-9def2078487c','user3@gmail.com','my user3','$2a$10$ylBqF.oFa/XVorjzAC0gnOk2WFirRT/tuzq2oWgci55LSX3Clfpaa','0123456789',NULL,'user3',_binary '','USER',NULL,NULL),('cbea4aab-59b9-40b7-ac1f-3e242302a46f','encodeuser@gmail.com','My encode user','$2a$10$uSf5QV9nbRRAHPM8ac0Ud.wiGh5P02aB9J3PWSaHXWAMjRh6VFRFG','0123456789',NULL,'my encode user',_binary '','USER',NULL,NULL),('e023e32d-e072-4aa7-933b-83ceced1a09d','user1@gmail.com','my user1','$2a$10$GKfuEYEscg4a58l3TmUsgu7VfXaU05MGd2slzom.RKIrzmc6sa.gS','0123456789',NULL,'user1',_binary '','USER',NULL,NULL),('fb02e60f-5d47-4741-b01e-629a2f861713',NULL,NULL,'$2a$10$6OAXP6UYOJKSXyuZdbjW2OwEx8cqxl4Fhxs5JuoB5RWGFakhzwR2C',NULL,NULL,'admin',_binary '\0','ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 11:28:47
