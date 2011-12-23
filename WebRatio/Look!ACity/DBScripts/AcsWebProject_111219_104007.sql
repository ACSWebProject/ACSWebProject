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


-- Utilizador_Tipo_Utilizador [rel1]
alter table "APP"."UTILIZADOR"  add column  "TIPO_UTILIZADOR_ID_TIPO_UTILIZ"  integer;
alter table "APP"."UTILIZADOR"   add constraint FK_UTILIZADOR_TIPO_UTILIZADOR foreign key ("TIPO_UTILIZADOR_ID_TIPO_UTILIZ") references "APP"."TIPO_UTILIZADOR" ("ID_TIPO_UTILIZADOR");
create index "IDX_UTILIZADOR_TIPO_UTILIZADOR" on "APP"."UTILIZADOR"("TIPO_UTILIZADOR_ID_TIPO_UTILIZ");


-- Foto_Cidade [rel10]
alter table "APP"."FOTO"  add column  "CIDADE_ID_CIDADE"  integer;
alter table "APP"."FOTO"   add constraint FK_FOTO_CIDADE foreign key ("CIDADE_ID_CIDADE") references "APP"."CIDADE" ("ID_CIDADE");
create index "IDX_FOTO_CIDADE" on "APP"."FOTO"("CIDADE_ID_CIDADE");


-- Utilizador_Comentario [rel11]
alter table "APP"."COMENTARIO"  add column  "UTILIZADOR_ID_UTILIZADOR"  integer;
alter table "APP"."COMENTARIO"   add constraint FK_COMENTARIO_UTILIZADOR foreign key ("UTILIZADOR_ID_UTILIZADOR") references "APP"."UTILIZADOR" ("ID_UTILIZADOR");
create index "IDX_COMENTARIO_UTILIZADOR" on "APP"."COMENTARIO"("UTILIZADOR_ID_UTILIZADOR");


-- Utilizador_Rating [rel12]
alter table "APP"."RATING"  add column  "UTILIZADOR_ID_UTILIZADOR"  integer;
alter table "APP"."RATING"   add constraint FK_RATING_UTILIZADOR foreign key ("UTILIZADOR_ID_UTILIZADOR") references "APP"."UTILIZADOR" ("ID_UTILIZADOR");
create index "IDX_RATING_UTILIZADOR" on "APP"."RATING"("UTILIZADOR_ID_UTILIZADOR");


-- Rating_Cidade [rel13]
alter table "APP"."RATING"  add column  "CIDADE_ID_CIDADE"  integer;
alter table "APP"."RATING"   add constraint FK_RATING_CIDADE foreign key ("CIDADE_ID_CIDADE") references "APP"."CIDADE" ("ID_CIDADE");
create index "IDX_RATING_CIDADE" on "APP"."RATING"("CIDADE_ID_CIDADE");


-- Comentario_Cidade [rel14]
alter table "APP"."COMENTARIO"  add column  "CIDADE_ID_CIDADE"  integer;
alter table "APP"."COMENTARIO"   add constraint FK_COMENTARIO_CIDADE foreign key ("CIDADE_ID_CIDADE") references "APP"."CIDADE" ("ID_CIDADE");
create index "IDX_COMENTARIO_CIDADE" on "APP"."COMENTARIO"("CIDADE_ID_CIDADE");


-- Cidade_Estado [rel2]
alter table "APP"."CIDADE"  add column  "ESTADO_ID_ESTADO"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_ESTADO foreign key ("ESTADO_ID_ESTADO") references "APP"."ESTADO" ("ID_ESTADO");
create index "IDX_CIDADE_ESTADO" on "APP"."CIDADE"("ESTADO_ID_ESTADO");


-- Cidade_Moeda [rel3]
alter table "APP"."CIDADE"  add column  "MOEDA_ID_MOEDA"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_MOEDA foreign key ("MOEDA_ID_MOEDA") references "APP"."MOEDA" ("ID_MOEDA");
create index "IDX_CIDADE_MOEDA" on "APP"."CIDADE"("MOEDA_ID_MOEDA");


-- Cidade_Pais [rel4]
alter table "APP"."CIDADE"  add column  "PAIS_ID_PAIS"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_PAIS foreign key ("PAIS_ID_PAIS") references "APP"."PAIS" ("ID_PAIS");
create index "IDX_CIDADE_PAIS" on "APP"."CIDADE"("PAIS_ID_PAIS");


-- Cidade_Lingua [rel6]
alter table "APP"."CIDADE"  add column  "LINGUA_ID_LINGUA"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_LINGUA foreign key ("LINGUA_ID_LINGUA") references "APP"."LINGUA" ("ID_LINGUA");
create index "IDX_CIDADE_LINGUA" on "APP"."CIDADE"("LINGUA_ID_LINGUA");


-- Cidade_Continente [rel7]
alter table "APP"."CIDADE"  add column  "CONTINENTE_ID_CONTINENTE"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_CONTINENTE foreign key ("CONTINENTE_ID_CONTINENTE") references "APP"."CONTINENTE" ("ID_CONTINENTE");
create index "IDX_CIDADE_CONTINENTE" on "APP"."CIDADE"("CONTINENTE_ID_CONTINENTE");


-- Cidade_Coordenadas [rel8]
alter table "APP"."CIDADE"  add column  "COORDENADAS_ID_COORDENADAS"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_COORDENADAS foreign key ("COORDENADAS_ID_COORDENADAS") references "APP"."COORDENADAS" ("ID_COORDENADAS");
create index "IDX_CIDADE_COORDENADAS" on "APP"."CIDADE"("COORDENADAS_ID_COORDENADAS");


-- Foto_Utilizador [rel9]
alter table "APP"."FOTO"  add column  "UTILIZADOR_ID_UTILIZADOR"  integer;
alter table "APP"."FOTO"   add constraint FK_FOTO_UTILIZADOR foreign key ("UTILIZADOR_ID_UTILIZADOR") references "APP"."UTILIZADOR" ("ID_UTILIZADOR");
create index "IDX_FOTO_UTILIZADOR" on "APP"."FOTO"("UTILIZADOR_ID_UTILIZADOR");


