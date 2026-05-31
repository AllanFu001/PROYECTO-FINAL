-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: supermercado_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `nit` varchar(12) NOT NULL,
  `genero` bit(1) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo_electronico` varchar(45) NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `nit` (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (5,'Sofia Alejandra ','Contreras Sosa','1123032',_binary '\0','47856874','Alee@gmail.com','2026-04-16 08:18:16'),(8,'marco ','lopez','15ADAD1',_binary '','41023567','oadaodad,a654','2026-08-01 00:00:00'),(9,'Alan','aguilar','202536',_binary '\0','40251689','aaddad@gmail.com','2026-05-24 09:58:14'),(10,'Allan','astuRIAas','106215299',_binary '','3166824','alla94@','2001-03-10 00:00:00'),(11,'Rodrigo','Asturias','112810470',_binary '','3166824','allanasturias@.com','2001-04-03 00:00:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int NOT NULL DEFAULT '1',
  `id_proveedor` int NOT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fecha_ingreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `id_detalle` bigint NOT NULL,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_costo_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `compras_detalle_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE,
  CONSTRAINT `compras_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cui` varchar(20) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_puesto` smallint NOT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_empleados_puestos` (`id_puesto`),
  CONSTRAINT `fk_empleados_puestos` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (5,'Maicol Andre','Perez Lopez','Mexico ','45125486','4512789654','M','1996-04-07',2,'2012-08-03','2012-08-03'),(6,'Alan Asturias ','Fuentes ','Guatemala ','48758921','154215684143','M','2001-08-16',2,'2026-08-02','2026-08-06'),(7,'Kevin ','Aguila','Guatemala ','48759612','48615311531889','M','2026-04-03',1,'2026-04-09','2026-04-12');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` smallint NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre` (`marca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (7,'Bimbo'),(1,'Coca-Cola'),(9,'Colgate'),(6,'Diana'),(5,'La Popular'),(8,'Maggi'),(10,'Nestle'),(2,'Pepsi'),(4,'Red Bull'),(3,'Tampico');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) NOT NULL,
  `id_marca` smallint NOT NULL,
  `descripcion` varchar(100) NOT NULL DEFAULT '',
  `imagen` varchar(30) NOT NULL DEFAULT '',
  `precio_costo` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `existencia` int NOT NULL DEFAULT '0',
  `fecha_ingreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_marcas` (`id_marca`),
  CONSTRAINT `fk_productos_marcas` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Coca-Cola',1,'Bebida gaseosa','coca_cola.jpg',8.00,10.00,0,'2026-05-23 00:00:00'),(2,'Pepsi',2,'Bebida gaseosa','pepsi.jpg',7.00,9.00,18,'2026-05-23 00:00:00'),(3,'Tampico',3,'Bebida de frutas','tampico.jpg',3.00,6.00,23,'2026-05-23 00:00:00'),(4,'Red Bull',4,'Bebida energetica','redbull.jpg',10.00,16.00,14,'2026-05-23 00:00:00'),(5,'Arroz',5,'Arroz blanco 1 libra','arroz.jpg',5.00,8.00,25,'2026-05-23 00:00:00'),(6,'Frijol',5,'Frijol negro 1 libra','frijol.jpg',6.00,10.00,28,'2026-05-23 00:00:00'),(7,'Azucar',5,'Azucar blanca 1 libra','azucar.jpg',3.00,5.00,40,'2026-05-23 00:00:00'),(8,'Sal',5,'Sal de mesa','sal.jpg',2.00,4.00,31,'2026-05-23 00:00:00'),(9,'Tortrix',6,'Snack de maiz','tortrix.jpg',2.50,4.00,33,'2026-05-23 00:00:00'),(10,'Pan Sandwich',7,'Pan sandwich familiar','pan.jpg',12.00,18.00,15,'2026-05-23 00:00:00'),(11,'Sopa Instantanea',8,'Sopa instantanea de pollo','sopa.jpg',2.00,4.00,50,'2026-05-23 00:00:00'),(12,'Consome',8,'Consome de pollo','consome.jpg',1.50,3.00,50,'2026-05-23 00:00:00'),(13,'Pasta Dental',9,'Pasta dental familiar','pasta.jpg',9.00,14.00,20,'2026-05-23 00:00:00'),(14,'Cepillo Dental',9,'Cepillo dental adulto','cepillo.jpg',5.00,9.00,20,'2026-05-23 00:00:00'),(15,'Leche',10,'Leche entera 1 litro','leche.jpg',8.00,12.00,25,'2026-05-23 00:00:00'),(16,'Cafe',10,'Cafe soluble','cafe.jpg',18.00,28.00,15,'2026-05-23 00:00:00'),(17,'Chocolate',10,'Chocolate en polvo','chocolate.jpg',15.00,24.00,15,'2026-05-23 00:00:00'),(18,'Galletas',10,'Galletas dulces','galletas.jpg',6.00,10.00,30,'2026-05-23 00:00:00'),(19,'Agua Pura',1,'Agua pura botella','agua.jpg',3.00,5.00,40,'2026-05-23 00:00:00'),(20,'Jugo',3,'Jugo de naranja','jugo.jpg',4.00,7.00,30,'2026-05-23 00:00:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) NOT NULL,
  `nit` varchar(12) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Central','1234567-8','Zona 1','22221111'),(2,'Abarrotes del Norte','2345678-9','Zona 6','22222222'),(3,'Bebidas Guatemala','3456789-0','Zona 12','23334444'),(4,'Alimentos La Union','4567890-1','Zona 4','24445555'),(5,'Lacteos del Sur','5678901-2','Villa Nueva','25556666'),(6,'Productos Diana','6789012-3','Mixco','26667777'),(7,'Panificadora Bimbo','7890123-4','Carretera a El Salvador','27778888'),(8,'Nestle Guatemala','8901234-5','Zona 10','28889999'),(9,'Colgate Palmolive','9012345-6','Zona 9','29990000'),(10,'Distribuidora El Buen Precio','1122334-5','Zona 7','21112222');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_puesto`),
  UNIQUE KEY `nombre` (`puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (2,'Administrador'),(3,'Bodeguero'),(1,'Cajero');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `no_factura` int NOT NULL,
  `serie` char(1) NOT NULL,
  `fecha_factura` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_ingreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venta`),
  UNIQUE KEY `serie` (`serie`,`no_factura`),
  KEY `id_cliente` (`id_cliente`),
  KEY `fk_ventas_empleados` (`id_empleado`),
  CONSTRAINT `fk_ventas_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (2,1,'A','2026-05-19',5,5,'2026-05-19 20:29:44'),(3,2,'A','2026-05-24',5,5,'2026-05-24 09:31:35'),(7,3,'A','2026-05-24',10,5,'2026-05-24 10:03:19'),(8,4,'A','2026-05-24',10,5,'2026-05-24 10:04:17'),(9,5,'A','2026-05-26',5,5,'2026-05-26 22:06:31'),(11,6,'A','2026-05-31',9,6,'2026-05-31 08:07:52'),(12,7,'A','2026-05-31',10,5,'2026-05-31 08:23:09'),(13,8,'A','2026-05-31',10,6,'2026-05-31 08:54:24'),(14,9,'A','2026-05-31',11,5,'2026-05-31 09:05:18');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `id_venta_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE,
  CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,3,2,2,9.00),(2,7,6,2,10.00),(3,7,8,4,4.00),(4,8,1,20,10.00),(5,9,5,2,8.00),(6,9,3,2,6.00),(7,11,8,2,4.00),(8,12,9,2,4.00),(9,13,4,1,16.00),(10,14,5,3,8.00),(11,14,8,3,4.00);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31  9:19:40
