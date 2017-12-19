-- DROPPING INDEXES
DROP INDEX nif_fornecedor_idx;
DROP INDEX nif_produto_idx;
DROP INDEX categoria_frutos_idx;
DROP INDEX ean_produto_idx;
DROP INDEX ean_fornece_sec_idx;

-- 1
CREATE INDEX nif_fornecedor_idx ON fornecedor(nif);
CREATE INDEX nif_produto_idx ON produto(fornecedor);
CREATE INDEX categoria_frutos_idx ON produto(categoria) WHERE categoria = 'Frutos';

-- 2
CREATE INDEX ean_produto_idx ON produto (ean);
CREATE INDEX ean_fornece_sec_idx ON fornece_sec (ean);