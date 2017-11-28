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