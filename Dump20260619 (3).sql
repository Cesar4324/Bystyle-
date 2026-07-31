CREATE DATABASE IF NOT EXISTS `railway`;
USE `railway`;


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
-- Table structure for table `cabeza_pedidos`
--

DROP TABLE IF EXISTS `cabeza_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabeza_pedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPedido` varchar(45) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `total_Pedido` decimal(10,2) NOT NULL,
  `Carrito_Cabeza_idCarrito` int(11) NOT NULL,
  `Estado_idEstado` int(11) NOT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `Carrito_Cabeza_idCarrito` (`Carrito_Cabeza_idCarrito`),
  KEY `Estado_idEstado` (`Estado_idEstado`),
  CONSTRAINT `cabeza_pedidos_ibfk_1` FOREIGN KEY (`Carrito_Cabeza_idCarrito`) REFERENCES `carrito_cabeza` (`idCarrito`),
  CONSTRAINT `cabeza_pedidos_ibfk_2` FOREIGN KEY (`Estado_idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabeza_pedidos`
--

LOCK TABLES `cabeza_pedidos` WRITE;
/*!40000 ALTER TABLE `cabeza_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabeza_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_cabeza`
--

DROP TABLE IF EXISTS `carrito_cabeza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_cabeza` (
  `idCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `total_carrito` decimal(10,2) NOT NULL,
  `Usuarios_idusuarios` int(11) NOT NULL,
  PRIMARY KEY (`idCarrito`),
  KEY `Usuarios_idusuarios` (`Usuarios_idusuarios`),
  CONSTRAINT `carrito_cabeza_ibfk_1` FOREIGN KEY (`Usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_cabeza`
--

LOCK TABLES `carrito_cabeza` WRITE;
/*!40000 ALTER TABLE `carrito_cabeza` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_cabeza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_detalle`
--

DROP TABLE IF EXISTS `carrito_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_detalle` (
  `idCarrito_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `total_Carrito` decimal(10,2) NOT NULL,
  `Carrito_Cabeza_idCarrito` int(11) NOT NULL,
  `Producto_id_producto` int(11) NOT NULL,
  PRIMARY KEY (`idCarrito_Detalle`),
  KEY `Carrito_Cabeza_idCarrito` (`Carrito_Cabeza_idCarrito`),
  KEY `Producto_id_producto` (`Producto_id_producto`),
  CONSTRAINT `carrito_detalle_ibfk_1` FOREIGN KEY (`Carrito_Cabeza_idCarrito`) REFERENCES `carrito_cabeza` (`idCarrito`),
  CONSTRAINT `carrito_detalle_ibfk_2` FOREIGN KEY (`Producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_detalle`
--

LOCK TABLES `carrito_detalle` WRITE;
/*!40000 ALTER TABLE `carrito_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Camisetas'),(2,'Pantalones'),(3,'Chaquetas'),(4,'Zapatos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colores`
--

DROP TABLE IF EXISTS `colores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colores` (
  `idColores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_color` varchar(45) NOT NULL,
  PRIMARY KEY (`idColores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colores`
--

LOCK TABLES `colores` WRITE;
/*!40000 ALTER TABLE `colores` DISABLE KEYS */;
INSERT INTO `colores` VALUES (1,'Negro'),(2,'Blanco'),(3,'Azul'),(4,'Rojo');
/*!40000 ALTER TABLE `colores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `idDetalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `Pedidos_idPedidos` int(11) NOT NULL,
  `Carrito_Detalle_idCarrito_Detalle` int(11) NOT NULL,
  PRIMARY KEY (`idDetalle_pedido`),
  KEY `Pedidos_idPedidos` (`Pedidos_idPedidos`),
  KEY `Carrito_Detalle_idCarrito_Detalle` (`Carrito_Detalle_idCarrito_Detalle`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`Pedidos_idPedidos`) REFERENCES `cabeza_pedidos` (`idPedidos`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`Carrito_Detalle_idCarrito_Detalle`) REFERENCES `carrito_detalle` (`idCarrito_Detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `descripciondelestado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Pendiente'),(2,'Pagado'),(3,'Enviado'),(4,'Entregado'),(5,'Cancelado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes_producto`
--

DROP TABLE IF EXISTS `imagenes_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_producto` (
  `idImagenes_producto` int(11) NOT NULL AUTO_INCREMENT,
  `url_imagen` varchar(255) NOT NULL,
  `Producto_id_producto` int(11) NOT NULL,
  PRIMARY KEY (`idImagenes_producto`),
  KEY `Producto_id_producto` (`Producto_id_producto`),
  CONSTRAINT `imagenes_producto_ibfk_1` FOREIGN KEY (`Producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_producto`
--

LOCK TABLES `imagenes_producto` WRITE;
/*!40000 ALTER TABLE `imagenes_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Nike','Ropa deportiva'),(2,'Adidas','Ropa deportiva'),(3,'Puma','Ropa deportiva');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediodepago`
--

DROP TABLE IF EXISTS `mediodepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediodepago` (
  `idMediodepago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_mediodepago` varchar(45) NOT NULL,
  PRIMARY KEY (`idMediodepago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediodepago`
--

LOCK TABLES `mediodepago` WRITE;
/*!40000 ALTER TABLE `mediodepago` DISABLE KEYS */;
INSERT INTO `mediodepago` VALUES (1,'Efectivo'),(2,'Tarjeta'),(3,'Transferencia');
/*!40000 ALTER TABLE `mediodepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `fechadepago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `referenciadepago` varchar(60) NOT NULL,
  `Mediodepago_idMediodepago` int(11) NOT NULL,
  `Cabeza_Pedidos_idPedidos` int(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `Mediodepago_idMediodepago` (`Mediodepago_idMediodepago`),
  KEY `Cabeza_Pedidos_idPedidos` (`Cabeza_Pedidos_idPedidos`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`Mediodepago_idMediodepago`) REFERENCES `mediodepago` (`idMediodepago`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`Cabeza_Pedidos_idPedidos`) REFERENCES `cabeza_pedidos` (`idPedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionPais` varchar(45) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Colombia');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `Categorias_idCategorias` int(11) NOT NULL,
  `Tallas_idTallas` int(11) NOT NULL,
  `Colores_idColores` int(11) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  `Pais_idPais` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `Categorias_idCategorias` (`Categorias_idCategorias`),
  KEY `Tallas_idTallas` (`Tallas_idTallas`),
  KEY `Colores_idColores` (`Colores_idColores`),
  KEY `Marca_idMarca` (`Marca_idMarca`),
  KEY `Pais_idPais` (`Pais_idPais`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Categorias_idCategorias`) REFERENCES `categorias` (`idCategorias`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Tallas_idTallas`) REFERENCES `tallas` (`idTallas`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`Colores_idColores`) REFERENCES `colores` (`idColores`),
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`),
  CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionRol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallas`
--

DROP TABLE IF EXISTS `tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallas` (
  `idTallas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionTallas` varchar(45) NOT NULL,
  PRIMARY KEY (`idTallas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallas`
--

LOCK TABLES `tallas` WRITE;
/*!40000 ALTER TABLE `tallas` DISABLE KEYS */;
INSERT INTO `tallas` VALUES (1,'XS'),(2,'S'),(3,'M'),(4,'L'),(5,'XL');
/*!40000 ALTER TABLE `tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodeidentificacion`
--

DROP TABLE IF EXISTS `tipodeidentificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodeidentificacion` (
  `idTipoIdentificacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionTipoDoc` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodeidentificacion`
--

LOCK TABLES `tipodeidentificacion` WRITE;
/*!40000 ALTER TABLE `tipodeidentificacion` DISABLE KEYS */;
INSERT INTO `tipodeidentificacion` VALUES (1,'Cedula de Ciudadania'),(2,'Tarjeta de Identidad'),(3,'Pasaporte'),(4,'Cedula de Extranjeria'),(5,'NIT'),(6,'Cédula de Ciudadanía'),(7,'Tarjeta de Identidad'),(8,'Pasaporte'),(9,'Cédula de Extranjería'),(10,'NIT');
/*!40000 ALTER TABLE `tipodeidentificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `identificacion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `TipoIdentificacion_idTipoIdentificacion` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`idusuarios`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_Usuarios_TipoIdentificacion` (`TipoIdentificacion_idTipoIdentificacion`),
  KEY `fk_Usuarios_Rol1` (`Rol_idRol`),
  CONSTRAINT `fk_Usuarios_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `fk_Usuarios_TipoIdentificacion` FOREIGN KEY (`TipoIdentificacion_idTipoIdentificacion`) REFERENCES `tipodeidentificacion` (`idTipoIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Santiago ','Correa','1013121424','321212312','cra9este#15a2','cesar@gmail.com','12345','1995-05-25',1,2),(2,'cesar ','Cifuentes ','1013596587','3201547896','cra9este15e','asduysdyugsdyu@gmail.com','345','2006-02-06',1,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-19  9:46:19
