-- Tipo_Utilizador [ent1]
create table "APP"."TIPO_UTILIZADOR" (
   "ID_TIPO_UTILIZADOR"  integer  not null,
   "DESCRICAO"  varchar(255),
  primary key ("ID_TIPO_UTILIZADOR")
);


-- Foto [ent11]
create table "APP"."FOTO" (
   "ID_FOTO"  integer  not null,
   "URL"  varchar(255),
   "DESCRICAO"  varchar(255),
   "DATA"  date,
   "ID_UTILIZADOR"  integer,
   "ID_CIDADE"  integer,
  primary key ("ID_FOTO")
);


-- Continente [ent12]
create table "APP"."CONTINENTE" (
   "ID_CONTINENTE"  integer  not null,
   "DESCRICAO"  varchar(255),
  primary key ("ID_CONTINENTE")
);


-- Coordenadas [ent13]
create table "APP"."COORDENADAS" (
   "ID_COORDENADAS"  integer  not null,
   "LATITUTE"  varchar(255),
   "LONGITUDE"  varchar(255),
   "ALTITUDE"  varchar(255),
  primary key ("ID_COORDENADAS")
);


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


-- Lingua [ent3]
create table "APP"."LINGUA" (
   "ID_LINGUA"  integer  not null,
   "NOME"  varchar(255),
  primary key ("ID_LINGUA")
);


-- Utilizador [ent4]
create table "APP"."UTILIZADOR" (
   "ID_UTILIZADOR"  integer  not null,
   "NOME"  varchar(255),
   "EMAIL"  varchar(255),
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "ID_TIPO_UTILIZADOR"  integer,
  primary key ("ID_UTILIZADOR")
);


-- Moeda [ent5]
create table "APP"."MOEDA" (
   "ID_MOEDA"  integer  not null,
   "NOME"  varchar(255),
  primary key ("ID_MOEDA")
);


-- Pais [ent6]
create table "APP"."PAIS" (
   "ID_PAIS"  integer  not null,
   "NOME"  varchar(255),
   "BANDEIRA"  varchar(255),
  primary key ("ID_PAIS")
);


-- Rating [ent7]
create table "APP"."RATING" (
   "ID_CIDADE"  integer  not null,
   "ID_UTILIZADOR"  integer  not null,
   "CLASSIFICACAO"  integer,
  primary key ("ID_CIDADE", "ID_UTILIZADOR")
);


-- Comentario [ent8]
create table "APP"."COMENTARIO" (
   "ID_COMENTARIO"  integer  not null,
   "COMENTARIO"  varchar(255),
   "DATA"  date,
   "ID_UTILIZADOR"  integer,
   "ID_CIDADE"  integer,
  primary key ("ID_COMENTARIO")
);


-- Estado [ent9]
create table "APP"."ESTADO" (
   "ID_ESTADO"  integer  not null,
   "DESCRICAO"  varchar(255),
  primary key ("ID_ESTADO")
);


