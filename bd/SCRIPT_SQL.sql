SET SQL DIALECT 3;

SET NAMES WIN1252;

CREATE DATABASE 'localhost/3050:D:\Delphi\Estudo\MVC\Menus\bd\base_mvc.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_CLIENTE_ID START WITH 1 INCREMENT BY 1;
SET GENERATOR GEN_CLIENTE_ID TO 0;

CREATE GENERATOR GEN_PRODUTO_ID START WITH 1 INCREMENT BY 1;
SET GENERATOR GEN_PRODUTO_ID TO 0;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE CLIENTE (
    ID    INTEGER NOT NULL,
    NOME  VARCHAR(150)
);

CREATE TABLE PRODUTO (
    ID         INTEGER NOT NULL,
    DESCRICAO  VARCHAR(100)
);



/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (ID);
ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (ID);


/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: CLIENTE_BI */
CREATE TRIGGER CLIENTE_BI FOR CLIENTE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_cliente_id,1);
end
^

/* Trigger: PRODUTO_BI */
CREATE TRIGGER PRODUTO_BI FOR PRODUTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_cliente_id,1);
end
^
SET TERM ; ^


CREATE ROLE RDB$ADMIN;
