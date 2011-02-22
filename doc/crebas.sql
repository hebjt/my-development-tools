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
'供货范围-合同联系表';

comment on column t_productmgr_areacontractlink.acl_code is
'范围联系编号';

comment on column t_productmgr_areacontractlink.c_code is
'合同编码';

comment on column t_productmgr_areacontractlink.acl_area is
'供货范围';

comment on column t_productmgr_areacontractlink.acl_remark is
'备注';

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
'供货范围表';

comment on column t_productmgr_delivery.d_code is
'供货范围编码';

comment on column t_productmgr_delivery.d_province is
'省区地址';

comment on column t_productmgr_delivery.d_city is
'城市地址';

comment on column t_productmgr_delivery.d_state is
'县区地址';

comment on column t_productmgr_delivery.d_area is
'供货地区';

comment on column t_productmgr_delivery.d_parent is
'父属区域，0 为最高';

comment on column t_productmgr_delivery.d_sumary is
'详细描述';

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
'分公司表';

comment on column t_productmgr_deptment.dept_code is
'分公司编码';

comment on column t_productmgr_deptment.dept_name is
'分公司名称';

comment on column t_productmgr_deptment.dept_addr is
'分公司地址';

comment on column t_productmgr_deptment.dept_phone is
'联系电话';

comment on column t_productmgr_deptment.dept_person is
'主要负责人';

comment on column t_productmgr_deptment.dept_mobile is
'负责人联系电话';

comment on column t_productmgr_deptment.dept_remark is
'备注';

comment on column t_productmgr_deptment.dept_area is
'分公司所属区域';

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
'分公司合同联系表';

comment on column t_productmgr_deptmentlink.dept_code is
'分公司编码';

comment on column t_productmgr_deptmentlink.c_code is
'合同编码';

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
'商品编码';

comment on column t_productmgr_products.sort_code is
'类别编号';

comment on column t_productmgr_products.p_name is
'商品名称';

comment on column t_productmgr_products.p_zhongliang is
'重量单位';

comment on column t_productmgr_products.p_jiliang is
'计量单位';

comment on column t_productmgr_products.p_order is
'商品排序号';

comment on column t_productmgr_products.p_price1 is
'销售价格';

comment on column t_productmgr_products.p_price2 is
'市场售价';

comment on column t_productmgr_products.p_price3 is
'网购价格';

comment on column t_productmgr_products.p_price4 is
'促销价格';

comment on column t_productmgr_products.p_price5 is
'会员价格';

comment on column t_productmgr_products.p_price6 is
'商品优惠价格';

comment on column t_productmgr_products.p_rem1 is
'超级特价推荐';

comment on column t_productmgr_products.p_rem2 is
'最新商品推进啊';

comment on column t_productmgr_products.p_img1 is
'商品图片';

comment on column t_productmgr_products.p_video is
'商品视频';

comment on column t_productmgr_products.p_summary is
'商品描述';

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
'商品展示表';

comment on column t_productmgr_productshow.psh_id is
'商品序号';

comment on column t_productmgr_productshow.sort_code is
'类别编号';

comment on column t_productmgr_productshow.p_code is
'商品编码';

comment on column t_productmgr_productshow.psh_price1 is
'销售价格';

comment on column t_productmgr_productshow.psh_price2 is
'市场售价';

comment on column t_productmgr_productshow.psh_starttime is
'促销开始时间';

comment on column t_productmgr_productshow.psh_endtime is
'促销结束时间';

comment on column t_productmgr_productshow.psh_price3 is
'商品优惠价格';

comment on column t_productmgr_productshow.psh_num is
'优惠数量';

comment on column t_productmgr_productshow.psh_price4 is
'网购价格';

comment on column t_productmgr_productshow.psh_price5 is
'促销价格';

comment on column t_productmgr_productshow.psh_price6 is
'会员价格';

comment on column t_productmgr_productshow.psh_desc is
'描述';

comment on column t_productmgr_productshow.psh_order is
'排序';

comment on column t_productmgr_productshow.psh_img1 is
'商品图片';

comment on column t_productmgr_productshow.psh_video is
'广告视频';

comment on column t_productmgr_productshow.dept_code is
'分公司编码';

comment on column t_productmgr_productshow.psh_rem1 is
'超级特价推荐方式，1 推荐 0 不推荐';

comment on column t_productmgr_productshow.psh_rem2 is
'最新商品推荐方式，1 推荐 0 不推荐';

comment on column t_productmgr_productshow.psh_rem3 is
'是否促销';

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
'商品属性类别表';

comment on column t_productmgr_property.property_code is
'属性类别编码';

comment on column t_productmgr_property.property_name is
'属性类别名称';

comment on column t_productmgr_property.property_sort is
'属性值的属性，单选 or 多选';

comment on column t_productmgr_property.property_remark is
'备注';

comment on column t_productmgr_property.property_leaf is
'是否叶子结点';

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
'类别编号';

comment on column t_productmgr_propertylink.property_code is
'属性类别编码';

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
'商品属性值关联表';

comment on column t_productmgr_propertyvaluelink.sp_id is
'商品id';

comment on column t_productmgr_propertyvaluelink.pv_code is
'属性值编码';

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
'商品属性值明细表';

comment on column t_productmgr_propertyvalues.pv_code is
'属性值编码';

comment on column t_productmgr_propertyvalues.property_code is
'属性类别编码';

comment on column t_productmgr_propertyvalues.pv_name is
'属性值名称';

comment on column t_productmgr_propertyvalues.pv_remark is
'备注';

comment on column t_productmgr_propertyvalues.pv_pcode is
'父属性编码';

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
'类别编号';

comment on column t_productmgr_sorts.sort_name is
'类别名称';

comment on column t_productmgr_sorts.sort_parentcode is
'父类别';

comment on column t_productmgr_sorts.sort_img is
'类别图片';

comment on column t_productmgr_sorts.sort_sumary is
'类别说明';

comment on column t_productmgr_sorts.sort_leaf is
'是否叶子结点';

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
'合同编码';

comment on column t_productmgr_supplierscontract.c_name1 is
'合同名称';

comment on column t_productmgr_supplierscontract.c_project is
'项目名称';

comment on column t_productmgr_supplierscontract.c_supname is
'供应商名称';

comment on column t_productmgr_supplierscontract.c_property is
'合同类型';

comment on column t_productmgr_supplierscontract.c_type is
'合同类别';

comment on column t_productmgr_supplierscontract.c_state is
'合同状态';

comment on column t_productmgr_supplierscontract.c_style is
'合同形式';

comment on column t_productmgr_supplierscontract.c_runstyle is
'合同执行方式';

comment on column t_productmgr_supplierscontract.c_cash is
'收付方向';

comment on column t_productmgr_supplierscontract.c_paymenttype is
'结算方式';

comment on column t_productmgr_supplierscontract.c_moneytype is
'货币类别';

comment on column t_productmgr_supplierscontract.c_money1 is
'合同金额';

comment on column t_productmgr_supplierscontract.c_money2 is
'合同签约金额';

comment on column t_productmgr_supplierscontract.c_typedetail is
'详细分类';

comment on column t_productmgr_supplierscontract.c_subject is
'合同标的';

comment on column t_productmgr_supplierscontract.c_date is
'签订日期';

comment on column t_productmgr_supplierscontract.c_startdate is
'开始日期';

comment on column t_productmgr_supplierscontract.c_endstart is
'结束日期';

comment on column t_productmgr_supplierscontract.c_summary is
'合同简况';

comment on column t_productmgr_supplierscontract.c_message is
'采购信息';

comment on column t_productmgr_supplierscontract.c_msgfrom is
'采购来源';

comment on column t_productmgr_supplierscontract.c_dutyman is
'责任人';

comment on column t_productmgr_supplierscontract.c_regdate is
'登记日期';

comment on column t_productmgr_supplierscontract.c_checkstate is
'审核状态 0 未审核 1 已审核 3 已删除';

comment on column t_productmgr_supplierscontract.c_processdept is
'经手人部门';

comment on column t_productmgr_supplierscontract.c_processer is
'经手人';

comment on column t_productmgr_supplierscontract.c_remark is
'备注';

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
'供应商商品表';

comment on column t_productmgr_suppliersproduct.sp_id is
'商品id';

comment on column t_productmgr_suppliersproduct.c_code is
'合同编码';

comment on column t_productmgr_suppliersproduct.p_code is
'商品编码';

comment on column t_productmgr_suppliersproduct.sp_spcode is
'供应商产品编码';

comment on column t_productmgr_suppliersproduct.sp_price is
'商品价格';

comment on column t_productmgr_suppliersproduct.sp_num is
'商品数量';

comment on column t_productmgr_suppliersproduct.sp_desc is
'商品描述';

comment on column t_productmgr_suppliersproduct.dept_code is
'分公司编码';

comment on column t_productmgr_suppliersproduct.sp_state is
'状态';

comment on column t_productmgr_suppliersproduct.sp_order is
'商品排序号';

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

