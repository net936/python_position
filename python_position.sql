/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : python_position

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 23/11/2025 11:12:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 招聘岗位', 7, 'add_job');
INSERT INTO `auth_permission` VALUES (26, 'Can change 招聘岗位', 7, 'change_job');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 招聘岗位', 7, 'delete_job');
INSERT INTO `auth_permission` VALUES (28, 'Can view 招聘岗位', 7, 'view_job');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$260000$AwbPDxOHicJrFSPUmpWOuR$eGThmtjteZeVQIhzLVN1QRS5UzWIz2jbw0qdrgHw19M=', '2025-11-21 22:43:29.185218', 1, 'admin111', '', '', '', 1, 1, '2025-11-21 22:43:14.680729');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2025-11-21 22:43:46.877219', '1', '谷歌公司 - 测试工程师', 2, '[{\"changed\": {\"fields\": [\"\\u5ba1\\u6838\\u72b6\\u6001\"]}}]', 7, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app', 'job');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-11-21 22:35:14.290826');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-11-21 22:35:14.958630');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-11-21 22:35:15.119211');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-11-21 22:35:15.125199');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-21 22:35:15.131198');
INSERT INTO `django_migrations` VALUES (6, 'app', '0001_initial', '2025-11-21 22:35:15.279999');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2025-11-21 22:35:15.359672');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2025-11-21 22:35:15.407023');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2025-11-21 22:35:15.422158');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2025-11-21 22:35:15.429158');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2025-11-21 22:35:15.473019');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2025-11-21 22:35:15.477816');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2025-11-21 22:35:15.485813');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2025-11-21 22:35:15.546349');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2025-11-21 22:35:15.589491');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2025-11-21 22:35:15.604989');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2025-11-21 22:35:15.614540');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2025-11-21 22:35:15.658144');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2025-11-21 22:35:15.731178');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('9cjygdq5rt0tw6peizinl1nxuqscm0oc', 'eyJ0dXJuc3RpbGVfdmVyaWZpZWQiOnRydWV9:1vMzbQ:m7cM28PyaQkdIz6CXgjFWh6A0XUBzL7YJGoGTunxdDw', '2025-12-07 10:13:24.627969');
INSERT INTO `django_session` VALUES ('ws6jj3x3mdekbqt4okcnecvjvks3r80a', '.eJxVjEEOwiAQAP_C2RAqyAaP3n0DWXZZqRpISntq_Lsh6UGvM5PZVcRtLXHreYkzq6ua1OmXJaRXrkPwE-ujaWp1XeakR6IP2_W9cX7fjvZvULCXsbXCIMbiWUIS76wn8HBhBJpCSsECOIdBkITQiKHggDJyYG-BBNTnC_fwONg:1vMSMD:F8eaQgZuJB8ME-EZdbulwjriXs5L0nsF4XOtnF87wlo', '2025-12-05 22:43:29.192212');

-- ----------------------------
-- Table structure for job_position
-- ----------------------------
DROP TABLE IF EXISTS `job_position`;
CREATE TABLE `job_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_type` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL,
  `salary_max` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `education` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `pv` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `expire` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_position
-- ----------------------------
INSERT INTO `job_position` VALUES (1, '测试工程师', '谷歌公司', 1, 12, 15, 2, 4, '测试要求。。哈哈哈123哈哈哈', '上海市', '刘老师', '88889999', NULL, 1, 5, '2025-11-21 22:42:03.898467', 15);
INSERT INTO `job_position` VALUES (2, 'Android开发工程师', 'ByteDance', 1, 11, 22, 2, 3, '计算机相关专业本科及以上学历，2年以上软件开发经验。\r\n熟练掌握至少一种主流开发语言，如Java、C#、Python、Go等，并能独立承担模块开发任务。\r\n具备良好的数据结构与算法基础，能够解决实际问题并优化代码性能。\r\n熟悉主流的开发框架与工具，如Spring、.NET、Django等，了解常见的软件架构模式。\r\n掌握常用数据库（如MySQL、PostgreSQL、MongoDB等）开发与优化技能。\r\n具有良好的代码习惯、注重代码质量，具备规范的文档编写能力。\r\n具备良好的沟通能力和团队协作精神，能在项目中积极交流与推动需求落地。\r\n有Web开发、移动端开发、云计算相关经验者优先。\r\n学习能力强，热爱技术，能够持续关注行业发展与新技术动态。', '北京', '刘老师', '22222222', NULL, 0, 0, '2025-11-22 14:52:18.231030', 15);
INSERT INTO `job_position` VALUES (3, 'Python后端工程师', '阿里巴巴', 0, 20, 40, 2, 4, '岗位职责：\n1. 负责公司核心业务系统的后端开发和维护\n2. 参与系统架构设计，保证系统的高可用性和稳定性\n3. 优化系统性能，提升用户体验\n\n任职要求：\n1. 精通Python，熟悉Django或Flask框架\n2. 熟悉MySQL、Redis等数据库\n3. 有大型互联网项目经验者优先', '杭州市西湖区', '张经理', '13800138001', 'hr@alibaba.com', 1, 156, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (4, 'Java高级开发工程师', '腾讯科技', 0, 25, 45, 3, 4, '岗位职责：\n1. 负责微信生态相关业务的开发工作\n2. 参与系统架构设计和技术选型\n3. 解决复杂技术问题，提升系统性能\n\n任职要求：\n1. 5年以上Java开发经验\n2. 精通Spring Boot、Spring Cloud等框架\n3. 熟悉分布式系统设计', '深圳市南山区', '李女士', '13800138002', 'recruit@tencent.com', 1, 235, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (5, '前端开发工程师', '字节跳动', 0, 18, 35, 2, 4, '岗位职责：\n1. 负责抖音Web端的前端开发工作\n2. 与产品、设计团队协作，实现优秀的用户体验\n3. 持续优化前端性能\n\n任职要求：\n1. 精通Vue.js或React框架\n2. 熟悉ES6+、TypeScript\n3. 有移动端H5开发经验', '北京市海淀区', '王先生', '13800138003', 'jobs@bytedance.com', 1, 190, '2025-11-22 14:55:43.000000', 15);
INSERT INTO `job_position` VALUES (6, '产品经理', '美团', 0, 22, 38, 2, 4, '岗位职责：\n1. 负责美团外卖业务的产品规划和设计\n2. 收集用户需求，制定产品方案\n3. 跟进产品开发，确保产品质量\n\n任职要求：\n1. 3年以上产品经验\n2. 有O2O或电商行业经验优先\n3. 优秀的沟通和协调能力', '北京市朝阳区', '陈经理', '13800138004', 'pm@meituan.com', 1, 167, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (7, 'UI设计师', '网易', 0, 15, 28, 1, 3, '岗位职责：\n1. 负责游戏产品的UI设计工作\n2. 制定视觉规范，保证设计一致性\n3. 与开发团队协作，确保设计落地\n\n任职要求：\n1. 熟练使用Sketch、Figma等设计工具\n2. 有游戏UI设计经验者优先\n3. 良好的审美和创新能力', '杭州市滨江区', '刘设计', '13800138005', 'design@163.com', 1, 142, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (8, '数据分析师', '京东', 0, 16, 30, 2, 4, '岗位职责：\n1. 负责电商数据的采集、分析和挖掘\n2. 建立数据分析模型，支持业务决策\n3. 制作数据报表和可视化分析\n\n任职要求：\n1. 熟练使用SQL、Python等工具\n2. 熟悉数据分析方法和统计学知识\n3. 有电商行业经验者优先', '北京市大兴区', '周分析', '13800138006', 'data@jd.com', 1, 98, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (9, '测试工程师', '百度', 0, 14, 25, 1, 4, '岗位职责：\n1. 负责搜索业务的功能测试和自动化测试\n2. 编写测试用例，执行测试计划\n3. 跟踪和管理bug，保证产品质量\n\n任职要求：\n1. 熟悉测试理论和方法\n2. 掌握至少一门编程语言\n3. 有自动化测试经验者优先', '北京市海淀区', '吴测试', '13800138007', 'qa@baidu.com', 1, 87, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (10, '运维工程师', '小米科技', 0, 18, 32, 2, 4, '岗位职责：\n1. 负责公司服务器和网络的运维工作\n2. 监控系统运行状态，及时处理故障\n3. 优化系统架构，提升稳定性\n\n任职要求：\n1. 熟悉Linux系统管理\n2. 掌握Shell、Python等脚本语言\n3. 熟悉Docker、K8s等容器技术', '北京市海淀区', '赵运维', '13800138008', 'ops@mi.com', 1, 76, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (11, 'iOS开发工程师', '滴滴出行', 0, 20, 35, 2, 4, '岗位职责：\n1. 负责滴滴App iOS端的开发工作\n2. 优化App性能，提升用户体验\n3. 解决技术难题，保证代码质量\n\n任职要求：\n1. 精通Swift或Objective-C\n2. 熟悉iOS开发框架和工具\n3. 有大型App开发经验者优先', '北京市朝阳区', '孙iOS', '13800138009', 'ios@didichuxing.com', 1, 134, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (12, 'Android开发工程师', '拼多多', 0, 19, 33, 2, 4, '岗位职责：\n1. 负责拼多多App Android端开发\n2. 参与技术方案设计和优化\n3. 持续改进产品性能和用户体验\n\n任职要求：\n1. 精通Java或Kotlin\n2. 熟悉Android开发框架\n3. 有电商App开发经验优先', '上海市长宁区', '郑安卓', '13800138010', 'android@pdd.com', 1, 145, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (13, '算法工程师', '商汤科技', 0, 28, 50, 3, 5, '岗位职责：\n1. 负责计算机视觉算法的研发工作\n2. 优化现有算法模型，提升性能\n3. 跟踪前沿技术，推动技术创新\n\n任职要求：\n1. 计算机、数学等相关专业硕士以上学历\n2. 精通深度学习框架（TensorFlow、PyTorch）\n3. 有CV或NLP相关经验', '北京市海淀区', '钱算法', '13800138011', 'ai@sensetime.com', 1, 201, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (14, '全栈开发工程师', '哔哩哔哩', 0, 22, 38, 2, 4, '岗位职责：\n1. 负责B站Web和移动端的全栈开发\n2. 参与产品功能设计和实现\n3. 优化系统架构和性能\n\n任职要求：\n1. 熟悉前端框架（Vue/React）和后端技术（Node.js/Python）\n2. 熟悉数据库设计和优化\n3. 有视频网站开发经验优先', '上海市杨浦区', '黄全栈', '13800138012', 'dev@bilibili.com', 1, 167, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (15, '实习生 - Java开发', '华为技术', 2, 5, 8, 0, 4, '岗位职责：\n1. 参与公司项目的开发工作\n2. 学习企业级开发流程和规范\n3. 协助完成开发任务\n\n任职要求：\n1. 计算机相关专业在读本科或研究生\n2. 熟悉Java基础知识\n3. 能实习3个月以上', '深圳市龙岗区', '冯HR', '13800138013', 'campus@huawei.com', 1, 298, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (16, '兼职UI设计师', '创业公司', 1, 0, 0, 1, 3, '岗位职责：\n1. 负责App界面设计\n2. 制作设计规范文档\n3. 配合开发完成设计落地\n\n任职要求：\n1. 有UI设计经验\n2. 熟练使用设计工具\n3. 工作时间灵活，按项目结算', '远程办公', '创始人', '13800138014', 'startup@example.com', 1, 56, '2025-11-22 14:55:43.000000', 7);
INSERT INTO `job_position` VALUES (17, 'DevOps工程师', '蚂蚁金服', 0, 24, 42, 3, 4, '岗位职责：\n1. 负责CI/CD流程的建设和优化\n2. 管理云基础设施\n3. 自动化运维工具开发\n\n任职要求：\n1. 熟悉Jenkins、GitLab CI等CI/CD工具\n2. 熟悉AWS、阿里云等云平台\n3. 精通Linux和容器技术', '杭州市西湖区', '褚DevOps', '13800138015', 'devops@antfin.com', 1, 112, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (18, '游戏策划', 'miHoYo米哈游', 0, 18, 32, 2, 4, '岗位职责：\n1. 负责游戏玩法设计和数值策划\n2. 撰写策划案，推动功能实现\n3. 分析游戏数据，优化游戏体验\n\n任职要求：\n1. 热爱游戏，有游戏策划经验\n2. 优秀的逻辑思维和文档能力\n3. 有二次元游戏经验者优先', '上海市徐汇区', '卫策划', '13800138016', 'game@mihoyo.com', 1, 223, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (19, '人工智能研究员', '旷视科技', 0, 30, 60, 4, 6, '岗位职责：\n1. 从事计算机视觉前沿技术研究\n2. 发表高水平学术论文\n3. 将研究成果应用到产品中\n\n任职要求：\n1. 计算机、AI相关专业博士学历\n2. 在顶级会议发表过论文\n3. 深厚的数学和算法功底', '北京市海淀区', '蒋研究', '13800138017', 'research@megvii.com', 1, 178, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (20, '外包项目经理', '软通动力', 3, 0, 0, 3, 4, '岗位职责：\n1. 负责外包项目的管理和交付\n2. 协调资源，控制项目进度\n3. 维护客户关系\n\n任职要求：\n1. 5年以上项目管理经验\n2. 熟悉软件开发流程\n3. 优秀的沟通和协调能力\n\n备注：按项目结算，具体薪资面议', '北京市朝阳区', '韩PM', '13800138018', 'outsource@isoftstone.com', 1, 67, '2025-11-22 14:55:43.000000', 15);
INSERT INTO `job_position` VALUES (21, 'Node.js开发工程师', '去哪儿网', 0, 17, 30, 2, 4, '岗位职责：\n1. 负责后端服务的开发和维护\n2. 优化服务性能，提升响应速度\n3. 参与技术方案设计\n\n任职要求：\n1. 精通Node.js，熟悉Express或Koa框架\n2. 熟悉MongoDB、MySQL等数据库\n3. 有大并发系统开发经验', '北京市海淀区', '邹Node', '13800138019', 'nodejs@qunar.com', 1, 93, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (22, '区块链开发工程师', '火币科技', 0, 26, 48, 3, 4, '岗位职责：\n1. 负责区块链底层技术研发\n2. 开发智能合约和DApp\n3. 优化区块链性能和安全性\n\n任职要求：\n1. 精通Go、Rust或C++\n2. 熟悉以太坊、比特币等区块链原理\n3. 有智能合约开发经验', '北京市朝阳区', '尤区块', '13800138020', 'blockchain@huobi.com', 1, 145, '2025-11-22 14:55:43.000000', 30);
INSERT INTO `job_position` VALUES (23, 'Senior Software Engineer', 'Google', 0, 40, 80, 4, 5, '岗位职责：\n1. Design and develop next-generation search technologies\n2. Work on large-scale distributed systems\n3. Collaborate with teams across the globe\n\n任职要求：\n1. 5+ years of software development experience\n2. Proficient in C++, Java, or Python\n3. Experience with distributed systems\n4. 英语流利，可作为工作语言', '美国加州山景城 / 远程', 'Sarah Chen', '+1-650-2530000', 'recruit@google.com', 1, 433, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (24, 'Remote Full Stack Developer', 'Microsoft', 0, 35, 65, 3, 4, '岗位职责：\n1. Develop cloud-based applications on Azure platform\n2. Build responsive web applications\n3. Participate in agile development process\n\n任职要求：\n1. Strong experience with .NET and React\n2. Familiar with Azure or AWS\n3. Excellent communication skills\n4. 支持全球远程办公', '远程办公（全球）', 'David Lee', '+1-425-8828080', 'careers@microsoft.com', 1, 388, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (25, 'Machine Learning Engineer', 'Meta (Facebook)', 0, 45, 85, 4, 5, '岗位职责：\n1. Build ML models for content recommendation\n2. Optimize algorithms for billions of users\n3. Research cutting-edge ML techniques\n\n任职要求：\n1. PhD or Master in CS/ML\n2. Strong background in deep learning\n3. Experience with PyTorch or TensorFlow\n4. 可选远程或硅谷办公', '美国加州门罗帕克 / 远程', 'Emily Wang', '+1-650-5434800', 'ml-jobs@meta.com', 1, 522, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (26, 'Frontend Engineer (Remote)', 'Shopify', 0, 30, 55, 2, 4, '岗位职责：\n1. 开发电商平台前端功能\n2. 优化用户购物体验\n3. 与全球团队协作\n\n任职要求：\n1. 精通React和TypeScript\n2. 有电商项目经验\n3. 良好的英语沟通能力\n4. 全远程工作，时区友好', '远程办公（支持中国）', 'Michael Zhang', '+1-613-2416200', 'remote@shopify.com', 1, 298, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (27, 'DevOps Engineer', 'Amazon Web Services', 0, 38, 70, 3, 4, '岗位职责：\n1. Manage AWS infrastructure at scale\n2. Build automation tools and CI/CD pipelines\n3. Ensure system reliability and performance\n\n任职要求：\n1. Deep knowledge of AWS services\n2. Expert in Kubernetes and Docker\n3. Scripting skills (Python/Bash)\n4. 可远程办公', '美国西雅图 / 远程', 'James Liu', '+1-206-2661000', 'aws-jobs@amazon.com', 1, 356, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (28, 'Remote Python Developer', 'GitLab', 0, 28, 52, 2, 4, '岗位职责：\n1. Develop GitLab core features\n2. Work on distributed version control\n3. Contribute to open source community\n\n任职要求：\n1. Strong Python and Ruby skills\n2. Experience with Git and CI/CD\n3. Open source contribution experience\n4. 100% 远程工作', '远程办公（全球）', 'Rachel Kim', '+1-415-6551700', 'remote@gitlab.com', 1, 267, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (29, 'iOS Developer', 'Apple', 0, 42, 75, 4, 4, '岗位职责：\n1. Develop next-generation iOS features\n2. Work on system-level frameworks\n3. Collaborate with design teams\n\n任职要求：\n1. Expert in Swift and Objective-C\n2. Deep understanding of iOS SDK\n3. Passion for great user experience\n4. 部分岗位支持混合办公', '美国加州库比蒂诺', 'Kevin Chen', '+1-408-9961010', 'ios@apple.com', 1, 489, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (30, 'Backend Engineer (Remote)', 'Stripe', 0, 35, 65, 3, 4, '岗位职责：\n1. Build payment processing systems\n2. Design scalable APIs\n3. Ensure transaction security\n\n任职要求：\n1. Strong in Ruby or Java\n2. Experience with payment systems\n3. Focus on code quality and testing\n4. 支持远程办公', '美国旧金山 / 远程', 'Sophie Wang', '+1-888-9264678', 'backend@stripe.com', 1, 334, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (31, 'Data Scientist', 'Netflix', 0, 40, 75, 3, 5, '岗位职责：\n1. Analyze user behavior and preferences\n2. Build recommendation algorithms\n3. Support data-driven decision making\n\n任职要求：\n1. Master/PhD in Statistics or CS\n2. Expert in Python, SQL, R\n3. Experience with A/B testing\n4. 混合办公模式', '美国加州洛斯盖图', 'Tony Liu', '+1-408-5403700', 'data@netflix.com', 1, 412, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (32, 'Security Engineer (Remote)', 'Cloudflare', 0, 32, 58, 3, 4, '岗位职责：\n1. Protect internet infrastructure\n2. Research security vulnerabilities\n3. Develop security tools\n\n任职要求：\n1. Strong security background\n2. Experience with network protocols\n3. Knowledge of cryptography\n4. 全球远程工作', '远程办公（全球）', 'Alex Zhang', '+1-888-9935273', 'security@cloudflare.com', 1, 289, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (33, 'Remote UX Designer', 'Figma', 0, 28, 50, 2, 3, '岗位职责：\n1. 设计产品界面和交互流程\n2. 创建设计系统\n3. 与产品和工程团队协作\n\n任职要求：\n1. 精通Figma和设计工具\n2. 有B端产品设计经验\n3. 优秀的视觉表达能力\n4. 支持全球远程', '远程办公（全球）', 'Lisa Chen', '+1-415-5471155', 'design@figma.com', 1, 245, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (34, 'Blockchain Developer', 'Coinbase', 0, 38, 70, 3, 4, '岗位职责：\n1. Develop cryptocurrency trading platform\n2. Build blockchain infrastructure\n3. Ensure transaction security\n\n任职要求：\n1. Strong in Go, Rust or Solidity\n2. Deep understanding of blockchain\n3. Experience with smart contracts\n4. 可远程办公', '美国旧金山 / 远程', 'Eric Wu', '+1-888-9082646', 'crypto@coinbase.com', 1, 367, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (35, 'Game Developer (Remote)', 'Unity Technologies', 0, 30, 55, 2, 4, '岗位职责：\n1. Develop game engine features\n2. Optimize rendering performance\n3. Support game developers globally\n\n任职要求：\n1. Proficient in C# and C++\n2. Deep knowledge of Unity\n3. 3D graphics programming experience\n4. 远程工作友好', '远程办公（全球）', 'Chris Park', '+1-415-9397000', 'gamedev@unity.com', 1, 312, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (36, 'Product Manager', 'Airbnb', 0, 35, 60, 3, 4, '岗位职责：\n1. Define product roadmap and strategy\n2. Lead cross-functional teams\n3. Drive product growth and innovation\n\n任职要求：\n1. 5+ years PM experience\n2. Experience in travel or marketplace\n3. Strong analytical skills\n4. 混合办公', '美国旧金山 / 远程', 'Jessica Huang', '+1-855-4247262', 'pm@airbnb.com', 1, 378, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (37, 'Remote Technical Writer', 'Atlassian', 0, 22, 40, 2, 4, '岗位职责：\n1. Write technical documentation\n2. Create tutorials and guides\n3. Maintain knowledge base\n\n任职要求：\n1. Excellent English writing skills\n2. Technical background preferred\n3. Experience with dev tools\n4. 100% 远程工作', '远程办公（全球）', 'Amanda Li', '+61-2-83676099', 'writer@atlassian.com', 1, 198, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (38, 'Site Reliability Engineer', 'Uber', 0, 36, 65, 3, 4, '岗位职责：\n1. Ensure platform reliability and uptime\n2. Build monitoring and alerting systems\n3. Improve deployment automation\n\n任职要求：\n1. Strong Linux and networking skills\n2. Experience with large-scale systems\n3. Programming skills in Go or Python\n4. 部分远程', '美国旧金山', 'Daniel Kim', '+1-800-5938069', 'sre@uber.com', 1, 423, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (39, 'Remote QA Engineer', 'Zoom', 0, 24, 42, 2, 4, '岗位职责：\n1. Test video conferencing features\n2. Develop automated testing frameworks\n3. Ensure product quality\n\n任职要求：\n1. 3+ years testing experience\n2. Automation testing skills\n3. Familiar with video technology\n4. 全球远程工作', '远程办公（全球）', 'Nancy Zhao', '+1-888-7997666', 'qa@zoom.us', 1, 234, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (40, 'AI Research Scientist', 'DeepMind (Google)', 0, 50, 100, 5, 6, '岗位职责：\n1. Conduct cutting-edge AI research\n2. Publish papers at top conferences\n3. Develop AGI technologies\n\n任职要求：\n1. PhD in CS/AI/ML\n2. Strong publication record\n3. Expert in reinforcement learning\n4. 伦敦或加州办公', '英国伦敦', 'Thomas Anderson', '+44-20-73955000', 'research@deepmind.com', 1, 567, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (41, 'Remote Content Creator', 'TikTok (ByteDance)', 1, 15, 30, 1, 3, '岗位职责：\n1. 创作海外市场短视频内容\n2. 运营社交媒体账号\n3. 分析内容数据和趋势\n\n任职要求：\n1. 创意思维和内容制作能力\n2. 熟悉TikTok平台特性\n3. 英语流利\n4. 兼职远程，时间灵活', '远程办公（全球）', 'Nina Zhang', '+86-10-12345678', 'creator@tiktok.com', 1, 445, '2025-11-22 15:04:18.000000', 15);
INSERT INTO `job_position` VALUES (42, 'Remote Customer Success Manager', 'Salesforce', 0, 26, 45, 2, 4, '岗位职责：\n1. Manage enterprise customer relationships\n2. Drive product adoption and retention\n3. Provide technical guidance\n\n任职要求：\n1. 3+ years customer success experience\n2. CRM or SaaS industry background\n3. Excellent communication skills\n4. 支持亚太区远程', '远程办公（亚太区）', 'Steven Wu', '+1-415-9019000', 'success@salesforce.com', 1, 267, '2025-11-22 15:04:18.000000', 30);
INSERT INTO `job_position` VALUES (43, 'Golang开发工程师', '快手科技', 0, 22, 40, 3, 4, '岗位职责：\n1. 负责短视频推荐系统的后端开发\n2. 参与微服务架构的设计和优化\n3. 处理高并发场景下的技术难题\n\n任职要求：\n1. 精通Golang，有大型项目经验\n2. 熟悉Redis、Kafka等中间件\n3. 了解推荐算法优先\n4. 能承受一定工作压力', '北京市海淀区', '赵经理', '13900139001', 'golang@kuaishou.com', 1, 187, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (44, 'Remote Rust Developer', 'Discord', 0, 32, 58, 2, 4, '岗位职责：\n1. Build high-performance backend services\n2. Optimize real-time communication systems\n3. Work with distributed teams globally\n\n任职要求：\n1. Strong Rust programming skills\n2. Experience with WebSocket and networking\n3. Understanding of async programming\n4. 支持全球远程工作', '远程办公（全球）', 'Andrew Miller', '+1-415-3339800', 'rust@discord.com', 1, 334, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (45, '电商运营专员', '苏宁易购', 0, 10, 18, 1, 4, '岗位职责：\n1. 负责电商平台的日常运营工作\n2. 策划促销活动，提升销售额\n3. 分析运营数据，优化运营策略\n\n任职要求：\n1. 1-3年电商运营经验\n2. 熟悉电商平台运营规则\n3. 数据分析能力强\n4. 有促销活动策划经验', '南京市雨花台区', '孙运营', '13900139002', 'operation@suning.com', 1, 98, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (46, 'Senior Cloud Architect', 'Spotify', 0, 42, 75, 5, 5, '岗位职责：\n1. Design cloud infrastructure on GCP\n2. Lead migration to microservices\n3. Ensure scalability for millions of users\n\n任职要求：\n1. 7+ years experience in cloud architecture\n2. Expert in GCP, AWS or Azure\n3. Strong knowledge of Kubernetes\n4. 斯德哥尔摩或远程', '瑞典斯德哥尔摩 / 远程', 'Emma Johansson', '+46-8-56002000', 'cloud@spotify.com', 1, 456, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (47, '鸿蒙OS应用开发工程师', '华为技术', 0, 20, 35, 2, 4, '岗位职责：\n1. 负责HarmonyOS应用的开发工作\n2. 参与跨设备协同功能的实现\n3. 优化应用性能和用户体验\n\n任职要求：\n1. 熟悉Java/C++/ArkTS\n2. 了解HarmonyOS开发框架\n3. 有移动端开发经验\n4. 对新技术有热情', '深圳市龙岗区', '李开发', '13900139003', 'harmonyos@huawei.com', 1, 267, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (48, 'Remote Growth Hacker', 'Notion', 0, 28, 50, 2, 4, '岗位职责：\n1. Drive user acquisition and retention\n2. Experiment with growth strategies\n3. Analyze metrics and optimize funnels\n\n任职要求：\n1. 3+ years growth marketing experience\n2. Data-driven mindset\n3. Experience with SaaS products\n4. 100% 远程工作', '远程办公（全球）', 'Jason Park', '+1-415-8630909', 'growth@notion.so', 1, 289, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (49, '视频剪辑师', '芒果TV', 1, 8, 15, 1, 2, '岗位职责：\n1. 负责综艺节目的剪辑工作\n2. 配合导演完成后期制作\n3. 处理音频、字幕等后期任务\n\n任职要求：\n1. 熟练使用PR、Final Cut等剪辑软件\n2. 有综艺或影视剪辑经验\n3. 审美好，有创意\n4. 兼职岗位，按项目结算', '长沙市岳麓区 / 可远程', '马导演', '13900139004', 'editor@mgtv.com', 1, 145, '2025-11-22 15:08:58.000000', 15);
INSERT INTO `job_position` VALUES (50, 'Cybersecurity Analyst', 'Kaspersky', 0, 24, 45, 3, 4, '岗位职责：\n1. Monitor and respond to security threats\n2. Conduct vulnerability assessments\n3. Develop security policies and procedures\n\n任职要求：\n1. Strong background in information security\n2. Experience with penetration testing\n3. Knowledge of malware analysis\n4. 莫斯科或北京办公', '俄罗斯莫斯科 / 北京', 'Dmitry Ivanov', '+7-495-7979333', 'security@kaspersky.com', 1, 312, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (51, 'Unity3D游戏开发工程师', '莉莉丝游戏', 0, 20, 38, 2, 4, '岗位职责：\n1. 负责手游客户端开发工作\n2. 实现游戏玩法和UI界面\n3. 优化游戏性能，解决技术问题\n\n任职要求：\n1. 精通Unity3D引擎和C#\n2. 有完整手游项目经验\n3. 了解游戏优化技巧\n4. 热爱游戏，有团队精神', '上海市浦东新区', '周制作人', '13900139005', 'unity@lilith.com', 1, 234, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (52, 'Remote Technical Support Engineer', 'Slack', 0, 22, 40, 2, 4, '岗位职责：\n1. Provide technical support to enterprise customers\n2. Troubleshoot integration issues\n3. Create technical documentation\n\n任职要求：\n1. Strong troubleshooting skills\n2. Experience with API integrations\n3. Excellent written communication\n4. 支持亚太时区远程工作', '远程办公（亚太区）', 'Kelly Chen', '+1-415-6307715', 'support@slack.com', 1, 198, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (53, '数字营销经理', '完美日记', 0, 18, 32, 3, 4, '岗位职责：\n1. 负责品牌数字营销策略制定\n2. 管理小红书、抖音等社交媒体\n3. 策划线上营销活动，提升品牌影响力\n\n任职要求：\n1. 3年以上数字营销经验\n2. 熟悉美妆行业和KOL合作\n3. 数据分析能力强\n4. 有成功营销案例', '广州市天河区', '林营销', '13900139006', 'marketing@perfectdiary.com', 1, 176, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (54, 'Embedded Systems Engineer', 'Tesla', 0, 35, 65, 4, 5, '岗位职责：\n1. Develop embedded software for vehicle systems\n2. Work on autonomous driving features\n3. Optimize real-time performance\n\n任职要求：\n1. Expert in C/C++ and embedded systems\n2. Experience with automotive systems\n3. Real-time OS experience (FreeRTOS, QNX)\n4. 上海超级工厂或美国', '上海市浦东新区 / 美国', 'Elon\'s Team', '+1-650-6815000', 'embedded@tesla.com', 1, 523, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (55, '供应链管理专员', '盒马鲜生', 0, 12, 22, 1, 4, '岗位职责：\n1. 负责生鲜商品的供应链管理\n2. 协调供应商和物流配送\n3. 监控库存，优化采购策略\n\n任职要求：\n1. 了解供应链管理流程\n2. 有生鲜或零售行业经验优先\n3. 沟通协调能力强\n4. 能适应零售行业节奏', '杭州市余杭区', '侯供应链', '13900139007', 'scm@freshippo.com', 1, 87, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (56, 'Remote Data Engineer', 'Snowflake', 0, 32, 58, 3, 4, '岗位职责：\n1. Build and maintain data pipelines\n2. Design data warehouse solutions\n3. Optimize query performance\n\n任职要求：\n1. Strong SQL and Python skills\n2. Experience with cloud data platforms\n3. Knowledge of ETL processes\n4. 全球远程办公', '远程办公（全球）', 'Sarah Johnson', '+1-844-7669355', 'data@snowflake.com', 1, 367, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (57, 'Web3产品经理', 'Binance币安', 0, 28, 50, 3, 4, '岗位职责：\n1. 负责加密货币交易产品规划\n2. 研究Web3行业趋势\n3. 与技术团队协作推进产品开发\n\n任职要求：\n1. 3年以上产品经验\n2. 深入了解区块链和加密货币\n3. 有Web3产品经验优先\n4. 英语流利，支持远程', '新加坡 / 远程', 'CZ Team', '+65-31595900', 'pm@binance.com', 1, 445, '2025-11-22 15:08:58.000000', 30);
INSERT INTO `job_position` VALUES (58, 'Python后端工程师', '阿里巴巴', 0, 20, 40, 2, 4, '岗位职责：\n1. 负责公司核心业务系统的后端开发和维护\n2. 参与系统架构设计，保证系统的高可用性和稳定性\n3. 优化系统性能，提升用户体验\n\n任职要求：\n1. 精通Python，熟悉Django或Flask框架\n2. 熟悉MySQL、Redis等数据库\n3. 有大型互联网项目经验者优先', '杭州市西湖区', '张经理', '13800138001', 'hr@alibaba.com', 1, 162, '2025-11-22 15:10:40.000000', 30);
INSERT INTO `job_position` VALUES (59, 'Java高级开发工程师', '腾讯科技', 0, 25, 45, 3, 4, '岗位职责：\n1. 负责微信生态相关业务的开发工作\n2. 参与系统架构设计和技术选型\n3. 解决复杂技术问题，提升系统性能\n\n任职要求：\n1. 5年以上Java开发经验\n2. 精通Spring Boot、Spring Cloud等框架\n3. 熟悉分布式系统设计', '深圳市南山区', '李女士', '13800138002', 'recruit@tencent.com', 1, 234, '2025-11-22 15:10:40.000000', 30);
INSERT INTO `job_position` VALUES (60, '前端开发工程师', '字节跳动', 0, 18, 35, 2, 4, '岗位职责：\n1. 负责抖音Web端的前端开发工作\n2. 与产品、设计团队协作，实现优秀的用户体验\n3. 持续优化前端性能\n\n任职要求：\n1. 精通Vue.js或React框架\n2. 熟悉ES6+、TypeScript\n3. 有移动端H5开发经验', '北京市海淀区', '王先生', '13800138003', 'jobs@bytedance.com', 1, 189, '2025-11-22 15:10:40.000000', 15);
INSERT INTO `job_position` VALUES (61, '产品经理', '美团', 0, 22, 38, 2, 4, '岗位职责：\n1. 负责美团外卖业务的产品规划和设计\n2. 收集用户需求，制定产品方案\n3. 跟进产品开发，确保产品质量\n\n任职要求：\n1. 3年以上产品经验\n2. 有O2O或电商行业经验优先\n3. 优秀的沟通和协调能力', '北京市朝阳区', '陈经理', '13800138004', 'pm@meituan.com', 1, 168, '2025-11-22 15:10:40.000000', 30);
INSERT INTO `job_position` VALUES (62, 'UI设计师', '网易', 0, 15, 28, 1, 3, '岗位职责：\n1. 负责游戏产品的UI设计工作\n2. 制定视觉规范，保证设计一致性\n3. 与开发团队协作，确保设计落地\n\n任职要求：\n1. 熟练使用Sketch、Figma等设计工具\n2. 有游戏UI设计经验者优先\n3. 良好的审美和创新能力', '杭州市滨江区', '刘设计', '13800138005', 'design@163.com', 1, 142, '2025-11-22 15:10:40.000000', 30);

SET FOREIGN_KEY_CHECKS = 1;
