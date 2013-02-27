INSERT INTO `wtrole` VALUES (10003,'经理','1','2013-02-26 10:01:00','10003',NULL,'1',0);
INSERT INTO `wtfunction` (`wtfunction_id`,`wtfun_parentid`,`wtfun_isleaf`,`wtfun_code`,`wtfun_order`,`wtfun_name`,`wtfun_excutepath`,`wtfun_createtime`,`wtfun_description`) VALUES (103,100,'1','0103','0103','工作流管理','workflow.do','2013-02-26 11:11:00',NULL);
INSERT INTO `wtresource` (`wtresource_id`,`wtfunction_id`,`wtres_name`,`wtres_code`,`wtres_createtime`,`wtres_description`) VALUES (10301,103,'添加','01','2013-02-26 11:11:11',NULL);

INSERT INTO `wtrolefunrelationship` VALUES (10004,10001,103,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119898,10003,131,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119899,10003,145,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119900,10003,137,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119901,10003,179,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119902,10003,221,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119903,10003,1433,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119904,10003,1455,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119905,10003,1422,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119906,10003,189,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119907,10003,167,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119908,10003,1477,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119909,10003,1499,NULL);
INSERT INTO `wtrolefunrelationship` VALUES (119910,10003,1466,NULL);


INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100001,'2013-02-26 11:11:11','项目',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100002,'2013-02-26 11:11:11','申请人登记表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100003,'2013-02-26 11:11:11','健康评估表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100004,'2013-02-26 11:11:11','护理评估与计划',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100005,'2013-02-26 11:11:11','助浴服务记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100006,'2013-02-26 11:11:11','老年人介护服务计划表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100007,'2013-02-26 11:11:11','其他介护服务记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100008,'2013-02-26 11:11:11','老年人介护服务计划表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100009,'2013-02-26 11:11:11','康复评估与康复计划',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100010,'2013-02-26 11:11:11','血压测量记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100011,'2013-02-26 11:11:11','心理康复活动记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100012,'2013-02-26 11:11:11','感官功能康复记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100013,'2013-02-26 11:11:11','保健操记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100014,'2013-02-26 11:11:11','器械康复记录表',NULL,NULL);
INSERT INTO `tbl_form` (`form_id`,`form_createtime`,`form_name`,`form_desc`,`form_code`) VALUES (100015,'2013-02-26 11:11:11','活动',NULL,NULL);