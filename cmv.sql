-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-09-2021 a las 06:47:02
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cmv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_cmv_tipo_cuenta`
--

CREATE TABLE `cat_cmv_tipo_cuenta` (
  `idCuenta` int(11) NOT NULL,
  `nombreCuenta` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cat_cmv_tipo_cuenta`
--

INSERT INTO `cat_cmv_tipo_cuenta` (`idCuenta`, `nombreCuenta`) VALUES
(1, 'Ahorro'),
(2, 'Crédito'),
(3, 'Prestamos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cmv_cliente`
--

CREATE TABLE `tbl_cmv_cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoPaterno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoMaterno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rfc` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `curp` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_cmv_cliente`
--

INSERT INTO `tbl_cmv_cliente` (`idCliente`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `rfc`, `curp`, `fechaAlta`) VALUES
(1, 'Alex', 'Hernandez', 'Pérez', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:05:39'),
(2, 'Antonio', 'Briseño', 'Martinez', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:06:54'),
(3, 'Paulina', 'Solorsano', 'Salgado', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:07:24'),
(4, 'Paola', 'Dominguez', 'Padilla', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:08:20'),
(5, 'Fernando', 'Sanchez', 'Delgado', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:09:16'),
(6, 'Leonardo', 'Juarez', 'Medina', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:10:16'),
(7, 'Guadalupe', 'Lopez', 'Araujo', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:10:56'),
(8, 'Rodrigo', 'García', 'González', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:11:50'),
(9, 'Luis', 'Flores', 'Cervantes', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:12:18'),
(10, 'Adriana', 'Meza', 'Valdez', 'PEGM9007151H0', 'SABC560626MDFLRN09', '2021-09-08 23:13:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cmv_cliente_cuenta`
--

CREATE TABLE `tbl_cmv_cliente_cuenta` (
  `idClienteCuenta` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idCuenta` int(11) NOT NULL,
  `saldoActual` decimal(12,2) NOT NULL,
  `fechaContratacion` datetime NOT NULL,
  `fechaUltimoMovimiento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_cmv_cliente_cuenta`
--

INSERT INTO `tbl_cmv_cliente_cuenta` (`idClienteCuenta`, `idCliente`, `idCuenta`, `saldoActual`, `fechaContratacion`, `fechaUltimoMovimiento`) VALUES
(1, 10, 1, '12000.00', '2021-09-09 06:13:56', '2021-09-09 06:13:56'),
(2, 1, 2, '15000.20', '2021-09-09 06:13:56', '2021-09-09 06:13:56'),
(3, 2, 3, '20000.00', '2021-09-09 06:14:51', '2021-09-09 06:14:51'),
(4, 5, 1, '10000.00', '2021-09-09 06:14:51', '2021-09-09 06:14:51'),
(5, 7, 2, '5000.00', '2021-09-09 06:15:18', '2021-09-09 06:15:18'),
(6, 6, 3, '6000.00', '2021-09-09 06:15:18', '2021-09-09 06:15:18'),
(7, 9, 1, '9000.00', '2021-09-09 06:15:46', '2021-09-09 06:15:46'),
(8, 4, 2, '35000.00', '2021-09-09 06:15:46', '2021-09-09 06:15:46'),
(9, 3, 3, '17000.00', '2021-09-09 06:16:21', '2021-09-09 06:16:21'),
(10, 8, 1, '28000.00', '2021-09-09 06:16:21', '2021-09-09 06:16:21'),
(11, 10, 2, '20000.00', '2021-09-09 06:21:02', '2021-09-09 06:21:02'),
(12, 1, 1, '5000.00', '2021-09-09 06:32:53', '2021-09-09 06:32:53'),
(13, 2, 1, '5000.00', '2021-09-09 06:34:17', '2021-09-09 06:34:17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cat_cmv_tipo_cuenta`
--
ALTER TABLE `cat_cmv_tipo_cuenta`
  ADD PRIMARY KEY (`idCuenta`);

--
-- Indices de la tabla `tbl_cmv_cliente`
--
ALTER TABLE `tbl_cmv_cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `tbl_cmv_cliente_cuenta`
--
ALTER TABLE `tbl_cmv_cliente_cuenta`
  ADD PRIMARY KEY (`idClienteCuenta`),
  ADD KEY `FK_CLIENTE_CUENTA` (`idCliente`),
  ADD KEY `FK_CLIENTE_TIPO_CUENTA` (`idCuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cat_cmv_tipo_cuenta`
--
ALTER TABLE `cat_cmv_tipo_cuenta`
  MODIFY `idCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_cmv_cliente`
--
ALTER TABLE `tbl_cmv_cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_cmv_cliente_cuenta`
--
ALTER TABLE `tbl_cmv_cliente_cuenta`
  MODIFY `idClienteCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_cmv_cliente_cuenta`
--
ALTER TABLE `tbl_cmv_cliente_cuenta`
  ADD CONSTRAINT `FK_CLIENTE_CUENTA` FOREIGN KEY (`idCliente`) REFERENCES `tbl_cmv_cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CLIENTE_TIPO_CUENTA` FOREIGN KEY (`idCuenta`) REFERENCES `cat_cmv_tipo_cuenta` (`idCuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
