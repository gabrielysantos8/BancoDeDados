-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/08/2025 às 19:56
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restaurante`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `arearestaurante`
--

CREATE TABLE `arearestaurante` (
  `codarea` int(11) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `arearestaurante`
--

INSERT INTO `arearestaurante` (`codarea`, `descricao`) VALUES
(1, 'Área interna climatizada'),
(2, 'Varanda externa'),
(3, 'Salão principal'),
(4, 'Área VIP'),
(5, 'Terraço com vista'),
(6, 'Salão de eventos'),
(7, 'Área infantil'),
(8, 'Deck ao ar livre'),
(9, 'Área de fumantes'),
(10, 'Lounge bar');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `codatendimento` int(11) NOT NULL,
  `qtdepessoas` int(11) DEFAULT NULL,
  `horarioentrada` time DEFAULT NULL,
  `horariosaida` time DEFAULT NULL,
  `codmesa` int(11) DEFAULT NULL,
  `codgarcom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`codatendimento`, `qtdepessoas`, `horarioentrada`, `horariosaida`, `codmesa`, `codgarcom`) VALUES
(1, 4, '19:00:00', '20:30:00', 1, 1),
(2, 2, '18:15:00', '19:00:00', 2, 2),
(3, 3, '20:00:00', '21:10:00', 3, 3),
(4, 6, '19:30:00', '21:00:00', 4, 4),
(5, 5, '21:00:00', '22:30:00', 5, 5),
(6, 2, '17:00:00', '18:10:00', 6, 6),
(7, 4, '20:15:00', '21:20:00', 7, 7),
(8, 3, '18:40:00', '19:50:00', 8, 8),
(9, 6, '21:10:00', '22:45:00', 9, 9),
(10, 2, '19:20:00', '20:10:00', 10, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `codconta` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valortotal` decimal(10,2) DEFAULT NULL,
  `valorporpessoa` decimal(10,2) DEFAULT NULL,
  `codmesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta`
--

INSERT INTO `conta` (`codconta`, `data`, `valortotal`, `valorporpessoa`, `codmesa`) VALUES
(1, '2025-08-11', 100.50, 25.13, 1),
(2, '2025-08-11', 62.40, 31.20, 2),
(3, '2025-08-11', 90.00, 30.00, 3),
(4, '2025-08-11', 250.00, 41.67, 4),
(5, '2025-08-11', 200.00, 40.00, 5),
(6, '2025-08-11', 55.00, 27.50, 6),
(7, '2025-08-11', 150.00, 37.50, 7),
(8, '2025-08-11', 120.00, 40.00, 8),
(9, '2025-08-11', 300.00, 50.00, 9),
(10, '2025-08-11', 60.00, 30.00, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `garcom`
--

CREATE TABLE `garcom` (
  `codgarcom` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `garcom`
--

INSERT INTO `garcom` (`codgarcom`, `nome`) VALUES
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Carlos Pereira'),
(4, 'Ana Souza'),
(5, 'Pedro Santos'),
(6, 'Luiza Ferreira'),
(7, 'Rafael Costa'),
(8, 'Juliana Rocha'),
(9, 'Fernando Lima'),
(10, 'Camila Almeida');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE `item` (
  `coditem` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item`
--

INSERT INTO `item` (`coditem`, `nome`, `preco`) VALUES
(1, 'Pizza Margherita', 45.90),
(2, 'Pizza Calabresa', 49.90),
(3, 'Hambúrguer Artesanal', 32.00),
(4, 'Lasanha Bolonhesa', 39.50),
(5, 'Salada Caesar', 25.00),
(6, 'Suco Natural', 8.50),
(7, 'Refrigerante Lata', 6.00),
(8, 'Água Mineral', 4.50),
(9, 'Sorvete 2 bolas', 12.00),
(10, 'Café Espresso', 5.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itensconta`
--

CREATE TABLE `itensconta` (
  `coditensconta` int(11) NOT NULL,
  `qtde` int(11) DEFAULT NULL,
  `totalitem` decimal(10,2) DEFAULT NULL,
  `codconta` int(11) DEFAULT NULL,
  `coditem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itensconta`
--

INSERT INTO `itensconta` (`coditensconta`, `qtde`, `totalitem`, `codconta`, `coditem`) VALUES
(1, 2, 91.80, 1, 1),
(2, 4, 34.00, 1, 6),
(3, 1, 49.90, 2, 2),
(4, 2, 12.00, 2, 7),
(5, 3, 96.00, 3, 3),
(6, 2, 79.00, 4, 4),
(7, 5, 125.00, 5, 5),
(8, 2, 9.00, 6, 8),
(9, 4, 48.00, 7, 9),
(10, 2, 10.00, 8, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesa`
--

CREATE TABLE `mesa` (
  `codmesa` int(11) NOT NULL,
  `comporta` int(11) DEFAULT NULL,
  `codarea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mesa`
--

INSERT INTO `mesa` (`codmesa`, `comporta`, `codarea`) VALUES
(1, 4, 1),
(2, 6, 2),
(3, 2, 3),
(4, 8, 4),
(5, 4, 5),
(6, 6, 1),
(7, 2, 2),
(8, 8, 3),
(9, 4, 4),
(10, 6, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `arearestaurante`
--
ALTER TABLE `arearestaurante`
  ADD PRIMARY KEY (`codarea`);

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`codatendimento`),
  ADD KEY `codmesa` (`codmesa`),
  ADD KEY `codgarcom` (`codgarcom`);

--
-- Índices de tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`codconta`),
  ADD KEY `codmesa` (`codmesa`);

--
-- Índices de tabela `garcom`
--
ALTER TABLE `garcom`
  ADD PRIMARY KEY (`codgarcom`);

--
-- Índices de tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`coditem`);

--
-- Índices de tabela `itensconta`
--
ALTER TABLE `itensconta`
  ADD PRIMARY KEY (`coditensconta`),
  ADD KEY `codconta` (`codconta`),
  ADD KEY `coditem` (`coditem`);

--
-- Índices de tabela `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`codmesa`),
  ADD KEY `codarea` (`codarea`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arearestaurante`
--
ALTER TABLE `arearestaurante`
  MODIFY `codarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `codatendimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `codconta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `garcom`
--
ALTER TABLE `garcom`
  MODIFY `codgarcom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `coditem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itensconta`
--
ALTER TABLE `itensconta`
  MODIFY `coditensconta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `mesa`
--
ALTER TABLE `mesa`
  MODIFY `codmesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`codmesa`) REFERENCES `mesa` (`codmesa`),
  ADD CONSTRAINT `atendimento_ibfk_2` FOREIGN KEY (`codgarcom`) REFERENCES `garcom` (`codgarcom`);

--
-- Restrições para tabelas `conta`
--
ALTER TABLE `conta`
  ADD CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`codmesa`) REFERENCES `mesa` (`codmesa`);

--
-- Restrições para tabelas `itensconta`
--
ALTER TABLE `itensconta`
  ADD CONSTRAINT `itensconta_ibfk_1` FOREIGN KEY (`codconta`) REFERENCES `conta` (`codconta`),
  ADD CONSTRAINT `itensconta_ibfk_2` FOREIGN KEY (`coditem`) REFERENCES `item` (`coditem`);

--
-- Restrições para tabelas `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`codarea`) REFERENCES `arearestaurante` (`codarea`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
