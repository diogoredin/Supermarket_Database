----------------------------------------
-- Populate Relations
----------------------------------------

insert into categoria values ('Frescos');
insert into super_categoria values ('Frescos');

insert into categoria values ('Vegetais');
insert into categoria_simples values ('Vegetais');

insert into categoria values ('Fruta');
insert into categoria_simples values ('Fruta');

insert into categoria values ('Carne');
insert into categoria_simples values ('Carne');

insert into categoria values ('Peixe');
insert into categoria_simples values ('Peixe');

insert into constituida values ('Frescos', 'Fruta');
insert into constituida values ('Frescos', 'Vegetais');
insert into constituida values ('Frescos', 'Carne');
insert into constituida values ('Frescos', 'Peixe');

insert into categoria values ('Lacticinios');
insert into super_categoria values ('Lacticinios');

insert into categoria values ('Leite');
insert into categoria_simples values ('Leite');

insert into categoria values ('Iogurte');
insert into categoria_simples values ('Iogurte');

insert into categoria values ('Queijo');
insert into categoria_simples values ('Queijo');

insert into categoria values ('Manteiga');
insert into categoria_simples values ('Manteiga');

insert into constituida values ('Lacticinios', 'Leite');
insert into constituida values ('Lacticinios', 'Iogurte');
insert into constituida values ('Lacticinios', 'Queijo');
insert into constituida values ('Lacticinios', 'Manteiga');

insert into categoria values ('Massas');
insert into super_categoria values ('Massas');

insert into categoria values ('Penne');
insert into categoria_simples values ('Penne');

insert into categoria values ('Spaghettini');
insert into categoria_simples values ('Spaghettini');

insert into categoria values ('Fusilli');
insert into categoria_simples values ('Fusilli');

insert into categoria values ('Ravioli');
insert into categoria_simples values ('Ravioli');

insert into categoria values ('Tagliati');
insert into categoria_simples values ('Tagliati');

insert into categoria values ('Taglierini');
insert into categoria_simples values ('Taglierini');

insert into categoria values ('Lasagne');
insert into categoria_simples values ('Lasagne');

insert into categoria values ('Caneloni');
insert into categoria_simples values ('Caneloni');

insert into constituida values ('Massas', 'Penne');
insert into constituida values ('Massas', 'Spaghettini');
insert into constituida values ('Massas', 'Fusilli');
insert into constituida values ('Massas', 'Ravioli');
insert into constituida values ('Massas', 'Tagliati');
insert into constituida values ('Massas', 'Taglierini');
insert into constituida values ('Massas', 'Lasagne');
insert into constituida values ('Massas', 'Caneloni');

insert into fornecedor values (123456789, 'Peixaria');
insert into fornecedor values (927654321, 'Talho');
insert into fornecedor values (12345678, 'Agros');
insert into fornecedor values (987454321, 'Mimosa');
insert into fornecedor values (123456783, 'Matinal');
insert into fornecedor values (987656321, 'Primor');
insert into fornecedor values (123456689, 'Vigor');
insert into fornecedor values (987654621, 'Parmalat');
insert into fornecedor values (123656789, 'Milaneza');
insert into fornecedor values (987656322, 'Nacional');
insert into fornecedor values (947654321, 'Horta de Cima');
insert into fornecedor values (323456789, 'Pomar do Lado');
insert into fornecedor values (123453749, 'Casteloes');
insert into fornecedor values (323456782, 'Nova Acores');
insert into fornecedor values (984654321, 'Seia');
insert into fornecedor values (123454789, 'Estrela');
insert into fornecedor values (937654321, 'Campestre');
insert into fornecedor values (223456789, 'Makro');

insert into produto values (1234517891234, 'Salmao', 'Peixe', 223456789, '2017-10-22 11:58:00');
insert into produto values (1234527891234, 'Corvina', 'Peixe', 223456789, '2017-11-18 10:30:00');
insert into produto values (1234537891234, 'Carapau', 'Peixe', 223456789, '2017-11-08 09:21:00');
insert into produto values (4234547891234, 'Pescada', 'Peixe', 223456789, '2017-11-18 10:20:00');
insert into produto values (1234557891234, 'Sardinha', 'Peixe', 223456789, '2017-11-28 18:10:00');
insert into produto values (1234567891234, 'Perca', 'Peixe', 223456789, '2017-11-28 19:22:00');
insert into produto values (4234577891234, 'Arenque', 'Peixe', 223456789, '2017-11-28 13:09:00');
insert into produto values (1234587891234, 'Atum', 'Peixe', 223456789, '2017-11-28 10:10:00');
insert into produto values (1234597891234, 'Bacalhau', 'Peixe', 223456789, '2017-11-28 10:23:00');
insert into produto values (1234507891234, 'Cavala', 'Peixe', 223456789, '2017-11-28 11:20:00');
insert into produto values (3234561891234, 'Peixe-Espada', 'Peixe', 223456789, '2017-11-28 12:21:00');
insert into produto values (1234562891239, 'Pargo', 'Peixe', 223456789, '2017-11-28 13:10:00');
insert into produto values (1234563891234, 'Garoupa', 'Peixe', 223456789, '2017-11-28 14:11:00');
insert into produto values (1234564791234, 'Dourada', 'Peixe', 223456789, '2017-11-28 15:01:00');
insert into produto values (2234565891234, 'Anchova', 'Peixe', 223456789, '2017-11-28 16:05:00');
insert into produto values (1234566891234, 'Tainha', 'Peixe', 223456789, '2017-11-28 17:03:00');
insert into produto values (2234567891234, 'Linguado', 'Peixe', 223456789, '2017-11-28 18:22:00');
insert into produto values (1234568891234, 'Robalo', 'Peixe', 223456789, '2017-11-28 19:25:00');
insert into produto values (1234562891234, 'Truta', 'Peixe', 223456789, '2017-11-28 20:10:00');
insert into produto values (1234564891234, 'Penne Rigate', 'Penne', 223456789, '2017-11-28 21:25:00');
insert into produto values (6534567891234, 'Penne Integral', 'Penne', 223456789, '2017-11-28 22:45:00');
insert into produto values (8634567891234, 'Spaghettini Rigate', 'Spaghettini', 223456789, '2017-11-28 23:50:00');
insert into produto values (8134567891234, 'Spaghettini Integral', 'Spaghettini', 223456789, '2017-11-28 01:10:00');
insert into produto values (6234567591234, 'Taglierini Rigate', 'Taglierini', 223456789, '2017-11-28 08:02:00');
insert into produto values (9232567891234, 'Taglierini Integral', 'Taglierini', 223456789, '2017-11-28 09:21:00');
insert into produto values (8233567891234, 'Lasagne Rigate', 'Lasagne', 223456789, '2017-11-28 10:11:00');
insert into produto values (7234467891234, 'Lasagne Integral', 'Lasagne', 223456789, '2017-11-28 11:27:00');
insert into produto values (6234567811234, 'Caneloni Rigate', 'Caneloni', 223456789, '2017-11-28 12:02:00');
insert into produto values (1234567791234, 'Caneloni Integral', 'Caneloni', 223456789, '2017-11-28 13:29:00');
insert into produto values (1234567691234, 'Hamburguer Vaca', 'Carne', 223456789, '2017-11-28 14:03:00');
insert into produto values (1234567591234, 'Lombo Porco', 'Carne', 223456789, '2017-11-28 15:10:00');
insert into produto values (1234567491234, 'Bife Vazia', 'Carne', 223456789, '2017-11-28 16:11:00');
insert into produto values (1234567391234, 'Leite sem Lactose', 'Leite', 223456789, '2017-11-28 17:01:00');
insert into produto values (1234567291234, 'Leite Soja', 'Leite', 223456789, '2017-11-28 18:00:00');
insert into produto values (1234567191234, 'Leite Meio Gordo', 'Leite', 223456789, '2017-11-28 19:22:00');
insert into produto values (1294567891234, 'Manteiga Light', 'Manteiga', 223456789, '2017-11-28 20:00:00');
insert into produto values (1284567891234, 'Manteiga Gorda', 'Manteiga', 223456789, '2017-11-28 21:11:00');
insert into produto values (1274567891234, 'Queijo XXL', 'Queijo', 223456789, '2017-11-28 22:22:00');
insert into produto values (1264567891234, 'Queijo Amanteigado', 'Queijo', 223456789, '2017-11-28 23:20:00');
insert into produto values (1254567891234, 'Queijo de Seia', 'Queijo', 223456789, '2017-11-28 00:35:00');
insert into produto values (1244567891234, 'Queijo da Serra', 'Queijo', 223456789, '2017-11-28 01:24:00');
insert into produto values (1234547891234, 'Alface', 'Vegetais', 223456789, '2017-11-28 01:22:00');
insert into produto values (1224567891234, 'Tomate', 'Vegetais', 223456789, '2017-11-28 02:51:00');
insert into produto values (1214567891234, 'Cenoura', 'Vegetais', 223456789, '2017-11-28 01:49:00');
insert into produto values (9234567891234, 'Coentros', 'Vegetais', 223456789, '2017-11-28 04:01:00');
insert into produto values (2224567892234, 'Maca', 'Fruta', 223456789, '2017-11-28 02:51:00');
insert into produto values (2214567891232, 'Banana', 'Fruta', 223456789, '2017-11-28 01:49:00');
insert into produto values (9234267891232, 'Pera', 'Fruta', 223456789, '2017-11-28 04:01:00');

insert into fornece_sec values (123456789, 1234517891234);
insert into fornece_sec values (123456789, 1234527891234);
insert into fornece_sec values (123456789, 1234537891234);
insert into fornece_sec values (123456789, 4234547891234);
insert into fornece_sec values (123456789, 1234557891234);
insert into fornece_sec values (123456789, 1234567891234);
insert into fornece_sec values (123456789, 4234577891234);
insert into fornece_sec values (123456789, 1234587891234);
insert into fornece_sec values (123456789, 1234597891234);
insert into fornece_sec values (123456789, 1234507891234);
insert into fornece_sec values (123456789, 3234561891234);
insert into fornece_sec values (123456789, 1234562891239);
insert into fornece_sec values (123456789, 1234563891234);
insert into fornece_sec values (123456789, 1234564791234);
insert into fornece_sec values (123456789, 2234565891234);
insert into fornece_sec values (123456789, 1234566891234);
insert into fornece_sec values (123456789, 2234567891234);
insert into fornece_sec values (123456789, 1234568891234);
insert into fornece_sec values (123456789, 1234562891234);
insert into fornece_sec values (123656789, 1234564891234);
insert into fornece_sec values (123656789, 6534567891234);
insert into fornece_sec values (123656789, 8634567891234);
insert into fornece_sec values (123656789, 8134567891234);
insert into fornece_sec values (987656321, 6234567591234);
insert into fornece_sec values (987656321, 9232567891234);
insert into fornece_sec values (123656789, 8233567891234);
insert into fornece_sec values (123656789, 7234467891234);
insert into fornece_sec values (123656789, 6234567811234);
insert into fornece_sec values (123656789, 1234567791234);
insert into fornece_sec values (927654321, 1234567691234);
insert into fornece_sec values (927654321, 1234567591234);
insert into fornece_sec values (927654321, 1234567491234);
insert into fornece_sec values (123456783, 1234567391234);
insert into fornece_sec values (123456783, 1234567291234);
insert into fornece_sec values (987656322, 1234567191234);
insert into fornece_sec values (987654621, 1294567891234);
insert into fornece_sec values (323456789, 1284567891234);
insert into fornece_sec values (123453749, 1274567891234);
insert into fornece_sec values (984654321, 1264567891234);
insert into fornece_sec values (984654321, 1254567891234);
insert into fornece_sec values (123454789, 1244567891234);
insert into fornece_sec values (947654321, 1234547891234);
insert into fornece_sec values (947654321, 1224567891234);
insert into fornece_sec values (947654321, 1214567891234);
insert into fornece_sec values (947654321, 9234567891234);
insert into fornece_sec values (323456789, 2224567892234);
insert into fornece_sec values (323456789, 2214567891232);
insert into fornece_sec values (323456789, 9234267891232);

insert into corredor values (0, 20);
insert into corredor values (1, 20);
insert into corredor values (2, 20);
insert into corredor values (3, 20);
insert into corredor values (4, 20);
insert into corredor values (5, 20);
insert into corredor values (6, 20);
insert into corredor values (7, 20);
insert into corredor values (8, 20);
insert into corredor values (9, 20);
insert into corredor values (10, 20);

insert into prateleira values (1, 'd', 10);
insert into prateleira values (2, 'd', 10);
insert into prateleira values (3, 'd', 10);
insert into prateleira values (4, 'd', 10);
insert into prateleira values (5, 'd', 10);
insert into prateleira values (6, 'd', 10);
insert into prateleira values (7, 'd', 10);
insert into prateleira values (8, 'd', 10);
insert into prateleira values (9, 'd', 10);
insert into prateleira values (10, 'd', 10);

insert into planograma values (1234517891234, 1, 'd', 10, 'f', 4, 'Zona A');
insert into planograma values (1234527891234, 2, 'd', 10, 'f', 4, 'Zona B');
insert into planograma values (1234537891234, 3, 'd', 10, 'f', 4, 'Zona C');
insert into planograma values (4234547891234, 4, 'd', 10, 'f', 4, 'Zona D');
insert into planograma values (1234557891234, 5, 'd', 10, 'f', 4, 'Zona E');
insert into planograma values (1214567891234, 6, 'd', 10, 'f', 4, 'Zona A');
insert into planograma values (8634567891234, 7, 'd', 10, 'f', 4, 'Zona B');
insert into planograma values (1234547891234, 8, 'd', 10, 'f', 4, 'Zona C');
insert into planograma values (3234561891234, 9, 'd', 10, 'f', 4, 'Zona D');

insert into evento_reposicao values ('Andre', '2017-11-28 11:58:00');
insert into evento_reposicao values ('Andreia', '2017-11-28 11:10:00');
insert into evento_reposicao values ('Joao', '2017-11-28 09:30:00');
insert into evento_reposicao values ('Joana', '2017-11-28 07:23:00');
insert into evento_reposicao values ('Ana', '2017-11-28 22:10:00');
insert into evento_reposicao values ('Hugo', '2017-11-28 18:10:00');
insert into evento_reposicao values ('Mariana', '2017-11-28 09:11:00');
insert into evento_reposicao values ('Susana', '2017-11-28 10:10:00');
insert into evento_reposicao values ('Francisco', '2017-11-28 16:05:00');

insert into reposicao values (1234517891234, 1, 'd', 10, 'Andre', '2017-11-28 11:58:00', 4);
insert into reposicao values (1234527891234, 2, 'd', 10, 'Andreia', '2017-11-28 11:10:00', 4);
insert into reposicao values (1234537891234, 3, 'd', 10, 'Joao', '2017-11-28 09:30:00', 4);
insert into reposicao values (4234547891234, 4, 'd', 10, 'Joana', '2017-11-28 07:23:00', 4);
insert into reposicao values (1234557891234, 5, 'd', 10, 'Ana', '2017-11-28 22:10:00', 4);
insert into reposicao values (1214567891234, 6, 'd', 10, 'Hugo', '2017-11-28 18:10:00', 4);
insert into reposicao values (8634567891234, 7, 'd', 10, 'Mariana', '2017-11-28 09:11:00', 4);
insert into reposicao values (1234547891234, 8, 'd', 10, 'Susana', '2017-11-28 10:10:00', 4);
insert into reposicao values (3234561891234, 9, 'd', 10, 'Francisco', '2017-11-28 16:05:00', 4);

-- STAR SCHEMA
INSERT INTO d_produto
SELECT ean, categoria, fornecedor
FROM produto;

INSERT INTO d_tempo
SELECT DISTINCT extract(day FROM instante), extract(month FROM instante), extract(year FROM instante)
FROM evento_reposicao;

INSERT INTO fact_table
SELECT cean, dia, mes, ano, unidades
FROM d_produto, d_tempo, reposicao
WHERE cean = ean AND
extract(day FROM instante) = dia AND
extract(month FROM instante) = mes AND
extract(year FROM instante) = ano;