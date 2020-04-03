-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 04:38 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafeplace`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectDetalle` (IN `id_cliente` INT)  NO SQL
SELECT * FROM detalle WHERE idCliente = id_cliente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectDetalles` ()  NO SQL
SELECT * FROM detalle$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectProducto` (IN `id_Producto` INT)  NO SQL
SELECT * FROM productos WHERE idProducto = id_Producto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectProductos` ()  NO SQL
SELECT * FROM productos$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`nombre`, `correo`, `telefono`, `comentario`) VALUES
('Nombre Anonimo', 'correo@prueba.com', '6441294361', 'Esta muy bueno el cafe pero no me gusto mucho la página web, quien la hizo? un ni?o de primaria?'),
('prueba bootstrap comentario', 'mirnada_lucia_@hotmail.com', '777777777', 'Me gusta la pagina pero no el cafe PRUEBA BOOTSTRAP');

-- --------------------------------------------------------

--
-- Table structure for table `detalle`
--

CREATE TABLE `detalle` (
  `folio` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detalle`
--

INSERT INTO `detalle` (`folio`, `idCliente`, `idProducto`, `cant`) VALUES
(2, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `facturas`
--

CREATE TABLE `facturas` (
  `folio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facturas`
--

INSERT INTO `facturas` (`folio`, `fecha`, `idCliente`, `idVenta`) VALUES
(1, '2019-12-02', 3, 2),
(2, '2019-12-02', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcion`, `precio`, `stock`, `imagen`) VALUES
(1, 'Americano caliente', 'Es una bebida Italiana, preparada con cafe expreso y leche montada con vapor para crear la espuma.', 45, 50, 'img/menu/americanoDecaf.jpg'),
(2, 'Esspresso', 'Es un tipo de cafe que se creo anadiendo agua caliente a un espresso.', 30, 50, 'img/menu/1cafeAmericano.jpg'),
(3, 'Esspresso descafeinado', 'Es un tipo de cafe que se creo anadiendo agua caliente a un espresso, sin cafeína.', 30, 50, 'img/menu/americanoDecaf.jpg'),
(4, 'Cold Brew', 'Cafe molido de manera muy fina, a traves del cual pasa una determinada cantidad de agua cuya temperatura es cercana al punto de ebullicion.', 30, 50, 'img/menu/expresso.jpg'),
(5, 'Latte', 'Cafe preparado a base de cafe espresso y leche al vapor.', 45, 50, 'img/menu/latte.jpg'),
(6, 'Chocolate Caliente', 'Chocolate caliente.', 35, 50, 'img/menu/chocolate.jpg'),
(7, 'Iced Latte Caramelo', 'Latte en las rocas sabor caramelo.', 50, 50, 'img/menu/2CafelatteRocas.png'),
(8, 'Mocha', 'Cafe con un toque de chocolate.', 50, 50, 'img/menu/mocha.jpg'),
(10, 'Frappe Oreo', 'Galletas oreo en un delicioso frappe.', 55, 50, 'img/menu/2frappeOreo.png'),
(12, 'Nachos', 'Totopos con queso amarillo y blanco.', 40.5, 50, 'img/menu/6nachos.png');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(10) NOT NULL,
  `edad` int(3) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idCliente`, `nombre`, `direccion`, `correo`, `usuario`, `contrasena`, `edad`, `nivel`) VALUES
(2, 'nombre', 'direccion', 'correo', 'usuario3', '123456', 21, 2),
(3, 'EQUIPO', 'Alfonso Garcia #2331', 'danielrv02@hotmail.com', 'administrador', '123456', 20, 1),
(10, 'nombre apellido', 'direccion', 'email@prueba.com', 'usuario3', '123456', 21, 2),
(11, 'prueba con bootstrap', 'Eucalipto #1503, Valle Dorado', 'direccion@prueba.com', 'usuarioBoot', '123456', 21, 2),
(12, 'prueba con bootstrap 2', 'Eucalipto #1503, Valle Dorado', 'mirnada_lucia_@hotmail.com', 'usuarioBoot2', '123456', 21, 2),
(13, 'prueba con bootstrap 3', 'EUCALIPTO', 'mirnada_lucia_@hotmail.com', 'usuarioBoot3', '123456', 18, 2),
(14, 'prueba con bootstrap 4', 'EUCALIPTO', 'mirnada_lucia_@hotmail.com', 'usuarioBoot4', '123456', 21, 2),
(15, 'prueba con bootstrap 4', 'EUCALIPTO', 'mirnada_lucia_@hotmail.com', 'usuarioBoot4', '123456', 21, 2),
(16, 'Daniel Eduardo Rojas Villalba', 'Alfonso Garcia#2331', 'danielrojas@hotmail.com', 'daniel', '123456', 20, 2),
(17, 'Daniel Rojas', 'Alfonso Garcia#2331', 'daniel@hotmail.com', 'Daniel', 'rojas', 20, 2),
(18, 'Daniel Rojas', 'Alfonso Garcia#2331', 'daniel@hotmail.com', 'Daniel', 'rojas', 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`idVenta`, `idCliente`, `idProducto`, `cantidad`, `precioTotal`) VALUES
(1, 2, 1, 2, 25.7),
(2, 10, 1, 2, 25.7),
(4, 2, 1, 2, 21.4),
(5, 2, 1, 2, 21.4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`nombre`);

--
-- Indexes for table `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indexes for table `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detalle`
--
ALTER TABLE `detalle`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facturas`
--
ALTER TABLE `facturas`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Constraints for table `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idCliente`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`);

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
