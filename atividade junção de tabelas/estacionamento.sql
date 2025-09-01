-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/09/2025 às 14:04
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento`
--
CREATE DATABASE IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `estacionamento`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `andar`
--

CREATE TABLE `andar` (
  `codandar` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `andar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `andar`
--

INSERT INTO `andar` (`codandar`, `capacidade`, `andar`) VALUES
(1, 50, 'Subsolo 1'),
(2, 40, 'Subsolo 2'),
(3, 60, 'Subsolo 3'),
(4, 55, 'Subsolo 4'),
(5, 70, 'Térreo'),
(6, 45, '1º Andar'),
(7, 50, '2º Andar'),
(8, 65, '3º Andar'),
(9, 35, '4º Andar'),
(10, 80, 'Cobertura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(20) NOT NULL,
  `dnasc` date DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `dnasc`, `nome`) VALUES
('10101010101', '1997-02-25', 'Paula Mendes'),
('11111111111', '1990-05-12', 'João Silva'),
('22222222222', '1985-08-23', 'Maria Oliveira'),
('33333333333', '2000-11-05', 'Pedro Souza'),
('44444444444', '1992-03-14', 'Ana Costa'),
('55555555555', '1978-07-21', 'Carlos Lima'),
('66666666666', '1999-01-09', 'Fernanda Alves'),
('77777777777', '2001-12-30', 'Rafael Pereira'),
('88888888888', '1995-04-18', 'Juliana Rocha'),
('99999999999', '1983-09-10', 'Bruno Martins');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estaciona`
--

CREATE TABLE `estaciona` (
  `cod` int(11) NOT NULL,
  `horasaida` datetime DEFAULT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` datetime DEFAULT NULL,
  `dataentrada` date DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `codandar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estaciona`
--

INSERT INTO `estaciona` (`cod`, `horasaida`, `datasaida`, `horaentrada`, `dataentrada`, `placa`, `codandar`) VALUES
(1, '2025-09-01 10:30:00', '2025-09-01', '2025-09-01 08:00:00', '2025-09-01', 'ABC1234', 1),
(2, '2025-09-01 14:00:00', '2025-09-01', '2025-09-01 09:15:00', '2025-09-01', 'XYZ5678', 2),
(3, NULL, NULL, '2025-09-01 11:00:00', '2025-09-01', 'JKL4321', 3),
(4, '2025-09-01 17:45:00', '2025-09-01', '2025-09-01 12:30:00', '2025-09-01', 'MNO8765', 4),
(5, '2025-09-02 08:00:00', '2025-09-02', '2025-09-01 19:00:00', '2025-09-01', 'PQR2468', 5),
(6, '2025-09-02 09:15:00', '2025-09-02', '2025-09-02 07:45:00', '2025-09-02', 'STU1357', 6),
(7, '2025-09-02 13:30:00', '2025-09-02', '2025-09-02 09:50:00', '2025-09-02', 'VWX9753', 7),
(8, '2025-09-02 16:10:00', '2025-09-02', '2025-09-02 11:20:00', '2025-09-02', 'YZA6420', 8),
(9, '2025-09-03 12:00:00', '2025-09-03', '2025-09-03 08:30:00', '2025-09-03', 'BCD1597', 9),
(10, '2025-09-03 18:20:00', '2025-09-03', '2025-09-03 14:10:00', '2025-09-03', 'EFG7531', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `codmodelo` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `modelo`
--

INSERT INTO `modelo` (`codmodelo`, `modelo`) VALUES
(1, 'Civic'),
(2, 'Corolla'),
(3, 'Onix'),
(4, 'HB20'),
(5, 'Gol'),
(6, 'Fiesta'),
(7, 'Siena'),
(8, 'Renegade'),
(9, 'Cruze'),
(10, 'Hilux');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `placa` varchar(20) NOT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `codmodelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`placa`, `cor`, `cpf`, `codmodelo`) VALUES
('ABC1234', 'Preto', '11111111111', 1),
('BCD1597', 'Branco', '99999999999', 9),
('EFG7531', 'Prata', '10101010101', 10),
('JKL4321', 'Prata', '33333333333', 3),
('MNO8765', 'Vermelho', '44444444444', 4),
('PQR2468', 'Azul', '55555555555', 5),
('STU1357', 'Preto', '66666666666', 6),
('VWX9753', 'Cinza', '77777777777', 7),
('XYZ5678', 'Branco', '22222222222', 2),
('YZA6420', 'Preto', '88888888888', 8);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`codandar`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `placa` (`placa`),
  ADD KEY `codandar` (`codandar`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codmodelo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `codmodelo` (`codmodelo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estaciona`
--
ALTER TABLE `estaciona`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `codmodelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `veiculo` (`placa`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`codandar`) REFERENCES `andar` (`codandar`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`codmodelo`) REFERENCES `modelo` (`codmodelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
