-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/05/2025 às 02:11
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
-- Banco de dados: `etecmcm2`
--
CREATE DATABASE IF NOT EXISTS `etecmcm2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `etecmcm2`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_cat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_cat`) VALUES
(1, 'Limpeza'),
(2, 'Frios'),
(3, 'Laticínios'),
(4, 'Enlatados'),
(5, 'Carnes'),
(6, 'Hortfrut'),
(7, 'Perfumaria'),
(8, 'Bebidas'),
(9, 'Eletrônicos'),
(10, 'Congelados');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `unidade_medida` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `preco`, `quant`, `marca`, `id_categoria`, `unidade_medida`) VALUES
(1, 'sabão em pó', 25.00, 4, 'omo', 1, 'un'),
(2, 'Detergente', 3.50, 15, 'Ypê', 1, 'un'),
(3, 'Mussarela', 25.49, 30, 'Presidente', 2, 'kg'),
(4, 'Pesunto', 6.99, 50, 'Sadia', 2, 'kg'),
(5, 'Mortadela', 3.99, 67, 'Perdigão', 2, 'kg'),
(6, 'Leite', 4.29, 67, 'Italac', 3, 'un'),
(7, 'Iorgute natural', 2.99, 40, 'Danone', 3, 'un'),
(8, 'Milho', 3.29, 57, 'Quero', 4, 'un'),
(9, 'Sardinha em óleo', 5.99, 34, 'Coqueiro', 4, 'un'),
(10, 'Filé de Frango', 18.90, 89, 'Seara', 5, 'kg'),
(11, 'Contra filé bovino', 34.99, 57, 'Friboi', 5, 'kg'),
(12, 'Manga', 3.00, 56, 'Produto nacional', 6, 'un'),
(13, 'Alface', 2.79, 78, 'Orgânicos do Sul', 6, 'un'),
(14, 'Shampoo', 20.79, 70, 'Elseve', 7, 'un'),
(15, 'Desodorante', 11.50, 56, 'Rexona', 7, 'un'),
(16, 'Refrigerante', 8.99, 89, 'Coca-cola', 8, 'un'),
(17, 'Suco de laranja', 6.49, 80, 'Del Valle', 8, 'un'),
(18, 'Fone de Ouvido Bluetooth', 89.90, 45, 'Multilaser', 9, 'un'),
(19, 'Carregador Turbo USB', 59.00, 56, 'Samsung', 9, 'un'),
(20, 'Lasanha Bolonhesa', 14.00, 90, 'Sadia', 10, 'un'),
(21, 'Pizza Calabresa', 16.90, 77, 'Perdigão', 10, 'un');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
