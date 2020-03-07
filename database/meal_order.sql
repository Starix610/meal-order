/*
 Navicat MySQL Data Transfer

 Source Server         : Tobu
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : online_order

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 23/08/2019 18:47:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('1', '网上订餐系统', '广东省湛江市麻章区海大路1号广东海洋大学', '史文杰', '123456789', '/about/aboutDesc.txt');
INSERT INTO `about` VALUES ('2', 'Haha', '广东省', 'aaa', '123456', '/about/aboutDesc.txt');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'tobu', '646722');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('0', '全部');
INSERT INTO `category` VALUES ('1', '主食菜');
INSERT INTO `category` VALUES ('2', '套餐类');
INSERT INTO `category` VALUES ('3', '面食类');
INSERT INTO `category` VALUES ('4', '饮料');
INSERT INTO `category` VALUES ('5', '单点小食');
INSERT INTO `category` VALUES ('6', '滋补炖品');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('0da3a98d-6785-4634-a2c1-431ca34b6a80', 'tobu', '45543543', '2018-09-14 20:35:41', '45');
INSERT INTO `comment` VALUES ('160104c2-a124-4465-8d2c-7c1f88a17896', 'aaa', '年覅设计概算德邦合上巴德hugs的', '2018-09-06 19:23:06', '16');
INSERT INTO `comment` VALUES ('1d679efd-96a2-4178-9a65-755b8e18e4d4', 'aaa', '发生过似的个', '2018-09-06 20:35:31', '13');
INSERT INTO `comment` VALUES ('1d9e2f7e-23f7-45ee-b355-3636075de1be', 'aaa', '按时发撒', '2018-09-06 20:34:26', '13');
INSERT INTO `comment` VALUES ('4a21db6a-14b5-44db-96ce-6b9a3b1ac3a7', 'bbb', '阿斯顿再续费大发广泛的生过使馆', '2018-09-06 20:05:28', '16');
INSERT INTO `comment` VALUES ('50b717fd-9f97-4256-9a2f-f3a3c58aa61f', 'aaa', '按时发送', '2018-09-06 20:14:44', '21');
INSERT INTO `comment` VALUES ('6e331721-eeed-4fbf-b9a3-306f9cab99e7', 'aaa', '按时发送大哥', '2018-09-06 20:35:13', '13');
INSERT INTO `comment` VALUES ('72c7ea42-0eed-431d-9f1f-8601eb8657bc', 'aaa', '按时发撒', '2018-09-06 20:34:23', '13');
INSERT INTO `comment` VALUES ('7535d6bd-3013-4f0e-84b5-0b0fbe7049ea', 'aaa', '真好吃', '2018-10-30 10:28:05', '2');
INSERT INTO `comment` VALUES ('7d52f36d-3bc7-4376-9851-ffb9a14d46a5', 'aaa', '打SFSAFSD', '2018-09-06 20:37:07', '13');
INSERT INTO `comment` VALUES ('85bf2a10-5fcd-4326-a409-bb819f0d7c2f', 'aaa', '说法是高富帅的公司的', '2018-09-06 19:22:56', '16');
INSERT INTO `comment` VALUES ('8ff90f2b-ee0b-4df5-b381-75de3ba3431f', 'aaa', '按时发送大哥', '2018-09-06 20:35:13', '13');
INSERT INTO `comment` VALUES ('acf5f694-f624-4e0b-8005-a0b7d791f80d', 'aaa', '按时发撒', '2018-09-06 20:34:26', '13');
INSERT INTO `comment` VALUES ('b43a763a-b061-47a5-8359-babe7aef96a1', 'aaa', '按时发撒', '2018-09-06 20:34:23', '13');
INSERT INTO `comment` VALUES ('cd7bd1ba-d37a-42c4-a0c9-4f2a15cfe503', 'aaa', '发生过似的个', '2018-09-06 19:23:01', '16');
INSERT INTO `comment` VALUES ('fbb7165d-952f-45ee-8f05-69985e9dfa31', 'aaa', '测试评论', '2018-09-06 19:21:30', '16');
INSERT INTO `comment` VALUES ('ffc250a2-5c21-4361-a30b-3ece0bdf5426', 'aaa', '发生过似的个', '2018-09-06 20:35:31', '13');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `is_hot` int(2) NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '白菜', 10.00, 'menu/白菜.jpg', '2018-08-16', 1, '白菜', '1');
INSERT INTO `menu` VALUES ('10', '宫爆鸡丁', 26.00, 'menu/宫爆鸡丁.jpg', '2018-08-30', 0, '宫爆鸡丁', '1');
INSERT INTO `menu` VALUES ('11', '果蔬沙拉', 16.00, 'menu/果蔬沙拉.jpg', '2018-08-06', 1, '果蔬沙拉', '5');
INSERT INTO `menu` VALUES ('12', '海带排骨冬瓜汤', 40.00, 'menu/海带排骨冬瓜汤.jpg', '2018-08-05', 0, '海带排骨冬瓜汤', '6');
INSERT INTO `menu` VALUES ('13', '黑椒牛扒', 36.00, 'menu/黑椒牛扒.jpg', '2018-08-12', 1, '黑椒牛扒', '1');
INSERT INTO `menu` VALUES ('14', '红牛', 6.00, 'menu/红牛.jpg', '2018-09-09', 0, '红牛', '4');
INSERT INTO `menu` VALUES ('15', '红烧丸子饭', 12.50, 'menu/红烧丸子饭.jpg', '2018-08-01', 0, '红烧丸子饭', '2');
INSERT INTO `menu` VALUES ('16', '花雕醉鸡卷', 11.50, 'menu/花雕醉鸡卷.jpg', '2018-08-28', 0, '花雕醉鸡卷', '5');
INSERT INTO `menu` VALUES ('17', '家常素炒面', 11.00, 'menu/家常素炒面.jpg', '2018-08-02', 1, '家常素炒面', '3');
INSERT INTO `menu` VALUES ('18', '煎鸡蛋', 1.50, 'menu/煎鸡蛋.jpg', '2018-08-09', 0, '煎鸡蛋', '5');
INSERT INTO `menu` VALUES ('19', '烤鸡排套餐', 14.00, 'menu/烤鸡排套餐.jpg', '2018-08-24', 1, '烤鸡排套餐', '2');
INSERT INTO `menu` VALUES ('2', '拌面', 12.00, 'menu/拌面.jpg', '2018-08-27', 0, '拌面', '3');
INSERT INTO `menu` VALUES ('20', '可乐', 2.50, 'menu/可乐.jpg', '2018-08-14', 0, '可乐', '4');
INSERT INTO `menu` VALUES ('21', '口水鸡套餐', 12.50, 'menu/口水鸡套餐.jpg', '2018-08-22', 1, '口水鸡套餐', '2');
INSERT INTO `menu` VALUES ('22', '老火靓汤', 29.00, 'menu/老火靓汤.jpg', '2018-08-21', 0, '老火靓汤', '6');
INSERT INTO `menu` VALUES ('23', '卤水双拼套餐', 13.00, 'menu/卤水双拼套餐.jpg', '2018-08-31', 1, '卤水双拼套餐', '2');
INSERT INTO `menu` VALUES ('24', '麻婆豆腐', 12.00, 'menu/麻婆豆腐.jpg', '2018-08-17', 0, '麻婆豆腐', '1');
INSERT INTO `menu` VALUES ('25', '美味叉烧', 25.00, 'menu/美味叉烧.jpg', '2018-08-13', 1, '美味叉烧', '1');
INSERT INTO `menu` VALUES ('26', '美味鸡翅', 19.00, 'menu/美味鸡翅.jpg', '2018-08-04', 0, '美味鸡翅', '1');
INSERT INTO `menu` VALUES ('27', '米饭', 0.50, 'menu/米饭.jpg', '2018-08-26', 1, '米饭', '5');
INSERT INTO `menu` VALUES ('28', '秘制牛腩营养套餐', 13.00, 'menu/秘制牛腩营养套餐.jpg', '2018-08-25', 0, '秘制牛腩营养套餐', '2');
INSERT INTO `menu` VALUES ('29', '蜜汁鸡肉串', 9.00, 'menu/蜜汁鸡肉串.jpg', '2018-08-10', 1, '蜜汁鸡肉串', '5');
INSERT INTO `menu` VALUES ('3', '炒河粉', 11.00, 'menu/炒河粉.jpg', '2018-08-29', 1, '炒河粉', '3');
INSERT INTO `menu` VALUES ('30', '木桶鸡', 12.50, 'menu/木桶鸡.jpg', '2018-08-01', 0, '木桶鸡', '1');
INSERT INTO `menu` VALUES ('31', '柠檬C', 4.00, 'menu/柠檬C.jpg', '2018-08-15', 1, '柠檬C', '4');
INSERT INTO `menu` VALUES ('32', '柠香手抓大鸡排', 9.50, 'menu/柠香手抓大鸡排.jpg', '2018-08-20', 0, '柠香手抓大鸡排', '5');
INSERT INTO `menu` VALUES ('33', '牛扒套餐', 15.00, 'menu/牛扒套餐.jpg', '2018-08-03', 1, '牛扒套餐', '2');
INSERT INTO `menu` VALUES ('34', '牛排', 32.00, 'menu/牛排.jpg', '2018-08-19', 0, '牛排', '1');
INSERT INTO `menu` VALUES ('35', '青菜鸡蛋面', 12.00, 'menu/青菜鸡蛋面.jpg', '2018-08-30', 1, '青菜鸡蛋面', '3');
INSERT INTO `menu` VALUES ('36', '青瓜', 10.00, 'menu/青瓜.jpg', '2018-08-06', 0, '青瓜', '1');
INSERT INTO `menu` VALUES ('37', '清炒青虾', 30.00, 'menu/清炒青虾.jpg', '2018-08-05', 1, '清炒青虾', '1');
INSERT INTO `menu` VALUES ('38', '砂锅鸡汤', 25.00, 'menu/砂锅鸡汤.jpg', '2018-08-12', 0, '砂锅鸡汤', '6');
INSERT INTO `menu` VALUES ('39', '炭烧奶茶', 10.00, 'menu/炭烧奶茶.jpg', '2018-08-11', 1, '炭烧奶茶', '4');
INSERT INTO `menu` VALUES ('4', '炒米粉', 13.00, 'menu/炒米粉.jpg', '2018-08-23', 0, '炒米粉', '3');
INSERT INTO `menu` VALUES ('40', '汤河粉', 11.00, 'menu/汤河粉.jpg', '2018-08-28', 0, '汤河粉', '3');
INSERT INTO `menu` VALUES ('41', '糖醋排骨', 31.00, 'menu/糖醋排骨.jpg', '2018-08-08', 1, '糖醋排骨', '1');
INSERT INTO `menu` VALUES ('42', '甜辣玉米排骨', 30.00, 'menu/甜辣玉米排骨.jpg', '2018-08-02', 0, '甜辣玉米排骨', '1');
INSERT INTO `menu` VALUES ('43', '乌鸡栗子滋补汤', 32.00, 'menu/乌鸡栗子滋补汤.jpg', '2018-08-09', 1, '乌鸡栗子滋补汤', '6');
INSERT INTO `menu` VALUES ('44', '小龙虾', 28.00, 'menu/小龙虾.jpg', '2018-08-24', 0, '小龙虾', '1');
INSERT INTO `menu` VALUES ('45', '小笼粉蒸排骨', 26.00, 'menu/小笼粉蒸排骨.jpg', '2018-08-14', 1, '小笼粉蒸排骨', '1');
INSERT INTO `menu` VALUES ('46', '雪碧', 2.50, 'menu/雪碧.jpg', '2018-08-22', 0, '雪碧', '4');
INSERT INTO `menu` VALUES ('47', '扬州炒饭', 12.00, 'menu/扬州炒饭.jpg', '2018-08-21', 1, '扬州炒饭', '2');
INSERT INTO `menu` VALUES ('48', '鱼香肉丝', 26.00, 'menu/鱼香肉丝.jpg', '2018-08-31', 0, '鱼香肉丝', '1');
INSERT INTO `menu` VALUES ('49', '玉米排骨汤', 17.00, 'menu/玉米排骨汤.jpg', '2018-08-17', 1, '玉米排骨汤', '6');
INSERT INTO `menu` VALUES ('5', '葱香白切鸡', 25.00, 'menu/葱香白切鸡.jpg', '2018-08-18', 1, '葱香白切鸡', '1');
INSERT INTO `menu` VALUES ('50', '云吞面', 11.00, 'menu/云吞面.jpg', '2018-08-13', 0, '云吞面', '3');
INSERT INTO `menu` VALUES ('51', '猪肚鸡', 25.00, 'menu/猪肚鸡.jpg', '2018-08-04', 1, '猪肚鸡', '6');
INSERT INTO `menu` VALUES ('6', '脆骨肠', 3.00, 'menu/脆骨肠.jpg', '2018-08-07', 0, '脆骨肠', '5');
INSERT INTO `menu` VALUES ('7', '大闸蟹', 35.00, 'menu/大闸蟹.jpg', '2018-08-20', 1, '大闸蟹', '1');
INSERT INTO `menu` VALUES ('8', '番茄炒蛋', 10.50, 'menu/番茄炒蛋.jpg', '2018-08-03', 0, '番茄炒蛋', '1');
INSERT INTO `menu` VALUES ('9', '番茄刀削面', 12.00, 'menu/番茄刀削面.jpg', '2018-08-19', 1, '番茄刀削面', '3');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `msg_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('0aa30f7d-5a3e-42ab-abb6-3db39d2d9d88', '阿萨', 'aaa@qq.com', '123456555', '测试', '2018-09-10 17:40:52');
INSERT INTO `message` VALUES ('6dd6b9b4-293f-4226-89e6-251496432dbb', '阿萨', 'aaa@qq.com', '123456555', ' 测试111111', '2018-09-10 17:41:18');
INSERT INTO `message` VALUES ('d1460b64-b4ec-48b8-8418-7ee587779d70', '测试', '123@tobu.com', '123456', '建议测试 ', '2018-09-09 22:02:44');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_0001`(`mid`) USING BTREE,
  INDEX `fk_0002`(`oid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('00921bc1-b643-46cc-8ce3-d19ce8977d12', 1, 26, '10', 'bc1846ab-eff5-43c3-bb0e-77df7d6d1f1e');
INSERT INTO `orderitem` VALUES ('086241dd-3faa-46ec-859a-2417de80bef0', 10, 115, '16', 'a7a08f60-ae8b-4694-b5b2-2f4a3be3e6bd');
INSERT INTO `orderitem` VALUES ('0b3ac4e4-10fc-434c-9b22-5b3f4970c887', 10, 160, '11', '79aa7db2-bc89-41bf-87f6-181f3b45d2eb');
INSERT INTO `orderitem` VALUES ('0b51093b-b7ae-4b76-b135-296ee9b3f1be', 1, 26, '10', '0b4be416-2e25-4a52-b0f5-83db1a3058e3');
INSERT INTO `orderitem` VALUES ('0cf42c20-956c-4035-9578-b118293e4ff2', 1, 28, '44', '54d28abd-ceec-4d98-916e-b5f2eb85d668');
INSERT INTO `orderitem` VALUES ('0f16a745-bf16-43ea-9852-1d2ee2b04de5', 1, 16, '11', '302e5480-a532-4d0b-bd61-f98419f8e2b5');
INSERT INTO `orderitem` VALUES ('1b7a76b0-157c-4797-afbc-2523ee0f345a', 1, 12, '47', '16ae0061-f8f2-4060-a0a0-ddcb2d3ea91c');
INSERT INTO `orderitem` VALUES ('22b8d38d-8b12-4693-8f9f-8ec864b34805', 10, 25, '20', '4c94f23d-4f92-4c2e-8084-3ed5f82f3d48');
INSERT INTO `orderitem` VALUES ('246034b9-de7e-4f7c-91c8-c6766f332df7', 1, 0.5, '27', '5b82e4a7-7c47-48d4-bfc2-7a1167b7cc8f');
INSERT INTO `orderitem` VALUES ('2477f9a4-651c-4042-9f5e-0a4e2593e86b', 1, 25, '25', 'ee9e5505-ec62-4cc8-a0c1-52d9be3ef3c5');
INSERT INTO `orderitem` VALUES ('293603d1-e7b3-44ff-94b2-1d762ca4f600', 1, 10, '1', '7c9f838b-412a-4b0b-a514-26eb4766d7a0');
INSERT INTO `orderitem` VALUES ('32d83e87-8a10-4aad-800a-95724b164a4d', 2, 32, '11', '1f4eceff-9f9c-4fc7-a3cd-72d47bd1382a');
INSERT INTO `orderitem` VALUES ('34b63fb4-2bb0-446c-a329-0cfa978b9457', 1, 26, '10', 'e09ca8f3-5cf0-4d4a-b903-f88a819aa991');
INSERT INTO `orderitem` VALUES ('386c55a4-34bb-4c44-9737-cd9d6a1b7bc5', 1, 26, '10', '4ad333b5-1a6a-4d07-8597-4afe4908d01e');
INSERT INTO `orderitem` VALUES ('4516b510-9dbc-47a8-9b94-54df549b7a98', 1, 29, '22', '563fafb3-4d68-42e8-b040-4cff7a311188');
INSERT INTO `orderitem` VALUES ('4edf7811-1043-4dd4-a186-855435a7c2c5', 1, 9.5, '32', 'ee9e5505-ec62-4cc8-a0c1-52d9be3ef3c5');
INSERT INTO `orderitem` VALUES ('4f9d834f-565e-4571-8995-a60acbd5ccb1', 2, 24, '35', '910b6c7c-0e53-48a1-87a1-d9031c48a005');
INSERT INTO `orderitem` VALUES ('5943f083-f72c-49aa-a993-845d947a1a70', 24, 240, '1', '0b4be416-2e25-4a52-b0f5-83db1a3058e3');
INSERT INTO `orderitem` VALUES ('5c77f6bd-c1bc-4e5d-90e2-fa486c4c4e10', 1, 26, '45', 'c631b529-4a91-4f8c-b44b-431e44c041eb');
INSERT INTO `orderitem` VALUES ('5dd8e837-1610-4699-b043-3b987d7fcbb3', 1, 15, '33', '5c1f4085-9999-469a-8422-755d89549b84');
INSERT INTO `orderitem` VALUES ('6577a806-a03d-442b-a310-bbcb85fc81f4', 1, 19, '26', '910b6c7c-0e53-48a1-87a1-d9031c48a005');
INSERT INTO `orderitem` VALUES ('6fe18994-b399-472d-99f3-81cdfc4afaaf', 1, 1.5, '18', '7c9f838b-412a-4b0b-a514-26eb4766d7a0');
INSERT INTO `orderitem` VALUES ('752aef7f-f751-4e8d-a5eb-c3b0b36f655d', 1, 12, '2', '728d70ab-b792-44ea-a15d-79dcd2fbb1a6');
INSERT INTO `orderitem` VALUES ('7773a98e-5631-42ff-9a01-76e5a0fdf5e9', 1, 10, '36', '16ae0061-f8f2-4060-a0a0-ddcb2d3ea91c');
INSERT INTO `orderitem` VALUES ('79d238b9-f113-480c-8667-cdbea71c23c5', 1, 12, '2', 'aa07db98-42af-4a7e-9b22-c1b1c7600244');
INSERT INTO `orderitem` VALUES ('7e541c8a-65c7-4304-a847-31e576bb425b', 1, 1.5, '18', '0b4be416-2e25-4a52-b0f5-83db1a3058e3');
INSERT INTO `orderitem` VALUES ('7f5b885f-003e-481c-a396-77115c1f149e', 1, 12, '2', 'd0fff944-c216-4db4-949d-d6d6e643a0d5');
INSERT INTO `orderitem` VALUES ('7f790ae3-eafa-469b-a7e1-ade9524c3832', 24, 240, '1', 'd0fff944-c216-4db4-949d-d6d6e643a0d5');
INSERT INTO `orderitem` VALUES ('7fd1f613-ff2f-43e2-a299-7ff15589591d', 1, 1.5, '18', 'd0fff944-c216-4db4-949d-d6d6e643a0d5');
INSERT INTO `orderitem` VALUES ('8415a564-5c33-4527-998e-553e0df5dca5', 1, 12, '2', '7c9f838b-412a-4b0b-a514-26eb4766d7a0');
INSERT INTO `orderitem` VALUES ('88bc9090-d475-4e6a-8883-d0c7ec56ff28', 1, 16, '11', 'f54628fe-4a42-422a-9e3e-a2fd7cefa9cc');
INSERT INTO `orderitem` VALUES ('8e58f90d-eecc-4f71-9a19-7eb76ea3c0a2', 1, 36, '13', '563fafb3-4d68-42e8-b040-4cff7a311188');
INSERT INTO `orderitem` VALUES ('8f274ba9-b4a5-435f-9dfe-3aa847f8ff10', 1, 26, '45', '34295939-4688-4250-bbc2-3977e39b1bcf');
INSERT INTO `orderitem` VALUES ('9b1d8955-b502-4d09-9309-01d86c9e2490', 1, 25, '5', '910b6c7c-0e53-48a1-87a1-d9031c48a005');
INSERT INTO `orderitem` VALUES ('ac901887-eced-4120-8fad-d5410a05e5bc', 1, 1.5, '18', '1019fcd1-c112-404f-bf75-57ef314ea208');
INSERT INTO `orderitem` VALUES ('b404571c-dda2-4ef1-9751-9373c936a9dc', 1, 10, '1', '5ba940c5-597b-48ac-b328-ce25e01e4023');
INSERT INTO `orderitem` VALUES ('b4d726c4-b3f9-4c44-b70d-ad71fdc836ac', 1, 36, '13', 'ef4a90c1-c963-47c4-87c8-4b218b4cc3fb');
INSERT INTO `orderitem` VALUES ('ba95c4ae-8abd-4d93-83a1-bb19ddfce909', 1, 15, '33', '44de6ca8-b56a-479f-aef8-08b75e3b8b11');
INSERT INTO `orderitem` VALUES ('ba9f6c07-d603-46a5-977f-61111d49c250', 1, 12, '2', '3fa0077a-012c-4aa8-88ec-1b3c3503d7b8');
INSERT INTO `orderitem` VALUES ('be28c01a-dbe3-4365-9c87-04ade047e580', 2, 64, '43', '5c1f4085-9999-469a-8422-755d89549b84');
INSERT INTO `orderitem` VALUES ('c20333cf-916f-41e5-8375-27df6680d5ab', 1, 9, '29', '44de6ca8-b56a-479f-aef8-08b75e3b8b11');
INSERT INTO `orderitem` VALUES ('c26e99de-f9e9-4935-affb-50a23c940ec9', 1, 26, '10', '7c9f838b-412a-4b0b-a514-26eb4766d7a0');
INSERT INTO `orderitem` VALUES ('c3fd39d1-f785-4f52-88cb-d4a1b1f2fac5', 1, 26, '10', 'd0fff944-c216-4db4-949d-d6d6e643a0d5');
INSERT INTO `orderitem` VALUES ('ca0325e6-69c9-4f44-a7c0-9b803585ad5d', 10, 15, '18', 'f6b332c1-080d-4479-8c5d-e118c5da90b6');
INSERT INTO `orderitem` VALUES ('d5211c14-cb9f-4e86-8f93-45dff7a59da4', 1, 4, '31', 'ef4a90c1-c963-47c4-87c8-4b218b4cc3fb');
INSERT INTO `orderitem` VALUES ('d6c38aa1-659c-4ab8-8484-f6983ba7c0ff', 2, 80, '12', '0e10c3c3-2f79-4f12-beed-62feef399444');
INSERT INTO `orderitem` VALUES ('d9447073-ec21-40fd-becf-cc590f1909c9', 1, 12, '2', '0b4be416-2e25-4a52-b0f5-83db1a3058e3');
INSERT INTO `orderitem` VALUES ('da67c07e-5728-4b0f-aaec-ecb183f465dd', 1, 10, '1', 'e09ca8f3-5cf0-4d4a-b903-f88a819aa991');
INSERT INTO `orderitem` VALUES ('df072721-c839-433e-a34a-867b2a09b159', 2, 50, '5', '1019fcd1-c112-404f-bf75-57ef314ea208');
INSERT INTO `orderitem` VALUES ('e0d313f9-ec26-4ece-b8b0-21caf5ec024b', 1, 15, '33', '5b82e4a7-7c47-48d4-bfc2-7a1167b7cc8f');
INSERT INTO `orderitem` VALUES ('e573ec28-eff3-4faa-aeb8-a985012b5a79', 1, 32, '43', '54d28abd-ceec-4d98-916e-b5f2eb85d668');
INSERT INTO `orderitem` VALUES ('ea8cf518-3c1f-4b34-bb41-eb71edd4cba2', 1, 15, '33', '1019fcd1-c112-404f-bf75-57ef314ea208');
INSERT INTO `orderitem` VALUES ('f05623ae-a353-4e0f-aa85-d6daf9b55eab', 1, 6, '14', '1356c854-2f36-4d59-b9e8-709db075374d');
INSERT INTO `orderitem` VALUES ('f23ca132-5edf-44d2-8818-ec6b3a46ce35', 1, 11, '17', '50457619-b446-4776-ac57-55eb3ef127ce');
INSERT INTO `orderitem` VALUES ('f901832e-ef9a-4ae3-ac72-b0e4223b444c', 1, 26, '10', '8cc2c266-4451-43fa-a9d4-570f3202acfb');
INSERT INTO `orderitem` VALUES ('fa2142fa-ef99-4186-bcf5-bbc1c83512dd', 1, 16, '11', 'aa9e3d46-841a-4cd9-837d-c874fe093a7a');
INSERT INTO `orderitem` VALUES ('ffca4c3d-0c57-4a81-bc59-330aae0577a3', 1, 25, '25', '5ba940c5-597b-48ac-b328-ce25e01e4023');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` datetime NULL DEFAULT NULL,
  `total_price` double NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0b4be416-2e25-4a52-b0f5-83db1a3058e3', '2018-09-03 16:50:14', 279.5, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('0e10c3c3-2f79-4f12-beed-62feef399444', '2018-09-05 15:47:32', 80, 1, 'asagasg', 'haha', '123456', 'bbb');
INSERT INTO `orders` VALUES ('1019fcd1-c112-404f-bf75-57ef314ea208', '2018-09-03 22:47:22', 66.5, 1, 'gd', 'swj', '66651515', '1');
INSERT INTO `orders` VALUES ('1356c854-2f36-4d59-b9e8-709db075374d', '2018-09-03 22:15:30', 6, 1, 'sbsb', '123', '萨芬', '1');
INSERT INTO `orders` VALUES ('16ae0061-f8f2-4060-a0a0-ddcb2d3ea91c', '2018-09-05 15:57:47', 22, 1, 'asagasg', '萨芬', '214123', 'bbb');
INSERT INTO `orders` VALUES ('1f4eceff-9f9c-4fc7-a3cd-72d47bd1382a', '2018-09-03 22:42:17', 86, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('302e5480-a532-4d0b-bd61-f98419f8e2b5', '2018-09-16 19:58:52', 16, 0, NULL, NULL, NULL, '654ad96c-b788-4c71-b9a8-4f96e7c640d9');
INSERT INTO `orders` VALUES ('34295939-4688-4250-bbc2-3977e39b1bcf', '2018-09-14 20:36:58', 26, 0, NULL, NULL, NULL, '654ad96c-b788-4c71-b9a8-4f96e7c640d9');
INSERT INTO `orders` VALUES ('3fa0077a-012c-4aa8-88ec-1b3c3503d7b8', '2018-09-03 21:51:18', 12, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('44de6ca8-b56a-479f-aef8-08b75e3b8b11', '2018-09-10 18:50:21', 24, 1, 'gdou', 'swj', '1234564325', '654ad96c-b788-4c71-b9a8-4f96e7c640d9');
INSERT INTO `orders` VALUES ('4ad333b5-1a6a-4d07-8597-4afe4908d01e', '2018-09-03 16:49:28', 26, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('4c94f23d-4f92-4c2e-8084-3ed5f82f3d48', '2018-09-03 20:40:44', 25, 1, 'gdou', 'aaa', '122142423', '1');
INSERT INTO `orders` VALUES ('50457619-b446-4776-ac57-55eb3ef127ce', '2018-09-03 22:36:12', 11, 1, 'zzzz', 'wqrwq', '峰会将于', '1');
INSERT INTO `orders` VALUES ('54d28abd-ceec-4d98-916e-b5f2eb85d668', '2018-09-03 21:31:59', 60, 1, '', '', '', '1');
INSERT INTO `orders` VALUES ('563fafb3-4d68-42e8-b040-4cff7a311188', '2018-09-05 15:32:52', 65, 1, 'asagasg', '撒打发', '65156515', 'bbb');
INSERT INTO `orders` VALUES ('5b82e4a7-7c47-48d4-bfc2-7a1167b7cc8f', '2018-09-05 15:34:14', 15.5, 1, 'asagasg', '按时发的符号', '123124534', 'bbb');
INSERT INTO `orders` VALUES ('5ba940c5-597b-48ac-b328-ce25e01e4023', '2018-09-03 19:42:51', 35, 1, 'gdou', 'aaa', '1231231214', '1');
INSERT INTO `orders` VALUES ('5c1f4085-9999-469a-8422-755d89549b84', '2018-09-04 19:19:56', 79, 1, 'zzzz', '啊反倒是发', '63635-65', '396feab3-c366-4874-a81c-bae7ccbacf84');
INSERT INTO `orders` VALUES ('728d70ab-b792-44ea-a15d-79dcd2fbb1a6', '2018-09-03 21:51:15', 12, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('79aa7db2-bc89-41bf-87f6-181f3b45d2eb', '2018-09-05 15:35:13', 160, 1, 'asagasg', '按时发的符号飞洒', '12313124214', 'bbb');
INSERT INTO `orders` VALUES ('7c9f838b-412a-4b0b-a514-26eb4766d7a0', '2018-09-03 16:50:04', 49.5, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('8cc2c266-4451-43fa-a9d4-570f3202acfb', '2018-09-03 22:17:48', 26, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('910b6c7c-0e53-48a1-87a1-d9031c48a005', '2018-09-10 22:42:42', 68, 1, 'gdou', 'swj', '1234567891111', '654ad96c-b788-4c71-b9a8-4f96e7c640d9');
INSERT INTO `orders` VALUES ('a7a08f60-ae8b-4694-b5b2-2f4a3be3e6bd', '2018-09-05 15:44:35', 115, 1, 'asagasg', '阿萨', '66651515', 'bbb');
INSERT INTO `orders` VALUES ('aa07db98-42af-4a7e-9b22-c1b1c7600244', '2018-09-03 21:51:21', 12, 1, '', '', '', '1');
INSERT INTO `orders` VALUES ('aa9e3d46-841a-4cd9-837d-c874fe093a7a', '2018-09-04 18:15:38', 16, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('bc1846ab-eff5-43c3-bb0e-77df7d6d1f1e', '2018-09-03 22:37:54', 26, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('c631b529-4a91-4f8c-b44b-431e44c041eb', '2018-09-14 20:39:41', 26, 0, NULL, NULL, NULL, '654ad96c-b788-4c71-b9a8-4f96e7c640d9');
INSERT INTO `orders` VALUES ('d0fff944-c216-4db4-949d-d6d6e643a0d5', '2018-09-03 16:50:24', 279.5, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('e09ca8f3-5cf0-4d4a-b903-f88a819aa991', '2018-09-03 19:48:11', 36, 1, 'gdou', 'aaa', '123123', '1');
INSERT INTO `orders` VALUES ('ee9e5505-ec62-4cc8-a0c1-52d9be3ef3c5', '2018-09-05 14:45:25', 34.5, 0, NULL, NULL, NULL, '1');
INSERT INTO `orders` VALUES ('ef4a90c1-c963-47c4-87c8-4b218b4cc3fb', '2018-09-03 19:40:39', 40, 1, 'gdou', 'swj', '123456789', '1');
INSERT INTO `orders` VALUES ('f54628fe-4a42-422a-9e3e-a2fd7cefa9cc', '2018-09-16 19:53:23', 16, 0, NULL, NULL, NULL, '654ad96c-b788-4c71-b9a8-4f96e7c640d9');
INSERT INTO `orders` VALUES ('f6b332c1-080d-4479-8c5d-e118c5da90b6', '2018-09-05 15:39:07', 15, 1, 'asagasg', '啊发撒', '6363565', 'bbb');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `sex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `point` double(255, 0) NULL DEFAULT 0,
  `age` int(11) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', '123', '阿萨', 'aaa@qq.com', '123456555', '2009-09-15', 'female', 1, '123', 500, 30, 'user_image/Cg-4zFU5saeIEEOaAAcatIe29xYAAXVdAEdnLsABxrM840.jpg');
INSERT INTO `user` VALUES ('4c29296c-0ceb-49e8-b9f1-82287fefa3d7', '测试1', '646722', 'haha', '413412007@qq.com', '123456789', '2018-09-10', 'male', 0, 'b4fde901-c7d7-48df-97a8-b50080abbd1f', 0, 0, 'user_image/default.jpg');
INSERT INTO `user` VALUES ('5be9a9c7-452b-4a93-8c75-43d3486438de', '测试2', '646722', 'haha', '413412007@qq.com', '123456789', '2018-09-10', 'male', 1, 'f787006d-32d1-411e-9d3a-93210af6c9cf', 0, 0, 'user_image/default.jpg');
INSERT INTO `user` VALUES ('654ad96c-b788-4c71-b9a8-4f96e7c640d9', 'tobu', '646722', 'swj', '646722505@qq.com', '123456789', '2018-09-01', 'male', 1, '4e0d0a5d-77b3-41b1-b919-8a4af960ca89', 92, 0, 'user_image/default.jpg');
INSERT INTO `user` VALUES ('d951464f-3d51-48ad-8ca8-307383f48e6f', '测试', '123456', 'mca', '413412007@qq.com', '123456789', '2018-09-01', 'male', 1, 'bd47d301-4eb8-404a-8bd3-c9392ad52c26', 0, 0, 'user_image/default.jpg');

SET FOREIGN_KEY_CHECKS = 1;
