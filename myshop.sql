/*
 Navicat Premium Dump SQL

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : myshop

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 06/04/2025 20:38:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '推荐图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '轮播图信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (7, 50, 'http://localhost:8080/files/download/1736776978643-七匹狼短袖圆领T恤.jpg');
INSERT INTO `carousel` VALUES (9, 49, 'http://localhost:8080/files/download/1736833818615-四川春见耙耙柑.jpg');
INSERT INTO `carousel` VALUES (10, 48, 'http://localhost:8080/files/download/1736833828681-智利车厘子.jpg');
INSERT INTO `carousel` VALUES (11, 44, 'http://localhost:8080/files/download/1736833839545-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '男装');
INSERT INTO `category` VALUES (3, '女装');
INSERT INTO `category` VALUES (4, '食品');
INSERT INTO `category` VALUES (5, '电子');
INSERT INTO `category` VALUES (7, '水果');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `score` int NULL DEFAULT NULL COMMENT '评分',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评价内容',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评价时间',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商家回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评价信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `origin_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `has_group` tinyint(1) NULL DEFAULT 0 COMMENT '是否团购',
  `group_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '团购价',
  `has_flash` tinyint(1) NULL DEFAULT 0 COMMENT '是否秒杀',
  `flash_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '秒杀价',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品详情',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `category_id` int NULL DEFAULT NULL COMMENT '分类ID',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上架日期',
  `store` int NULL DEFAULT NULL COMMENT '库存',
  `flash_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '秒杀截止时间',
  `flash_num` int NULL DEFAULT NULL COMMENT '秒杀名额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (40, '猫山王榴莲', 49.00, 0, 45.00, 1, 40.00, '<p>猫山王榴莲</p>', 'http://localhost:8080/files/download/1736773141644-榴莲.jpg', 7, '2025-01-13', 100, '2025-05-03 00:00:00', 20);
INSERT INTO `goods` VALUES (41, '键盘', 109.00, 0, NULL, 0, NULL, '<p>键盘</p>', 'http://localhost:8080/files/download/1736774792886-键盘.jpg', 5, '2025-01-13', 100, NULL, NULL);
INSERT INTO `goods` VALUES (42, '拖鞋', 30.00, 0, NULL, 0, NULL, '<p>拖鞋</p>', 'http://localhost:8080/files/download/1736775291475-拖鞋.jpg', 1, '2025-01-13', 100, NULL, NULL);
INSERT INTO `goods` VALUES (43, '鼠标', 180.00, 1, 169.00, 1, 159.00, '<p>鼠标</p>', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 5, '2025-01-13', 10, '2025-01-31 00:00:00', 5);
INSERT INTO `goods` VALUES (44, 'LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫', 1499.00, 0, NULL, 0, NULL, '<h1 style=\"text-align: start;\">LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫</h1>', 'http://localhost:8080/files/download/1736775427487-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg', 3, '2025-01-13', 100, NULL, NULL);
INSERT INTO `goods` VALUES (45, '小当家干脆面', 13.90, 0, NULL, 0, NULL, '<p>干脆面</p>', 'http://localhost:8080/files/download/1736775494192-小当家干脆面.jpg', 4, '2025-01-13', 100, NULL, NULL);
INSERT INTO `goods` VALUES (46, '双汇热狗玉米肠', 6.00, 0, NULL, 0, NULL, '<p>双汇热狗玉米肠</p>', 'http://localhost:8080/files/download/1736775552704-双汇热狗玉米肠.jpg', 4, '2025-01-13', 100, NULL, NULL);
INSERT INTO `goods` VALUES (47, '好利来半熟芝士', 80.00, 0, NULL, 1, 213.00, '<p>好利来半熟芝士</p>', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 4, '2025-01-13', 93, '2025-04-04 00:00:00', 1);
INSERT INTO `goods` VALUES (48, '智利车厘子', 199.00, 0, NULL, 1, 189.00, '<p>智利车厘子</p>', 'http://localhost:8080/files/download/1736775682907-智利车厘子.jpg', 7, '2025-01-13', 99, '2025-05-01 00:00:00', 9);
INSERT INTO `goods` VALUES (49, '四川春见耙耙柑', 16.80, 0, NULL, 1, 15.00, '<h1 style=\"text-align: start;\">四川春见耙耙柑</h1>', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 7, '2025-01-13', 9, '2025-04-30 00:00:00', 9);
INSERT INTO `goods` VALUES (50, '七匹狼短袖圆领T恤', 249.00, 1, 239.00, 0, 235.00, '<p>七匹狼短袖圆领T恤</p>', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 1, '2025-01-13', 90, '2025-03-31 00:00:00', 10);

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  `operate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作',
  `user_id` int NULL DEFAULT NULL COMMENT '操作人ID',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (88, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:01:28');
INSERT INTO `logs` VALUES (89, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:03:10');
INSERT INTO `logs` VALUES (90, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:07:49');
INSERT INTO `logs` VALUES (91, '用户', '注册', NULL, '127.0.0.1', '2025-01-13 15:08:03');
INSERT INTO `logs` VALUES (92, '用户', '登录', 50, '127.0.0.1', '2025-01-13 15:08:08');
INSERT INTO `logs` VALUES (93, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:08:53');
INSERT INTO `logs` VALUES (94, '用户', '修改密码', 1, '127.0.0.1', '2025-01-13 15:09:22');
INSERT INTO `logs` VALUES (95, '用户', '修改密码', 1, '127.0.0.1', '2025-01-13 15:09:33');
INSERT INTO `logs` VALUES (96, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:27:42');
INSERT INTO `logs` VALUES (97, '用户', '注册', NULL, '127.0.0.1', '2025-01-13 15:28:20');
INSERT INTO `logs` VALUES (98, '用户', '注册', NULL, '127.0.0.1', '2025-01-13 15:28:39');
INSERT INTO `logs` VALUES (99, '用户', '登录', 52, '127.0.0.1', '2025-01-13 15:28:46');
INSERT INTO `logs` VALUES (100, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:28:56');
INSERT INTO `logs` VALUES (101, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:57:05');
INSERT INTO `logs` VALUES (102, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:13:08');
INSERT INTO `logs` VALUES (103, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:15:09');
INSERT INTO `logs` VALUES (104, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:16:26');
INSERT INTO `logs` VALUES (105, '用户', '登录', 52, '127.0.0.1', '2025-01-13 16:16:40');
INSERT INTO `logs` VALUES (106, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:16:48');
INSERT INTO `logs` VALUES (107, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:38:59');
INSERT INTO `logs` VALUES (108, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:45:37');
INSERT INTO `logs` VALUES (109, '用户', '登录', 52, '127.0.0.1', '2025-01-13 16:45:48');
INSERT INTO `logs` VALUES (110, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:46:02');
INSERT INTO `logs` VALUES (111, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:36:30');
INSERT INTO `logs` VALUES (112, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:36:36');
INSERT INTO `logs` VALUES (113, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:42:26');
INSERT INTO `logs` VALUES (114, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:42:34');
INSERT INTO `logs` VALUES (115, '用户', '登录', 1, '127.0.0.1', '2025-01-13 19:52:05');
INSERT INTO `logs` VALUES (116, '用户', '登录', 1, '127.0.0.1', '2025-01-13 20:02:06');
INSERT INTO `logs` VALUES (117, '用户', '登录', 1, '127.0.0.1', '2025-01-13 20:02:58');
INSERT INTO `logs` VALUES (118, '用户', '登录', 1, '127.0.0.1', '2025-01-13 20:14:35');
INSERT INTO `logs` VALUES (119, '用户', '登录', 1, '127.0.0.1', '2025-01-14 13:50:05');
INSERT INTO `logs` VALUES (120, '用户', '登录', 1, '127.0.0.1', '2025-01-16 11:06:33');
INSERT INTO `logs` VALUES (121, '用户', '登录', 1, '127.0.0.1', '2025-01-16 11:46:51');
INSERT INTO `logs` VALUES (122, '用户', '登录', 52, '127.0.0.1', '2025-01-16 12:19:41');
INSERT INTO `logs` VALUES (123, '用户', '登录', 1, '127.0.0.1', '2025-01-16 12:20:04');
INSERT INTO `logs` VALUES (124, '用户', '登录', 52, '127.0.0.1', '2025-01-16 12:21:59');
INSERT INTO `logs` VALUES (125, '用户', '登录', 1, '127.0.0.1', '2025-01-16 12:22:05');
INSERT INTO `logs` VALUES (126, '用户', '登录', 52, '127.0.0.1', '2025-01-16 12:22:13');
INSERT INTO `logs` VALUES (127, '用户', '登录', 1, '127.0.0.1', '2025-01-16 12:24:45');
INSERT INTO `logs` VALUES (128, '订单', '创建订单成功，订单编号：【1879778334520963072】', 1, '127.0.0.1', '2025-01-16 14:30:54');
INSERT INTO `logs` VALUES (129, '订单', '创建订单成功，订单编号：【1879780066286174208】', 1, '127.0.0.1', '2025-01-16 14:37:47');
INSERT INTO `logs` VALUES (130, '用户', '登录', 1, '127.0.0.1', '2025-01-16 14:50:59');
INSERT INTO `logs` VALUES (131, '订单', '创建订单成功，订单编号：【1879783849481273344】', 1, '127.0.0.1', '2025-01-16 14:52:49');
INSERT INTO `logs` VALUES (132, '订单', '创建订单成功，订单编号：【1879786398917656576】', 1, '127.0.0.1', '2025-01-16 15:02:56');
INSERT INTO `logs` VALUES (133, '订单', '创建订单成功，订单编号：【1879787265293090816】', 1, '127.0.0.1', '2025-01-16 15:06:23');
INSERT INTO `logs` VALUES (134, '订单', '创建订单成功，订单编号：【1879787282489737216】', 1, '127.0.0.1', '2025-01-16 15:06:27');
INSERT INTO `logs` VALUES (135, '用户', '登录', 1, '127.0.0.1', '2025-01-16 15:07:13');
INSERT INTO `logs` VALUES (136, '订单', '创建订单成功，订单编号：【1879788310438150144】', 1, '127.0.0.1', '2025-01-16 15:10:32');
INSERT INTO `logs` VALUES (137, '用户', '登录', 52, '127.0.0.1', '2025-01-16 15:10:58');
INSERT INTO `logs` VALUES (138, '订单', '创建订单成功，订单编号：【1879788435394854912】', 52, '127.0.0.1', '2025-01-16 15:11:02');
INSERT INTO `logs` VALUES (139, '订单', '创建订单成功，订单编号：【1879797886277451776】', 52, '127.0.0.1', '2025-01-16 15:48:35');
INSERT INTO `logs` VALUES (140, '订单', '创建订单成功，订单编号：【1879802756220923904】', 52, '127.0.0.1', '2025-01-16 16:07:56');
INSERT INTO `logs` VALUES (141, '订单', '订单发起支付，订单号【1879802756220923904】', 52, '127.0.0.1', '2025-01-16 16:07:58');
INSERT INTO `logs` VALUES (142, '订单', '创建订单成功，订单编号：【1879802949079216128】', 52, '127.0.0.1', '2025-01-16 16:08:42');
INSERT INTO `logs` VALUES (143, '订单', '订单发起支付，订单号【1879802949079216128】', 52, '127.0.0.1', '2025-01-16 16:08:42');
INSERT INTO `logs` VALUES (144, '订单', '创建订单成功，订单编号：【1879802980188368896】', 52, '127.0.0.1', '2025-01-16 16:08:50');
INSERT INTO `logs` VALUES (145, '订单', '订单发起支付，订单号【1879802980188368896】', 52, '127.0.0.1', '2025-01-16 16:08:50');
INSERT INTO `logs` VALUES (146, '订单', '创建订单成功，订单编号：【1879803062178623488】', 52, '127.0.0.1', '2025-01-16 16:09:09');
INSERT INTO `logs` VALUES (147, '订单', '订单发起支付，订单号【1879803062178623488】', 52, '127.0.0.1', '2025-01-16 16:09:09');
INSERT INTO `logs` VALUES (148, '订单', '创建订单成功，订单编号：【1879804232607543296】', 52, '127.0.0.1', '2025-01-16 16:13:48');
INSERT INTO `logs` VALUES (149, '订单', '订单发起支付，订单号【1879804232607543296】', 52, '127.0.0.1', '2025-01-16 16:13:49');
INSERT INTO `logs` VALUES (150, '订单', '创建订单成功，订单编号：【1879804304388861952】', 52, '127.0.0.1', '2025-01-16 16:14:05');
INSERT INTO `logs` VALUES (151, '订单', '订单发起支付，订单号【1879804304388861952】', 52, '127.0.0.1', '2025-01-16 16:14:06');
INSERT INTO `logs` VALUES (152, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:14:41');
INSERT INTO `logs` VALUES (153, '用户', '登录', 1, '127.0.0.1', '2025-01-16 16:15:10');
INSERT INTO `logs` VALUES (154, '用户', '登录', 1, '127.0.0.1', '2025-01-16 16:17:59');
INSERT INTO `logs` VALUES (155, '订单', '创建订单成功，订单编号：【1879806219294158848】', 1, '127.0.0.1', '2025-01-16 16:21:42');
INSERT INTO `logs` VALUES (156, '订单', '订单发起支付，订单号【1879806219294158848】', 1, '127.0.0.1', '2025-01-16 16:21:42');
INSERT INTO `logs` VALUES (157, '订单', '创建订单成功，订单编号：【1879806769502957568】', 1, '127.0.0.1', '2025-01-16 16:23:53');
INSERT INTO `logs` VALUES (158, '订单', '订单发起支付，订单号【1879806769502957568】', 1, '127.0.0.1', '2025-01-16 16:23:53');
INSERT INTO `logs` VALUES (159, '订单', '创建订单成功，订单编号：【1879807252942630912】', 1, '127.0.0.1', '2025-01-16 16:25:48');
INSERT INTO `logs` VALUES (160, '订单', '订单发起支付，订单号【1879807252942630912】', 1, '127.0.0.1', '2025-01-16 16:25:49');
INSERT INTO `logs` VALUES (161, '订单', '创建订单成功，订单编号：【1879807674671534080】', 1, '127.0.0.1', '2025-01-16 16:27:29');
INSERT INTO `logs` VALUES (162, '订单', '订单发起支付，订单号【1879807674671534080】', 1, '127.0.0.1', '2025-01-16 16:27:30');
INSERT INTO `logs` VALUES (163, '订单', '创建订单成功，订单编号：【1879809588222029824】', 1, '127.0.0.1', '2025-01-16 16:35:05');
INSERT INTO `logs` VALUES (164, '订单', '订单发起支付，订单号【1879809588222029824】', 1, '127.0.0.1', '2025-01-16 16:35:06');
INSERT INTO `logs` VALUES (165, '订单', '创建订单成功，订单编号：【1879809902404759552】', 1, '127.0.0.1', '2025-01-16 16:36:20');
INSERT INTO `logs` VALUES (166, '订单', '订单发起支付，订单号【1879809902404759552】', 1, '127.0.0.1', '2025-01-16 16:36:20');
INSERT INTO `logs` VALUES (167, '订单', '创建订单', 1, '127.0.0.1', '2025-01-16 16:41:00');
INSERT INTO `logs` VALUES (168, '订单', '订单发起支付，订单号【1879811075891335168】', 1, '127.0.0.1', '2025-01-16 16:41:00');
INSERT INTO `logs` VALUES (169, '订单', '创建订单', 1, '127.0.0.1', '2025-01-16 16:43:48');
INSERT INTO `logs` VALUES (170, '订单', '订单发起支付，订单号【1879811783071961088】', 1, '127.0.0.1', '2025-01-16 16:43:49');
INSERT INTO `logs` VALUES (171, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:44:07');
INSERT INTO `logs` VALUES (172, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:44:26');
INSERT INTO `logs` VALUES (173, '用户', '登录', 33, '127.0.0.1', '2025-01-16 16:44:33');
INSERT INTO `logs` VALUES (174, '用户', '登录', 1, '127.0.0.1', '2025-01-16 16:44:53');
INSERT INTO `logs` VALUES (175, '订单', '创建订单', 1, '127.0.0.1', '2025-01-16 16:45:06');
INSERT INTO `logs` VALUES (176, '订单', '订单发起支付，订单号【1879812106314387456】', 1, '127.0.0.1', '2025-01-16 16:45:06');
INSERT INTO `logs` VALUES (177, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:45:32');
INSERT INTO `logs` VALUES (178, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:45:45');
INSERT INTO `logs` VALUES (179, '订单', '创建订单', 26, '127.0.0.1', '2025-01-16 16:49:27');
INSERT INTO `logs` VALUES (180, '订单', '订单发起支付，订单号【1879813200771850240】', 26, '127.0.0.1', '2025-01-16 16:49:27');
INSERT INTO `logs` VALUES (181, '订单', '创建订单', 26, '127.0.0.1', '2025-01-16 16:54:38');
INSERT INTO `logs` VALUES (182, '订单', '订单发起支付，订单号【1879814506785894400】', 26, '127.0.0.1', '2025-01-16 16:54:38');
INSERT INTO `logs` VALUES (183, '用户', '登录', 1, '127.0.0.1', '2025-01-17 18:19:57');
INSERT INTO `logs` VALUES (184, '用户', '登录', 1, '127.0.0.1', '2025-01-19 20:06:01');
INSERT INTO `logs` VALUES (185, '用户', '登录', 1, '127.0.0.1', '2025-01-19 20:07:06');
INSERT INTO `logs` VALUES (186, '用户', '登录', 26, '127.0.0.1', '2025-01-19 20:07:29');
INSERT INTO `logs` VALUES (187, '订单', '创建订单', 26, '127.0.0.1', '2025-01-19 20:07:41');
INSERT INTO `logs` VALUES (188, '订单', '订单发起支付，订单号【1880950253962158080】', 26, '127.0.0.1', '2025-01-19 20:07:43');
INSERT INTO `logs` VALUES (189, '用户', '登录', 26, '127.0.0.1', '2025-01-19 20:11:51');
INSERT INTO `logs` VALUES (190, '用户', '登录', 26, '127.0.0.1', '2025-02-15 12:40:30');
INSERT INTO `logs` VALUES (191, '订单', '创建订单', 26, '127.0.0.1', '2025-02-15 12:40:38');
INSERT INTO `logs` VALUES (192, '订单', '创建订单', 26, '127.0.0.1', '2025-02-15 12:40:42');
INSERT INTO `logs` VALUES (193, '订单', '订单发起支付，订单号【1890622238036094976】', 26, '127.0.0.1', '2025-02-15 12:40:43');
INSERT INTO `logs` VALUES (194, '用户', '登录', 1, '127.0.0.1', '2025-02-15 12:41:02');
INSERT INTO `logs` VALUES (195, '用户', '登录', 1, '127.0.0.1', '2025-04-01 12:56:31');
INSERT INTO `logs` VALUES (196, '用户', '登录', 26, '127.0.0.1', '2025-04-01 12:58:03');
INSERT INTO `logs` VALUES (197, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 12:58:10');
INSERT INTO `logs` VALUES (198, '订单', '订单发起支付，订单号【1906934087621472256】', 26, '127.0.0.1', '2025-04-01 12:58:10');
INSERT INTO `logs` VALUES (199, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 12:58:39');
INSERT INTO `logs` VALUES (200, '订单', '订单发起支付，订单号【1906934208622948352】', 26, '127.0.0.1', '2025-04-01 12:58:39');
INSERT INTO `logs` VALUES (201, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 13:03:16');
INSERT INTO `logs` VALUES (202, '订单', '订单发起支付，订单号【1906935370558459904】', 26, '127.0.0.1', '2025-04-01 13:03:16');
INSERT INTO `logs` VALUES (203, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 13:03:39');
INSERT INTO `logs` VALUES (204, '订单', '订单发起支付，订单号【1906935470093488128】', 26, '127.0.0.1', '2025-04-01 13:03:40');
INSERT INTO `logs` VALUES (205, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:04:21');
INSERT INTO `logs` VALUES (206, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:04:32');
INSERT INTO `logs` VALUES (207, '用户', '登录', 1, '127.0.0.1', '2025-04-01 13:37:33');
INSERT INTO `logs` VALUES (208, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:37:49');
INSERT INTO `logs` VALUES (209, '用户', '登录', 1, '127.0.0.1', '2025-04-01 13:38:01');
INSERT INTO `logs` VALUES (210, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:42:46');
INSERT INTO `logs` VALUES (211, '用户', '登录', 1, '127.0.0.1', '2025-04-01 13:42:55');
INSERT INTO `logs` VALUES (212, '用户', '注册', NULL, '127.0.0.1', '2025-04-01 13:58:41');
INSERT INTO `logs` VALUES (213, '用户', '登录', 53, '127.0.0.1', '2025-04-01 13:58:50');
INSERT INTO `logs` VALUES (214, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:08:04');
INSERT INTO `logs` VALUES (215, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:11:20');
INSERT INTO `logs` VALUES (216, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:11:52');
INSERT INTO `logs` VALUES (217, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:12:06');
INSERT INTO `logs` VALUES (218, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:13:21');
INSERT INTO `logs` VALUES (219, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:17:18');
INSERT INTO `logs` VALUES (220, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:19:48');
INSERT INTO `logs` VALUES (221, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:20:27');
INSERT INTO `logs` VALUES (222, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:20:42');
INSERT INTO `logs` VALUES (223, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:21:37');
INSERT INTO `logs` VALUES (224, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:21:46');
INSERT INTO `logs` VALUES (225, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:23:00');
INSERT INTO `logs` VALUES (226, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:25:35');
INSERT INTO `logs` VALUES (227, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:25:40');
INSERT INTO `logs` VALUES (228, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:25:48');
INSERT INTO `logs` VALUES (229, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:25:54');
INSERT INTO `logs` VALUES (230, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:26:33');
INSERT INTO `logs` VALUES (231, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:26:54');
INSERT INTO `logs` VALUES (232, '用户', '登录', 1, '127.0.0.1', '2025-04-02 09:29:48');
INSERT INTO `logs` VALUES (233, '订单', '创建订单成功，订单编号：【1907245078821359616】', 1, '127.0.0.1', '2025-04-02 09:33:56');
INSERT INTO `logs` VALUES (234, '订单', '订单发起支付，订单号【1907245078821359616】', 1, '127.0.0.1', '2025-04-02 09:33:58');
INSERT INTO `logs` VALUES (235, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:20:06');
INSERT INTO `logs` VALUES (236, '订单', '创建订单', 26, '127.0.0.1', '2025-04-02 10:20:13');
INSERT INTO `logs` VALUES (237, '订单', '订单发起支付，订单号【1907256727238234112】', 26, '127.0.0.1', '2025-04-02 10:20:13');
INSERT INTO `logs` VALUES (238, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:20:47');
INSERT INTO `logs` VALUES (239, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:22:14');
INSERT INTO `logs` VALUES (240, '用户', '登录', 33, '127.0.0.1', '2025-04-02 10:22:41');
INSERT INTO `logs` VALUES (241, '订单', '创建订单', 33, '127.0.0.1', '2025-04-02 10:22:54');
INSERT INTO `logs` VALUES (242, '订单', '订单发起支付，订单号【1907257403611697152】', 33, '127.0.0.1', '2025-04-02 10:22:55');
INSERT INTO `logs` VALUES (243, '订单', '创建订单', 33, '127.0.0.1', '2025-04-02 10:23:04');
INSERT INTO `logs` VALUES (244, '订单', '订单发起支付，订单号【1907257445919641600】', 33, '127.0.0.1', '2025-04-02 10:23:05');
INSERT INTO `logs` VALUES (245, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:23:59');
INSERT INTO `logs` VALUES (246, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:27:30');
INSERT INTO `logs` VALUES (247, '订单', '创建订单成功，订单编号：【1907258688922603520】', 26, '127.0.0.1', '2025-04-02 10:28:01');
INSERT INTO `logs` VALUES (248, '订单', '订单发起支付，订单号【1907258688922603520】', 26, '127.0.0.1', '2025-04-02 10:28:02');
INSERT INTO `logs` VALUES (249, '用户', '登录', 33, '127.0.0.1', '2025-04-02 10:28:12');
INSERT INTO `logs` VALUES (250, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:31:29');
INSERT INTO `logs` VALUES (251, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:33:46');
INSERT INTO `logs` VALUES (252, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:33:55');
INSERT INTO `logs` VALUES (253, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:34:40');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `num` int NULL DEFAULT NULL COMMENT '购买数量',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总价',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `user_id` int NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `pay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付单号',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单状态',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单类型',
  `group_order_id` int NULL DEFAULT NULL COMMENT '拼团订单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (57, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1879812106314387456', 1, '2025-01-16 16:45:06', NULL, NULL, 'NOT_PAY', 'GROUP', 59);
INSERT INTO `orders` VALUES (58, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1879813200771850240', 26, '2025-01-16 16:49:26', NULL, NULL, 'NOT_PAY', 'GROUP', 57);
INSERT INTO `orders` VALUES (59, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1879814506785894400', 26, '2025-01-16 16:54:38', NULL, NULL, 'NOT_PAY', 'GROUP', 57);
INSERT INTO `orders` VALUES (60, 47, '好利来半熟芝士', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 80.00, 1, 80.00, '1880950253962158080', 26, '2025-01-19 20:07:41', NULL, NULL, 'NOT_PAY', 'COMMON', NULL);
INSERT INTO `orders` VALUES (61, 47, '好利来半熟芝士', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 80.00, 1, 80.00, '1890622220466155520', 26, '2025-02-15 12:40:38', NULL, NULL, 'NOT_PAY', 'COMMON', NULL);
INSERT INTO `orders` VALUES (62, 47, '好利来半熟芝士', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 80.00, 1, 80.00, '1890622238036094976', 26, '2025-02-15 12:40:42', NULL, NULL, 'NOT_PAY', 'COMMON', NULL);
INSERT INTO `orders` VALUES (63, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1906934087621472256', 26, '2025-04-01 12:58:10', NULL, NULL, 'NOT_PAY', 'GROUP', NULL);
INSERT INTO `orders` VALUES (64, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1906934208622948352', 26, '2025-04-01 12:58:39', NULL, NULL, 'NOT_PAY', 'GROUP', 65);
INSERT INTO `orders` VALUES (65, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1906935370558459904', 26, '2025-04-01 13:03:16', NULL, NULL, 'NOT_PAY', 'GROUP', 64);
INSERT INTO `orders` VALUES (66, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1906935470093488128', 26, '2025-04-01 13:03:39', NULL, NULL, 'NOT_PAY', 'GROUP', NULL);
INSERT INTO `orders` VALUES (67, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1907245078821359616', 1, '2025-04-02 09:33:56', NULL, NULL, 'NOT_PAY', 'FLASH', NULL);
INSERT INTO `orders` VALUES (68, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1907256727238234112', 26, '2025-04-02 10:20:13', NULL, NULL, 'NOT_PAY', 'GROUP', NULL);
INSERT INTO `orders` VALUES (69, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1907257403611697152', 33, '2025-04-02 10:22:54', NULL, NULL, 'NOT_PAY', 'GROUP', 70);
INSERT INTO `orders` VALUES (70, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1907257445919641600', 33, '2025-04-02 10:23:04', NULL, NULL, 'NOT_PAY', 'GROUP', 69);
INSERT INTO `orders` VALUES (71, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1907258688922603520', 26, '2025-04-02 10:28:01', NULL, NULL, 'NOT_PAY', 'FLASH', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '5e33372df37bd2344fdb81aa28381f49', '管理员', 'ADMIN', 'http://localhost:8080/files/download/1736773027304-avatar.png', '15895051864', 'xingbaojiang43@outlook.com');
INSERT INTO `user` VALUES (26, 'user01', '9d25e15c76942f13d3be9039526474c9', 'user01', 'USER', 'http://localhost:8080/files/download/1743483846460-avatar.png', '1101', '1101@shop.com');
INSERT INTO `user` VALUES (33, 'user02', '9d25e15c76942f13d3be9039526474c9', 'user02', 'USER', NULL, '1102', '1102@shop.com');
INSERT INTO `user` VALUES (34, 'user03', '9d25e15c76942f13d3be9039526474c9', 'user03', 'USER', NULL, '1103', '1103@shop.com');
INSERT INTO `user` VALUES (35, 'user04', '9d25e15c76942f13d3be9039526474c9', 'user04', 'USER', NULL, '1104', '1104@shop.com');
INSERT INTO `user` VALUES (36, 'user05', '9d25e15c76942f13d3be9039526474c9', 'user05', 'USER', NULL, '1105', '1105@shop.com');
INSERT INTO `user` VALUES (37, 'user06', '9d25e15c76942f13d3be9039526474c9', 'user06', 'USER', NULL, '1106', '1106@shop.com');
INSERT INTO `user` VALUES (38, 'user07', '9d25e15c76942f13d3be9039526474c9', 'user07', 'USER', NULL, '1107', '1107@shop.com');
INSERT INTO `user` VALUES (39, 'user08', '9d25e15c76942f13d3be9039526474c9', 'user08', 'USER', NULL, '1108', '1108@shop.com');
INSERT INTO `user` VALUES (40, 'user09', '9d25e15c76942f13d3be9039526474c9', 'user09', 'USER', NULL, '1109', '1109@shop.com');
INSERT INTO `user` VALUES (41, 'user10', '9d25e15c76942f13d3be9039526474c9', 'user10', 'USER', NULL, '1110', '1110@shop.com');
INSERT INTO `user` VALUES (42, 'user11', '9d25e15c76942f13d3be9039526474c9', 'user11', 'USER', NULL, '1111', '1111@shop.com');
INSERT INTO `user` VALUES (43, 'user12', '9d25e15c76942f13d3be9039526474c9', 'user12', 'USER', NULL, '1112', '1112@shop.com');
INSERT INTO `user` VALUES (45, 'user13', '9d25e15c76942f13d3be9039526474c9', 'user13', 'USER', NULL, '1113', '1113@shop.com');
INSERT INTO `user` VALUES (46, 'user14', '9d25e15c76942f13d3be9039526474c9', 'user14', 'USER', NULL, '1114', '1114@shop.com');
INSERT INTO `user` VALUES (48, 'user15', '9d25e15c76942f13d3be9039526474c9', 'user15', 'USER', NULL, '1115', '1115@shop.com');
INSERT INTO `user` VALUES (52, 'xingbao', '9d25e15c76942f13d3be9039526474c9', 'xingbao', 'USER', 'http://localhost:8080/files/download/1737001219737-avatar.png', NULL, NULL);
INSERT INTO `user` VALUES (53, 'test', '9d25e15c76942f13d3be9039526474c9', 'test', 'USER', 'http://localhost:8080/files/download/1743487145314-avatar.png', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
