-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/08/2025 às 22:41
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

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `codconta` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valortotal` decimal(10,2) DEFAULT NULL,
  `valorporpessoa` decimal(10,2) DEFAULT NULL,
  `codatendimento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `garcom`
--

CREATE TABLE `garcom` (
  `codgarcom` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE `item` (
  `coditem` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `codatendimento` (`codatendimento`);

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
  MODIFY `codarea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `codatendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `codconta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `garcom`
--
ALTER TABLE `garcom`
  MODIFY `codgarcom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `coditem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itensconta`
--
ALTER TABLE `itensconta`
  MODIFY `coditensconta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesa`
--
ALTER TABLE `mesa`
  MODIFY `codmesa` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`codatendimento`) REFERENCES `atendimento` (`codatendimento`);

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
