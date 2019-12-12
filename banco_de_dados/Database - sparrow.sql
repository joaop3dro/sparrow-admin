-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Dez-2019 às 01:01
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sparrow`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome`) VALUES
(1, 'Desenvolvimento'),
(2, 'Segurança da Informação'),
(3, 'Governaça de TI'),
(4, 'Gestão de Contratos de TI'),
(5, 'Infraestrutura');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `conteudo` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_subcategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `eventos`
--

INSERT INTO `eventos` (`id_evento`, `titulo`, `descricao`, `conteudo`, `id_categoria`, `id_subcategoria`) VALUES
(1, 'Novidades do PHP 7.3', 'O PHP 7.3 é muito top', 'CONTEUDO', 1, 1),
(2, 'Novidades do HTML5', 'Está e a descricao do HTML5', 'CONTEUDO', 1, 1),
(3, 'SERVIDOR HTTP NO WINDOWS', 'Conheça o IIS servidor HTTP do windows', 'CONTEUDO', 5, 1),
(4, 'PADRAO E-MAG', 'Criando SITES para cego ver', 'CONTEUDO', 1, 1),
(5, 'Contratando Softwares como Serviço', 'Gestão de contratos de Software', 'CONTEUDO', 3, 1),
(6, 'Cripto Virus', 'Preteja sua organização contra essa ameaça', 'CONTEUDO', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id_subcategoria` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `subcategorias`
--

INSERT INTO `subcategorias` (`id_subcategoria`, `id_categoria`, `nome`) VALUES
(1, 1, 'PHP'),
(2, 1, 'HTML'),
(3, 1, 'CSS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `primeiro_nome` varchar(15) NOT NULL,
  `segundo_nome` varchar(250) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `situacao` varchar(7) NOT NULL DEFAULT 'Ativo',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `cpf`, `primeiro_nome`, `segundo_nome`, `email`, `senha`, `situacao`, `data_criacao`, `data_atualizacao`) VALUES
(1, '125.986.198-98', 'Welton', 'Castoldi', 'welton@email.com.br', '123456', 'Ativo', '2019-11-19 23:08:14', '2019-11-20 00:02:45'),
(2, '125.986.198-90', 'GABI', 'GOL', 'email@email.com', '1234567', 'Ativo', '2019-11-19 23:13:00', '2019-11-19 23:50:32'),
(5, '112.459.786.52', 'Bruna', 'Mendes Toffoli', 'email@email.com', '89665', 'Ativo', '2019-11-19 23:23:39', '2019-11-19 23:50:32'),
(6, '111.450.786.04', 'Heloisa', 'Castoldi Lemos', 'email@email.com', '89665', 'Ativo', '2019-11-19 23:23:39', '2019-11-19 23:50:32');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_subcategoria` (`id_subcategoria`);

--
-- Índices para tabela `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id_subcategoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `cpf` (`cpf`);
ALTER TABLE `usuarios` ADD FULLTEXT KEY `primeiro_nome` (`primeiro_nome`);
ALTER TABLE `usuarios` ADD FULLTEXT KEY `segundo_nome` (`segundo_nome`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_id_subcategoria_evento` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`);

--
-- Limitadores para a tabela `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `fk_id_categoria_subcategoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
