/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : base

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-10-16 10:37:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'id',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '怡和祥云', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '广州分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '深圳分公司', '2', '0');
INSERT INTO `sys_dept` VALUES ('4', '2', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售部', '1', '0');
INSERT INTO `sys_dept` VALUES ('dept00001bebbe803ce5445a944323819fe26372', '1', '北京总公司', '3', '0');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'id',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', '', 'sys:user:list,sys:user:info', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', '', 'sys:dept:list,sys:dept:info', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('menu0000ebf52cf7083f46dab1c9d8519cf198b2', '0', 'test', '', '', '0', 'fa fa-bandcamp', '0');
INSERT INTO `sys_menu` VALUES ('menu0000f0e6c1ce210d4ffbb906e3f1b3d3f7eb', 'menu0000ebf52cf7083f46dab1c9d8519cf198b2', 'test2', '/', null, '1', 'fa fa-bell', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'id',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` varchar(40) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('role00003a57b761efed4dbbadba6cdc131ebe1c', '3123', '13', '1', '2017-09-11 17:36:19');
INSERT INTO `sys_role` VALUES ('role0000a0486eaab99e45e3a33735a0adddd65e', 'qq', null, '1', '2017-09-11 16:59:07');
INSERT INTO `sys_role` VALUES ('role0000de4a1c18511446e7b0ff736967d7ee4d', '超级管理员', '', '1', '2017-09-11 16:43:50');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` varchar(60) NOT NULL DEFAULT '' COMMENT 'id',
  `role_id` varchar(60) DEFAULT NULL COMMENT '角色ID',
  `dept_id` varchar(60) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('roleDept0000120cf9a3a2bd4341969383f01b722264', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '1');
INSERT INTO `sys_role_dept` VALUES ('roleDept00004e97d8b6f7134177b68973f42b171dd4', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '2');
INSERT INTO `sys_role_dept` VALUES ('roleDept00006ebe927438334491b6fda6bde1aa72b2', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '5');
INSERT INTO `sys_role_dept` VALUES ('roleDept00008d51547302b0458db8e26e94e4ca5369', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '2');
INSERT INTO `sys_role_dept` VALUES ('roleDept0000a1be182b5cca4d0b8cf5cc2f9c69f93e', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '3');
INSERT INTO `sys_role_dept` VALUES ('roleDept0000cdb38b962af147eeac8fac08c70c6eec', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '4');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(60) NOT NULL DEFAULT '' COMMENT 'id',
  `role_id` varchar(60) DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(60) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('roleMenu000000ef20d69118420b9e93fd8d19a0210e', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '1');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000035e9a4ddd0642e783ae2eb23c22e00f', 'role0000a0486eaab99e45e3a33735a0adddd65e', '4');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00000ae60471bc6047d2b6e9a7479ff9f93f', 'role0000a0486eaab99e45e3a33735a0adddd65e', '16');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00000eeb979782b54dcb8ed11bab2883b839', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '34');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000171eae41a4244ea6ac38e9b8d0fbcbce', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '33');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00001d85442e6d584146824f7a9eec840d33', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '20');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00001d9c062c568c4625b931749d041c7b64', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '26');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000022f0d6260265411c8dd02c520ab91185', 'role0000a0486eaab99e45e3a33735a0adddd65e', '31');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00002462035e5b35457ea74130f7c09e84ba', 'role0000a0486eaab99e45e3a33735a0adddd65e', '19');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00002ee8c81159054a2ca61ce4879d6a69dd', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '21');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000031e2f46b17c74dbba308a9f68644c00a', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '2');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000033547b58370f42c69b5c463871255f77', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '4');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000376e4907a4bc420bbd51e7f3417ef048', 'role0000a0486eaab99e45e3a33735a0adddd65e', '2');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000588c23b451f846d5bf2396eb5cf311af', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '25');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000059a3364f98b34cf39b81b35e237744e3', 'role0000a0486eaab99e45e3a33735a0adddd65e', '22');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000710274dc2ff54f3da4ec9e76bbb12d16', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '19');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000073eaf3b0dbdd4cc3a1761f7963d8ac75', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '31');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000078d3411f516744b293129679b35d21b2', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '1');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00007a02c0133e184f28acd41aef269f6e2e', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '35');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000080cb87b293a44595a6a56ad98040cc75', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '16');
INSERT INTO `sys_role_menu` VALUES ('roleMenu000088532753d8c2469887db371df376e485', 'role0000a0486eaab99e45e3a33735a0adddd65e', '35');
INSERT INTO `sys_role_menu` VALUES ('roleMenu00008d75c852618f4cea8c3af483bb6a642c', 'role0000a0486eaab99e45e3a33735a0adddd65e', '26');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000a0dac93db60a4019a06402c471fa892c', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '22');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000a2ccdced4f2b497dace55010ae2a909e', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '32');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000a8e71a6065c343e9905d08568330c12a', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '24');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000addaccf311cb43258c1442f819ce51f6', 'role0000a0486eaab99e45e3a33735a0adddd65e', '1');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000b4ba8669d835448ca0f186ad2d819422', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '23');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000b4d0f5d9ad36489ebf9350e2d073eb98', 'role0000a0486eaab99e45e3a33735a0adddd65e', '15');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000c146316b44fa4b28a6b0b04fb9365529', 'role0000a0486eaab99e45e3a33735a0adddd65e', '32');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000c8696049c2944b8b949b7b5e1e035e82', 'role0000a0486eaab99e45e3a33735a0adddd65e', '3');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000d30488d1eedc430fb9e248d24e30a8f4', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '15');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000d3e8940df656459ca11d27ec6a91d5d4', 'role0000de4a1c18511446e7b0ff736967d7ee4d', '3');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000d906e8eea9084da18641fe3062b25769', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '18');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000e5446d36d0ba4953b455b0110370cc2e', 'role0000a0486eaab99e45e3a33735a0adddd65e', '23');
INSERT INTO `sys_role_menu` VALUES ('roleMenu0000ef0fdff521234eca9eec4c01daf1758a', 'role00003a57b761efed4dbbadba6cdc131ebe1c', '17');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` varchar(40) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('super-admin-id', 'admin', '3640fb46021b7177fc377e1dc9f83b36d08343bb462f9506dd8f0b7c1ef1f21d', 'YzcmCZNvbXocrsz9dm8e', '1016167828@qq.com', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('user000014667a9b2a004cf3865588f5f898462f', '32', '703bff527f23a16fafb736f086a7133fb063b718cdd939d79fe3cb20b37ba8ef', 'dIGIlJKQTBX4LCs8QEbW', '23', '23', '1', '1', '2017-09-20 15:58:14');
INSERT INTO `sys_user` VALUES ('user000023a4327fd0194195a41461ff1410f2c5', '3', '15da7bcf780208a6a506cd7384e52b1e09b2971f3027379bcf9d7b668c800de2', 'wTUmr3s3uoSdGsJnfLFF', '3', '3', '1', '1', '2017-09-20 10:32:12');
INSERT INTO `sys_user` VALUES ('user00002c2fa347cc9d49e08aa98ef4ea3c9c23', '66', '0408b60bf9b6ecac02bd32bc42106168a408dbe5a3a8e3d453b2fe6220b9fb9e', '2p3t3R12q5jzimZawc0O', '3', '3', '1', '1', '2017-09-20 10:35:39');
INSERT INTO `sys_user` VALUES ('user00003d4e651ab7a64f98854e6b186e53cc22', '23', 'cd88fb5a584610f9db2ecc02d0726d3d5f4b78ce0b963c9d5a5bfcf9738856c5', 'seExJIbPNya2CUQgDnxU', '23', '23', '1', '1', '2017-09-20 15:57:52');
INSERT INTO `sys_user` VALUES ('user00009671fe33b48c40a5b5371756ab9048d4', '234', 'cf7039f16da7387718d1d37face6d095ca2dea25ddfe89c863463cfeff82c47a', 'cBFvgPjHmUQF5neHDXL8', '23', '23', '1', '1', '2017-09-20 16:05:17');
INSERT INTO `sys_user` VALUES ('user0000cea5cf2d454142489a388533a36454fa', '232', '306eb567990dabd357d648398eacb6511af6584ee26065bb414168efe1592ad4', '6y9WC412oLfe2fs95iA8', '3', '1', '1', '1', '2017-09-20 10:44:57');
INSERT INTO `sys_user` VALUES ('user0000d9cce9b49a354ac5bdbc3652e1b39cbd', 'aaa', '1a0906a64fded7b6f79230261fda1fde9b32fda862a39d8e642f971a4754f80c', 'E5jqES49XiUZuVF2Dcgo', '1', '1', '1', '1', '2017-09-13 17:19:33');
INSERT INTO `sys_user` VALUES ('user0000dded094f2f1a415fa36426b9279891e4', 'test', '763dc929aede1ce0a03b4cb3752e7935614f22a6c704d135ab7d67834a05d296', 'mNsivPV8S0REcCRfx6IX', 'test', 'test', '1', '2', '2017-09-11 18:08:50');
INSERT INTO `sys_user` VALUES ('user0000dfd03b648d6c4f1a8395c9215f50c184', '3434', '830ae2cfe7172cce01d586deb996fbe0fd75b144310a0eea04aeaa9a69eb4550', 'L6xIVzHVyoT25JrW2nC1', '4', '4', '1', '1', '2017-09-20 10:35:59');
INSERT INTO `sys_user` VALUES ('user0000ed82537d76d64f2cad9e7306b68d9ff8', '5', 'ca03a35100a2fa0137b2b0371f79e3323a24c11d3dc993b445c11bd4e3873825', 'QHEaXRq4131JOS6vGPP7', '33', '3', '1', '1', '2017-09-20 10:32:53');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(60) NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('userRole000000e85ee142f74c748e33a4310be79fe6', 'user00004d6f47bc42714ec6a32d180561b9daf8', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000052291cf9c704f1b99921df8b1ae9c89', 'user00007d72b387082140a5916bca5c82d37e51', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole00000dc0e5ea059f46a19bec47f0025029f2', 'user00001de0c3dfaa124c41b91c975a69357204', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole000011483d9080fa4d87ab553565638f1fb9', 'user000009d9574fe7ce4e9ba4e4f99e78969299', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000464c6dc02a2e49bca0d0a3310cc342ef', 'user00009b070cd45c57424c9211212c326c298f', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole0000487a3a9735ea4b73b62f02ee5a1cf30f', 'user0000dded094f2f1a415fa36426b9279891e4', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole00004977c2c66a16496db919df6dbce88f83', 'user0000cea5cf2d454142489a388533a36454fa', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole0000706079c85f554091be55732e6814ad46', 'user0000dfd03b648d6c4f1a8395c9215f50c184', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole000089307d8151644e0ebf8cfde9588876dc', 'user000014667a9b2a004cf3865588f5f898462f', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole00008e9d057636ae42a087217202dc1c8d83', 'super-admin-id', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole000096b6e346700e43a3bf1a3b9070e33b93', 'user0000ed82537d76d64f2cad9e7306b68d9ff8', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000a4b0efbbc6334f3aa0e61bb7467b9ec7', 'user0000d9cce9b49a354ac5bdbc3652e1b39cbd', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole0000b4c82ee4b4514195a15dacf5d8835fc6', 'user000023a4327fd0194195a41461ff1410f2c5', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000b90e6176e1d74657855845de91814ad6', 'user00009671fe33b48c40a5b5371756ab9048d4', 'role0000a0486eaab99e45e3a33735a0adddd65e');
INSERT INTO `sys_user_role` VALUES ('userRole0000c604c1e6e9ca4913b5e3674d165c8211', 'user00007ee115e2e1e0471089ee1b4ec913f527', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000ccc9d4641b334c08a7423ae95fd820dc', 'user00002c2fa347cc9d49e08aa98ef4ea3c9c23', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000f48a150d461b4ba3af0d8b47822e5e30', 'user00009f022a19466545698efcb0ad05dc11c0', 'role0000de4a1c18511446e7b0ff736967d7ee4d');
INSERT INTO `sys_user_role` VALUES ('userRole0000f8c406faf4424163b84f8a5016829e08', 'user00003d4e651ab7a64f98854e6b186e53cc22', 'role0000a0486eaab99e45e3a33735a0adddd65e');
