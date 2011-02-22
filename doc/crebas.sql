/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2011-2-21 15:26:26                           */
/*==============================================================*/


alter table t_productmgr_areacontractlink
   drop constraint Fk_acl_supcontract;

alter table t_productmgr_deptmentlink
   drop constraint Fk_deptment_supcontract;

alter table t_productmgr_deptmentlink
   drop constraint Fk_deptment_supcontract2;

alter table t_productmgr_products
   drop constraint Fk_sorts_product;

alter table t_productmgr_productshow
   drop constraint Fk_product_productShow;

alter table t_productmgr_productshow
   drop constraint Fk_sorts_productShow;

alter table t_productmgr_propertylink
   drop constraint Fk_sorts_property;

alter table t_productmgr_propertylink
   drop constraint Fk_sorts_property2;

alter table t_productmgr_propertyvaluelink
   drop constraint Fk_supproduct_propertyvalues;

alter table t_productmgr_propertyvaluelink
   drop constraint Fk_supproduct_propertyvalues2;

alter table t_productmgr_propertyvalues
   drop constraint Fk_property_propertyValues;

alter table t_productmgr_suppliersproduct
   drop constraint Fk_product_suppliersproduct;

alter table t_productmgr_suppliersproduct
   drop constraint Fk_supcontract_supproduct;

drop table t_productmgr_areacontractlink cascade constraints;

drop table t_productmgr_delivery cascade constraints;

drop table t_productmgr_deptment cascade constraints;

drop table t_productmgr_deptmentlink cascade constraints;

drop table t_productmgr_products cascade constraints;

drop table t_productmgr_productshow cascade constraints;

drop table t_productmgr_property cascade constraints;

drop table t_productmgr_propertylink cascade constraints;

drop table t_productmgr_propertyvaluelink cascade constraints;

drop table t_productmgr_propertyvalues cascade constraints;

drop table t_productmgr_sorts cascade constraints;

drop table t_productmgr_supplierscontract cascade constraints;

drop table t_productmgr_suppliersproduct cascade constraints;

/*==============================================================*/
/* Table: t_productmgr_areacontractlink                         */
/*==============================================================*/
create table t_productmgr_areacontractlink 
(
   acl_code             VARCHAR2(20)         not null,
   c_code               VARCHAR2(20),
   acl_area             VARCHAR2(150),
   acl_remark           VARCHAR2(255),
   constraint PK_T_PRODUCTMGR_AREACONTRACTLI primary key (acl_code)
);

comment on table t_productmgr_areacontractlink is
'������Χ-��ͬ��ϵ��';

comment on column t_productmgr_areacontractlink.acl_code is
'��Χ��ϵ���';

comment on column t_productmgr_areacontractlink.c_code is
'��ͬ����';

comment on column t_productmgr_areacontractlink.acl_area is
'������Χ';

comment on column t_productmgr_areacontractlink.acl_remark is
'��ע';

/*==============================================================*/
/* Table: t_productmgr_delivery                                 */
/*==============================================================*/
create table t_productmgr_delivery 
(
   d_code               VARCHAR2(20)         not null,
   d_province           VARCHAR2(20),
   d_city               VARCHAR2(20),
   d_state              VARCHAR2(20),
   d_area               VARCHAR2(255),
   d_parent             VARCHAR2(20),
   d_sumary             VARCHAR2(255),
   constraint PK_T_PRODUCTMGR_DELIVERY primary key (d_code)
);

comment on table t_productmgr_delivery is
'������Χ��';

comment on column t_productmgr_delivery.d_code is
'������Χ����';

comment on column t_productmgr_delivery.d_province is
'ʡ����ַ';

comment on column t_productmgr_delivery.d_city is
'���е�ַ';

comment on column t_productmgr_delivery.d_state is
'������ַ';

comment on column t_productmgr_delivery.d_area is
'��������';

comment on column t_productmgr_delivery.d_parent is
'��������0 Ϊ���';

comment on column t_productmgr_delivery.d_sumary is
'��ϸ����';

/*==============================================================*/
/* Table: t_productmgr_deptment                                 */
/*==============================================================*/
create table t_productmgr_deptment 
(
   dept_code            VARCHAR2(20)         not null,
   dept_name            VARCHAR2(20),
   dept_addr            VARCHAR2(255),
   dept_phone           VARCHAR2(20),
   dept_person          VARCHAR2(20),
   dept_mobile          VARCHAR2(20),
   dept_remark          VARCHAR2(255),
   dept_area            VARCHAR2(20),
   constraint PK_T_PRODUCTMGR_DEPTMENT primary key (dept_code)
);

comment on table t_productmgr_deptment is
'�ֹ�˾��';

comment on column t_productmgr_deptment.dept_code is
'�ֹ�˾����';

comment on column t_productmgr_deptment.dept_name is
'�ֹ�˾����';

comment on column t_productmgr_deptment.dept_addr is
'�ֹ�˾��ַ';

comment on column t_productmgr_deptment.dept_phone is
'��ϵ�绰';

comment on column t_productmgr_deptment.dept_person is
'��Ҫ������';

comment on column t_productmgr_deptment.dept_mobile is
'��������ϵ�绰';

comment on column t_productmgr_deptment.dept_remark is
'��ע';

comment on column t_productmgr_deptment.dept_area is
'�ֹ�˾��������';

/*==============================================================*/
/* Table: t_productmgr_deptmentlink                             */
/*==============================================================*/
create table t_productmgr_deptmentlink 
(
   dept_code            VARCHAR2(20)         not null,
   c_code               VARCHAR2(20)         not null,
   constraint PK_T_PRODUCTMGR_DEPTMENTLINK primary key (dept_code, c_code)
);

comment on table t_productmgr_deptmentlink is
'�ֹ�˾��ͬ��ϵ��';

comment on column t_productmgr_deptmentlink.dept_code is
'�ֹ�˾����';

comment on column t_productmgr_deptmentlink.c_code is
'��ͬ����';

/*==============================================================*/
/* Table: t_productmgr_products                                 */
/*==============================================================*/
create table t_productmgr_products 
(
   p_code               VARCHAR2(12)         not null,
   sort_code            VARCHAR2(12),
   p_name               VARCHAR2(20),
   p_zhongliang         VARCHAR2(20),
   p_jiliang            VARCHAR2(20),
   p_type               VARCHAR2(20),
   p_order              NUMBER(11,0),
   p_price1             NUMBER(11,2),
   p_price2             NUMBER(11,2),
   p_price3             NUMBER(11,2),
   p_price4             NUMBER(11,2),
   p_price5             NUMBER(11,2),
   p_price6             NUMBER(11,2),
   p_rem1               NUMBER(1),
   p_rem2               NUMBER(1),
   p_img1               VARCHAR2(150),
   p_img2               VARCHAR2(150),
   p_img3               VARCHAR2(150),
   p_img4               VARCHAR2(150),
   p_img5               VARCHAR2(150),
   p_img6               VARCHAR2(150),
   p_video              VARCHAR2(150),
   p_summary            VARCHAR2(255),
   constraint PK_T_PRODUCTMGR_PRODUCTS primary key (p_code)
);

comment on column t_productmgr_products.p_code is
'��Ʒ����';

comment on column t_productmgr_products.sort_code is
'�����';

comment on column t_productmgr_products.p_name is
'��Ʒ����';

comment on column t_productmgr_products.p_zhongliang is
'������λ';

comment on column t_productmgr_products.p_jiliang is
'������λ';

comment on column t_productmgr_products.p_order is
'��Ʒ�����';

comment on column t_productmgr_products.p_price1 is
'���ۼ۸�';

comment on column t_productmgr_products.p_price2 is
'�г��ۼ�';

comment on column t_productmgr_products.p_price3 is
'�����۸�';

comment on column t_productmgr_products.p_price4 is
'�����۸�';

comment on column t_productmgr_products.p_price5 is
'��Ա�۸�';

comment on column t_productmgr_products.p_price6 is
'��Ʒ�Żݼ۸�';

comment on column t_productmgr_products.p_rem1 is
'�����ؼ��Ƽ�';

comment on column t_productmgr_products.p_rem2 is
'������Ʒ�ƽ���';

comment on column t_productmgr_products.p_img1 is
'��ƷͼƬ';

comment on column t_productmgr_products.p_video is
'��Ʒ��Ƶ';

comment on column t_productmgr_products.p_summary is
'��Ʒ����';

/*==============================================================*/
/* Table: t_productmgr_productshow                              */
/*==============================================================*/
create table t_productmgr_productshow 
(
   psh_id               VARCHAR2(20)         not null,
   sort_code            VARCHAR2(12),
   p_code               VARCHAR2(12),
   psh_price1           NUMBER(11,2),
   psh_price2           NUMBER(11,2),
   psh_starttime        DATE,
   psh_endtime          DATE,
   psh_price3           NUMBER(11,2),
   psh_num              NUMBER(9,0),
   psh_price4           NUMBER(11,2),
   psh_price5           NUMBER(11,2),
   psh_price6           NUMBER(11,2),
   psh_desc             VARCHAR2(255),
   psh_order            NUMBER(11),
   psh_img1             VARCHAR2(150),
   psh_img2             VARCHAR2(150),
   psh_img3             VARCHAR2(150),
   psh_video            VARCHAR2(150),
   dept_code            VARCHAR2(20),
   psh_rem1             NUMBER(1),
   psh_rem2             NUMBER(1),
   psh_rem3             NUMBER(1),
   constraint PK_T_PRODUCTMGR_PRODUCTSHOW primary key (psh_id)
);

comment on table t_productmgr_productshow is
'��Ʒչʾ��';

comment on column t_productmgr_productshow.psh_id is
'��Ʒ���';

comment on column t_productmgr_productshow.sort_code is
'�����';

comment on column t_productmgr_productshow.p_code is
'��Ʒ����';

comment on column t_productmgr_productshow.psh_price1 is
'���ۼ۸�';

comment on column t_productmgr_productshow.psh_price2 is
'�г��ۼ�';

comment on column t_productmgr_productshow.psh_starttime is
'������ʼʱ��';

comment on column t_productmgr_productshow.psh_endtime is
'��������ʱ��';

comment on column t_productmgr_productshow.psh_price3 is
'��Ʒ�Żݼ۸�';

comment on column t_productmgr_productshow.psh_num is
'�Ż�����';

comment on column t_productmgr_productshow.psh_price4 is
'�����۸�';

comment on column t_productmgr_productshow.psh_price5 is
'�����۸�';

comment on column t_productmgr_productshow.psh_price6 is
'��Ա�۸�';

comment on column t_productmgr_productshow.psh_desc is
'����';

comment on column t_productmgr_productshow.psh_order is
'����';

comment on column t_productmgr_productshow.psh_img1 is
'��ƷͼƬ';

comment on column t_productmgr_productshow.psh_video is
'�����Ƶ';

comment on column t_productmgr_productshow.dept_code is
'�ֹ�˾����';

comment on column t_productmgr_productshow.psh_rem1 is
'�����ؼ��Ƽ���ʽ��1 �Ƽ� 0 ���Ƽ�';

comment on column t_productmgr_productshow.psh_rem2 is
'������Ʒ�Ƽ���ʽ��1 �Ƽ� 0 ���Ƽ�';

comment on column t_productmgr_productshow.psh_rem3 is
'�Ƿ����';

/*==============================================================*/
/* Table: t_productmgr_property                                 */
/*==============================================================*/
create table t_productmgr_property 
(
   property_code        VARCHAR2(12)         not null,
   property_name        VARCHAR2(20),
   property_sort        NUMBER(1),
   property_remark      VARCHAR2(255),
   property_leaf        NUMBER(1),
   constraint PK_T_PRODUCTMGR_PROPERTY primary key (property_code)
);

comment on table t_productmgr_property is
'��Ʒ��������';

comment on column t_productmgr_property.property_code is
'����������';

comment on column t_productmgr_property.property_name is
'�����������';

comment on column t_productmgr_property.property_sort is
'����ֵ�����ԣ���ѡ or ��ѡ';

comment on column t_productmgr_property.property_remark is
'��ע';

comment on column t_productmgr_property.property_leaf is
'�Ƿ�Ҷ�ӽ��';

/*==============================================================*/
/* Table: t_productmgr_propertylink                             */
/*==============================================================*/
create table t_productmgr_propertylink 
(
   sort_code            VARCHAR2(12)         not null,
   property_code        VARCHAR2(12)         not null,
   constraint PK_T_PRODUCTMGR_PROPERTYLINK primary key (sort_code, property_code)
);

comment on column t_productmgr_propertylink.sort_code is
'�����';

comment on column t_productmgr_propertylink.property_code is
'����������';

/*==============================================================*/
/* Table: t_productmgr_propertyvaluelink                        */
/*==============================================================*/
create table t_productmgr_propertyvaluelink 
(
   sp_id                VARCHAR2(20)         not null,
   pv_code              VARCHAR2(12)         not null,
   constraint PK_T_PRODUCTMGR_PROPERTYVALUEL primary key (sp_id, pv_code)
);

comment on table t_productmgr_propertyvaluelink is
'��Ʒ����ֵ������';

comment on column t_productmgr_propertyvaluelink.sp_id is
'��Ʒid';

comment on column t_productmgr_propertyvaluelink.pv_code is
'����ֵ����';

/*==============================================================*/
/* Table: t_productmgr_propertyvalues                           */
/*==============================================================*/
create table t_productmgr_propertyvalues 
(
   pv_code              VARCHAR2(12)         not null,
   property_code        VARCHAR2(12),
   pv_name              VARCHAR2(20),
   pv_remark            VARCHAR2(255),
   pv_pcode             VARCHAR2(12),
   constraint PK_T_PRODUCTMGR_PROPERTYVALUES primary key (pv_code)
);

comment on table t_productmgr_propertyvalues is
'��Ʒ����ֵ��ϸ��';

comment on column t_productmgr_propertyvalues.pv_code is
'����ֵ����';

comment on column t_productmgr_propertyvalues.property_code is
'����������';

comment on column t_productmgr_propertyvalues.pv_name is
'����ֵ����';

comment on column t_productmgr_propertyvalues.pv_remark is
'��ע';

comment on column t_productmgr_propertyvalues.pv_pcode is
'�����Ա���';

/*==============================================================*/
/* Table: t_productmgr_sorts                                    */
/*==============================================================*/
create table t_productmgr_sorts 
(
   sort_code            VARCHAR2(12)         not null,
   sort_name            VARCHAR2(20),
   sort_parentcode      VARCHAR2(12),
   sort_img             VARCHAR2(150),
   sort_sumary          VARCHAR2(255),
   sort_leaf            NUMBER(1),
   constraint PK_T_PRODUCTMGR_SORTS primary key (sort_code)
);

comment on column t_productmgr_sorts.sort_code is
'�����';

comment on column t_productmgr_sorts.sort_name is
'�������';

comment on column t_productmgr_sorts.sort_parentcode is
'�����';

comment on column t_productmgr_sorts.sort_img is
'���ͼƬ';

comment on column t_productmgr_sorts.sort_sumary is
'���˵��';

comment on column t_productmgr_sorts.sort_leaf is
'�Ƿ�Ҷ�ӽ��';

/*==============================================================*/
/* Table: t_productmgr_supplierscontract                        */
/*==============================================================*/
create table t_productmgr_supplierscontract 
(
   c_code               VARCHAR2(20)         not null,
   c_name1              VARCHAR2(100),
   c_project            VARCHAR2(100),
   c_supname            VARCHAR2(100),
   c_property           VARCHAR2(20),
   c_type               VARCHAR2(20),
   c_state              VARCHAR2(20),
   c_style              VARCHAR2(20),
   c_runstyle           VARCHAR2(20),
   c_cash               VARCHAR2(20),
   c_paymenttype        VARCHAR2(20),
   c_moneytype          VARCHAR2(20),
   c_money1             NUMBER(11,2),
   c_money2             NUMBER(11,2),
   c_typedetail         VARCHAR2(20),
   c_subject            VARCHAR2(20),
   c_date               DATE,
   c_startdate          DATE,
   c_endstart           DATE,
   c_summary            VARCHAR2(255),
   c_message            VARCHAR2(20),
   c_msgfrom            VARCHAR2(20),
   c_dutyman            VARCHAR2(20),
   c_regdate            DATE,
   c_checkstate         NUMBER(1),
   c_processdept        VARCHAR2(20),
   c_processer          VARCHAR2(20),
   c_remark             VARCHAR2(255),
   constraint PK_T_PRODUCTMGR_SUPPLIERSCONTR primary key (c_code)
);

comment on column t_productmgr_supplierscontract.c_code is
'��ͬ����';

comment on column t_productmgr_supplierscontract.c_name1 is
'��ͬ����';

comment on column t_productmgr_supplierscontract.c_project is
'��Ŀ����';

comment on column t_productmgr_supplierscontract.c_supname is
'��Ӧ������';

comment on column t_productmgr_supplierscontract.c_property is
'��ͬ����';

comment on column t_productmgr_supplierscontract.c_type is
'��ͬ���';

comment on column t_productmgr_supplierscontract.c_state is
'��ͬ״̬';

comment on column t_productmgr_supplierscontract.c_style is
'��ͬ��ʽ';

comment on column t_productmgr_supplierscontract.c_runstyle is
'��ִͬ�з�ʽ';

comment on column t_productmgr_supplierscontract.c_cash is
'�ո�����';

comment on column t_productmgr_supplierscontract.c_paymenttype is
'���㷽ʽ';

comment on column t_productmgr_supplierscontract.c_moneytype is
'�������';

comment on column t_productmgr_supplierscontract.c_money1 is
'��ͬ���';

comment on column t_productmgr_supplierscontract.c_money2 is
'��ͬǩԼ���';

comment on column t_productmgr_supplierscontract.c_typedetail is
'��ϸ����';

comment on column t_productmgr_supplierscontract.c_subject is
'��ͬ���';

comment on column t_productmgr_supplierscontract.c_date is
'ǩ������';

comment on column t_productmgr_supplierscontract.c_startdate is
'��ʼ����';

comment on column t_productmgr_supplierscontract.c_endstart is
'��������';

comment on column t_productmgr_supplierscontract.c_summary is
'��ͬ���';

comment on column t_productmgr_supplierscontract.c_message is
'�ɹ���Ϣ';

comment on column t_productmgr_supplierscontract.c_msgfrom is
'�ɹ���Դ';

comment on column t_productmgr_supplierscontract.c_dutyman is
'������';

comment on column t_productmgr_supplierscontract.c_regdate is
'�Ǽ�����';

comment on column t_productmgr_supplierscontract.c_checkstate is
'���״̬ 0 δ��� 1 ����� 3 ��ɾ��';

comment on column t_productmgr_supplierscontract.c_processdept is
'�����˲���';

comment on column t_productmgr_supplierscontract.c_processer is
'������';

comment on column t_productmgr_supplierscontract.c_remark is
'��ע';

/*==============================================================*/
/* Table: t_productmgr_suppliersproduct                         */
/*==============================================================*/
create table t_productmgr_suppliersproduct 
(
   sp_id                VARCHAR2(20)         not null,
   c_code               VARCHAR2(20),
   p_code               VARCHAR2(12),
   sp_spcode            VARCHAR2(100),
   sp_price             NUMBER(11,2),
   sp_num               NUMBER(11),
   sp_desc              VARCHAR2(255),
   dept_code            VARCHAR2(20),
   sp_state             NUMBER(1),
   sp_order             NUMBER(11,0),
   constraint PK_T_PRODUCTMGR_SUPPLIERSPRODU primary key (sp_id)
);

comment on table t_productmgr_suppliersproduct is
'��Ӧ����Ʒ��';

comment on column t_productmgr_suppliersproduct.sp_id is
'��Ʒid';

comment on column t_productmgr_suppliersproduct.c_code is
'��ͬ����';

comment on column t_productmgr_suppliersproduct.p_code is
'��Ʒ����';

comment on column t_productmgr_suppliersproduct.sp_spcode is
'��Ӧ�̲�Ʒ����';

comment on column t_productmgr_suppliersproduct.sp_price is
'��Ʒ�۸�';

comment on column t_productmgr_suppliersproduct.sp_num is
'��Ʒ����';

comment on column t_productmgr_suppliersproduct.sp_desc is
'��Ʒ����';

comment on column t_productmgr_suppliersproduct.dept_code is
'�ֹ�˾����';

comment on column t_productmgr_suppliersproduct.sp_state is
'״̬';

comment on column t_productmgr_suppliersproduct.sp_order is
'��Ʒ�����';

alter table t_productmgr_areacontractlink
   add constraint Fk_acl_supcontract foreign key (c_code)
      references t_productmgr_supplierscontract (c_code);

alter table t_productmgr_deptmentlink
   add constraint Fk_deptment_supcontract foreign key (dept_code)
      references t_productmgr_deptment (dept_code);

alter table t_productmgr_deptmentlink
   add constraint Fk_deptment_supcontract2 foreign key (c_code)
      references t_productmgr_supplierscontract (c_code);

alter table t_productmgr_products
   add constraint Fk_sorts_product foreign key (sort_code)
      references t_productmgr_sorts (sort_code);

alter table t_productmgr_productshow
   add constraint Fk_product_productShow foreign key (p_code)
      references t_productmgr_products (p_code);

alter table t_productmgr_productshow
   add constraint Fk_sorts_productShow foreign key (sort_code)
      references t_productmgr_sorts (sort_code);

alter table t_productmgr_propertylink
   add constraint Fk_sorts_property foreign key (sort_code)
      references t_productmgr_sorts (sort_code);

alter table t_productmgr_propertylink
   add constraint Fk_sorts_property2 foreign key (property_code)
      references t_productmgr_property (property_code);

alter table t_productmgr_propertyvaluelink
   add constraint Fk_supproduct_propertyvalues foreign key (sp_id)
      references t_productmgr_suppliersproduct (sp_id);

alter table t_productmgr_propertyvaluelink
   add constraint Fk_supproduct_propertyvalues2 foreign key (pv_code)
      references t_productmgr_propertyvalues (pv_code);

alter table t_productmgr_propertyvalues
   add constraint Fk_property_propertyValues foreign key (property_code)
      references t_productmgr_property (property_code);

alter table t_productmgr_suppliersproduct
   add constraint Fk_product_suppliersproduct foreign key (p_code)
      references t_productmgr_products (p_code);

alter table t_productmgr_suppliersproduct
   add constraint Fk_supcontract_supproduct foreign key (c_code)
      references t_productmgr_supplierscontract (c_code);

