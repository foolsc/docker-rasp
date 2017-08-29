-- ----------------------------
-- Database
-- ----------------------------

DROP DATABASE IF EXISTS `dcsec_rasp`;
CREATE DATABASE `dcsec_rasp` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
USE `dcsec_rasp`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dcsec_admin
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_admin`;
CREATE TABLE `dcsec_admin` (
  `username` varchar(40) NOT NULL DEFAULT '',
  `desc` varchar(200) DEFAULT '',
  `password` varchar(80) DEFAULT '',
  `login_type` int(11) NOT NULL,
  `auth_type` int(11) NOT NULL DEFAULT '1',
  `radius_server_name` varchar(40) DEFAULT '',
  `key_sn` varchar(128) DEFAULT NULL,
  `right` varchar(80) NOT NULL DEFAULT '',
  `block` int(11) unsigned NOT NULL DEFAULT '0',
  `block_time` datetime DEFAULT NULL,
  `begin_time` datetime NOT NULL DEFAULT '2008-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '2037-01-01 00:00:00',
  `update_pwd_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `predefined` int(2) DEFAULT '0',
  `deleted` int(2) DEFAULT '0',
  `pwd_policy` varchar(40) DEFAULT '无' COMMENT '密码安全策略',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_admin
-- ----------------------------
INSERT INTO `dcsec_admin` VALUES ('admin', '用户管理员', '67E6AD4EEC682E9D6C86A5B7D1E1A69DF13D5666', '0', '1', '', '', '用户管理', '0', null, '2017-01-17 07:23:56', '2037-01-01 00:00:00', '2017-05-27 09:45:56', '1', '0', 'default', null, null);

-- ----------------------------
-- Table structure for dcsec_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_admin_role`;
CREATE TABLE `dcsec_admin_role` (
  `username` varchar(40) NOT NULL COMMENT '用户名称，主键',
  `role_id` int(11) NOT NULL COMMENT '角色id，主键',
  PRIMARY KEY (`username`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员与角色关联表';

-- ----------------------------
-- Records of dcsec_admin_role
-- ----------------------------
INSERT INTO `dcsec_admin_role` VALUES ('admin', '1');

-- ----------------------------
-- Table structure for dcsec_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_admin_menu`;
CREATE TABLE `dcsec_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dcsec_email_receiver
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_email_receiver`;
CREATE TABLE `dcsec_email_receiver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `enable` int(11) NOT NULL,
  `insert_time` datetime NOT NULL,
  `extra_info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_email_receiver
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_operation_log`;
CREATE TABLE `dcsec_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(80) DEFAULT ' ',
  `level` int(11) NOT NULL DEFAULT '30',
  `insert_time` datetime DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `user_ip` varchar(255) NOT NULL,
  `content` varchar(8192) DEFAULT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_rasp
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_rasp`;
CREATE TABLE `dcsec_rasp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '探针名称',
  `version` varchar(64) NOT NULL COMMENT '探针版本',
  `status` int(8) NOT NULL DEFAULT '2' COMMENT '探针状态',
  `ip` varchar(256) NOT NULL COMMENT '探针ip',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_del` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_rasp
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_rasp_log
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_rasp_log`;
CREATE TABLE `dcsec_rasp_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `host` varchar(64) NOT NULL DEFAULT '' COMMENT '主机ip',
  `url` varchar(64) NOT NULL DEFAULT '' COMMENT '攻击URL',
  `params` varchar(256) NOT NULL COMMENT '攻击参数',
  `method` int(8) NOT NULL DEFAULT '1' COMMENT '攻击访问方式',
  `user_agent` varchar(256) DEFAULT '' COMMENT '使用代理',
  `src_ip` varchar(64) NOT NULL DEFAULT '' COMMENT '攻击者ip',
  `src_port` varchar(64) NOT NULL DEFAULT '' COMMENT '攻击者端口',
  `dst_ip` varchar(64) NOT NULL DEFAULT '' COMMENT '目标ip',
  `dst_port` varchar(64) NOT NULL DEFAULT '' COMMENT '目标端口',
  `request_type` int(8) NOT NULL DEFAULT '0' COMMENT '请求类型',
  `action` int(8) NOT NULL DEFAULT '0' COMMENT '是否拦截 1 拦截 0 通过',
  `cookie` varchar(256) NOT NULL DEFAULT '' COMMENT 'cookie',
  `request_user` varchar(256) DEFAULT '' COMMENT 'session',
  `triggers` varchar(256) DEFAULT '' COMMENT '触发事件',
  `vulne_type` int(8) DEFAULT '0' COMMENT '攻击类型',
  `level` int(8) DEFAULT '0' COMMENT '日志级别',
  `stack_trace` varchar(4096) DEFAULT NULL COMMENT '堆栈信息',
  `req_context_type` int(8) DEFAULT NULL COMMENT '请求内容类型',
  `res_context_type` int(8) DEFAULT NULL COMMENT '返回内容类型',
  `attack_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '攻击时间',
  `remarks` varchar(64) DEFAULT NULL COMMENT '备注信息',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `rasp_level` int(8) DEFAULT '3' COMMENT '1.高，2.中，3.低',
  PRIMARY KEY (`id`),
  KEY `index_name` (`src_ip`,`dst_ip`,`vulne_type`,`rasp_level`,`attack_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_rasp_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_email_config
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_email_config`;
CREATE TABLE `dcsec_email_config` (
  `id` int(8) NOT NULL,
  `rasp_ip` varchar(512) DEFAULT NULL,
  `level` varchar(64) DEFAULT NULL,
  `receiver_email` varchar(1024) DEFAULT NULL,
  `enable` int(8) DEFAULT '0',
  `task_time` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index` (`rasp_ip`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_email_config
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_role
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_role`;
CREATE TABLE `dcsec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL COMMENT '角色名称',
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `predefined` int(11) NOT NULL DEFAULT '0' COMMENT '是否系统预定义',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dcsec_role
-- ----------------------------
INSERT INTO `dcsec_role` VALUES ('1', '用户管理员', '用户管理员', '2017-01-17 07:23:56', '2017-01-17 07:23:56', '1', '0');
INSERT INTO `dcsec_role` VALUES ('3', '审计管理员', '审计管理员', '2017-01-17 07:23:56', '2017-01-17 07:23:56', '1', '0');
INSERT INTO `dcsec_role` VALUES ('5', '配置管理员', '配置管理员', '2017-01-17 07:23:56', '2017-01-17 07:23:56', '1', '0');

-- ----------------------------
-- Table structure for dcsec_run_log
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_run_log`;
CREATE TABLE `dcsec_run_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(80) NOT NULL DEFAULT '',
  `level` int(10) unsigned DEFAULT '6',
  `insert_time` datetime NOT NULL,
  `content` varchar(16384) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_run_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_sys_email
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_sys_email`;
CREATE TABLE `dcsec_sys_email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smtp_server_ip` varchar(260) NOT NULL DEFAULT '',
  `smtp_port` int(11) unsigned NOT NULL DEFAULT '25',
  `sender` varchar(128) NOT NULL DEFAULT '',
  `authentication` int(11) unsigned NOT NULL DEFAULT '0',
  `ssl` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `password` varchar(80) NOT NULL DEFAULT '',
  `encoding` varchar(40) NOT NULL DEFAULT 'UTF-8',
  `smsp_domain` varchar(260) NOT NULL DEFAULT '' COMMENT '',
  `smsp_account` varchar(80) NOT NULL DEFAULT '' COMMENT '',
  `smsp_password` varchar(80) NOT NULL DEFAULT '' COMMENT '',
  `send_type` int(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_sys_email
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_sys_kv
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_sys_kv`;
CREATE TABLE `dcsec_sys_kv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `k` varchar(100) NOT NULL,
  `v` varchar(5000) NOT NULL DEFAULT '',
  `extra_info` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_sys_kv
-- ----------------------------

-- ----------------------------
-- Table structure for dcsec_security_category
-- ----------------------------
CREATE TABLE `dcsec_security_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `id_path` varchar(1000) NOT NULL,
  `name_path` varchar(2000) NOT NULL,
  `important` int(11) NOT NULL,
  `keywords` varchar(512) DEFAULT NULL,
  `predefined` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` varchar(512) DEFAULT NULL,
  `insert_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `extra_info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dcsec_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `dcsec_sys_menu`;
CREATE TABLE `dcsec_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_level` int(11) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `menu_key` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `predefined` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `insert_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcsec_sys_menu
-- ----------------------------
INSERT INTO `dcsec_sys_menu` VALUES (1, 0, '主页', 1, 1, 'home', '/routes/home', 'fa fa-dashboard', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (2, 0, '安全事件', 1, 2, 'logs', '/routes/logs', 'fa fa-file-text-o', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (3, 0, '安全报表', 1, 3, 'report', '/routes/report', 'fa fa-file-pdf-o', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (4, 0, '探针管理', 1, 4, 'rasp', '/routes/rasp', 'fa fa-shield', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (5, 0, '系统管理', 1, 5, 'sys', '/routes/sys', 'fa fa-cog', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (11, 1, '主页', 2, 1, 'home.home', '/routes/home', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (21, 2, '安全事件', 2, 1, 'rasp.events', '/routes/rasp-events', 'fa', 1, 0, '2017-8-1 10:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (31, 3, '攻击源IP统计', 2, 2, 'report.srcip', '/routes/report-srcip', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (32, 3, '攻击目标IP统计', 2, 3, 'report.dstip', '/routes/report-dstip', 'fa', 1, 0, '2017-8-4 11:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (33, 3, '威胁等级统计', 2, 1, 'report.level', '/routes/report-level', 'fa', 1, 0, '2017-8-4 11:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (34, 3, '攻击类型统计', 2, 5, 'report.vulnetype', '/routes/report-vulnetype', 'fa', 1, 0, '2017-8-4 11:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (35, 3, '攻击趋势统计', 2, 4, 'report.date', '/routes/report-date', 'fa', 1, 0, '2017-8-4 11:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (36, 3, '防护动作统计', 2, 6, 'report.action', '/routes/report-action', 'fa', 1, 0, '2017-8-4 11:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (41, 4, '探针管理', 2, 1, 'rasp.rasp', '/routes/rasp', 'fa', 1, 0, '2017-8-1 10:40:22');
INSERT INTO `dcsec_sys_menu` VALUES (51, 5, '系统配置', 2, 1, 'sys.config', '/routes/sys-config', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (52, 5, '邮件配置', 2, 2, 'sys.email', '/routes/email', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (53, 5, '用户管理', 2, 3, 'sys.users', '/routes/users', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (54, 5, '在线用户', 2, 3, 'sys.online.users', '/routes/online-users', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (55, 5, '运行日志', 2, 4, 'sys.run.logs', '/routes/sys-logs', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (56, 5, '操作日志', 2, 5, 'sys.operation.logs', '/routes/operation-logs', 'fa', 1, 0, '2017-7-31 15:10:03');
INSERT INTO `dcsec_sys_menu` VALUES (57, 5, '邮件告警', 2, 2, 'sys.email-call', '/routes/email-call', 'fa', 1, 0, '2017-7-31 15:10:03');
