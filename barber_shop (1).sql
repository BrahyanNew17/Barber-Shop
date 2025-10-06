-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2025 a las 02:33:03
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barber_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbero`
--

CREATE TABLE `barbero` (
  `idBarbero` int(11) NOT NULL,
  `nombreCompleto` varchar(60) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barbero`
--

INSERT INTO `barbero` (`idBarbero`, `nombreCompleto`, `telefono`) VALUES
(1, 'Helmer amariles', 3138273456),
(2, 'Brahyan estiven leal', 3202166561),
(3, 'Pepe ortiz', 3503685678),
(4, 'Pablo rodriguez', 3148687435),
(5, 'Arnoldo suarez', 3246542345),
(6, 'Mathias pedregal', 3208345672);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Maquinas y herramientas electricas'),
(2, 'Tijeras y herramientas manuales'),
(3, 'Cuidado capilar y estilizado'),
(4, 'Barba y afeitado'),
(5, 'Higiene y desinfeccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEstadocita` int(11) DEFAULT NULL,
  `idBarbero` int(11) DEFAULT NULL,
  `idpago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `fecha`, `hora`, `fechapago`, `idCliente`, `idEstadocita`, `idBarbero`, `idpago`) VALUES
(1, '2025-10-05', '14:30:00', '2025-10-05', 1, 2, 1, 1),
(2, '2025-10-06', '10:00:00', '2025-10-06', 2, 1, 2, 3),
(3, '2025-10-04', '12:30:00', '2025-10-04', 3, 3, 3, 1),
(4, '2025-10-06', '09:30:00', '2025-10-06', 4, 1, 4, 2),
(5, '2025-10-01', '15:30:00', '2025-10-01', 5, 2, 5, 4),
(6, '2025-08-10', '18:30:00', '2025-08-10', 6, 2, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombreCompleto` varchar(60) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombreCompleto`, `telefono`, `correo`, `fechaRegistro`, `idTipoDocumento`) VALUES
(1, 'Andres Felipe Ramirez', 3001234567, 'andres.ramirez@gmail.com', '2024-03-12', 1),
(2, 'Juan Camilo Torres', 3152347701, 'juan.torres@correo.com', '2023-11-21', 2),
(3, 'Carlos Alberto Gomez', 3116783344, 'calberto.gomez@outlook.com', '2025-06-18', 3),
(4, 'Sebastian Alejandro Ruiz', 3054120098, 'sebastian.ruiz@mail.com', '2023-05-14', 4),
(5, 'Diego Fernando Castro', 3183347722, 'diego.castro@gmail.com', '2024-01-27', 5),
(6, 'Miguel Angel Herrera', 3149096677, 'miguel.herrera@outlook.com', '2025-03-25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecita`
--

CREATE TABLE `detallecita` (
  `idDetalle` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `idServicio` int(11) DEFAULT NULL,
  `idCita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallecita`
--

INSERT INTO `detallecita` (`idDetalle`, `precio`, `observaciones`, `idServicio`, `idCita`) VALUES
(1, 35000, 'implementar masajes', 5, 1),
(2, 17000, 'muy buena la experencia', 1, 2),
(3, 27000, 'una experencia muy buena', 4, 3),
(4, 10000, 'muy bueno', 2, 4),
(5, 8000, 'super recomendado', 3, 5),
(6, 35000, 'muy top', 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalle` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioUnitario` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `idProduc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idDetalle`, `cantidad`, `precioUnitario`, `idVenta`, `idProduc`) VALUES
(1, 2, 25000, 6, 10),
(2, 1, 32000, 4, 9),
(3, 10, 30000, 1, 5),
(4, 1, 30000, 2, 6),
(5, 4, 400000, 3, 7),
(6, 3, 35000, 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocita`
--

CREATE TABLE `estadocita` (
  `idEstadocita` int(11) NOT NULL,
  `estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocita`
--

INSERT INTO `estadocita` (`idEstadocita`, `estado`) VALUES
(1, 'programada'),
(2, 'realizada'),
(3, 'cancelada por cliente'),
(4, 'cancelada por barberia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idProduc` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idProduc`, `nombre`, `cantidad`, `precio`, `idMarca`, `idcategoria`) VALUES
(1, 'patllera detailer', 5, 50000, 1, 1),
(2, 'afeitadora profoil', 4, 35000, 2, 1),
(3, 'maquina classic 76', 3, 80000, 4, 1),
(4, 'tijera white line', 12, 35000, 6, 2),
(5, 'cuchillas pro guard', 50, 50000, 7, 2),
(6, 'pomada blue strong hold', 3, 60000, 8, 3),
(7, 'Shampoo killer', 4, 40000, 9, 3),
(8, 'aceite para barbar', 5, 30000, 11, 4),
(9, 'champu barba', 4, 35000, 12, 4),
(10, 'desinfectante liquido', 3, 20000, 13, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`) VALUES
(1, 'Wahl'),
(2, 'Andis'),
(3, 'BabylissPro'),
(4, 'Oster'),
(5, 'Kemei'),
(6, 'Jaguar'),
(7, 'Kiepe'),
(8, 'Rauzel'),
(9, 'Barber Mind'),
(10, 'American Crew'),
(11, 'Proaso'),
(12, 'The Beard Club'),
(13, 'Barbicide'),
(14, 'Andis cool Care'),
(15, 'Lysol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `idpago` int(11) NOT NULL,
  `metodo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`idpago`, `metodo`) VALUES
(1, 'Pagos en efectivo'),
(2, 'Bancolombia'),
(3, 'Nequi'),
(4, 'Daviplata'),
(5, 'Bancolombia a la man'),
(6, 'visa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombreservicio`
--

CREATE TABLE `nombreservicio` (
  `idservi` int(11) NOT NULL,
  `servicio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nombreservicio`
--

INSERT INTO `nombreservicio` (`idservi`, `servicio`) VALUES
(1, 'corte de cabello'),
(2, 'barba'),
(3, 'cejas'),
(4, 'corte + barba'),
(5, 'corte + barba + cejas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `NITproveedor` varchar(30) NOT NULL,
  `nombreProveedor` varchar(50) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`NITproveedor`, `nombreProveedor`, `telefono`, `direccion`) VALUES
('802547891-9', 'Productos Reuzel & Co.', 6017159940, 'Cra 7 #120-15, Bogota D.C.'),
('900654987-2', 'Higiene Profesional Barber Ltda.', 6053564412, 'Calle 72 #52-10, Barranquilla, Atlantico'),
('900987654-3', 'Estilo & corte Distribuciones', 6043012298, 'Calle 45 #18-32, Medelli, Antioquia'),
('901236587-1', 'ProBarber Colombia S.A.S.', 6024897715, 'Av. 3 Norte #25-60, Cali, Valle del Cauca'),
('901458123-4', 'Barber tools S.A.S', 6014567821, 'Cra 10 #15-24, Bogota D.C.'),
('901555221-0', 'Equipos Wahl Colombia S.A.S.', 6014678852, 'Autopista Norte #106-45, Bogota D.C.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorinventario`
--

CREATE TABLE `proveedorinventario` (
  `idproveinven` int(11) NOT NULL,
  `NITproveedor` varchar(30) DEFAULT NULL,
  `idproduc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedorinventario`
--

INSERT INTO `proveedorinventario` (`idproveinven`, `NITproveedor`, `idproduc`) VALUES
(1, '802547891-9', 1),
(2, '900654987-2', 2),
(3, '900987654-3', 3),
(4, '901236587-1', 4),
(5, '901458123-4', 5),
(6, '901555221-0', 6),
(7, '900654987-2', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `duracionServicio` varchar(30) DEFAULT NULL,
  `idservi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `descripcion`, `precio`, `duracionServicio`, `idservi`) VALUES
(1, 'el corte de cabello es un servicio que el cliente ordena a su gusto, ej: el corte, con cuales numero', 17000, '1 hora', 1),
(2, 'el servicio de la barba es un servicio el cual el cliente ordena a su gusto', 10000, '30 minutos', 2),
(3, 'las cejas es un servicio que el cliente ordena a su gusto', 8000, '20 minutos', 3),
(4, 'el servicio barba mas corte es un servico que incluye una gaseosa ', 27000, '1 hora y 30 minutos', 4),
(5, 'el servicio de corte, barba, cejas es un servicio completo ', 35000, '2 horas', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `tipoDocumento` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `tipoDocumento`) VALUES
(1, 'CC'),
(2, 'TI'),
(3, 'RC'),
(4, 'CE'),
(5, 'PA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasproducto`
--

CREATE TABLE `ventasproducto` (
  `idVenta` int(11) NOT NULL,
  `fechaVenta` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventasproducto`
--

INSERT INTO `ventasproducto` (`idVenta`, `fechaVenta`, `total`, `idCliente`) VALUES
(1, '2025-10-05', 17000, 1),
(2, '2025-09-23', 27000, 2),
(3, '2024-11-23', 15000, 3),
(4, '2025-07-05', 32000, 4),
(5, '2025-08-22', 10000, 5),
(6, '2025-01-13', 45000, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barbero`
--
ALTER TABLE `barbero`
  ADD PRIMARY KEY (`idBarbero`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idEstadocita` (`idEstadocita`),
  ADD KEY `idBarbero` (`idBarbero`),
  ADD KEY `idpago` (`idpago`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idTipoDocumento` (`idTipoDocumento`);

--
-- Indices de la tabla `detallecita`
--
ALTER TABLE `detallecita`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idServicio` (`idServicio`),
  ADD KEY `idCita` (`idCita`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idProduc` (`idProduc`);

--
-- Indices de la tabla `estadocita`
--
ALTER TABLE `estadocita`
  ADD PRIMARY KEY (`idEstadocita`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idProduc`),
  ADD KEY `idMarca` (`idMarca`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`idpago`);

--
-- Indices de la tabla `nombreservicio`
--
ALTER TABLE `nombreservicio`
  ADD PRIMARY KEY (`idservi`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NITproveedor`);

--
-- Indices de la tabla `proveedorinventario`
--
ALTER TABLE `proveedorinventario`
  ADD PRIMARY KEY (`idproveinven`),
  ADD KEY `NITproveedor` (`NITproveedor`),
  ADD KEY `idproduc` (`idproduc`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `idservi` (`idservi`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `ventasproducto`
--
ALTER TABLE `ventasproducto`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barbero`
--
ALTER TABLE `barbero`
  MODIFY `idBarbero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detallecita`
--
ALTER TABLE `detallecita`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estadocita`
--
ALTER TABLE `estadocita`
  MODIFY `idEstadocita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idProduc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `nombreservicio`
--
ALTER TABLE `nombreservicio`
  MODIFY `idservi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedorinventario`
--
ALTER TABLE `proveedorinventario`
  MODIFY `idproveinven` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventasproducto`
--
ALTER TABLE `ventasproducto`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`idEstadocita`) REFERENCES `estadocita` (`idEstadocita`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`idBarbero`) REFERENCES `barbero` (`idBarbero`),
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`idpago`) REFERENCES `metodopago` (`idpago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallecita`
--
ALTER TABLE `detallecita`
  ADD CONSTRAINT `detallecita_ibfk_1` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`),
  ADD CONSTRAINT `detallecita_ibfk_2` FOREIGN KEY (`idCita`) REFERENCES `citas` (`idCita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `ventasproducto` (`idVenta`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`idProduc`) REFERENCES `inventario` (`idProduc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedorinventario`
--
ALTER TABLE `proveedorinventario`
  ADD CONSTRAINT `proveedorinventario_ibfk_1` FOREIGN KEY (`NITproveedor`) REFERENCES `proveedor` (`NITproveedor`),
  ADD CONSTRAINT `proveedorinventario_ibfk_2` FOREIGN KEY (`idproduc`) REFERENCES `inventario` (`idProduc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`idservi`) REFERENCES `nombreservicio` (`idservi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventasproducto`
--
ALTER TABLE `ventasproducto`
  ADD CONSTRAINT `ventasproducto_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
