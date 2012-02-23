-- Tipo_Utilizador [ent1]
create table `TIPO_UTILIZADOR` (
   `ID_TIPO_UTILIZADOR`  integer  not null,
   `DESCRICAO`  varchar(255),
  primary key (`ID_TIPO_UTILIZADOR`)
);


-- Foto [ent11]
create table `FOTO` (
   `ID_FOTO`  integer  not null,
   `URL`  varchar(255),
   `DESCRICAO`  varchar(255),
   `DATA`  date,
   `ID_UTILIZADOR`  integer,
   `ID_CIDADE`  integer,
  primary key (`ID_FOTO`)
);


-- Continente [ent12]
create table `CONTINENTE` (
   `ID_CONTINENTE`  integer  not null,
   `DESCRICAO`  varchar(255),
  primary key (`ID_CONTINENTE`)
);


-- Coordenadas [ent13]
create table `COORDENADAS` (
   `ID_COORDENADAS`  integer  not null,
   `LATITUTE`  varchar(255),
   `LONGITUDE`  varchar(255),
   `ALTITUDE`  varchar(255),
  primary key (`ID_COORDENADAS`)
);


-- Cidade [ent2]
create table `CIDADE` (
   `ID_CIDADE`  integer  not null,
   `NOME`  varchar(255),
   `DESCRICAO`  varchar(255),
   `AREA`  varchar(255),
   `NUM_HABITANTES`  varchar(255),
   `ID_PAIS`  integer,
   `ID_MOEDA`  integer,
   `ID_LINGUA`  integer,
   `ID_CONTINENTE`  integer,
   `BANDEIRA`  varchar(255),
   `ID_COORDENADAS`  integer,
   `ID_ESTADO`  integer,
  primary key (`ID_CIDADE`)
);


-- Lingua [ent3]
create table `LINGUA` (
   `ID_LINGUA`  integer  not null,
   `NOME`  varchar(255),
  primary key (`ID_LINGUA`)
);


-- Utilizador [ent4]
create table `UTILIZADOR` (
   `ID_UTILIZADOR`  integer  not null,
   `NOME`  varchar(255),
   `EMAIL`  varchar(255),
   `USERNAME`  varchar(255),
   `PASSWORD`  varchar(255),
   `ID_TIPO_UTILIZADOR`  integer,
  primary key (`ID_UTILIZADOR`)
);


-- Moeda [ent5]
create table `MOEDA` (
   `ID_MOEDA`  integer  not null,
   `NOME`  varchar(255),
  primary key (`ID_MOEDA`)
);


-- Pais [ent6]
create table `PAIS` (
   `ID_PAIS`  integer  not null,
   `NOME`  varchar(255),
   `BANDEIRA`  varchar(255),
  primary key (`ID_PAIS`)
);


-- Rating [ent7]
create table `RATING` (
   `ID_CIDADE`  integer  not null,
   `ID_UTILIZADOR`  integer  not null,
   `CLASSIFICACAO`  integer,
  primary key (`ID_CIDADE`, `ID_UTILIZADOR`)
);


-- Comentario [ent8]
create table `COMENTARIO` (
   `ID_COMENTARIO`  integer  not null,
   `COMENTARIO`  varchar(255),
   `DATA`  date,
   `ID_UTILIZADOR`  integer,
   `ID_CIDADE`  integer,
  primary key (`ID_COMENTARIO`)
);


-- Estado [ent9]
create table `ESTADO` (
   `ID_ESTADO`  integer  not null,
   `DESCRICAO`  varchar(255),
  primary key (`ID_ESTADO`)
);


-- Utilizador_Tipo_Utilizador [rel1]
alter table `UTILIZADOR`  add column  `TIPO_UTILIZADOR_ID_TIPO_UTILIZ`  integer;
alter table `UTILIZADOR`   add index fk_utilizador_tipo_utilizador (`TIPO_UTILIZADOR_ID_TIPO_UTILIZ`), add constraint fk_utilizador_tipo_utilizador foreign key (`TIPO_UTILIZADOR_ID_TIPO_UTILIZ`) references `TIPO_UTILIZADOR` (`ID_TIPO_UTILIZADOR`);
create index `idx_utilizador_tipo_utilizador` on `UTILIZADOR`(`TIPO_UTILIZADOR_ID_TIPO_UTILIZ`);


-- Foto_Cidade [rel10]
alter table `FOTO`  add column  `CIDADE_ID_CIDADE`  integer;
alter table `FOTO`   add index fk_foto_cidade (`CIDADE_ID_CIDADE`), add constraint fk_foto_cidade foreign key (`CIDADE_ID_CIDADE`) references `CIDADE` (`ID_CIDADE`);
create index `idx_foto_cidade` on `FOTO`(`CIDADE_ID_CIDADE`);


-- Utilizador_Comentario [rel11]
alter table `COMENTARIO`  add column  `UTILIZADOR_ID_UTILIZADOR`  integer;
alter table `COMENTARIO`   add index fk_comentario_utilizador (`UTILIZADOR_ID_UTILIZADOR`), add constraint fk_comentario_utilizador foreign key (`UTILIZADOR_ID_UTILIZADOR`) references `UTILIZADOR` (`ID_UTILIZADOR`);
create index `idx_comentario_utilizador` on `COMENTARIO`(`UTILIZADOR_ID_UTILIZADOR`);


-- Utilizador_Rating [rel12]
alter table `RATING`  add column  `UTILIZADOR_ID_UTILIZADOR`  integer;
alter table `RATING`   add index fk_rating_utilizador (`UTILIZADOR_ID_UTILIZADOR`), add constraint fk_rating_utilizador foreign key (`UTILIZADOR_ID_UTILIZADOR`) references `UTILIZADOR` (`ID_UTILIZADOR`);
create index `idx_rating_utilizador` on `RATING`(`UTILIZADOR_ID_UTILIZADOR`);


-- Rating_Cidade [rel13]
alter table `RATING`  add column  `CIDADE_ID_CIDADE`  integer;
alter table `RATING`   add index fk_rating_cidade (`CIDADE_ID_CIDADE`), add constraint fk_rating_cidade foreign key (`CIDADE_ID_CIDADE`) references `CIDADE` (`ID_CIDADE`);
create index `idx_rating_cidade` on `RATING`(`CIDADE_ID_CIDADE`);


-- Comentario_Cidade [rel14]
alter table `COMENTARIO`  add column  `CIDADE_ID_CIDADE`  integer;
alter table `COMENTARIO`   add index fk_comentario_cidade (`CIDADE_ID_CIDADE`), add constraint fk_comentario_cidade foreign key (`CIDADE_ID_CIDADE`) references `CIDADE` (`ID_CIDADE`);
create index `idx_comentario_cidade` on `COMENTARIO`(`CIDADE_ID_CIDADE`);


-- Cidade_Estado [rel2]
alter table `CIDADE`  add column  `ESTADO_ID_ESTADO`  integer;
alter table `CIDADE`   add index fk_cidade_estado (`ESTADO_ID_ESTADO`), add constraint fk_cidade_estado foreign key (`ESTADO_ID_ESTADO`) references `ESTADO` (`ID_ESTADO`);
create index `idx_cidade_estado` on `CIDADE`(`ESTADO_ID_ESTADO`);


-- Cidade_Moeda [rel3]
alter table `CIDADE`  add column  `MOEDA_ID_MOEDA`  integer;
alter table `CIDADE`   add index fk_cidade_moeda (`MOEDA_ID_MOEDA`), add constraint fk_cidade_moeda foreign key (`MOEDA_ID_MOEDA`) references `MOEDA` (`ID_MOEDA`);
create index `idx_cidade_moeda` on `CIDADE`(`MOEDA_ID_MOEDA`);


-- Cidade_Pais [rel4]
alter table `CIDADE`  add column  `PAIS_ID_PAIS`  integer;
alter table `CIDADE`   add index fk_cidade_pais (`PAIS_ID_PAIS`), add constraint fk_cidade_pais foreign key (`PAIS_ID_PAIS`) references `PAIS` (`ID_PAIS`);
create index `idx_cidade_pais` on `CIDADE`(`PAIS_ID_PAIS`);


-- Cidade_Lingua [rel6]
alter table `CIDADE`  add column  `LINGUA_ID_LINGUA`  integer;
alter table `CIDADE`   add index fk_cidade_lingua (`LINGUA_ID_LINGUA`), add constraint fk_cidade_lingua foreign key (`LINGUA_ID_LINGUA`) references `LINGUA` (`ID_LINGUA`);
create index `idx_cidade_lingua` on `CIDADE`(`LINGUA_ID_LINGUA`);


-- Cidade_Continente [rel7]
alter table `CIDADE`  add column  `CONTINENTE_ID_CONTINENTE`  integer;
alter table `CIDADE`   add index fk_cidade_continente (`CONTINENTE_ID_CONTINENTE`), add constraint fk_cidade_continente foreign key (`CONTINENTE_ID_CONTINENTE`) references `CONTINENTE` (`ID_CONTINENTE`);
create index `idx_cidade_continente` on `CIDADE`(`CONTINENTE_ID_CONTINENTE`);


-- Cidade_Coordenadas [rel8]
alter table `CIDADE`  add column  `COORDENADAS_ID_COORDENADAS`  integer;
alter table `CIDADE`   add index fk_cidade_coordenadas (`COORDENADAS_ID_COORDENADAS`), add constraint fk_cidade_coordenadas foreign key (`COORDENADAS_ID_COORDENADAS`) references `COORDENADAS` (`ID_COORDENADAS`);
create index `idx_cidade_coordenadas` on `CIDADE`(`COORDENADAS_ID_COORDENADAS`);


-- Foto_Utilizador [rel9]
alter table `FOTO`  add column  `UTILIZADOR_ID_UTILIZADOR`  integer;
alter table `FOTO`   add index fk_foto_utilizador (`UTILIZADOR_ID_UTILIZADOR`), add constraint fk_foto_utilizador foreign key (`UTILIZADOR_ID_UTILIZADOR`) references `UTILIZADOR` (`ID_UTILIZADOR`);
create index `idx_foto_utilizador` on `FOTO`(`UTILIZADOR_ID_UTILIZADOR`);


