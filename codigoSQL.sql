
/* E-Comerce*/
CREATE TABLE Cachorro (
 id_cachorro NUMBER(15) PRIMARY KEY,
 id_chip NUMBER(15),
 id_racao NVARCHAR2(255),
 id_padreador NUMBER(15),
 cod_ped NUMBER(15),
 nome_cachorro NVARCHAR2(255),
 raca NVARCHAR2(255),
 idade NVARCHAR2(255),
 Padreador NVARCHAR2(255),
 tipo_alimentacao NVARCHAR2(255)
);
CREATE TABLE Pedigree (
 cod_ped NUMBER(15) PRIMARY KEY,
 RG_ped NUMBER(15),
 raca NVARCHAR2(255)
);
CREATE TABLE Vacina (
 id_vacina NUMBER(15) PRIMARY KEY,
 nome_vacina NVARCHAR2(255),
 doses NUMBER(15)
);
CREATE TABLE Racao (
 id_racao NVARCHAR2(255) PRIMARY KEY,
 marca NVARCHAR2(255),
 KG NUMBER(15),
 desc_racao NVARCHAR2(255)
);
CREATE TABLE Medicacao (
 id_medicacao NUMBER(15) PRIMARY KEY,
 nome_med NVARCHAR2(255),
 tipo_med NVARCHAR2(255),
 posologia NVARCHAR2(255)
);
CREATE TABLE Veterinario (
 CRMV NUMBER(15) PRIMARY KEY,
 nome_vet NVARCHAR2(255),
 especialidade NVARCHAR2(255)
);
CREATE TABLE Cart_vacinacao (
 cod_cart NUMBER(15) PRIMARY KEY,
 id_vacina NUMBER(15),
 tipo_vacina VARCHAR(20),
 doses_aplicadas NUMBER(15)
);
CREATE TABLE Exame_Laboratorio (
 id_exame NUMBER(15) PRIMARY KEY,
 CRMV NUMBER(15),
 id_cachorro NUMBER(15),
 id_filhote NUMBER(15),
 id_medicacao NUMBER(15),
 hemogramas NVARCHAR2(255),
 laudos_displasia NVARCHAR2(255),
 exame_fezes NVARCHAR2(255)
);
CREATE TABLE Comprador (
 cod_comprador NUMBER(15) PRIMARY KEY,
 RG NUMBER(15),
 CPF NUMBER(15),
 Dat_nascimento VARCHAR(10),
 Nome_Comprador NVARCHAR2(255),
 Email NVARCHAR2(255),
 Estado_civil NVARCHAR2(255),
 Endereço NVARCHAR2(255),
 Sexo VARCHAR2(1)
);
CREATE TABLE Historico_venda (
 id_compra NUMBER(15) PRIMARY KEY,
 id_nota NUMBER(15),
 cod_comprador NUMBER(15),
 desc_hist_vendas NVARCHAR2(255)
);
CREATE TABLE Reg_reserv_filhote (
 id_reserva NUMBER(15) PRIMARY KEY,
 cod_comprador NUMBER(15),
 id_filhote NUMBER(15),
 qtd_cachorros NUMBER(15)
);
CREATE TABLE Nota_Fiscal (
 id_nota NUMBER(15) PRIMARY KEY,
 cod_comprador NUMBER(15),
 data_emissao DATE
);
CREATE TABLE Filhote (
 id_filhote NUMBER(15) PRIMARY KEY,
 id_chip NUMBER(15),
 id_padreador NUMBER(15),
 id_racao NVARCHAR2(255),
 cod_ped NUMBER(15),
 cod_comprador NUMBER(15),
 padreador NVARCHAR2(255),
 raca_filhote NVARCHAR2(255)
);
CREATE TABLE Pedido_compra (
 id_pedido NUMBER(15) PRIMARY KEY,
 cod_comprador NUMBER(15),
 id_cachorro NUMBER(15),
 id_nota NUMBER(15),
 id_form_pag NUMBER(15),
 cod_ped NUMBER(15),
 valor_pedido NUMBER(15),
 qtd_itens NUMBER(15)
);
CREATE TABLE Form_pagamento (
 id_form_pag NUMBER(15) PRIMARY KEY,
 Desc_pagamento NVARCHAR2(255)
);
CREATE TABLE Padreador (
 id_padreador NUMBER(15) PRIMARY KEY,
 cod_ped NUMBER(15),
 matriz NVARCHAR2(255),
 qtd_filhotes NUMBER(15),
 nome_pai NVARCHAR2(255),
 nome_mãe NVARCHAR2(255),
 dono NVARCHAR2(255)
);
CREATE TABLE Chip (
 id_chip NUMBER(15) PRIMARY KEY,
 End_rastreio NVARCHAR2(255)
);
ALTER TABLE Cachorro ADD CONSTRAINT FK_Cachorro_1
 FOREIGN KEY (cod_ped)
 REFERENCES Pedigree (cod_ped);
ALTER TABLE Cachorro ADD CONSTRAINT FK_Cachorro_3
 FOREIGN KEY (id_chip)
 REFERENCES Chip (id_chip);
ALTER TABLE Cachorro ADD CONSTRAINT FK_Cachorro_4
 FOREIGN KEY (id_racao)
 REFERENCES Racao (id_racao);
ALTER TABLE Cachorro ADD CONSTRAINT FK_Cachorro_5
 FOREIGN KEY (id_padreador)
 REFERENCES Padreador (id_padreador);
ALTER TABLE Cart_vacinacao ADD CONSTRAINT FK_Cart_vacinacao_2
 FOREIGN KEY (id_vacina)
 REFERENCES Vacina (id_vacina);
ALTER TABLE Exame_Laboratorio ADD CONSTRAINT FK_Exame_Laboratorio_2
 FOREIGN KEY (CRMV)
 REFERENCES Veterinario (CRMV);
ALTER TABLE Exame_Laboratorio ADD CONSTRAINT FK_Exame_Laboratorio_3
 FOREIGN KEY (id_cachorro)
 REFERENCES Cachorro (id_cachorro);
ALTER TABLE Exame_Laboratorio ADD CONSTRAINT FK_Exame_Laboratorio_4
 FOREIGN KEY (id_filhote)
 REFERENCES Filhote (id_filhote);
ALTER TABLE Exame_Laboratorio ADD CONSTRAINT FK_Exame_Laboratorio_5
 FOREIGN KEY (id_medicacao)
 REFERENCES Medicacao (id_medicacao);
ALTER TABLE Historico_venda ADD CONSTRAINT FK_Historico_venda_1
 FOREIGN KEY (id_nota)
 REFERENCES Nota_Fiscal (id_nota);
ALTER TABLE Historico_venda ADD CONSTRAINT FK_Historico_venda_3
 FOREIGN KEY (cod_comprador)
 REFERENCES Comprador (cod_comprador);
ALTER TABLE Reg_reserv_filhote ADD CONSTRAINT FK_Reg_reserv_filhote_2
 FOREIGN KEY (cod_comprador)
 REFERENCES Comprador (cod_comprador);
ALTER TABLE Reg_reserv_filhote ADD CONSTRAINT FK_Reg_reserv_filhote_3
 FOREIGN KEY (id_filhote)
 REFERENCES Filhote (id_filhote);
ALTER TABLE Nota_Fiscal ADD CONSTRAINT FK_Nota_Fiscal_2
 FOREIGN KEY (cod_comprador)
 REFERENCES Comprador (cod_comprador);
ALTER TABLE Filhote ADD CONSTRAINT FK_Filhote_2
 FOREIGN KEY (cod_ped)
 REFERENCES Pedigree (cod_ped);
ALTER TABLE Filhote ADD CONSTRAINT FK_Filhote_3
 FOREIGN KEY (id_racao)
 REFERENCES Racao (id_racao);
ALTER TABLE Filhote ADD CONSTRAINT FK_Filhote_4
 FOREIGN KEY (id_chip)
 REFERENCES Chip (id_chip);
ALTER TABLE Filhote ADD CONSTRAINT FK_Filhote_5
 FOREIGN KEY (id_padreador)
 REFERENCES Padreador (id_padreador);
ALTER TABLE Filhote ADD CONSTRAINT FK_Filhote_6
 FOREIGN KEY (cod_comprador)
 REFERENCES Comprador (cod_comprador);
ALTER TABLE Pedido_compra ADD CONSTRAINT FK_Pedido_compra_2
 FOREIGN KEY (cod_comprador)
 REFERENCES Comprador (cod_comprador);
ALTER TABLE Pedido_compra ADD CONSTRAINT FK_Pedido_compra_3
 FOREIGN KEY (id_cachorro)
 REFERENCES Cachorro (id_cachorro);
ALTER TABLE Pedido_compra ADD CONSTRAINT FK_Pedido_compra_4
 FOREIGN KEY (id_nota)
 REFERENCES Nota_Fiscal (id_nota);
ALTER TABLE Pedido_compra ADD CONSTRAINT FK_Pedido_compra_5
 FOREIGN KEY (id_form_pag)
 REFERENCES Form_pagamento (id_form_pag);
ALTER TABLE Pedido_compra ADD CONSTRAINT FK_Pedido_compra_6
 FOREIGN KEY (cod_ped)
 REFERENCES Pedigree (cod_ped);
ALTER TABLE Padreador ADD CONSTRAINT FK_Padreador_2
 FOREIGN KEY (id_cachorro)
 REFERENCES Cachorro (id_cachorro);
ALTER TABLE Padreador ADD CONSTRAINT FK_Padreador_3
 Foreign Key (Cod_Ped)
 REFERENCES Pedigree (cod_ped);

--INSERTS DAS TABELAS-------
INSERT
Into Cachorro
 (
ID_CACHORRO,ID_CHIP,ID_RACAO,ID_PADREADOR,COD_PED,NOME_CACHORRO,RACA,IDADE,
PADREADOR,Tipo_Alimentacao)
 Values
 (
2153694851,4781542658,2374861259,4524785476,2548471236,'Maya','Buldogue',4,'Buldogu
e e Beagle','ração');

INSERT
Into Pedigree
 ( cod_ped,RG_ped,raca)
 Values
 ( 2548471236,78945675,'Buldogue');

 INSERT
Into Vacina
 ( id_vacina,nome_vacina,doses)
 Values
 ( 6456356363,'Gripe','2');

 Insert
Into Racao
 ( id_racao,marca,KG,desc_racao)
 Values
 ( 1321314511,'Golden',5,'Carne e Frango');
Insert
Into medicacao
 ( id_medicacao,nome_med,tipo_med,posologia)
 Values
 ( 9978686674,'Gripe','Injeção',2);

Insert
Into Veterinario
 ( CRMV,nome_vet,especialidade)
 Values
 ( 4613251423,'Claudio','Pediatra');
INSERT
Into Cart_vacinacao
 ( cod_cart,id_vacina,Tipo_vacina,Doses_aplicadas)
 Values
 ( 6241314235,6456356363, 'GRIPE',2);

 SELECT * FROM CART_VACINACAO;


INSERT
Into Exame_Laboratorio
 ( id_exame ,CRMV ,id_cachorro ,id_filhote ,id_medicacao ,hemogramas ,laudos_displasia
,exame_fezes )
 Values
 ( 5673456564,4613251423,2153694851,2234412343,9978686674,'2 Hemogramas','3
Laudos','4 exames de fezes');
 

INSERT
Into Comprador
 ( cod_comprador ,RG ,CPF ,Dat_nascimento ,Nome_Comprador ,Email ,Estado_civil ,Endereço
,Sexo )
 Values
 (
8776457445,78945675,23456432647,'07/08/2020','José','Jose123@gmail.com','Solteiro','Aven
ida Brasil','M');
INSERT
Into Historico_venda
 ( id_compra ,id_nota ,cod_comprador ,desc_hist_vendas)
 Values
 ( 1462342134,0879769685,8776457445,'1 Ração Golden de 5KG');


INSERT
Into Reg_reserv_filhote
 ( id_reserva ,cod_comprador ,id_filhote ,qtd_cachorros )
 Values
 ( 4423425123,8776457445,2234412343,2);


INSERT
Into Nota_Fiscal
 ( id_nota ,cod_comprador ,data_emissao )
 Values
 ( 0879769685,8776457445,'07/10/2021');

INSERT
Into Filhote 
 ( id_filhote ,id_chip ,id_padreador ,id_racao ,cod_ped ,cod_comprador ,padreador
,raca_filhote)
 Values
 ( 2234412343,4781542658,4524785476,2374861259,2548471236,8776457445,'Buldogue e
Beagle','Buldogue');


INSERT INTO CHIP
VALUES (4781542658, 'RUA DAS LAMENTACOES, 10');
insert into racao
 (id_racao, marca, kg, desc_racao)
values
 (2374861259, 'PEDIGREE', 10, 'CARNE DELICINHA');
--desculpe pelo nome da racao, tentei apagar mas ia dar muito trabalho coloquei para testar--
INSERT
Into Pedido_compra
 ( id_pedido ,cod_comprador ,id_cachorro ,id_nota ,id_form_pag ,cod_ped ,valor_pedido
,qtd_itens)
 Values
 ( 6457457456,8776457445,2153694851,0879769685,5151231245,2548471236,50.00,1);
INSERT
Into Form_pagamento
 ( id_form_pag ,Desc_pagamento)
 Values
 ( 5151231245,'Cartão de Credito');

INSERT
Into Padreador 
 ( id_padreador ,cod_ped , matriz ,qtd_filhotes ,nome_pai ,nome_mãe ,dono)
 Values
 ( 4524785476,2548471236, 'Mei','5','Bul','Mei', 'Marcos');

---Projeto Segundo Bimestre---


SELECT * FROM CACHORRO;
SELECT * FROM CART_VACINACAO;
SELECT * FROM CHIP;
SELECT * FROM COMPRADOR;
SELECT * FROM exame_laboratorio;
SELECT * FROM FILHOTE;
SELECT * FROM form_pagamento;
SELECT * FROM historico_venda;
SELECT * FROM medicacao;
SELECT * FROM nota_fiscal;
SELECT * FROM padreador;
SELECT * FROM pedido_compra;
SELECT * FROM pedigree;
SELECT * FROM Racao;
SELECT * FROM reg_reserv_filhote;
SELECT * FROM VACINA;
SELECT * FROM VETERINARIO;


 