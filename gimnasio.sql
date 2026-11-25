-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2026 a las 03:34:25
-- Versión del servidor: 10.11.16-MariaDB
-- Versión de PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id_clase` int(11) NOT NULL,
  `nombre_clase` varchar(50) NOT NULL,
  `horario` time NOT NULL,
  `cupos` int(11) NOT NULL,
  `id_entrenador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id_clase`, `nombre_clase`, `horario`, `cupos`, `id_entrenador`) VALUES
(1, 'Musculacion', '08:00:00', 20, 1),
(2, 'Crossfit', '09:00:00', 15, 2),
(3, 'Yoga', '10:00:00', 12, 3),
(4, 'Spinning', '11:00:00', 20, 4),
(5, 'Funcional', '16:00:00', 15, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `documento`, `telefono`, `correo`) VALUES
(1, 'Joel', 'Mendez', '1001', '3001111111', 'joel@gmail.com'),
(2, 'Carlos', 'Perez', '1002', '3002222222', 'carlos@gmail.com'),
(3, 'Andres', 'Lopez', '1003', '3003333333', 'andres@gmail.com'),
(4, 'Daniel', 'Gomez', '1004', '3004444444', 'daniel@gmail.com'),
(5, 'Juan', 'Rodriguez', '1005', '3005555555', 'juan@gmail.com'),
(6, 'Pedro', 'Martinez', '1006', '3006666666', 'pedro@gmail.com'),
(7, 'Luis', 'Torres', '1007', '3007777777', 'luis@gmail.com'),
(8, 'Santiago', 'Ramirez', '1008', '3008888888', 'santiago@gmail.com'),
(9, 'David', 'Castro', '1009', '3009999999', 'david@gmail.com'),
(10, 'Mateo', 'Garcia', '1010', '3010000000', 'mateo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenadores`
--

CREATE TABLE `entrenadores` (
  `id_entrenador` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrenadores`
--

INSERT INTO `entrenadores` (`id_entrenador`, `nombre`, `apellido`, `especialidad`, `telefono`) VALUES
(1, 'Andres', 'Rojas', 'Musculacion', '3111111111'),
(2, 'Miguel', 'Diaz', 'Crossfit', '3222222222'),
(3, 'Laura', 'Sanchez', 'Yoga', '3333333333'),
(4, 'Camila', 'Moreno', 'Spinning', '3444444444'),
(5, 'Felipe', 'Vargas', 'Funcional', '3555555555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `id_cliente`, `id_clase`, `fecha_inscripcion`) VALUES
(1, 1, 1, '2026-11-01'),
(2, 2, 2, '2026-11-02'),
(3, 3, 3, '2026-11-03'),
(4, 4, 4, '2026-11-04'),
(5, 5, 5, '2026-11-05'),
(6, 6, 1, '2026-11-06'),
(7, 7, 2, '2026-11-07'),
(8, 8, 3, '2026-11-08'),
(9, 9, 4, '2026-11-09'),
(10, 10, 5, '2026-11-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `id_membresia` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `duracion_dias` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`id_membresia`, `tipo`, `duracion_dias`, `precio`) VALUES
(1, 'Mensual', 30, 80000.00),
(2, 'Trimestral', 90, 210000.00),
(3, 'Semestral', 180, 390000.00),
(4, 'Anual', 365, 700000.00),
(5, 'Semanal', 7, 25000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_cliente`, `fecha_pago`, `valor`, `metodo_pago`) VALUES
(1, 1, '2026-11-01', 80000.00, 'Efectivo'),
(2, 2, '2026-11-02', 210000.00, 'Transferencia'),
(3, 3, '2026-11-03', 80000.00, 'Tarjeta'),
(4, 4, '2026-11-04', 390000.00, 'Efectivo'),
(5, 5, '2026-11-05', 25000.00, 'Transferencia'),
(6, 6, '2026-11-06', 80000.00, 'Tarjeta'),
(7, 7, '2026-11-07', 210000.00, 'Efectivo'),
(8, 8, '2026-11-08', 80000.00, 'Transferencia'),
(9, 9, '2026-11-09', 700000.00, 'Tarjeta'),
(10, 10, '2026-11-10', 25000.00, 'Efectivo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_entrenador` (`id_entrenador`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  ADD PRIMARY KEY (`id_entrenador`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_clase` (`id_clase`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`id_membresia`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  MODIFY `id_entrenador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id_entrenador`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
