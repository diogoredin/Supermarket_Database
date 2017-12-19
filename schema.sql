----------------------------------------
-- Eliminacao das Tabelas
----------------------------------------

-- STAR SCHEMA
drop table fact_table;
drop table d_produto;
drop table d_tempo;

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

-- Nome de uma categoria tem de existir em categoria_simples ou super_categoria mas nao nas duas
create assertion categoria_definida check (
	not exists ( 
		select *
		from categoria cat
		where (  
			( cat.nome not in (select nome from categoria_simples) and cat.nome not in (select nome from super_categoria) )
			or 
			( cat.nome in (select nome from categoria_simples) and cat.nome in (select nome from super_categoria) ) 
		)
	)
);

-- Constituida
create table constituida (
	super_categoria varchar(15) not null,
	categoria varchar(15) not null,
	unique (super_categoria, categoria),
	constraint categoria_inception check (super_categoria != categoria),
	constraint fk_super_categoria foreign key (super_categoria) references super_categoria(nome),
	constraint fk_categoria foreign key (categoria) references categoria(nome),
	constraint pk_constituida primary key (super_categoria, categoria)
);

-- Nao podem existir ciclos super_categoria com categoria
create assertion categoria_ciclica check (
	not exists ( 
		select *
		from constituida const
		where ( const.super_categoria in (select categoria from constituida) 
				or const.categoria in (select super_categoria from constituida) )
	)
);

-- Uma super-categoria tem que estar presente na relacao constituida
create assertion constituida_super_categoria check (
	not exists ( 
		select *
		from super_categoria super
		where ( super.nome not in (select super_categoria from constituida) ) 
	)
);

-- Fornecedor
create table fornecedor (
	nif numeric(9,0) not null unique,
	nome varchar(15) not null unique,
	constraint pk_fornecedor primary key (nif)
);

-- Produto
create table produto (
	ean numeric(20,0) not null unique,
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
	nif numeric(9,0) not null,
	ean numeric(20,0) not null unique,
	constraint fk_fornecedor foreign key (nif) references fornecedor(nif),
	constraint fk_produto foreign key (ean) references produto(ean),
	constraint pk_fornece_sec primary key (nif, ean)
);

-- Todo os produtos tem de ter fornecedor secundario
create assertion produto_fornece_sec check (
	not exists ( 
		select *
		from produto pro
		where ( pro.ean not in (select ean from fornece_sec) ) 
	)
);

-- O fornecedor primario de um produto nao pode existir na relacao fornece_sec para o mesmo produto
create assertion produto_fornece_sec check (
	not exists ( 
		select *
		from produto pro
		where ( pro.fornecedor in (select nif from fornece_sec) )
	)
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
	ean numeric(20,0) not null unique,
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
	constraint categoria_inception check (instante <= now()),
	constraint pk_evento_reposicao primary key (operador, instante)
);

-- Reposicao
create table reposicao (
	ean numeric(20,0) not null,
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

-- STAR SCHEMA
CREATE TABLE d_produto(
    cean numeric(20,0) not null unique,
    categoria varchar(15) not null,
    nif_fornecedor_principal numeric(9,0) not null,
    constraint fk_categoria foreign key (categoria) references categoria(nome),
	constraint fk_fornecedor foreign key (nif_fornecedor_principal) references fornecedor(nif),
	constraint pk_d_produto primary key (cean)
);

CREATE TABLE d_tempo(
    dia numeric(2,0) not null,
    mes numeric(2,0) not null,
    ano numeric(4,0) not null,
    constraint pk_d_tempo primary key (dia, mes, ano)
);

CREATE TABLE fact_table(
    cean numeric(20,0) not null,
    dia numeric(2,0) not null,
    mes numeric(2,0) not null,
    ano numeric (4,0) not null,
    unidades numeric(4,0) not null,
    constraint fk_cean foreign key (cean) references d_produto(cean),
    constraint pk_fact_table primary key (cean, dia, mes, ano)
);


-- 
CREATE FUNCTION fornecedor_ciclico() RETURNS TRIGGER AS
    $$
    begin
        IF ( EXISTS ( SELECT * FROM produto pro WHERE ( pro.fornecedor = new.nif AND pro.ean = new.ean ) ) ) THEN
            RAISE EXCEPTION 'Fornecedor secundario % introduzido para o produto % ja e primario para o mesmo.', new.nif, new.ean;
        END IF;
    RETURN new;
    END
    $$ language plpgsql;

CREATE TRIGGER fornecedor_ciclico AFTER INSERT ON fornece_sec FOR EACH ROW EXECUTE PROCEDURE fornecedor_ciclico();
