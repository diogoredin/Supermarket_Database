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
    super_categoria varchar(15) not null,
    categoria varchar(15) not null,
	unique (super_categoria, categoria),
    constraint categoria_ciclica check (super_categoria != categoria),
    constraint fk_super_categoria foreign key (super_categoria) references super_categoria(nome),
    constraint fk_categoria foreign key (categoria) references categoria(nome),
    constraint pk_constituida primary key (super_categoria, categoria)
);

-- Fornecedor
create table fornecedor (
    nif numeric(9,0) not null unique,
    nome varchar(15) not null unique,
    constraint pk_fornecedor primary key (nif)
);

-- Produto
create table produto (
    ean numeric(13,0) not null unique,
    design varchar(50) not null,
    categoria varchar(15) not null,
    fornecedor numeric(9,0) not null,
    instante timestamp not null,
    constraint fk_categoria foreign key (categoria) references categoria(nome),
    constraint fk_fornecedor foreign key (fornecedor) references fornecedor(nif),
    constraint pk_produto primary key (ean)
);

-- Fornecedor Secundario
create table fornece_sec (
    nif numeric(9,0) not null unique,
    ean numeric(13,0) not null,
    constraint fk_fornecedor foreign key (nif) references fornecedor(nif),
    constraint fk_produto foreign key (ean) references produto(ean),
    constraint pk_fornece_sec primary key (nif, ean)
);

-- Corredor
create table corredor (
    nro numeric(4,0) not null unique,
    largura numeric(3,0) not null,
    constraint pk_corredor primary key (nro)
);

-- Prateleira
create table prateleira (
    nro numeric(4,0) not null,
    lado varchar(1) not null,
    altura numeric(3,0) not null,
    unique (nro, lado, altura),
    constraint fk_corredor foreign key (nro) references corredor(nro),
    constraint pk_prateleira primary key (nro)
);

-- Planograma
create table planograma (
    ean numeric(13,0) not null unique,
    nro numeric(4,0) not null,
    lado varchar(1) not null,
    altura numeric(3,0) not null,
    face varchar(1) not null,
    unidades numeric(4,0) not null,
    loc varchar(15) not null,
    constraint fk_produto foreign key (ean) references produto(ean),
    constraint fk_prateleira foreign key (nro, lado, altura) references prateleira(nro, lado, altura),
    constraint pk_planograma primary key (ean, nro, lado, altura)
);

-- Evento Reposicao
create table evento_reposicao (
    operador varchar(15) not null,
    instante timestamp not null,
	unique (operador, instante),
    constraint pk_evento_reposicao primary key (operador, instante)
);

-- Reposicao
create table reposicao (
    ean numeric(13,0) not null,
    nro numeric(4,0) not null,
    lado char(1) not null,
    altura numeric(3,0) not null,
    operador varchar(15) not null,
    instante timestamp not null,
    unidades numeric(4,0) not null,
	unique (ean, nro, lado, altura, operador, instante, unidades),
    constraint fk_planograma foreign key (ean, nro, lado, altura) references planograma(ean, nro, lado, altura),
    constraint fk_evento_reposicao foreign key (operador, instante) references evento_reposicao(operador, instante),
    constraint pk_reposicao primary key (ean, nro, lado, altura, operador, instante)
);