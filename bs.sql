/*
 Navicat Premium Data Transfer

 Source Server         : Test
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : beauty

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 23/06/2024 16:34:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for care
-- ----------------------------
DROP TABLE IF EXISTS `care`;
CREATE TABLE `care`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '项目描述',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of care
-- ----------------------------
INSERT INTO `care` VALUES (1, '面部护理', '清洁，按摩，面膜', 100.00);
INSERT INTO `care` VALUES (2, '美甲服务', '修剪、打磨、涂装指甲油', 80.00);
INSERT INTO `care` VALUES (3, '身体护理', '磨砂、身体按摩、身体乳液护理', 130.00);
INSERT INTO `care` VALUES (4, '化妆服务', '婚礼化妆、特殊场合化妆、日常化妆', 800.00);
INSERT INTO `care` VALUES (5, '水疗服务', '按摩、热敷、桑拿', 200.00);
INSERT INTO `care` VALUES (6, '美发服务', '洗剪吹、染发、烫发、护发', 230.00);

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UserID`(`user_id`) USING BTREE,
  CONSTRAINT `info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (1, 2, '明天美容', '2024-05-16 16:47:36', '2024-05-15 10:54:53');
INSERT INTO `info` VALUES (2, 4, '后天美容', '2024-06-21 19:43:52', '2024-05-10 10:54:58');
INSERT INTO `info` VALUES (3, 3, '四天后来美容', '2024-06-13 19:44:07', '2024-05-21 10:55:01');
INSERT INTO `info` VALUES (4, 4, '五天后来美容', '2024-06-22 19:44:35', '2024-02-14 10:55:05');
INSERT INTO `info` VALUES (5, 2, '后天来美容', '2024-06-16 19:44:52', '2024-05-22 20:55:11');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL COMMENT '订单ID',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `care_id` int(0) NULL DEFAULT NULL COMMENT '服务项目ID',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `status` enum('pending','confirmed','cancled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending' COMMENT '状态：如（pending）待确认、（confirmed）\r\n已确认、（concelld)已取消等',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UserID`(`user_id`) USING BTREE,
  INDEX `ServiceID`(`care_id`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`care_id`) REFERENCES `care` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 3, 3, '2024-05-08 16:43:56', '2024-04-11 10:54:02', '2024-05-23 10:54:26', 'confirmed');
INSERT INTO `order` VALUES (2, 3, 4, '2024-05-22 16:51:13', '2024-04-12 10:54:07', '2024-05-28 10:54:31', 'cancled');
INSERT INTO `order` VALUES (3, 2, 4, '2024-06-28 19:45:12', '2024-04-18 10:54:12', '2024-05-14 10:54:35', 'pending');
INSERT INTO `order` VALUES (4, 4, 2, '2024-06-27 19:45:30', '2024-03-20 10:54:18', '2024-05-15 10:54:40', 'cancled');
INSERT INTO `order` VALUES (5, 2, 3, '2024-06-21 19:46:02', '2024-04-02 10:54:22', '2024-05-16 10:54:45', 'confirmed');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `order_id` int(0) NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `status` enum('true','false','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'pending',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pay_ibfk_1`(`user_id`) USING BTREE,
  INDEX `pay_ibfk__2`(`order_id`) USING BTREE,
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_ibfk__2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (1, 1, 1, 80.00, '2024-06-19 19:50:25', '2024-05-25 10:52:22', 'true');
INSERT INTO `pay` VALUES (2, 2, 2, 120.00, '2024-06-20 19:51:09', '2024-05-23 15:52:32', 'pending');
INSERT INTO `pay` VALUES (3, 3, 3, 130.00, '2024-06-22 19:51:40', '2024-05-10 10:10:42', 'false');
INSERT INTO `pay` VALUES (4, 3, 4, 135.00, '2024-06-26 19:51:58', '2024-05-02 11:52:55', 'pending');
INSERT INTO `pay` VALUES (5, 2, 5, 160.00, '2024-07-06 19:52:33', '2024-05-03 01:53:01', 'pending');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '123456', 'admin', '15689456845', '张三');
INSERT INTO `user` VALUES (2, 'wangwu', '12345', 'user', '16234659491', '王五');
INSERT INTO `user` VALUES (3, 'zhangwu', '123456', 'user', '17569854256', '张五');
INSERT INTO `user` VALUES (4, 'dengyi', '123456', 'user', '12684968425', '邓一');
INSERT INTO `user` VALUES (5, 'chenger', '123456', 'admin', '15987162575', '程二');

SET FOREIGN_KEY_CHECKS = 1;
