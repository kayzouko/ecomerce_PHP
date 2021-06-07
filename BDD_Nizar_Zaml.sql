drop table if exists ARTICL;

drop table if exists BASKET;

drop table if exists BELONGD;

drop table if exists "ORDER";

drop table if exists USER;

/*==============================================================*/
/* Table: ARTICL                                                */
/*==============================================================*/
create table ARTICL
(
   ARTICLE_ID           int not null,
   ARTICLENAME          text,
   ARTICLEPRICE         float,
   primary key (ARTICLE_ID)
);

/*==============================================================*/
/* Table: BASKET                                                */
/*==============================================================*/
create table BASKET
(
   BASKETID             int not null,
   USERID               int not null,
   ORDERID              int not null,
   ORD_ORDERID          int not null,
   primary key (BASKETID)
);

/*==============================================================*/
/* Table: BELONGD                                               */
/*==============================================================*/
create table BELONGD
(
   ARTICLE_ID           int not null,
   BASKETID             int not null,
   primary key (ARTICLE_ID, BASKETID)
);

/*==============================================================*/
/* Table: "ORDER"                                               */
/*==============================================================*/
create table "ORDER"
(
   ORDERID              int not null,
   BASKETID             int not null,
   BAS_BASKETID         int not null,
   primary key (ORDERID)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   USERID               int not null,
   FIRSTNAME            char(10),
   LASTNAME             char(10),
   EMAIL                char(10),
   PASSWORD             char(10),
   primary key (USERID)
);

alter table BASKET add constraint FK_CONTAINS foreign key (ORD_ORDERID)
      references "ORDER" (ORDERID) on delete restrict on update restrict;

alter table BASKET add constraint FK_CONTAINS2 foreign key (ORDERID)
      references "ORDER" (ORDERID) on delete restrict on update restrict;

alter table BASKET add constraint FK_HAVING foreign key (USERID)
      references USER (USERID) on delete restrict on update restrict;

alter table BELONGD add constraint FK_BELONGD foreign key (BASKETID)
      references BASKET (BASKETID) on delete restrict on update restrict;

alter table BELONGD add constraint FK_BELONGD2 foreign key (ARTICLE_ID)
      references ARTICL (ARTICLE_ID) on delete restrict on update restrict;

alter table "ORDER" add constraint FK_CONTAINS3 foreign key (BASKETID)
      references BASKET (BASKETID) on delete restrict on update restrict;

alter table "ORDER" add constraint FK_CONTAINS4 foreign key (BAS_BASKETID)
      references BASKET (BASKETID) on delete restrict on update restrict;
