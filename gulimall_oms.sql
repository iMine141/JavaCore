drop table if exists oms_order;

drop table if exists oms_order_item;

drop table if exists oms_order_operate_history;

drop table if exists oms_order_return_apply;

drop table if exists oms_order_return_reason;

drop table if ex
    ists oms_order_setting;

drop table if exists oms_payment_info;

drop table if exists oms_refund_info;

/*==============================================================*/
/* Table: oms_order                                             */
/*==============================================================*/
create table oms_order
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   order_sn             char(32) comment '¶©µ¥ºÅ',
   coupon_id            bigint comment 'Ê¹ÓÃµÄÓÅ»ÝÈ¯',
   create_time          datetime comment 'create_time',
   member_username      varchar(200) comment 'ÓÃ»§Ãû',
   total_amount         decimal(18,4) comment '¶©µ¥×Ü¶î',
   pay_amount           decimal(18,4) comment 'Ó¦¸¶×Ü¶î',
   freight_amount       decimal(18,4) comment 'ÔË·Ñ½ð¶î',
   promotion_amount     decimal(18,4) comment '´ÙÏúÓÅ»¯½ð¶î£¨´ÙÏú¼Û¡¢Âú¼õ¡¢½×ÌÝ¼Û£©',
   integration_amount   decimal(18,4) comment '»ý·ÖµÖ¿Û½ð¶î',
   coupon_amount        decimal(18,4) comment 'ÓÅ»ÝÈ¯µÖ¿Û½ð¶î',
   discount_amount      decimal(18,4) comment 'ºóÌ¨µ÷Õû¶©µ¥Ê¹ÓÃµÄÕÛ¿Û½ð¶î',
   pay_type             tinyint comment 'Ö§¸¶·½Ê½¡¾1->Ö§¸¶±¦£»2->Î¢ÐÅ£»3->ÒøÁª£» 4->»õµ½¸¶¿î£»¡¿',
   source_type          tinyint comment '¶©µ¥À´Ô´[0->PC¶©µ¥£»1->app¶©µ¥]',
   status               tinyint comment '¶©µ¥×´Ì¬¡¾0->´ý¸¶¿î£»1->´ý·¢»õ£»2->ÒÑ·¢»õ£»3->ÒÑÍê³É£»4->ÒÑ¹Ø±Õ£»5->ÎÞÐ§¶©µ¥¡¿',
   delivery_company     varchar(64) comment 'ÎïÁ÷¹«Ë¾(ÅäËÍ·½Ê½)',
   delivery_sn          varchar(64) comment 'ÎïÁ÷µ¥ºÅ',
   auto_confirm_day     int comment '×Ô¶¯È·ÈÏÊ±¼ä£¨Ìì£©',
   integration          int comment '¿ÉÒÔ»ñµÃµÄ»ý·Ö',
   growth               int comment '¿ÉÒÔ»ñµÃµÄ³É³¤Öµ',
   bill_type            tinyint comment '·¢Æ±ÀàÐÍ[0->²»¿ª·¢Æ±£»1->µç×Ó·¢Æ±£»2->Ö½ÖÊ·¢Æ±]',
   bill_header          varchar(255) comment '·¢Æ±Ì§Í·',
   bill_content         varchar(255) comment '·¢Æ±ÄÚÈÝ',
   bill_receiver_phone  varchar(32) comment 'ÊÕÆ±ÈËµç»°',
   bill_receiver_email  varchar(64) comment 'ÊÕÆ±ÈËÓÊÏä',
   receiver_name        varchar(100) comment 'ÊÕ»õÈËÐÕÃû',
   receiver_phone       varchar(32) comment 'ÊÕ»õÈËµç»°',
   receiver_post_code   varchar(32) comment 'ÊÕ»õÈËÓÊ±à',
   receiver_province    varchar(32) comment 'Ê¡·Ý/Ö±Ï½ÊÐ',
   receiver_city        varchar(32) comment '³ÇÊÐ',
   receiver_region      varchar(32) comment 'Çø',
   receiver_detail_address varchar(200) comment 'ÏêÏ¸µØÖ·',
   note                 varchar(500) comment '¶©µ¥±¸×¢',
   confirm_status       tinyint comment 'È·ÈÏÊÕ»õ×´Ì¬[0->Î´È·ÈÏ£»1->ÒÑÈ·ÈÏ]',
   delete_status        tinyint comment 'É¾³ý×´Ì¬¡¾0->Î´É¾³ý£»1->ÒÑÉ¾³ý¡¿',
   use_integration      int comment 'ÏÂµ¥Ê±Ê¹ÓÃµÄ»ý·Ö',
   payment_time         datetime comment 'Ö§¸¶Ê±¼ä',
   delivery_time        datetime comment '·¢»õÊ±¼ä',
   receive_time         datetime comment 'È·ÈÏÊÕ»õÊ±¼ä',
   comment_time         datetime comment 'ÆÀ¼ÛÊ±¼ä',
   modify_time          datetime comment 'ÐÞ¸ÄÊ±¼ä',
   primary key (id)
);

alter table oms_order comment '¶©µ¥';

/*==============================================================*/
/* Table: oms_order_item                                        */
/*==============================================================*/
create table oms_order_item
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment 'order_id',
   order_sn             char(32) comment 'order_sn',
   spu_id               bigint comment 'spu_id',
   spu_name             varchar(255) comment 'spu_name',
   spu_pic              varchar(500) comment 'spu_pic',
   spu_brand            varchar(200) comment 'Æ·ÅÆ',
   category_id          bigint comment 'ÉÌÆ··ÖÀàid',
   sku_id               bigint comment 'ÉÌÆ·sku±àºÅ',
   sku_name             varchar(255) comment 'ÉÌÆ·skuÃû×Ö',
   sku_pic              varchar(500) comment 'ÉÌÆ·skuÍ¼Æ¬',
   sku_price            decimal(18,4) comment 'ÉÌÆ·sku¼Û¸ñ',
   sku_quantity         int comment 'ÉÌÆ·¹ºÂòµÄÊýÁ¿',
   sku_attrs_vals       varchar(500) comment 'ÉÌÆ·ÏúÊÛÊôÐÔ×éºÏ£¨JSON£©',
   promotion_amount     decimal(18,4) comment 'ÉÌÆ·´ÙÏú·Ö½â½ð¶î',
   coupon_amount        decimal(18,4) comment 'ÓÅ»ÝÈ¯ÓÅ»Ý·Ö½â½ð¶î',
   integration_amount   decimal(18,4) comment '»ý·ÖÓÅ»Ý·Ö½â½ð¶î',
   real_amount          decimal(18,4) comment '¸ÃÉÌÆ·¾­¹ýÓÅ»ÝºóµÄ·Ö½â½ð¶î',
   gift_integration     int comment 'ÔùËÍ»ý·Ö',
   gift_growth          int comment 'ÔùËÍ³É³¤Öµ',
   primary key (id)
);

alter table oms_order_item comment '¶©µ¥ÏîÐÅÏ¢';

/*==============================================================*/
/* Table: oms_order_operate_history                             */
/*==============================================================*/
create table oms_order_operate_history
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment '¶©µ¥id',
   operate_man          varchar(100) comment '²Ù×÷ÈË[ÓÃ»§£»ÏµÍ³£»ºóÌ¨¹ÜÀíÔ±]',
   create_time          datetime comment '²Ù×÷Ê±¼ä',
   order_status         tinyint comment '¶©µ¥×´Ì¬¡¾0->´ý¸¶¿î£»1->´ý·¢»õ£»2->ÒÑ·¢»õ£»3->ÒÑÍê³É£»4->ÒÑ¹Ø±Õ£»5->ÎÞÐ§¶©µ¥¡¿',
   note                 varchar(500) comment '±¸×¢',
   primary key (id)
);

alter table oms_order_operate_history comment '¶©µ¥²Ù×÷ÀúÊ·¼ÇÂ¼';

/*==============================================================*/
/* Table: oms_order_return_apply                                */
/*==============================================================*/
create table oms_order_return_apply
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment 'order_id',
   sku_id               bigint comment 'ÍË»õÉÌÆ·id',
   order_sn             char(32) comment '¶©µ¥±àºÅ',
   create_time          datetime comment 'ÉêÇëÊ±¼ä',
   member_username      varchar(64) comment '»áÔ±ÓÃ»§Ãû',
   return_amount        decimal(18,4) comment 'ÍË¿î½ð¶î',
   return_name          varchar(100) comment 'ÍË»õÈËÐÕÃû',
   return_phone         varchar(20) comment 'ÍË»õÈËµç»°',
   status               tinyint(1) comment 'ÉêÇë×´Ì¬[0->´ý´¦Àí£»1->ÍË»õÖÐ£»2->ÒÑÍê³É£»3->ÒÑ¾Ü¾ø]',
   handle_time          datetime comment '´¦ÀíÊ±¼ä',
   sku_img              varchar(500) comment 'ÉÌÆ·Í¼Æ¬',
   sku_name             varchar(200) comment 'ÉÌÆ·Ãû³Æ',
   sku_brand            varchar(200) comment 'ÉÌÆ·Æ·ÅÆ',
   sku_attrs_vals       varchar(500) comment 'ÉÌÆ·ÏúÊÛÊôÐÔ(JSON)',
   sku_count            int comment 'ÍË»õÊýÁ¿',
   sku_price            decimal(18,4) comment 'ÉÌÆ·µ¥¼Û',
   sku_real_price       decimal(18,4) comment 'ÉÌÆ·Êµ¼ÊÖ§¸¶µ¥¼Û',
   reason               varchar(200) comment 'Ô­Òò',
   descriptionÊö         varchar(500) comment 'ÃèÊö',
   desc_pics            varchar(2000) comment 'Æ¾Ö¤Í¼Æ¬£¬ÒÔ¶ººÅ¸ô¿ª',
   handle_note          varchar(500) comment '´¦Àí±¸×¢',
   handle_man           varchar(200) comment '´¦ÀíÈËÔ±',
   receive_man          varchar(100) comment 'ÊÕ»õÈË',
   receive_time         datetime comment 'ÊÕ»õÊ±¼ä',
   receive_note         varchar(500) comment 'ÊÕ»õ±¸×¢',
   receive_phone        varchar(20) comment 'ÊÕ»õµç»°',
   company_address      varchar(500) comment '¹«Ë¾ÊÕ»õµØÖ·',
   primary key (id)
);

alter table oms_order_return_apply comment '¶©µ¥ÍË»õÉêÇë';

/*==============================================================*/
/* Table: oms_order_return_reason                               */
/*==============================================================*/
create table oms_order_return_reason
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(200) comment 'ÍË»õÔ­ÒòÃû',
   sort                 int comment 'ÅÅÐò',
   status               tinyint(1) comment 'ÆôÓÃ×´Ì¬',
   create_time          datetime comment 'create_time',
   primary key (id)
);

alter table oms_order_return_reason comment 'ÍË»õÔ­Òò';

/*==============================================================*/
/* Table: oms_order_setting                                     */
/*==============================================================*/
create table oms_order_setting
(
   id                   bigint not null auto_increment comment 'id',
   flash_order_overtime int comment 'ÃëÉ±¶©µ¥³¬Ê±¹Ø±ÕÊ±¼ä(·Ö)',
   normal_order_overtime int comment 'Õý³£¶©µ¥³¬Ê±Ê±¼ä(·Ö)',
   confirm_overtime     int comment '·¢»õºó×Ô¶¯È·ÈÏÊÕ»õÊ±¼ä£¨Ìì£©',
   finish_overtime      int comment '×Ô¶¯Íê³É½»Ò×Ê±¼ä£¬²»ÄÜÉêÇëÍË»õ£¨Ìì£©',
   comment_overtime     int comment '¶©µ¥Íê³Éºó×Ô¶¯ºÃÆÀÊ±¼ä£¨Ìì£©',
   member_level         tinyint(2) comment '»áÔ±µÈ¼¶¡¾0-²»ÏÞ»áÔ±µÈ¼¶£¬È«²¿Í¨ÓÃ£»ÆäËû-¶ÔÓ¦µÄÆäËû»áÔ±µÈ¼¶¡¿',
   primary key (id)
);

alter table oms_order_setting comment '¶©µ¥ÅäÖÃÐÅÏ¢';

/*==============================================================*/
/* Table: oms_payment_info                                      */
/*==============================================================*/
create table oms_payment_info
(
   id                   bigint not null auto_increment comment 'id',
   order_sn             char(32) comment '¶©µ¥ºÅ£¨¶ÔÍâÒµÎñºÅ£©',
   order_id             bigint comment '¶©µ¥id',
   alipay_trade_no      varchar(50) comment 'Ö§¸¶±¦½»Ò×Á÷Ë®ºÅ',
   total_amount         decimal(18,4) comment 'Ö§¸¶×Ü½ð¶î',
   subject              varchar(200) comment '½»Ò×ÄÚÈÝ',
   payment_status       varchar(20) comment 'Ö§¸¶×´Ì¬',
   create_time          datetime comment '´´½¨Ê±¼ä',
   confirm_time         datetime comment 'È·ÈÏÊ±¼ä',
   callback_content     varchar(4000) comment '»Øµ÷ÄÚÈÝ',
   callback_time        datetime comment '»Øµ÷Ê±¼ä',
   primary key (id)
);

alter table oms_payment_info comment 'Ö§¸¶ÐÅÏ¢±í';

/*==============================================================*/
/* Table: oms_refund_info                                       */
/*==============================================================*/
create table oms_refund_info
(
   id                   bigint not null auto_increment comment 'id',
   order_return_id      bigint comment 'ÍË¿îµÄ¶©µ¥',
   refund               decimal(18,4) comment 'ÍË¿î½ð¶î',
   refund_sn            varchar(64) comment 'ÍË¿î½»Ò×Á÷Ë®ºÅ',
   refund_status        tinyint(1) comment 'ÍË¿î×´Ì¬',
   refund_channel       tinyint comment 'ÍË¿îÇþµÀ[1-Ö§¸¶±¦£¬2-Î¢ÐÅ£¬3-ÒøÁª£¬4-»ã¿î]',
   refund_content       varchar(5000),
   primary key (id)
);

alter table oms_refund_info comment 'ÍË¿îÐÅÏ¢';
