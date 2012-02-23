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


-- Foto [ent11]
create table `foto` (
   `id_foto`  integer  not null,
   `url`  varchar(255),
   `descricao`  varchar(255),
   `data`  date,
   `id_utilizador`  integer,
   `id_cidade`  integer,
  primary key (`id_foto`)
);


-- Continente [ent12]
create table `continente` (
   `id_continente`  integer  not null,
   `descricao`  varchar(255),
  primary key (`id_continente`)
);


-- Coordenadas [ent13]
create table `coordenadas` (
   `id_coordenadas`  integer  not null,
   `latitute`  varchar(255),
   `longitude`  varchar(255),
   `altitude`  varchar(255),
  primary key (`id_coordenadas`)
);


-- Cidade [ent2]
create table `cidade` (
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
create table `lingua` (
   `id_lingua`  integer  not null,
   `nome`  varchar(255),
  primary key (`id_lingua`)
);


-- Moeda [ent5]
create table `moeda` (
   `id_moeda`  integer  not null,
   `nome`  varchar(255),
  primary key (`id_moeda`)
);


-- Pais [ent6]
create table `pais` (
   `id_pais`  integer  not null,
   `nome`  varchar(255),
   `bandeira`  varchar(255),
  primary key (`id_pais`)
);


-- Rating [ent7]
create table `rating` (
   `id_cidade`  integer  not null,
   `id_utilizador`  integer  not null,
   `classificacao`  integer,
  primary key (`id_cidade`, `id_utilizador`)
);


-- Comentario [ent8]
create table `comentario` (
   `id_comentario`  integer  not null,
   `comentario`  varchar(255),
   `data`  date,
   `id_utilizador`  integer,
   `id_cidade`  integer,
  primary key (`id_comentario`)
);


-- Estado [ent9]
create table `estado` (
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


-- Foto_Cidade [rel10]
alter table `foto`  add column  `cidade_id_cidade`  integer;
alter table `foto`   add index fk_foto_cidade (`cidade_id_cidade`), add constraint fk_foto_cidade foreign key (`cidade_id_cidade`) references `cidade` (`id_cidade`);
create index `idx_foto_cidade` on `foto`(`cidade_id_cidade`);


-- Utilizador_Comentario [rel11]
alter table `comentario`  add column  `user_oid`  integer;
alter table `comentario`   add index fk_comentario_user (`user_oid`), add constraint fk_comentario_user foreign key (`user_oid`) references `user` (`oid`);
create index `idx_comentario_user` on `comentario`(`user_oid`);


-- Utilizador_Rating [rel12]
alter table `rating`  add column  `user_oid`  integer;
alter table `rating`   add index fk_rating_user (`user_oid`), add constraint fk_rating_user foreign key (`user_oid`) references `user` (`oid`);
create index `idx_rating_user` on `rating`(`user_oid`);


-- Rating_Cidade [rel13]
alter table `rating`  add column  `cidade_id_cidade`  integer;
alter table `rating`   add index fk_rating_cidade (`cidade_id_cidade`), add constraint fk_rating_cidade foreign key (`cidade_id_cidade`) references `cidade` (`id_cidade`);
create index `idx_rating_cidade` on `rating`(`cidade_id_cidade`);


-- Comentario_Cidade [rel14]
alter table `comentario`  add column  `cidade_id_cidade`  integer;
alter table `comentario`   add index fk_comentario_cidade (`cidade_id_cidade`), add constraint fk_comentario_cidade foreign key (`cidade_id_cidade`) references `cidade` (`id_cidade`);
create index `idx_comentario_cidade` on `comentario`(`cidade_id_cidade`);


-- Cidade_Estado [rel2]
alter table `cidade`  add column  `estado_id_estado`  integer;
alter table `cidade`   add index fk_cidade_estado (`estado_id_estado`), add constraint fk_cidade_estado foreign key (`estado_id_estado`) references `estado` (`id_estado`);
create index `idx_cidade_estado` on `cidade`(`estado_id_estado`);


-- Cidade_Moeda [rel3]
alter table `cidade`  add column  `moeda_id_moeda`  integer;
alter table `cidade`   add index fk_cidade_moeda (`moeda_id_moeda`), add constraint fk_cidade_moeda foreign key (`moeda_id_moeda`) references `moeda` (`id_moeda`);
create index `idx_cidade_moeda` on `cidade`(`moeda_id_moeda`);


-- Cidade_Pais [rel4]
alter table `cidade`  add column  `pais_id_pais`  integer;
alter table `cidade`   add index fk_cidade_pais (`pais_id_pais`), add constraint fk_cidade_pais foreign key (`pais_id_pais`) references `pais` (`id_pais`);
create index `idx_cidade_pais` on `cidade`(`pais_id_pais`);


-- Cidade_Lingua [rel6]
alter table `cidade`  add column  `lingua_id_lingua`  integer;
alter table `cidade`   add index fk_cidade_lingua (`lingua_id_lingua`), add constraint fk_cidade_lingua foreign key (`lingua_id_lingua`) references `lingua` (`id_lingua`);
create index `idx_cidade_lingua` on `cidade`(`lingua_id_lingua`);


-- Cidade_Continente [rel7]
alter table `cidade`  add column  `continente_id_continente`  integer;
alter table `cidade`   add index fk_cidade_continente (`continente_id_continente`), add constraint fk_cidade_continente foreign key (`continente_id_continente`) references `continente` (`id_continente`);
create index `idx_cidade_continente` on `cidade`(`continente_id_continente`);


-- Cidade_Coordenadas [rel8]
alter table `cidade`  add column  `coordenadas_id_coordenadas`  integer;
alter table `cidade`   add index fk_cidade_coordenadas (`coordenadas_id_coordenadas`), add constraint fk_cidade_coordenadas foreign key (`coordenadas_id_coordenadas`) references `coordenadas` (`id_coordenadas`);
create index `idx_cidade_coordenadas` on `cidade`(`coordenadas_id_coordenadas`);


-- Foto_Utilizador [rel9]
alter table `foto`  add column  `user_oid`  integer;
alter table `foto`   add index fk_foto_user (`user_oid`), add constraint fk_foto_user foreign key (`user_oid`) references `user` (`oid`);
create index `idx_foto_user` on `foto`(`user_oid`);


