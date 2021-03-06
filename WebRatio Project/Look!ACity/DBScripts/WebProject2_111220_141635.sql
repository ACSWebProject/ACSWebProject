-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `email`  varchar(255),
   `password`  varchar(255),
   `username`  varchar(255),
  primary key (`oid`)
);


-- Tipo_Utilizador [ent1]
create table `tipo_utilizador_2` (
   `id_tipo_utilizador`  integer  not null,
   `descricao`  varchar(255),
  primary key (`id_tipo_utilizador`)
);


-- Foto [ent11]
create table `foto_2` (
   `id_foto`  integer  not null,
   `url`  varchar(255),
   `descricao`  varchar(255),
   `data`  date,
   `id_utilizador`  integer,
   `id_cidade`  integer,
  primary key (`id_foto`)
);


-- Continente [ent12]
create table `continente_2` (
   `id_continente`  integer  not null,
   `descricao`  varchar(255),
  primary key (`id_continente`)
);


-- Coordenadas [ent13]
create table `coordenadas_2` (
   `id_coordenadas`  integer  not null,
   `latitute`  varchar(255),
   `longitude`  varchar(255),
   `altitude`  varchar(255),
  primary key (`id_coordenadas`)
);


-- Cidade [ent2]
create table `cidade_2` (
   `id_cidade`  integer  not null,
   `nome`  varchar(255),
   `descricao`  varchar(255),
   `area`  varchar(255),
   `num_habitantes`  varchar(255),
   `id_pais`  integer,
   `id_moeda`  integer,
   `id_lingua`  integer,
   `id_continente`  integer,
   `bandeira`  varchar(255),
   `id_coordenadas`  integer,
   `id_estado`  integer,
  primary key (`id_cidade`)
);


-- Lingua [ent3]
create table `lingua_2` (
   `id_lingua`  integer  not null,
   `nome`  varchar(255),
  primary key (`id_lingua`)
);


-- Utilizador [ent4]
create table `utilizador_2` (
   `id_utilizador`  integer  not null,
   `nome`  varchar(255),
   `email`  varchar(255),
   `username`  varchar(255),
   `password`  varchar(255),
   `id_tipo_utilizador`  integer,
  primary key (`id_utilizador`)
);


-- Moeda [ent5]
create table `moeda_2` (
   `id_moeda`  integer  not null,
   `nome`  varchar(255),
  primary key (`id_moeda`)
);


-- Pais [ent6]
create table `pais_2` (
   `id_pais`  integer  not null,
   `nome`  varchar(255),
   `bandeira`  varchar(255),
  primary key (`id_pais`)
);


-- Rating [ent7]
create table `rating_2` (
   `id_cidade`  integer  not null,
   `id_utilizador`  integer  not null,
   `classificacao`  integer,
  primary key (`id_cidade`, `id_utilizador`)
);


-- Comentario [ent8]
create table `comentario_2` (
   `id_comentario`  integer  not null,
   `comentario`  varchar(255),
   `data`  date,
   `id_utilizador`  integer,
   `id_cidade`  integer,
  primary key (`id_comentario`)
);


-- Estado [ent9]
create table `estado_2` (
   `id_estado`  integer  not null,
   `descricao`  varchar(255),
  primary key (`id_estado`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);
create index `idx_group_module` on `group`(`module_oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);
create index `idx_group_module_group` on `group_module`(`group_oid`);
create index `idx_group_module_module` on `group_module`(`module_oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);
create index `idx_user_group` on `user`(`group_oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);
create index `idx_user_group_user` on `user_group`(`user_oid`);
create index `idx_user_group_group` on `user_group`(`group_oid`);


-- Utilizador_Tipo_Utilizador [rel1]
alter table `utilizador_2`  add column  `tipo_utilizador_2_id_tipo_util`  integer;
alter table `utilizador_2`   add index fk_utilizador_2_tipo_utilizado (`tipo_utilizador_2_id_tipo_util`), add constraint fk_utilizador_2_tipo_utilizado foreign key (`tipo_utilizador_2_id_tipo_util`) references `tipo_utilizador_2` (`id_tipo_utilizador`);
create index `idx_utilizador_2_tipo_utilizad` on `utilizador_2`(`tipo_utilizador_2_id_tipo_util`);


-- Foto_Cidade [rel10]
alter table `foto_2`  add column  `cidade_2_id_cidade`  integer;
alter table `foto_2`   add index fk_foto_2_cidade_2 (`cidade_2_id_cidade`), add constraint fk_foto_2_cidade_2 foreign key (`cidade_2_id_cidade`) references `cidade_2` (`id_cidade`);
create index `idx_foto_2_cidade_2` on `foto_2`(`cidade_2_id_cidade`);


-- Utilizador_Comentario [rel11]
alter table `comentario_2`  add column  `utilizador_2_id_utilizador`  integer;
alter table `comentario_2`   add index fk_comentario_2_user (`utilizador_2_id_utilizador`), add constraint fk_comentario_2_user foreign key (`utilizador_2_id_utilizador`) references `user` (`id_utilizador`);
create index `idx_comentario_2_user` on `comentario_2`(`utilizador_2_id_utilizador`);


-- Utilizador_Rating [rel12]
alter table `rating_2`  add column  `utilizador_2_id_utilizador`  integer;
alter table `rating_2`   add index fk_rating_2_user (`utilizador_2_id_utilizador`), add constraint fk_rating_2_user foreign key (`utilizador_2_id_utilizador`) references `user` (`id_utilizador`);
create index `idx_rating_2_user` on `rating_2`(`utilizador_2_id_utilizador`);


-- Rating_Cidade [rel13]
alter table `rating_2`  add column  `cidade_2_id_cidade`  integer;
alter table `rating_2`   add index fk_rating_2_cidade_2 (`cidade_2_id_cidade`), add constraint fk_rating_2_cidade_2 foreign key (`cidade_2_id_cidade`) references `cidade_2` (`id_cidade`);
create index `idx_rating_2_cidade_2` on `rating_2`(`cidade_2_id_cidade`);


-- Comentario_Cidade [rel14]
alter table `comentario_2`  add column  `cidade_2_id_cidade`  integer;
alter table `comentario_2`   add index fk_comentario_2_cidade_2 (`cidade_2_id_cidade`), add constraint fk_comentario_2_cidade_2 foreign key (`cidade_2_id_cidade`) references `cidade_2` (`id_cidade`);
create index `idx_comentario_2_cidade_2` on `comentario_2`(`cidade_2_id_cidade`);


-- Cidade_Estado [rel2]
alter table `cidade_2`  add column  `estado_2_id_estado`  integer;
alter table `cidade_2`   add index fk_cidade_2_estado_2 (`estado_2_id_estado`), add constraint fk_cidade_2_estado_2 foreign key (`estado_2_id_estado`) references `estado_2` (`id_estado`);
create index `idx_cidade_2_estado_2` on `cidade_2`(`estado_2_id_estado`);


-- Cidade_Moeda [rel3]
alter table `cidade_2`  add column  `moeda_2_id_moeda`  integer;
alter table `cidade_2`   add index fk_cidade_2_moeda_2 (`moeda_2_id_moeda`), add constraint fk_cidade_2_moeda_2 foreign key (`moeda_2_id_moeda`) references `moeda_2` (`id_moeda`);
create index `idx_cidade_2_moeda_2` on `cidade_2`(`moeda_2_id_moeda`);


-- Cidade_Pais [rel4]
alter table `cidade_2`  add column  `pais_2_id_pais`  integer;
alter table `cidade_2`   add index fk_cidade_2_pais_2 (`pais_2_id_pais`), add constraint fk_cidade_2_pais_2 foreign key (`pais_2_id_pais`) references `pais_2` (`id_pais`);
create index `idx_cidade_2_pais_2` on `cidade_2`(`pais_2_id_pais`);


-- Cidade_Lingua [rel6]
alter table `cidade_2`  add column  `lingua_2_id_lingua`  integer;
alter table `cidade_2`   add index fk_cidade_2_lingua_2 (`lingua_2_id_lingua`), add constraint fk_cidade_2_lingua_2 foreign key (`lingua_2_id_lingua`) references `lingua_2` (`id_lingua`);
create index `idx_cidade_2_lingua_2` on `cidade_2`(`lingua_2_id_lingua`);


-- Cidade_Continente [rel7]
alter table `cidade_2`  add column  `continente_2_id_continente`  integer;
alter table `cidade_2`   add index fk_cidade_2_continente_2 (`continente_2_id_continente`), add constraint fk_cidade_2_continente_2 foreign key (`continente_2_id_continente`) references `continente_2` (`id_continente`);
create index `idx_cidade_2_continente_2` on `cidade_2`(`continente_2_id_continente`);


-- Cidade_Coordenadas [rel8]
alter table `cidade_2`  add column  `coordenadas_2_id_coordenadas`  integer;
alter table `cidade_2`   add index fk_cidade_2_coordenadas_2 (`coordenadas_2_id_coordenadas`), add constraint fk_cidade_2_coordenadas_2 foreign key (`coordenadas_2_id_coordenadas`) references `coordenadas_2` (`id_coordenadas`);
create index `idx_cidade_2_coordenadas_2` on `cidade_2`(`coordenadas_2_id_coordenadas`);


-- Foto_Utilizador [rel9]
alter table `foto_2`  add column  `utilizador_2_id_utilizador`  integer;
alter table `foto_2`   add index fk_foto_2_user (`utilizador_2_id_utilizador`), add constraint fk_foto_2_user foreign key (`utilizador_2_id_utilizador`) references `user` (`id_utilizador`);
create index `idx_foto_2_user` on `foto_2`(`utilizador_2_id_utilizador`);


