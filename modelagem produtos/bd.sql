/* Lógico_produtos: */

CREATE DATABASE etecmcm2;

USE etecmcm2;

CREATE TABLE Produtos (
    id_Produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    qtde INT,
    preco DECIMAL(10,2),
    marca VARCHAR(255),
    fk_categorias_id_Categoria INT
);

CREATE TABLE categorias (
    id_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255)
);
 
ALTER TABLE Produtos ADD CONSTRAINT FK_Produtos_2
    FOREIGN KEY (fk_categorias_id_Categoria)
    REFERENCES categorias (id_Categoria)
    ON DELETE RESTRICT;