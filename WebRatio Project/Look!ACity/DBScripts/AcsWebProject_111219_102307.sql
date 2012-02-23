-- Group [Group]
create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);


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
   "ID_CONTINENTE"  varchar(255),
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
   "ID_UTILIZADOR"  integer  not null,
   "ID_CIDADE"  integer  not null,
   "CLASSIFICACAO"  integer,
  primary key ("ID_UTILIZADOR", "ID_CIDADE")
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


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP"  add column  "MODULE_OID"  integer;
alter table "APP"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER"  add column  "GROUP_OID"  integer;
alter table "APP"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- Utilizador_Tipo_Utilizador [rel1]
alter table "APP"."UTILIZADOR"  add column  "TIPO_UTILIZADOR_ID_TIPO_UTILIZ"  integer;
alter table "APP"."UTILIZADOR"   add constraint FK_UTILIZADOR_TIPO_UTILIZADOR foreign key ("TIPO_UTILIZADOR_ID_TIPO_UTILIZ") references "APP"."TIPO_UTILIZADOR" ("ID_TIPO_UTILIZADOR");


-- Foto_Cidade [rel10]
alter table "APP"."FOTO"  add column  "CIDADE_ID_CIDADE"  integer;
alter table "APP"."FOTO"   add constraint FK_FOTO_CIDADE foreign key ("CIDADE_ID_CIDADE") references "APP"."CIDADE" ("ID_CIDADE");


-- Utilizador_Comentario [rel11]
alter table "APP"."COMENTARIO"  add column  "UTILIZADOR_ID_UTILIZADOR"  integer;
alter table "APP"."COMENTARIO"   add constraint FK_COMENTARIO_UTILIZADOR foreign key ("UTILIZADOR_ID_UTILIZADOR") references "APP"."UTILIZADOR" ("ID_UTILIZADOR");


-- Utilizador_Rating [rel12]
alter table "APP"."RATING"  add column  "UTILIZADOR_ID_UTILIZADOR"  integer;
alter table "APP"."RATING"   add constraint FK_RATING_UTILIZADOR foreign key ("UTILIZADOR_ID_UTILIZADOR") references "APP"."UTILIZADOR" ("ID_UTILIZADOR");


-- Rating_Cidade [rel13]
alter table "APP"."RATING"  add column  "CIDADE_ID_CIDADE"  integer;
alter table "APP"."RATING"   add constraint FK_RATING_CIDADE foreign key ("CIDADE_ID_CIDADE") references "APP"."CIDADE" ("ID_CIDADE");


-- Comentario_Cidade [rel14]
alter table "APP"."COMENTARIO"  add column  "CIDADE_ID_CIDADE"  integer;
alter table "APP"."COMENTARIO"   add constraint FK_COMENTARIO_CIDADE foreign key ("CIDADE_ID_CIDADE") references "APP"."CIDADE" ("ID_CIDADE");


-- Cidade_Estado [rel2]
alter table "APP"."CIDADE"  add column  "ESTADO_ID_ESTADO"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_ESTADO foreign key ("ESTADO_ID_ESTADO") references "APP"."ESTADO" ("ID_ESTADO");


-- Cidade_Moeda [rel3]
alter table "APP"."CIDADE"  add column  "MOEDA_ID_MOEDA"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_MOEDA foreign key ("MOEDA_ID_MOEDA") references "APP"."MOEDA" ("ID_MOEDA");


-- Cidade_Pais [rel4]
alter table "APP"."CIDADE"  add column  "PAIS_ID_PAIS"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_PAIS foreign key ("PAIS_ID_PAIS") references "APP"."PAIS" ("ID_PAIS");


-- Cidade_Lingua [rel6]
alter table "APP"."CIDADE"  add column  "LINGUA_ID_LINGUA"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_LINGUA foreign key ("LINGUA_ID_LINGUA") references "APP"."LINGUA" ("ID_LINGUA");


-- Cidade_Continente [rel7]
alter table "APP"."CIDADE"  add column  "CONTINENTE_ID_CONTINENTE"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_CONTINENTE foreign key ("CONTINENTE_ID_CONTINENTE") references "APP"."CONTINENTE" ("ID_CONTINENTE");


-- Cidade_Coordenadas [rel8]
alter table "APP"."CIDADE"  add column  "COORDENADAS_ID_COORDENADAS"  integer;
alter table "APP"."CIDADE"   add constraint FK_CIDADE_COORDENADAS foreign key ("COORDENADAS_ID_COORDENADAS") references "APP"."COORDENADAS" ("ID_COORDENADAS");


-- Foto_Utilizador [rel9]
alter table "APP"."FOTO"  add column  "UTILIZADOR_ID_UTILIZADOR"  integer;
alter table "APP"."FOTO"   add constraint FK_FOTO_UTILIZADOR foreign key ("UTILIZADOR_ID_UTILIZADOR") references "APP"."UTILIZADOR" ("ID_UTILIZADOR");


