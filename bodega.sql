-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/10/2024 às 02:43
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bodega`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id_category`, `name`, `description`) VALUES
(1, 'Bebidas', 'Todas as bebidas disponíveis no bar'),
(2, 'Petiscos', 'Aperitivos e petiscos para acompanhar as bebidas'),
(3, 'Pratos principais', 'Refeições completas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clients`
--

INSERT INTO `clients` (`id_client`, `name`, `cpf`, `contact`) VALUES
(1, 'João Silva', '123.456.789-00', '(11) 91234-5678'),
(2, 'Maria Oliveira', '987.654.321-00', '(11) 99876-5432'),
(3, 'Pedro Santos', '456.789.123-00', '(11) 93456-7890'),
(4, 'Ana Costa', '321.654.987-00', '(11) 92345-6789');

-- --------------------------------------------------------

--
-- Estrutura para tabela `operators`
--

CREATE TABLE `operators` (
  `id_operator` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `operators`
--

INSERT INTO `operators` (`id_operator`, `name`, `password`, `is_admin`) VALUES
(1, 'Carlos', 'senha123', 1),
(2, 'Fernanda', 'senha456', 0),
(3, 'Roberto', 'senha789', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_operator` int(11) DEFAULT NULL,
  `id_paytype` int(11) DEFAULT NULL,
  `opening` datetime DEFAULT NULL,
  `closure` datetime DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id_order`, `id_client`, `id_operator`, `id_paytype`, `opening`, `closure`, `total`) VALUES
(1, 1, 1, 1, '2024-10-20 18:00:00', '2024-10-20 20:00:00', 50),
(2, 2, 2, 2, '2024-10-20 19:00:00', '2024-10-20 21:00:00', 35),
(3, 3, 1, 3, '2024-10-20 20:00:00', '2024-10-20 22:00:00', 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_types`
--

CREATE TABLE `payment_types` (
  `id_paytype` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `payment_types`
--

INSERT INTO `payment_types` (`id_paytype`, `name`) VALUES
(1, 'Cartão de crédito'),
(2, 'Cartão de débito'),
(3, 'Dinheiro'),
(4, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `products`
--

INSERT INTO `products` (`id_product`, `name`, `size`, `expiration_date`, `id_category`, `price`, `quantity`) VALUES
(1, 'Cerveja Artesanal', 'Long Neck', '2025-12-31', 1, 12, 100),
(2, 'Caipirinha', '500ml', '2024-10-21', 1, 15, 50),
(3, 'Batata Frita', 'Porção', '2024-10-21', 2, 10, 80),
(4, 'Coxinha', 'Unidade', '2024-10-21', 2, 5, 150),
(5, 'Feijoada', 'Prato', '2024-10-21', 3, 25, 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_orders`
--

CREATE TABLE `product_orders` (
  `id_prorder` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `product_orders`
--

INSERT INTO `product_orders` (`id_prorder`, `id_order`, `id_product`, `quantity`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 2, 4, 2),
(5, 3, 5, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Índices de tabela `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Índices de tabela `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id_operator`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_operator` (`id_operator`),
  ADD KEY `id_paytype` (`id_paytype`);

--
-- Índices de tabela `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id_paytype`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Índices de tabela `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id_prorder`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_order` (`id_order`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `operators`
--
ALTER TABLE `operators`
  MODIFY `id_operator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id_paytype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id_prorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_operator`) REFERENCES `operators` (`id_operator`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_paytype`) REFERENCES `payment_types` (`id_paytype`);

--
-- Restrições para tabelas `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`);

--
-- Restrições para tabelas `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `product_orders_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
