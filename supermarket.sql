drop table reposicao;
drop table evento_reposicao;
drop table planograma;
drop table prateleira;
drop table corredor;
drop table fornece_sec;
drop table produto;
drop table fornecedor;
drop table constituida;
drop table super_categoria;
drop table categoria_simples;
drop table categoria;

----------------------------------------
-- Criacao das Tabelas
----------------------------------------

-- As restricoes de nome sao globais na base de dados.
-- Portanto, vamos utilizar as seguintes regras para nao as confundir:
--   1. pk_table para os nomes de chaves primarias
--   2. fk_tabela_outra para os nomes de chaves estrangeiras

-- Categoria
create table categoria (
    nome varchar(15) not null unique,
    constraint pk_categoria primary key (nome)
);

-- Categoria Simples
create table categoria_simples (
    nome varchar(15) not null unique,
    constraint fk_categoria foreign key (nome) references categoria(nome),
    constraint pk_categoria_simples primary key (nome)
);

-- Super Categoria
create table super_categoria (
    nome varchar(15) not null unique,
    constraint fk_categoria foreign key (nome) references categoria(nome),
    constraint pk_super_categoria primary key (nome)
);

-- Constituida
create table constituida (
    super_categoria varchar(15),
    categoria varchar(15),
    constraint categoria_ciclica check (super_categoria != categoria),
    constraint fk_super_categoria foreign key (super_categoria) references super_categoria(nome),
    constraint fk_categoria foreign key (categoria) references categoria(nome),
    constraint pk_constituida primary key (super_categoria, categoria)
);

-- Fornecedor Primario
create table fornecedor (
    nif numeric(9,0) not null unique,
    nome varchar(15),
    constraint pk_fornecedor primary key (nif)
);

-- Produto
create table produto (
    ean numeric(13,0) not null unique,
    design varchar(50),
    categoria varchar(15),
    fornecedor numeric(9,0),
    instante timestamp,
    constraint fk_categoria foreign key (categoria) references categoria(nome),
    constraint fk_fornecedor foreign key (fornecedor) references fornecedor(nif),
    constraint pk_produto primary key (ean)
);

-- Fornecedor Secundario
create table fornece_sec (
    nif numeric(9,0),
    ean numeric(13,0),
    constraint fk_fornecedor foreign key (nif) references fornecedor(nif),
    constraint fk_produto foreign key (ean) references produto(ean),
    constraint pk_fornece_sec primary key (nif, ean)
);

-- Corredor
create table corredor (
    nro numeric(4,0) not null unique,
    largura numeric(3,0),
    constraint pk_corredor primary key (nro)
);

-- Prateleira
create table prateleira (
    nro numeric(4,0),
    lado varchar(1),
    altura numeric(3,0),
    unique (nro, lado, altura),
    constraint fk_corredor foreign key (nro) references corredor(nro),
    constraint pk_prateleira primary key (nro)
);

-- Planograma
create table planograma (
    ean numeric(13,0),
    nro numeric(4,0),
    lado varchar(1),
    altura numeric(3,0),
    face varchar(1),
    unidades numeric(4,0),
    loc varchar(15),
    constraint fk_produto foreign key (ean) references produto(ean),
    constraint fk_prateleira foreign key (nro, lado, altura) references prateleira(nro, lado, altura),
    constraint pk_planograma primary key (ean, nro, lado, altura)
);

-- Evento Reposicao
create table evento_reposicao (
    operador varchar(15),
    instante timestamp not null unique,
    constraint pk_evento_reposicao primary key (operador, instante)
);

-- Reposicao
create table reposicao (
    ean numeric(13,0),
    nro numeric(4,0),
    lado char(1),
    altura numeric(3,0),
    operador varchar(15),
    instante timestamp,
    unidades numeric(4,0),
    constraint fk_planograma foreign key (ean, nro, lado, altura) references planograma(ean, nro, lado, altura),
    constraint fk_evento_reposicao foreign key (operador, instante) references evento_reposicao(operador, instante),
    constraint pk_reposicao primary key (ean, nro, lado, altura, operador, instante)
);

----------------------------------------
-- Populate Relations
----------------------------------------

insert into categoria values ('Frescos');
insert into super_categoria values ('Frescos');

insert into categoria values ('Vegetais');
insert into categoria_simples values ('Vegetais');

insert into categoria values ('Carne');
insert into categoria_simples values ('Carne');

insert into categoria values ('Peixe');
insert into categoria_simples values ('Peixe');

insert into constituida values ('Frescos', 'Vegetais');
insert into constituida values ('Frescos', 'Carne');
insert into constituida values ('Frescos', 'Peixe');

insert into fornecedor values (123456789, 'Continente');
insert into fornecedor values (987654321, 'Makro');

insert into produto values (1234567891234, 'Salmao', 'Peixe', 987654321, '2017-11-28 11:58:48');

insert into fornece_sec values (123456789, 1234567891234);

insert into corredor values (1, 20);
insert into prateleira values (1, 'e', 10);

insert into planograma values (1234567891234, 1, 'e', 10, 'f', 4, 'Frigorificos');

insert into evento_reposicao values ('Andre', '2017-11-28 11:58:48');
insert into reposicao values (1234567891234, 1, 'e', 10, 'Andre', '2017-11-28 11:58:48', 4);