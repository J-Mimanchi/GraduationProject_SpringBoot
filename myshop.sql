/*
 Navicat Premium Dump SQL

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80404 (8.4.4)
 Source Host           : localhost:3306
 Source Schema         : myshop

 Target Server Type    : MySQL
 Target Server Version : 80404 (8.4.4)
 File Encoding         : 65001

 Date: 17/04/2025 19:17:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图信息';

-- ----------------------------
-- Records of carousel
-- ----------------------------
BEGIN;
INSERT INTO `carousel` (`id`, `goods_id`, `img`) VALUES (7, 50, 'http://localhost:8080/files/download/1736776978643-七匹狼短袖圆领T恤.jpg');
INSERT INTO `carousel` (`id`, `goods_id`, `img`) VALUES (9, 49, 'http://localhost:8080/files/download/1736833818615-四川春见耙耙柑.jpg');
INSERT INTO `carousel` (`id`, `goods_id`, `img`) VALUES (10, 48, 'http://localhost:8080/files/download/1736833828681-智利车厘子.jpg');
INSERT INTO `carousel` (`id`, `goods_id`, `img`) VALUES (11, 44, 'http://localhost:8080/files/download/1736833839545-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` (`id`, `name`) VALUES (1, '男装');
INSERT INTO `category` (`id`, `name`) VALUES (3, '女装');
INSERT INTO `category` (`id`, `name`) VALUES (4, '食品');
INSERT INTO `category` (`id`, `name`) VALUES (5, '电子');
INSERT INTO `category` (`id`, `name`) VALUES (7, '水果');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `score` int DEFAULT NULL COMMENT '评分',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评价内容',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评价时间',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='评价信息';

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`id`, `user_id`, `score`, `content`, `create_time`, `goods_id`, `reply`) VALUES (5, 26, 5, '1234', '2025-04-17 17:58:52', 42, NULL);
INSERT INTO `comment` (`id`, `user_id`, `score`, `content`, `create_time`, `goods_id`, `reply`) VALUES (6, 33, 5, 'qqq', '2025-04-17 18:28:44', 44, NULL);
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `origin_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `has_group` tinyint(1) DEFAULT '0' COMMENT '是否团购',
  `group_price` decimal(10,2) DEFAULT NULL COMMENT '团购价',
  `has_flash` tinyint(1) DEFAULT '0' COMMENT '是否秒杀',
  `flash_price` decimal(10,2) DEFAULT NULL COMMENT '秒杀价',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '商品详情',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `category_id` int DEFAULT NULL COMMENT '分类ID',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上架日期',
  `store` int DEFAULT NULL COMMENT '库存',
  `flash_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '秒杀截止时间',
  `flash_num` int DEFAULT NULL COMMENT '秒杀名额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品信息';

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (40, '猫山王榴莲', 49.00, 0, 45.00, 1, 40.00, '<p>猫山王榴莲</p>', 'http://localhost:8080/files/download/1736773141644-榴莲.jpg', 7, '2025-01-13', 100, '2025-05-03 00:00:00', 20);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (41, '键盘', 109.00, 0, NULL, 0, NULL, '<p>键盘</p>', 'http://localhost:8080/files/download/1736774792886-键盘.jpg', 5, '2025-01-13', 97, NULL, NULL);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (42, '拖鞋', 30.00, 0, NULL, 0, NULL, '<p>拖鞋</p>', 'http://localhost:8080/files/download/1736775291475-拖鞋.jpg', 1, '2025-01-13', 96, NULL, NULL);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (43, '鼠标', 180.00, 1, 169.00, 1, 159.00, '<p>鼠标</p>', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 5, '2025-01-13', 9, '2025-01-31 00:00:00', 4);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (44, 'LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫', 1499.00, 0, NULL, 0, NULL, '<h1 style=\"text-align: start;\">LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫</h1>', 'http://localhost:8080/files/download/1736775427487-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg', 3, '2025-01-13', 97, NULL, NULL);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (45, '小当家干脆面', 13.90, 0, NULL, 0, NULL, '<p>干脆面</p>', 'http://localhost:8080/files/download/1736775494192-小当家干脆面.jpg', 4, '2025-01-13', 96, NULL, NULL);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (46, '双汇热狗玉米肠', 6.00, 0, NULL, 0, NULL, '<p>双汇热狗玉米肠</p>', 'http://localhost:8080/files/download/1736775552704-双汇热狗玉米肠.jpg', 4, '2025-01-13', 99, NULL, NULL);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (47, '好利来半熟芝士', 80.00, 0, NULL, 1, 213.00, '<p>好利来半熟芝士</p>', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 4, '2025-01-13', 93, '2025-04-04 00:00:00', 1);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (48, '智利车厘子', 199.00, 0, NULL, 1, 189.00, '<p>智利车厘子</p>', 'http://localhost:8080/files/download/1736775682907-智利车厘子.jpg', 7, '2025-01-13', 99, '2025-05-01 00:00:00', 9);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (49, '四川春见耙耙柑', 16.80, 0, NULL, 1, 15.00, '<h1 style=\"text-align: start;\">四川春见耙耙柑</h1>', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 7, '2025-01-13', 5, '2025-04-30 00:00:00', 5);
INSERT INTO `goods` (`id`, `name`, `origin_price`, `has_group`, `group_price`, `has_flash`, `flash_price`, `content`, `img`, `category_id`, `date`, `store`, `flash_time`, `flash_num`) VALUES (50, '七匹狼短袖圆领T恤', 249.00, 1, 239.00, 0, 235.00, '<p>七匹狼短袖圆领T恤</p>', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 1, '2025-01-13', 89, '2025-03-31 00:00:00', 10);
COMMIT;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模块',
  `operate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作',
  `user_id` int DEFAULT NULL COMMENT '操作人ID',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统日志';

-- ----------------------------
-- Records of logs
-- ----------------------------
BEGIN;
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (88, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:01:28');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (89, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:03:10');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (90, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:07:49');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (91, '用户', '注册', NULL, '127.0.0.1', '2025-01-13 15:08:03');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (92, '用户', '登录', 50, '127.0.0.1', '2025-01-13 15:08:08');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (93, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:08:53');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (94, '用户', '修改密码', 1, '127.0.0.1', '2025-01-13 15:09:22');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (95, '用户', '修改密码', 1, '127.0.0.1', '2025-01-13 15:09:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (96, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:27:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (97, '用户', '注册', NULL, '127.0.0.1', '2025-01-13 15:28:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (98, '用户', '注册', NULL, '127.0.0.1', '2025-01-13 15:28:39');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (99, '用户', '登录', 52, '127.0.0.1', '2025-01-13 15:28:46');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (100, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:28:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (101, '用户', '登录', 1, '127.0.0.1', '2025-01-13 15:57:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (102, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:13:08');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (103, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:15:09');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (104, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:16:26');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (105, '用户', '登录', 52, '127.0.0.1', '2025-01-13 16:16:40');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (106, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:16:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (107, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:38:59');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (108, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:45:37');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (109, '用户', '登录', 52, '127.0.0.1', '2025-01-13 16:45:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (110, '用户', '登录', 1, '127.0.0.1', '2025-01-13 16:46:02');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (111, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:36:30');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (112, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:36:36');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (113, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:42:26');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (114, '用户', '登录', 1, '127.0.0.1', '2025-01-13 17:42:34');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (115, '用户', '登录', 1, '127.0.0.1', '2025-01-13 19:52:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (116, '用户', '登录', 1, '127.0.0.1', '2025-01-13 20:02:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (117, '用户', '登录', 1, '127.0.0.1', '2025-01-13 20:02:58');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (118, '用户', '登录', 1, '127.0.0.1', '2025-01-13 20:14:35');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (119, '用户', '登录', 1, '127.0.0.1', '2025-01-14 13:50:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (120, '用户', '登录', 1, '127.0.0.1', '2025-01-16 11:06:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (121, '用户', '登录', 1, '127.0.0.1', '2025-01-16 11:46:51');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (122, '用户', '登录', 52, '127.0.0.1', '2025-01-16 12:19:41');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (123, '用户', '登录', 1, '127.0.0.1', '2025-01-16 12:20:04');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (124, '用户', '登录', 52, '127.0.0.1', '2025-01-16 12:21:59');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (125, '用户', '登录', 1, '127.0.0.1', '2025-01-16 12:22:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (126, '用户', '登录', 52, '127.0.0.1', '2025-01-16 12:22:13');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (127, '用户', '登录', 1, '127.0.0.1', '2025-01-16 12:24:45');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (128, '订单', '创建订单成功，订单编号：【1879778334520963072】', 1, '127.0.0.1', '2025-01-16 14:30:54');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (129, '订单', '创建订单成功，订单编号：【1879780066286174208】', 1, '127.0.0.1', '2025-01-16 14:37:47');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (130, '用户', '登录', 1, '127.0.0.1', '2025-01-16 14:50:59');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (131, '订单', '创建订单成功，订单编号：【1879783849481273344】', 1, '127.0.0.1', '2025-01-16 14:52:49');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (132, '订单', '创建订单成功，订单编号：【1879786398917656576】', 1, '127.0.0.1', '2025-01-16 15:02:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (133, '订单', '创建订单成功，订单编号：【1879787265293090816】', 1, '127.0.0.1', '2025-01-16 15:06:23');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (134, '订单', '创建订单成功，订单编号：【1879787282489737216】', 1, '127.0.0.1', '2025-01-16 15:06:27');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (135, '用户', '登录', 1, '127.0.0.1', '2025-01-16 15:07:13');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (136, '订单', '创建订单成功，订单编号：【1879788310438150144】', 1, '127.0.0.1', '2025-01-16 15:10:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (137, '用户', '登录', 52, '127.0.0.1', '2025-01-16 15:10:58');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (138, '订单', '创建订单成功，订单编号：【1879788435394854912】', 52, '127.0.0.1', '2025-01-16 15:11:02');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (139, '订单', '创建订单成功，订单编号：【1879797886277451776】', 52, '127.0.0.1', '2025-01-16 15:48:35');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (140, '订单', '创建订单成功，订单编号：【1879802756220923904】', 52, '127.0.0.1', '2025-01-16 16:07:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (141, '订单', '订单发起支付，订单号【1879802756220923904】', 52, '127.0.0.1', '2025-01-16 16:07:58');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (142, '订单', '创建订单成功，订单编号：【1879802949079216128】', 52, '127.0.0.1', '2025-01-16 16:08:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (143, '订单', '订单发起支付，订单号【1879802949079216128】', 52, '127.0.0.1', '2025-01-16 16:08:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (144, '订单', '创建订单成功，订单编号：【1879802980188368896】', 52, '127.0.0.1', '2025-01-16 16:08:50');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (145, '订单', '订单发起支付，订单号【1879802980188368896】', 52, '127.0.0.1', '2025-01-16 16:08:50');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (146, '订单', '创建订单成功，订单编号：【1879803062178623488】', 52, '127.0.0.1', '2025-01-16 16:09:09');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (147, '订单', '订单发起支付，订单号【1879803062178623488】', 52, '127.0.0.1', '2025-01-16 16:09:09');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (148, '订单', '创建订单成功，订单编号：【1879804232607543296】', 52, '127.0.0.1', '2025-01-16 16:13:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (149, '订单', '订单发起支付，订单号【1879804232607543296】', 52, '127.0.0.1', '2025-01-16 16:13:49');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (150, '订单', '创建订单成功，订单编号：【1879804304388861952】', 52, '127.0.0.1', '2025-01-16 16:14:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (151, '订单', '订单发起支付，订单号【1879804304388861952】', 52, '127.0.0.1', '2025-01-16 16:14:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (152, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:14:41');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (153, '用户', '登录', 1, '127.0.0.1', '2025-01-16 16:15:10');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (154, '用户', '登录', 1, '127.0.0.1', '2025-01-16 16:17:59');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (155, '订单', '创建订单成功，订单编号：【1879806219294158848】', 1, '127.0.0.1', '2025-01-16 16:21:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (156, '订单', '订单发起支付，订单号【1879806219294158848】', 1, '127.0.0.1', '2025-01-16 16:21:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (157, '订单', '创建订单成功，订单编号：【1879806769502957568】', 1, '127.0.0.1', '2025-01-16 16:23:53');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (158, '订单', '订单发起支付，订单号【1879806769502957568】', 1, '127.0.0.1', '2025-01-16 16:23:53');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (159, '订单', '创建订单成功，订单编号：【1879807252942630912】', 1, '127.0.0.1', '2025-01-16 16:25:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (160, '订单', '订单发起支付，订单号【1879807252942630912】', 1, '127.0.0.1', '2025-01-16 16:25:49');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (161, '订单', '创建订单成功，订单编号：【1879807674671534080】', 1, '127.0.0.1', '2025-01-16 16:27:29');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (162, '订单', '订单发起支付，订单号【1879807674671534080】', 1, '127.0.0.1', '2025-01-16 16:27:30');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (163, '订单', '创建订单成功，订单编号：【1879809588222029824】', 1, '127.0.0.1', '2025-01-16 16:35:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (164, '订单', '订单发起支付，订单号【1879809588222029824】', 1, '127.0.0.1', '2025-01-16 16:35:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (165, '订单', '创建订单成功，订单编号：【1879809902404759552】', 1, '127.0.0.1', '2025-01-16 16:36:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (166, '订单', '订单发起支付，订单号【1879809902404759552】', 1, '127.0.0.1', '2025-01-16 16:36:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (167, '订单', '创建订单', 1, '127.0.0.1', '2025-01-16 16:41:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (168, '订单', '订单发起支付，订单号【1879811075891335168】', 1, '127.0.0.1', '2025-01-16 16:41:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (169, '订单', '创建订单', 1, '127.0.0.1', '2025-01-16 16:43:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (170, '订单', '订单发起支付，订单号【1879811783071961088】', 1, '127.0.0.1', '2025-01-16 16:43:49');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (171, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:44:07');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (172, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:44:26');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (173, '用户', '登录', 33, '127.0.0.1', '2025-01-16 16:44:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (174, '用户', '登录', 1, '127.0.0.1', '2025-01-16 16:44:53');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (175, '订单', '创建订单', 1, '127.0.0.1', '2025-01-16 16:45:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (176, '订单', '订单发起支付，订单号【1879812106314387456】', 1, '127.0.0.1', '2025-01-16 16:45:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (177, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:45:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (178, '用户', '登录', 26, '127.0.0.1', '2025-01-16 16:45:45');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (179, '订单', '创建订单', 26, '127.0.0.1', '2025-01-16 16:49:27');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (180, '订单', '订单发起支付，订单号【1879813200771850240】', 26, '127.0.0.1', '2025-01-16 16:49:27');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (181, '订单', '创建订单', 26, '127.0.0.1', '2025-01-16 16:54:38');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (182, '订单', '订单发起支付，订单号【1879814506785894400】', 26, '127.0.0.1', '2025-01-16 16:54:38');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (183, '用户', '登录', 1, '127.0.0.1', '2025-01-17 18:19:57');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (184, '用户', '登录', 1, '127.0.0.1', '2025-01-19 20:06:01');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (185, '用户', '登录', 1, '127.0.0.1', '2025-01-19 20:07:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (186, '用户', '登录', 26, '127.0.0.1', '2025-01-19 20:07:29');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (187, '订单', '创建订单', 26, '127.0.0.1', '2025-01-19 20:07:41');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (188, '订单', '订单发起支付，订单号【1880950253962158080】', 26, '127.0.0.1', '2025-01-19 20:07:43');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (189, '用户', '登录', 26, '127.0.0.1', '2025-01-19 20:11:51');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (190, '用户', '登录', 26, '127.0.0.1', '2025-02-15 12:40:30');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (191, '订单', '创建订单', 26, '127.0.0.1', '2025-02-15 12:40:38');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (192, '订单', '创建订单', 26, '127.0.0.1', '2025-02-15 12:40:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (193, '订单', '订单发起支付，订单号【1890622238036094976】', 26, '127.0.0.1', '2025-02-15 12:40:43');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (194, '用户', '登录', 1, '127.0.0.1', '2025-02-15 12:41:02');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (195, '用户', '登录', 1, '127.0.0.1', '2025-04-01 12:56:31');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (196, '用户', '登录', 26, '127.0.0.1', '2025-04-01 12:58:03');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (197, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 12:58:10');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (198, '订单', '订单发起支付，订单号【1906934087621472256】', 26, '127.0.0.1', '2025-04-01 12:58:10');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (199, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 12:58:39');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (200, '订单', '订单发起支付，订单号【1906934208622948352】', 26, '127.0.0.1', '2025-04-01 12:58:39');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (201, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 13:03:16');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (202, '订单', '订单发起支付，订单号【1906935370558459904】', 26, '127.0.0.1', '2025-04-01 13:03:16');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (203, '订单', '创建订单', 26, '127.0.0.1', '2025-04-01 13:03:39');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (204, '订单', '订单发起支付，订单号【1906935470093488128】', 26, '127.0.0.1', '2025-04-01 13:03:40');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (205, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:04:21');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (206, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:04:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (207, '用户', '登录', 1, '127.0.0.1', '2025-04-01 13:37:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (208, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:37:49');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (209, '用户', '登录', 1, '127.0.0.1', '2025-04-01 13:38:01');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (210, '用户', '登录', 26, '127.0.0.1', '2025-04-01 13:42:46');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (211, '用户', '登录', 1, '127.0.0.1', '2025-04-01 13:42:55');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (212, '用户', '注册', NULL, '127.0.0.1', '2025-04-01 13:58:41');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (213, '用户', '登录', 53, '127.0.0.1', '2025-04-01 13:58:50');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (214, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:08:04');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (215, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:11:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (216, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:11:52');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (217, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:12:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (218, '用户', '登录', 53, '127.0.0.1', '2025-04-01 14:13:21');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (219, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:17:18');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (220, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:19:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (221, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:20:27');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (222, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:20:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (223, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:21:37');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (224, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:21:46');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (225, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:23:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (226, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:25:35');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (227, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:25:40');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (228, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:25:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (229, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:25:54');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (230, '用户', '登录', 26, '127.0.0.1', '2025-04-01 14:26:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (231, '用户', '登录', 1, '127.0.0.1', '2025-04-01 14:26:54');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (232, '用户', '登录', 1, '127.0.0.1', '2025-04-02 09:29:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (233, '订单', '创建订单成功，订单编号：【1907245078821359616】', 1, '127.0.0.1', '2025-04-02 09:33:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (234, '订单', '订单发起支付，订单号【1907245078821359616】', 1, '127.0.0.1', '2025-04-02 09:33:58');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (235, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:20:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (236, '订单', '创建订单', 26, '127.0.0.1', '2025-04-02 10:20:13');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (237, '订单', '订单发起支付，订单号【1907256727238234112】', 26, '127.0.0.1', '2025-04-02 10:20:13');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (238, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:20:47');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (239, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:22:14');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (240, '用户', '登录', 33, '127.0.0.1', '2025-04-02 10:22:41');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (241, '订单', '创建订单', 33, '127.0.0.1', '2025-04-02 10:22:54');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (242, '订单', '订单发起支付，订单号【1907257403611697152】', 33, '127.0.0.1', '2025-04-02 10:22:55');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (243, '订单', '创建订单', 33, '127.0.0.1', '2025-04-02 10:23:04');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (244, '订单', '订单发起支付，订单号【1907257445919641600】', 33, '127.0.0.1', '2025-04-02 10:23:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (245, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:23:59');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (246, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:27:30');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (247, '订单', '创建订单成功，订单编号：【1907258688922603520】', 26, '127.0.0.1', '2025-04-02 10:28:01');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (248, '订单', '订单发起支付，订单号【1907258688922603520】', 26, '127.0.0.1', '2025-04-02 10:28:02');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (249, '用户', '登录', 33, '127.0.0.1', '2025-04-02 10:28:12');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (250, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:31:29');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (251, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:33:46');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (252, '用户', '登录', 26, '127.0.0.1', '2025-04-02 10:33:55');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (253, '用户', '登录', 1, '127.0.0.1', '2025-04-02 10:34:40');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (254, '用户', '登录', 26, '127.0.0.1', '2025-04-07 13:47:47');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (255, '用户', '登录', 26, '127.0.0.1', '2025-04-17 15:48:37');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (256, '订单', '创建订单成功，订单编号：【1912775209388322816】', 26, '127.0.0.1', '2025-04-17 15:48:42');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (257, '订单', '订单发起支付，订单号【1912775209388322816】', 26, '127.0.0.1', '2025-04-17 15:48:44');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (258, '订单', '订单发起支付，订单号【1912775209388322816】', 26, '127.0.0.1', '2025-04-17 16:04:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (259, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 16:04:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (260, '订单', '订单发起支付，订单号【1912779294241861632】', 26, '127.0.0.1', '2025-04-17 16:04:57');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (261, '订单', '订单发起支付，订单号【1912779294241861632】', 26, '127.0.0.1', '2025-04-17 16:09:35');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (262, '订单', '订单发起支付，订单号【1912779294241861632】', 26, '127.0.0.1', '2025-04-17 16:11:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (263, '订单', '订单发起支付，订单号【1912779294241861632】', 26, '127.0.0.1', '2025-04-17 16:12:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (264, '订单', '订单发起支付，订单号【1912779294241861632】', 26, '127.0.0.1', '2025-04-17 16:12:22');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (265, '订单', '订单发起支付，订单号【1912779294241861632】', 26, '127.0.0.1', '2025-04-17 16:13:37');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (266, '订单', '创建订单成功，订单编号：【1912781521945763840】', 26, '127.0.0.1', '2025-04-17 16:13:47');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (267, '订单', '订单发起支付，订单号【1912781521945763840】', 26, '127.0.0.1', '2025-04-17 16:13:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (268, '订单', '订单发起支付，订单号【1912781521945763840】', 26, '127.0.0.1', '2025-04-17 16:14:37');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (269, '订单', '订单发起支付，订单号【1912781521945763840】', 26, '127.0.0.1', '2025-04-17 16:18:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (270, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 16:18:26');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (271, '订单', '订单发起支付，订单号【1912782694069301248】', 26, '127.0.0.1', '2025-04-17 16:18:27');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (272, '订单', '订单发起支付，订单号【1912782694069301248】', 26, '127.0.0.1', '2025-04-17 16:19:43');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (273, '订单', '订单发起支付，订单号【1912782694069301248】', 26, '127.0.0.1', '2025-04-17 16:21:58');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (274, '订单', '订单发起支付，订单号【1912782694069301248】', 26, '127.0.0.1', '2025-04-17 16:25:12');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (275, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 16:25:28');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (276, '订单', '订单发起支付，订单号【1912784462601773056】', 26, '127.0.0.1', '2025-04-17 16:25:29');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (277, '用户', '登录', 1, '127.0.0.1', '2025-04-17 16:38:54');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (278, '订单', '创建订单', 1, '127.0.0.1', '2025-04-17 16:39:03');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (279, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:39:04');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (280, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:39:59');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (281, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:40:04');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (282, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:40:12');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (283, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:45:07');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (284, '订单', '创建订单成功，订单编号：【1912789562309210112】', 1, '127.0.0.1', '2025-04-17 16:45:44');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (285, '订单', '订单发起支付，订单号【1912789562309210112】', 1, '127.0.0.1', '2025-04-17 16:45:45');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (286, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:54:27');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (287, '订单', '订单发起支付，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 16:54:34');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (288, '订单', '订单支付回调成功，订单号【1912787879789322240】', 1, '119.42.228.163', '2025-04-17 16:55:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (289, '订单', '创建订单成功，订单编号：【1912793486378397696】', 1, '127.0.0.1', '2025-04-17 17:01:19');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (290, '订单', '订单发起支付，订单号【1912793486378397696】', 1, '127.0.0.1', '2025-04-17 17:01:21');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (291, '订单', '订单支付回调成功，订单号【1912793486378397696】', 1, '119.42.228.183', '2025-04-17 17:02:43');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (292, '用户', '登录', 1, '127.0.0.1', '2025-04-17 17:04:51');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (293, '订单', '创建订单', 1, '127.0.0.1', '2025-04-17 17:07:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (294, '订单', '订单发起支付，订单号【1912794999519703040】', 1, '127.0.0.1', '2025-04-17 17:07:21');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (295, '订单', '订单支付回调成功，订单号【1912794999519703040】', 1, '119.42.228.182', '2025-04-17 17:07:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (296, '订单', '创建订单成功，订单编号：【1912796268883865600】', 1, '127.0.0.1', '2025-04-17 17:12:23');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (297, '订单', '订单发起支付，订单号【1912796268883865600】', 1, '127.0.0.1', '2025-04-17 17:12:24');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (298, '订单', '订单支付回调成功，订单号【1912796268883865600】', 1, '119.42.228.163', '2025-04-17 17:12:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (299, '用户', '登录', 1, '127.0.0.1', '2025-04-17 17:14:25');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (300, '用户', '登录', 52, '127.0.0.1', '2025-04-17 17:18:39');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (301, '订单', '创建订单', 52, '127.0.0.1', '2025-04-17 17:18:45');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (302, '订单', '订单发起支付，订单号【1912797872089460736】', 52, '127.0.0.1', '2025-04-17 17:18:46');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (303, '订单', '订单支付回调成功，订单号【1912797872089460736】', 52, '119.42.228.162', '2025-04-17 17:19:09');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (304, '用户', '登录', 1, '127.0.0.1', '2025-04-17 17:34:43');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (305, '订单', '订单发起退款，订单号【1912797872089460736】', 52, '127.0.0.1', '2025-04-17 17:41:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (306, '订单', '订单发起退款，订单号【1912797872089460736】', 52, '127.0.0.1', '2025-04-17 17:41:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (307, '订单', '订单发起退款，订单号【1912797872089460736】', 52, '127.0.0.1', '2025-04-17 17:41:34');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (308, '用户', '登录', 26, '127.0.0.1', '2025-04-17 17:42:02');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (309, '用户', '登录', 26, '127.0.0.1', '2025-04-17 17:44:08');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (310, '订单', '订单发起退款，订单号【1912787879789322240】', 1, '127.0.0.1', '2025-04-17 17:44:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (311, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 17:49:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (312, '订单', '订单发起支付，订单号【1912805619891654656】', 26, '127.0.0.1', '2025-04-17 17:49:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (313, '订单', '订单支付回调成功，订单号【1912805619891654656】', 26, '119.42.228.167', '2025-04-17 17:49:52');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (314, '用户', '登录', 33, '127.0.0.1', '2025-04-17 17:51:30');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (315, '用户', '登录', 33, '127.0.0.1', '2025-04-17 17:55:15');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (316, '用户', '登录', 33, '127.0.0.1', '2025-04-17 17:55:25');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (317, '用户', '登录', 33, '127.0.0.1', '2025-04-17 17:56:23');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (318, '用户', '登录', 33, '127.0.0.1', '2025-04-17 17:56:28');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (319, '用户', '登录', 33, '127.0.0.1', '2025-04-17 17:57:01');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (320, '用户', '登录', 1, '127.0.0.1', '2025-04-17 17:57:20');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (321, '用户', '登录', 26, '127.0.0.1', '2025-04-17 17:57:40');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (322, '用户', '登录', 26, '127.0.0.1', '2025-04-17 17:58:44');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (323, '用户', '登录', 26, '127.0.0.1', '2025-04-17 18:07:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (324, '用户', '登录', 33, '127.0.0.1', '2025-04-17 18:26:34');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (325, '订单', '创建订单', 33, '127.0.0.1', '2025-04-17 18:26:45');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (326, '订单', '订单发起支付，订单号【1912814985705312256】', 33, '127.0.0.1', '2025-04-17 18:26:45');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (327, '订单', '订单支付回调成功，订单号【1912814985705312256】', 33, '119.42.228.183', '2025-04-17 18:27:06');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (328, '订单', '创建订单', 33, '127.0.0.1', '2025-04-17 18:27:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (329, '订单', '订单发起支付，订单号【1912815184490156032】', 33, '127.0.0.1', '2025-04-17 18:27:34');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (330, '订单', '订单支付回调成功，订单号【1912815184490156032】', 33, '119.42.228.162', '2025-04-17 18:27:53');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (331, '用户', '登录', 1, '127.0.0.1', '2025-04-17 18:28:05');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (332, '用户', '登录', 33, '127.0.0.1', '2025-04-17 18:28:33');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (333, '用户', '登录', 1, '127.0.0.1', '2025-04-17 18:29:15');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (334, '订单', '订单发起退款，订单号【1912796268883865600】', 1, '127.0.0.1', '2025-04-17 18:33:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (335, '用户', '登录', 26, '127.0.0.1', '2025-04-17 18:33:12');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (336, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 18:36:10');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (337, '订单', '订单发起支付，订单号【1912817354312691712】', 26, '127.0.0.1', '2025-04-17 18:36:11');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (338, '订单', '订单支付回调成功，订单号【1912817354312691712】', 26, '119.42.228.168', '2025-04-17 18:36:51');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (339, '订单', '订单发起支付，订单号【1912817354312691712】', 26, '127.0.0.1', '2025-04-17 18:38:47');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (340, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 18:39:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (341, '订单', '订单发起支付，订单号【1912818068833325056】', 26, '127.0.0.1', '2025-04-17 18:39:02');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (342, '订单', '订单支付回调成功，订单号【1912818068833325056】', 26, '119.42.228.168', '2025-04-17 18:39:23');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (343, '用户', '登录', 26, '127.0.0.1', '2025-04-17 18:40:16');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (344, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 18:40:23');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (345, '订单', '订单发起支付，订单号【1912818417233195008】', 26, '127.0.0.1', '2025-04-17 18:40:25');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (346, '订单', '订单支付回调成功，订单号【1912818417233195008】', 26, '119.42.228.168', '2025-04-17 18:40:48');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (347, '用户', '登录', 1, '127.0.0.1', '2025-04-17 18:41:11');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (348, '用户', '登录', 26, '127.0.0.1', '2025-04-17 18:41:25');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (349, '订单', '创建订单', 26, '127.0.0.1', '2025-04-17 18:48:56');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (350, '订单', '订单发起支付，订单号【1912820567833227264】', 26, '127.0.0.1', '2025-04-17 18:49:03');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (351, '订单', '订单支付回调成功，订单号【1912820567833227264】', 26, '119.42.228.171', '2025-04-17 18:49:26');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (352, '用户', '登录', 26, '127.0.0.1', '2025-04-17 18:49:43');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (353, '用户', '登录', 1, '127.0.0.1', '2025-04-17 18:49:50');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (354, '订单', '创建订单', 1, '127.0.0.1', '2025-04-17 18:54:39');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (355, '订单', '创建订单', 1, '127.0.0.1', '2025-04-17 18:59:00');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (356, '订单', '订单发起支付，订单号【1912823100538613760】', 1, '127.0.0.1', '2025-04-17 18:59:07');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (357, '订单', '订单支付回调成功，订单号【1912823100538613760】', 1, '119.42.228.168', '2025-04-17 18:59:26');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (358, '订单', '创建订单', 1, '127.0.0.1', '2025-04-17 19:01:07');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (359, '订单', '订单发起支付，订单号【1912823631935959040】', 1, '127.0.0.1', '2025-04-17 19:01:15');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (360, '订单', '订单支付回调成功，订单号【1912823631935959040】', 1, '119.42.228.163', '2025-04-17 19:01:35');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (361, '用户', '登录', 26, '127.0.0.1', '2025-04-17 19:02:32');
INSERT INTO `logs` (`id`, `module`, `operate`, `user_id`, `ip`, `time`) VALUES (362, '用户', '登录', 26, '127.0.0.1', '2025-04-17 19:02:48');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `num` int DEFAULT NULL COMMENT '购买数量',
  `total` decimal(10,2) DEFAULT NULL COMMENT '商品总价',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `user_id` int DEFAULT NULL COMMENT '创建人ID',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `pay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付单号',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单状态',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单类型',
  `group_order_id` int DEFAULT NULL COMMENT '拼团订单ID',
  `receiver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单信息';

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (57, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1879812106314387456', 1, '2025-01-16 16:45:06', NULL, NULL, 'NOT_PAY', 'GROUP', 59, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (58, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1879813200771850240', 26, '2025-01-16 16:49:26', NULL, NULL, 'NOT_PAY', 'GROUP', 57, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (59, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1879814506785894400', 26, '2025-01-16 16:54:38', NULL, NULL, 'NOT_PAY', 'GROUP', 57, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (60, 47, '好利来半熟芝士', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 80.00, 1, 80.00, '1880950253962158080', 26, '2025-01-19 20:07:41', NULL, NULL, 'NOT_PAY', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (61, 47, '好利来半熟芝士', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 80.00, 1, 80.00, '1890622220466155520', 26, '2025-02-15 12:40:38', NULL, NULL, 'NOT_PAY', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (62, 47, '好利来半熟芝士', 'http://localhost:8080/files/download/1736775614876-好利来半熟芝士.jpg', 80.00, 1, 80.00, '1890622238036094976', 26, '2025-02-15 12:40:42', NULL, NULL, 'NOT_PAY', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (63, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1906934087621472256', 26, '2025-04-01 12:58:10', NULL, NULL, 'NOT_PAY', 'GROUP', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (64, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1906934208622948352', 26, '2025-04-01 12:58:39', NULL, NULL, 'NOT_PAY', 'GROUP', 65, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (65, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1906935370558459904', 26, '2025-04-01 13:03:16', NULL, NULL, 'NOT_PAY', 'GROUP', 64, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (66, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1906935470093488128', 26, '2025-04-01 13:03:39', NULL, NULL, 'NOT_PAY', 'GROUP', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (67, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1907245078821359616', 1, '2025-04-02 09:33:56', NULL, NULL, 'NOT_PAY', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (68, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1907256727238234112', 26, '2025-04-02 10:20:13', NULL, NULL, 'NOT_PAY', 'GROUP', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (69, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1907257403611697152', 33, '2025-04-02 10:22:54', NULL, NULL, 'NOT_PAY', 'GROUP', 70, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (70, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 169.00, 1, 169.00, '1907257445919641600', 33, '2025-04-02 10:23:04', NULL, NULL, 'NOT_PAY', 'GROUP', 69, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (71, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1907258688922603520', 26, '2025-04-02 10:28:01', NULL, NULL, 'NOT_PAY', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (72, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1912775209388322816', 26, '2025-04-17 15:48:42', NULL, NULL, 'NOT_PAY', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (73, 42, '拖鞋', 'http://localhost:8080/files/download/1736775291475-拖鞋.jpg', 30.00, 1, 30.00, '1912779294241861632', 26, '2025-04-17 16:04:56', NULL, NULL, 'NOT_PAY', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (74, 43, '鼠标', 'http://localhost:8080/files/download/1736775366808-鼠标.jpg', 159.00, 1, 159.00, '1912781521945763840', 26, '2025-04-17 16:13:47', NULL, NULL, 'NOT_PAY', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (76, 41, '键盘', 'http://localhost:8080/files/download/1736774792886-键盘.jpg', 109.00, 1, 109.00, '1912784462601773056', 26, '2025-04-17 16:25:28', NULL, NULL, 'NOT_PAY', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (77, 45, '小当家干脆面', 'http://localhost:8080/files/download/1736775494192-小当家干脆面.jpg', 13.90, 1, 13.90, '1912787879789322240', 1, '2025-04-17 16:39:03', '2025041722001401650505236044', '2025-04-17 16:55:54', 'REFUND_DONE', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (78, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1912789562309210112', 1, '2025-04-17 16:45:44', NULL, NULL, 'NOT_PAY', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (79, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1912793486378397696', 1, '2025-04-17 17:01:19', '2025041722001401650505232179', '2025-04-17 17:02:41', 'DONE', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (80, 41, '键盘', 'http://localhost:8080/files/download/1736774792886-键盘.jpg', 109.00, 1, 109.00, '1912794999519703040', 1, '2025-04-17 17:07:20', '2025041722001401650505228077', '2025-04-17 17:07:46', 'NOT_ACCEPT', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (81, 49, '四川春见耙耙柑', 'http://localhost:8080/files/download/1736775725938-四川春见耙耙柑.jpg', 15.00, 1, 15.00, '1912796268883865600', 1, '2025-04-17 17:12:23', '2025041722001401650505230761', '2025-04-17 17:12:54', 'REFUND_DONE', 'FLASH', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (82, 44, 'LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫', 'http://localhost:8080/files/download/1736775427487-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg', 1499.00, 1, 1499.00, '1912797872089460736', 52, '2025-04-17 17:18:45', '2025041722001401650505230762', '2025-04-17 17:19:07', 'REFUND_DONE', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (84, 50, '七匹狼短袖圆领T恤', 'http://localhost:8080/files/download/1736775795231-七匹狼短袖圆领T恤.jpg', 239.00, 1, 239.00, '1912814985705312256', 33, '2025-04-17 18:26:45', '2025041722001401650505236047', '2025-04-17 18:27:05', 'IN_GROUP', 'GROUP', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (85, 44, 'LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫', 'http://localhost:8080/files/download/1736775427487-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg', 1499.00, 1, 1499.00, '1912815184490156032', 33, '2025-04-17 18:27:33', '2025041722001401650505236048', '2025-04-17 18:27:51', 'COMMENT_DONE', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (86, 45, '小当家干脆面', 'http://localhost:8080/files/download/1736775494192-小当家干脆面.jpg', 13.90, 1, 13.90, '1912817354312691712', 26, '2025-04-17 18:36:10', '2025041722001401650505233212', '2025-04-17 18:36:49', 'NOT_SEND', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (87, 42, '拖鞋', 'http://localhost:8080/files/download/1736775291475-拖鞋.jpg', 30.00, 1, 30.00, '1912818068833325056', 26, '2025-04-17 18:39:00', '2025041722001401650505226521', '2025-04-17 18:39:21', 'NOT_SEND', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (88, 44, 'LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫', 'http://localhost:8080/files/download/1736775427487-LIUWEN×ERDOS一字肩堆堆领抽条纯羊绒针织衫.jpg', 1499.00, 1, 1499.00, '1912818417233195008', 26, '2025-04-17 18:40:23', '2025041722001401650505226522', '2025-04-17 18:40:46', 'DONE', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (89, 46, '双汇热狗玉米肠', 'http://localhost:8080/files/download/1736775552704-双汇热狗玉米肠.jpg', 6.00, 1, 6.00, '1912820567833227264', 26, '2025-04-17 18:48:56', '2025041722001401650505234887', '2025-04-17 18:49:25', 'NOT_SEND', 'COMMON', NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (91, 42, '拖鞋', 'http://localhost:8080/files/download/1736775291475-拖鞋.jpg', 30.00, 1, 30.00, '1912823100538613760', 1, '2025-04-17 18:59:00', '2025041722001401650505225466', '2025-04-17 18:59:23', 'DONE', 'COMMON', NULL, 'zx', '111', '1234');
INSERT INTO `orders` (`id`, `goods_id`, `goods_name`, `goods_img`, `goods_price`, `num`, `total`, `order_no`, `user_id`, `create_time`, `pay_no`, `pay_time`, `status`, `type`, `group_order_id`, `receiver_name`, `receiver_phone`, `receiver_address`) VALUES (92, 45, '小当家干脆面', 'http://localhost:8080/files/download/1736775494192-小当家干脆面.jpg', 13.90, 1, 13.90, '1912823631935959040', 1, '2025-04-17 19:01:07', '2025041722001401650505230763', '2025-04-17 19:01:33', 'DONE', 'COMMON', NULL, 'jxb', '123', 'qaqaqa');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (1, 'admin', '5e33372df37bd2344fdb81aa28381f49', '管理员', 'ADMIN', 'http://localhost:8080/files/download/1736773027304-avatar.png', '15895051864', 'xingbaojiang43@outlook.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (26, 'user01', '9d25e15c76942f13d3be9039526474c9', 'user01', 'USER', 'http://localhost:8080/files/download/1743483846460-avatar.png', '1101', '1101@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (33, 'user02', '9d25e15c76942f13d3be9039526474c9', 'user02', 'USER', NULL, '1102', '1102@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (34, 'user03', '9d25e15c76942f13d3be9039526474c9', 'user03', 'USER', NULL, '1103', '1103@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (35, 'user04', '9d25e15c76942f13d3be9039526474c9', 'user04', 'USER', NULL, '1104', '1104@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (36, 'user05', '9d25e15c76942f13d3be9039526474c9', 'user05', 'USER', NULL, '1105', '1105@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (37, 'user06', '9d25e15c76942f13d3be9039526474c9', 'user06', 'USER', NULL, '1106', '1106@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (38, 'user07', '9d25e15c76942f13d3be9039526474c9', 'user07', 'USER', NULL, '1107', '1107@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (39, 'user08', '9d25e15c76942f13d3be9039526474c9', 'user08', 'USER', NULL, '1108', '1108@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (40, 'user09', '9d25e15c76942f13d3be9039526474c9', 'user09', 'USER', NULL, '1109', '1109@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (41, 'user10', '9d25e15c76942f13d3be9039526474c9', 'user10', 'USER', NULL, '1110', '1110@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (42, 'user11', '9d25e15c76942f13d3be9039526474c9', 'user11', 'USER', NULL, '1111', '1111@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (43, 'user12', '9d25e15c76942f13d3be9039526474c9', 'user12', 'USER', NULL, '1112', '1112@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (45, 'user13', '9d25e15c76942f13d3be9039526474c9', 'user13', 'USER', NULL, '1113', '1113@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (46, 'user14', '9d25e15c76942f13d3be9039526474c9', 'user14', 'USER', NULL, '1114', '1114@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (48, 'user15', '9d25e15c76942f13d3be9039526474c9', 'user15', 'USER', NULL, '1115', '1115@shop.com');
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (52, 'xingbao', '9d25e15c76942f13d3be9039526474c9', 'xingbao', 'USER', 'http://localhost:8080/files/download/1737001219737-avatar.png', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `name`, `role`, `avatar`, `phone`, `email`) VALUES (53, 'test', '9d25e15c76942f13d3be9039526474c9', 'test', 'USER', 'http://localhost:8080/files/download/1743487145314-avatar.png', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
