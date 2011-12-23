-- Cidade [ent2]
create table "APP"."CIDADE" (
   "ID_CIDADE"  integer  not null,
   "NOME"  varchar(255),
   "DESCRICAO"  varchar(255),
   "AREA"  varchar(255),
   "NUM_HABITANTES"  varchar(255),
   "ID_PAIS"  integer,
   "ID_MOEDA"  integer,
   "ID_LINGUA"  integer,
   "ID_CONTINENTE"  integer,
   "BANDEIRA"  varchar(255),
   "ID_COORDENADAS"  integer,
   "ID_ESTADO"  integer,
  primary key ("ID_CIDADE")
);


