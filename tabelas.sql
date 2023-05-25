CREATE DATABASE PETSHOP; 
    
    CREATE TABLE IF NOT EXISTS Cliente (
        id_cliente INT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        endereco VARCHAR(100) NOT NULL,
        telefone VARCHAR(20) NOT NULL,
        email VARCHAR(50)
    );

    CREATE TABLE IF NOT EXISTS Animal (
        id_animal INT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        data_nascimento DATE,
        especie VARCHAR(50) NOT NULL,
        raca VARCHAR(50),
        id_cliente INT,
        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
    );

    CREATE TABLE IF NOT EXISTS Servico (
        id_servico INT PRIMARY KEY,
        tipo_servico VARCHAR(50) NOT NULL,
        preco DECIMAL(10, 2) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS Agendamento (
        id_agendamento INT PRIMARY KEY,
        data DATE NOT NULL,
        horario TIME NOT NULL,
        id_cliente INT,
        id_animal INT,
        id_servico INT,
        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
        FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
        FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
    );

    CREATE TABLE IF NOT EXISTS Produto (
        id_produto INT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        descricao VARCHAR(100),
        preco DECIMAL(10, 2) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS Venda (
        id_venda INT PRIMARY KEY,
        data DATE NOT NULL,
        id_cliente INT,
        id_animal INT,
        id_produto INT,
        quantidade INT NOT NULL,
        valor_total DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
        FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
        FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
    );

    CREATE TABLE IF NOT EXISTS Venda_produto (
        id_venda_produto INT PRIMARY KEY,
        data DATE NOT NULL,
        id_cliente INT,
        id_animal INT,
        id_produto INT,
        quantidade INT NOT NULL,
        valor_total DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
        FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
        FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
    );

    CREATE TABLE IF NOT EXISTS Vacinacao (
        id_vacinacao INT PRIMARY KEY,
        data DATE NOT NULL,
        id_animal INT,
        tipo_vacina VARCHAR(50) NOT NULL,
        lote_vacina VARCHAR(50),
        FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
    );

    CREATE TABLE IF NOT EXISTS Banho_tosa (
        id_banho_tosa INT PRIMARY KEY,
        data DATE NOT NULL,
        id_animal INT,
        tipo_banho VARCHAR(50) NOT NULL,
        preco DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
    );

    CREATE TABLE IF NOT EXISTS Internacao (
        id_internacao INT PRIMARY KEY,
        data_entrada DATE NOT NULL,
        data_saida DATE NOT NULL,
        id_animal INT,
        diagnostico VARCHAR(100),
        preco_total DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
    );