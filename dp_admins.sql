/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : daproject

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-06-07 17:47:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dp_admins
-- ----------------------------
DROP TABLE IF EXISTS `dp_admins`;
CREATE TABLE `dp_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=正常，2=冻结',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_admins
-- ----------------------------
INSERT INTO `dp_admins` VALUES ('1', 'admin', '3abff3e2dafa82cf67eb629a23ffad1c4b89cced', '9ee6e643af', 'hello@dilicms.com', '1', '1');
INSERT INTO `dp_admins` VALUES ('2', 'waitatlee', '9d9aea41f8fbc1bd9cd4525143fdb93348fed362', '11eedf8abd', 'waitatlee@qq.com', '2', '1');

-- ----------------------------
-- Table structure for dp_attachments
-- ----------------------------
DROP TABLE IF EXISTS `dp_attachments`;
CREATE TABLE `dp_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_attachments
-- ----------------------------
INSERT INTO `dp_attachments` VALUES ('1', '1', '0', '0', '0', '1528277603f067a1f18ef8456d', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528277603');
INSERT INTO `dp_attachments` VALUES ('2', '1', '0', '0', '0', '15283545702d37e44118da3a7a', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528354570');
INSERT INTO `dp_attachments` VALUES ('3', '1', '0', '0', '0', '15283578418f08e2cb8f6fc615', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528357841');
INSERT INTO `dp_attachments` VALUES ('4', '1', '0', '0', '0', '1528358941cae77d86b914238f', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528358941');
INSERT INTO `dp_attachments` VALUES ('5', '1', '0', '0', '0', '1528358955935208688fb41940', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528358955');
INSERT INTO `dp_attachments` VALUES ('6', '1', '0', '0', '0', '1528359231cb4237ad39324f83', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528359231');
INSERT INTO `dp_attachments` VALUES ('7', '1', '0', '0', '0', '1528359763a47ca70dcdc63704', '2018/06', '9442fa52-7638-47d4-8bd3-b69a1621a911(2)', 'jpg', '1', '1528359763');
INSERT INTO `dp_attachments` VALUES ('8', '1', '0', '0', '0', '15283643469455a2d68478cca5', '2018/06', 'LOGO(28X28)', 'png', '1', '1528364346');

-- ----------------------------
-- Table structure for dp_backend_settings
-- ----------------------------
DROP TABLE IF EXISTS `dp_backend_settings`;
CREATE TABLE `dp_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif',
  `plugin_dev_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backend_http_auth_on` tinyint(1) DEFAULT '0',
  `backend_http_auth_user` varchar(40) DEFAULT NULL,
  `backend_http_auth_password` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_backend_settings
-- ----------------------------
INSERT INTO `dp_backend_settings` VALUES ('default', 'zh-cn', '1', '', '达项目', 'images/logo.gif', '0', '0', '', '');

-- ----------------------------
-- Table structure for dp_cate_fields
-- ----------------------------
DROP TABLE IF EXISTS `dp_cate_fields`;
CREATE TABLE `dp_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_cate_fields
-- ----------------------------
INSERT INTO `dp_cate_fields` VALUES ('1', 'n_id', '主键', '1', 'int', '11', '', '0', '0', 'required', '自增长字段', '0', '1', '1', '1');
INSERT INTO `dp_cate_fields` VALUES ('2', 'n_title', '新闻标题', '1', 'input', '0', '', '150', '20', 'required', '', '1', '1', '2', '1');
INSERT INTO `dp_cate_fields` VALUES ('3', 'n_content', '新闻内容', '1', 'wysiwyg', '0', '', '600', '300', 'required', '', '0', '1', '5', '1');
INSERT INTO `dp_cate_fields` VALUES ('4', 'n_create_at', '创建时间', '1', 'datetime', '0', '', '150', '20', '', '', '0', '1', '3', '0');
INSERT INTO `dp_cate_fields` VALUES ('5', 'n_del', '是否启用', '1', 'radio', '3', '0=启用|1=禁用', '30', '30', 'required', '0表示不删除, 1表示删除', '0', '1', '4', '1');

-- ----------------------------
-- Table structure for dp_cate_models
-- ----------------------------
DROP TABLE IF EXISTS `dp_cate_models`;
CREATE TABLE `dp_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  `auto_update` tinyint(1) DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_cate_models
-- ----------------------------
INSERT INTO `dp_cate_models` VALUES ('1', 'news', '新闻中心', '20', '3', '1', '0', '1', '{\"enabled\":[\"40x40\"],\"default\":\"original\"}');

-- ----------------------------
-- Table structure for dp_fieldtypes
-- ----------------------------
DROP TABLE IF EXISTS `dp_fieldtypes`;
CREATE TABLE `dp_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_fieldtypes
-- ----------------------------
INSERT INTO `dp_fieldtypes` VALUES ('int', '整形(INT)');
INSERT INTO `dp_fieldtypes` VALUES ('float', '浮点型(FLOAT)');
INSERT INTO `dp_fieldtypes` VALUES ('input', '单行文本框(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('textarea', '文本区域(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('select', '下拉菜单(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('select_from_model', '下拉菜单(模型数据)(INT)');
INSERT INTO `dp_fieldtypes` VALUES ('linked_menu', '联动下拉菜单(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('radio', '单选按钮(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('radio_from_model', '单选按钮(模型数据)(INT)');
INSERT INTO `dp_fieldtypes` VALUES ('checkbox', '复选框(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('checkbox_from_model', '复选框(模型数据)(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('wysiwyg', '编辑器(TEXT)');
INSERT INTO `dp_fieldtypes` VALUES ('wysiwyg_basic', '编辑器(简)(TEXT)');
INSERT INTO `dp_fieldtypes` VALUES ('datetime', '日期时间(VARCHAR)');
INSERT INTO `dp_fieldtypes` VALUES ('content', '内容模型调用(INT)');

-- ----------------------------
-- Table structure for dp_menus
-- ----------------------------
DROP TABLE IF EXISTS `dp_menus`;
CREATE TABLE `dp_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_menus
-- ----------------------------
INSERT INTO `dp_menus` VALUES ('1', 'system', 'home', '系统', '0', '0');
INSERT INTO `dp_menus` VALUES ('2', 'system', 'home', '后台首页', '1', '1');
INSERT INTO `dp_menus` VALUES ('3', 'system', 'home', '后台首页', '2', '2');
INSERT INTO `dp_menus` VALUES ('4', 'setting', 'site', '系统设置', '1', '1');
INSERT INTO `dp_menus` VALUES ('5', 'setting', 'site', '站点设置', '2', '4');
INSERT INTO `dp_menus` VALUES ('6', 'setting', 'backend', '后台设置', '2', '4');
INSERT INTO `dp_menus` VALUES ('7', 'system', 'password', '修改密码', '2', '4');
INSERT INTO `dp_menus` VALUES ('8', 'system', 'cache', '更新缓存', '2', '4');
INSERT INTO `dp_menus` VALUES ('9', 'model', 'view', '模型管理', '1', '1');
INSERT INTO `dp_menus` VALUES ('10', 'model', 'view', '内容模型管理', '2', '9');
INSERT INTO `dp_menus` VALUES ('11', 'category', 'view', '分类模型管理', '2', '9');
INSERT INTO `dp_menus` VALUES ('12', 'plugin', 'view', '扩展管理', '1', '1');
INSERT INTO `dp_menus` VALUES ('13', 'plugin', 'view', '插件管理', '2', '12');
INSERT INTO `dp_menus` VALUES ('14', 'role', 'view', '权限管理', '1', '1');
INSERT INTO `dp_menus` VALUES ('15', 'role', 'view', '用户组管理', '2', '14');
INSERT INTO `dp_menus` VALUES ('16', 'user', 'view', '用户管理', '2', '14');
INSERT INTO `dp_menus` VALUES ('17', 'content', 'view', '内容管理', '0', '0');
INSERT INTO `dp_menus` VALUES ('18', 'content', 'view', '内容管理', '1', '17');
INSERT INTO `dp_menus` VALUES ('19', 'category_content', 'view', '分类管理', '1', '17');
INSERT INTO `dp_menus` VALUES ('20', 'module', 'run', '插件', '0', '0');
INSERT INTO `dp_menus` VALUES ('21', 'database', 'index', '数据库管理', '1', '1');
INSERT INTO `dp_menus` VALUES ('22', 'database', 'index', '数据库备份', '2', '21');
INSERT INTO `dp_menus` VALUES ('23', 'database', 'recover', '数据库还原', '2', '21');
INSERT INTO `dp_menus` VALUES ('24', 'database', 'optimize', '数据库优化', '2', '21');

-- ----------------------------
-- Table structure for dp_model_fields
-- ----------------------------
DROP TABLE IF EXISTS `dp_model_fields`;
CREATE TABLE `dp_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_model_fields
-- ----------------------------
INSERT INTO `dp_model_fields` VALUES ('1', 'nc_id', '主键', '1', 'int', '11', '', '150', '20', 'required', '', '0', '1', '1', '1');
INSERT INTO `dp_model_fields` VALUES ('2', 'nc_content', '内容', '1', 'wysiwyg', '255', '', '600', '300', 'required', '', '1', '1', '2', '1');

-- ----------------------------
-- Table structure for dp_models
-- ----------------------------
DROP TABLE IF EXISTS `dp_models`;
CREATE TABLE `dp_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_models
-- ----------------------------
INSERT INTO `dp_models` VALUES ('1', 'news_content', '新闻内容列表', '20', '1', '0', '{\"enabled\":[\"40x40\"],\"default\":\"original\"}');

-- ----------------------------
-- Table structure for dp_plugins
-- ----------------------------
DROP TABLE IF EXISTS `dp_plugins`;
CREATE TABLE `dp_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for dp_rights
-- ----------------------------
DROP TABLE IF EXISTS `dp_rights`;
CREATE TABLE `dp_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_rights
-- ----------------------------
INSERT INTO `dp_rights` VALUES ('1', '密码修改', 'system', 'password', null);
INSERT INTO `dp_rights` VALUES ('2', '更新缓存', 'system', 'cache', null);
INSERT INTO `dp_rights` VALUES ('3', ' 站点设置', 'setting', 'site', null);
INSERT INTO `dp_rights` VALUES ('4', '后台设置', 'setting', 'backend', null);
INSERT INTO `dp_rights` VALUES ('5', '插件管理[列表]', 'plugin', 'view', null);
INSERT INTO `dp_rights` VALUES ('6', '添加插件', 'plugin', 'add', null);
INSERT INTO `dp_rights` VALUES ('7', '修改插件', 'plugin', 'edit', null);
INSERT INTO `dp_rights` VALUES ('8', '卸载插件', 'plugin', 'del', null);
INSERT INTO `dp_rights` VALUES ('9', '导出插件', 'plugin', 'export', null);
INSERT INTO `dp_rights` VALUES ('10', '导入插件', 'plugin', 'import', null);
INSERT INTO `dp_rights` VALUES ('11', '激活插件', 'plugin', 'active', null);
INSERT INTO `dp_rights` VALUES ('12', '禁用插件', 'plugin', 'deactive', null);
INSERT INTO `dp_rights` VALUES ('13', '运行插件', 'module', 'run', null);
INSERT INTO `dp_rights` VALUES ('14', '内容模型管理[列表]', 'model', 'view', null);
INSERT INTO `dp_rights` VALUES ('15', '添加内容模型', 'model', 'add', null);
INSERT INTO `dp_rights` VALUES ('16', '修改内容模型', 'model', 'edit', null);
INSERT INTO `dp_rights` VALUES ('17', '删除内容模型', 'model', 'del', null);
INSERT INTO `dp_rights` VALUES ('18', '内容模型字段管理[列表]', 'model', 'fields', null);
INSERT INTO `dp_rights` VALUES ('19', '添加内容模型字段', 'model', 'add_filed', null);
INSERT INTO `dp_rights` VALUES ('20', '修改内容模型字段', 'model', 'edit_field', null);
INSERT INTO `dp_rights` VALUES ('21', '删除内容模型字段', 'model', 'del_field', null);
INSERT INTO `dp_rights` VALUES ('22', '分类模型管理[列表]', 'category', 'view', null);
INSERT INTO `dp_rights` VALUES ('23', '添加分类模型', 'category', 'add', null);
INSERT INTO `dp_rights` VALUES ('24', '修改分类模型', 'category', 'edit', null);
INSERT INTO `dp_rights` VALUES ('25', '删除分类模型', 'category', 'del', null);
INSERT INTO `dp_rights` VALUES ('26', '分类模型字段管理[列表]', 'category', 'fields', null);
INSERT INTO `dp_rights` VALUES ('27', '添加分类模型字段', 'category', 'add_filed', null);
INSERT INTO `dp_rights` VALUES ('28', '修改分类模型字段', 'category', 'edit_field', null);
INSERT INTO `dp_rights` VALUES ('29', '删除分类模型字段', 'category', 'del_field', null);
INSERT INTO `dp_rights` VALUES ('30', '内容管理[列表]', 'content', 'view', null);
INSERT INTO `dp_rights` VALUES ('31', '添加内容[表单]', 'content', 'form', 'add');
INSERT INTO `dp_rights` VALUES ('32', '修改内容[表单]', 'content', 'form', 'edit');
INSERT INTO `dp_rights` VALUES ('33', '添加内容[动作]', 'content', 'save', 'add');
INSERT INTO `dp_rights` VALUES ('34', '修改内容[动作]', 'content', 'save', 'edit');
INSERT INTO `dp_rights` VALUES ('35', '删除内容', 'content', 'del', null);
INSERT INTO `dp_rights` VALUES ('36', '分类管理[列表]', 'category_content', 'view', null);
INSERT INTO `dp_rights` VALUES ('37', '添加分类[表单]', 'category_content', 'form', 'add');
INSERT INTO `dp_rights` VALUES ('38', '修改分类[表单]', 'category_content', 'form', 'edit');
INSERT INTO `dp_rights` VALUES ('39', '添加分类[动作]', 'category_content', 'save', 'add');
INSERT INTO `dp_rights` VALUES ('40', '修改分类[动作]', 'category_content', 'save', 'edit');
INSERT INTO `dp_rights` VALUES ('41', '删除分类', 'category_content', 'del', null);
INSERT INTO `dp_rights` VALUES ('42', '用户组管理[列表]', 'role', 'view', null);
INSERT INTO `dp_rights` VALUES ('43', '添加用户组', 'role', 'add', null);
INSERT INTO `dp_rights` VALUES ('44', '修改用户组', 'role', 'edit', null);
INSERT INTO `dp_rights` VALUES ('45', '删除用户组', 'role', 'del', null);
INSERT INTO `dp_rights` VALUES ('46', '用户管理[列表]', 'user', 'view', null);
INSERT INTO `dp_rights` VALUES ('47', '添加用户', 'user', 'add', null);
INSERT INTO `dp_rights` VALUES ('48', '修改用户', 'user', 'edit', null);
INSERT INTO `dp_rights` VALUES ('49', '删除用户', 'user', 'del', null);
INSERT INTO `dp_rights` VALUES ('50', '数据库备份', 'database', 'index', null);
INSERT INTO `dp_rights` VALUES ('51', '数据库还原', 'database', 'recover', null);
INSERT INTO `dp_rights` VALUES ('52', '数据库优化', 'database', 'optimize', null);

-- ----------------------------
-- Table structure for dp_roles
-- ----------------------------
DROP TABLE IF EXISTS `dp_roles`;
CREATE TABLE `dp_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_roles
-- ----------------------------
INSERT INTO `dp_roles` VALUES ('1', 'root', '', '', '', '');
INSERT INTO `dp_roles` VALUES ('2', '运营小组', '1,23,28,33,38', '0', '0', '0');

-- ----------------------------
-- Table structure for dp_sessions
-- ----------------------------
DROP TABLE IF EXISTS `dp_sessions`;
CREATE TABLE `dp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_sessions
-- ----------------------------
INSERT INTO `dp_sessions` VALUES ('34f24b75878483991bbefd4297927695', '10.0.2.2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '1528364305', 'a:4:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";s:10:\"model_type\";s:5:\"model\";s:5:\"model\";s:12:\"news_content\";}');

-- ----------------------------
-- Table structure for dp_site_settings
-- ----------------------------
DROP TABLE IF EXISTS `dp_site_settings`;
CREATE TABLE `dp_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_url` varchar(50) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL,
  `thumbs_preferences` varchar(500) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_site_settings
-- ----------------------------
INSERT INTO `dp_site_settings` VALUES ('daproject', 'http://admin.daproject.com', 'images/logo.gif', '', '一经注册, 不能后悔<br />', '', '', '1', '达叔维护升级中.....', '达项目', '达项目', 'default', 'http://attach.daproject.com', 'attachments', '*.jpg;*.gif;*.png;*.doc,*.pdf,*.doc,*.docx,*.xls,*', '10097152', '[{\"size\":\"60\",\"rule\":\"fitWidth\"},{\"size\":\"20x20\",\"rule\":\"crop\"},{\"size\":\"40x40\",\"rule\":\"fit\"},{\"size\":\"80x80\",\"rule\":\"fill\"}]');

-- ----------------------------
-- Table structure for dp_throttles
-- ----------------------------
DROP TABLE IF EXISTS `dp_throttles`;
CREATE TABLE `dp_throttles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_throttles
-- ----------------------------

-- ----------------------------
-- Table structure for dp_u_c_news
-- ----------------------------
DROP TABLE IF EXISTS `dp_u_c_news`;
CREATE TABLE `dp_u_c_news` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `n_id` int(11) NOT NULL DEFAULT '0',
  `n_title` varchar(100) NOT NULL DEFAULT '',
  `n_content` text NOT NULL,
  `n_create_at` varchar(100) NOT NULL DEFAULT '',
  `n_del` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_u_c_news
-- ----------------------------
INSERT INTO `dp_u_c_news` VALUES ('1', '0', '1', '{0}', '1', '快讯', '路边社', '', '0');

-- ----------------------------
-- Table structure for dp_u_m_news_content
-- ----------------------------
DROP TABLE IF EXISTS `dp_u_m_news_content`;
CREATE TABLE `dp_u_m_news_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `nc_id` int(11) NOT NULL DEFAULT '0',
  `nc_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_u_m_news_content
-- ----------------------------
INSERT INTO `dp_u_m_news_content` VALUES ('3', '1528278429', '1528278429', '1', '1', '1', '大大');
INSERT INTO `dp_u_m_news_content` VALUES ('4', '1528278764', '1528278764', '1', '1', '2', '大大');

-- ----------------------------
-- Table structure for dp_validations
-- ----------------------------
DROP TABLE IF EXISTS `dp_validations`;
CREATE TABLE `dp_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_validations
-- ----------------------------
INSERT INTO `dp_validations` VALUES ('required', '必填');
INSERT INTO `dp_validations` VALUES ('valid_email', 'E-mail格式');
