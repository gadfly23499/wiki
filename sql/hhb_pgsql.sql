/*
 Navicat Premium Data Transfer

 Source Server         : 32.14.14.35(test)
 Source Server Type    : PostgreSQL
 Source Server Version : 90424
 Source Host           : 32.14.14.35:5432
 Source Catalog        : test
 Source Schema         : hhb

 Target Server Type    : PostgreSQL
 Target Server Version : 90424
 File Encoding         : 65001

 Date: 27/03/2023 11:31:05
*/


-- ----------------------------
-- Sequence structure for category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "hhb"."category_id_seq";
CREATE SEQUENCE "hhb"."category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for content_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "hhb"."content_id_seq";
CREATE SEQUENCE "hhb"."content_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for doc_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "hhb"."doc_id_seq";
CREATE SEQUENCE "hhb"."doc_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ebook_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "hhb"."ebook_id_seq";
CREATE SEQUENCE "hhb"."ebook_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ebook_snapshot_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "hhb"."ebook_snapshot_id_seq";
CREATE SEQUENCE "hhb"."ebook_snapshot_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "hhb"."category";
CREATE TABLE "hhb"."category" (
  "id" int8 NOT NULL DEFAULT nextval('"hhb".category_id_seq'::regclass),
  "parent" int8 NOT NULL DEFAULT 0,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "sort" int4
)
;
COMMENT ON COLUMN "hhb"."category"."id" IS 'id';
COMMENT ON COLUMN "hhb"."category"."parent" IS '父id';
COMMENT ON COLUMN "hhb"."category"."name" IS '名称';
COMMENT ON COLUMN "hhb"."category"."sort" IS '顺序';
COMMENT ON TABLE "hhb"."category" IS '分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO "hhb"."category" VALUES (301, 300, '基础应用', 301);
INSERT INTO "hhb"."category" VALUES (100, 0, '前端开发', 100);
INSERT INTO "hhb"."category" VALUES (101, 100, 'Vue', 101);
INSERT INTO "hhb"."category" VALUES (202, 200, '框架应用', 202);
INSERT INTO "hhb"."category" VALUES (102, 100, 'HTML & CSS', 102);
INSERT INTO "hhb"."category" VALUES (300, 0, 'Python', 300);
INSERT INTO "hhb"."category" VALUES (400, 0, '数据库', 400);
INSERT INTO "hhb"."category" VALUES (302, 300, '进阶方向应用', 302);
INSERT INTO "hhb"."category" VALUES (501, 500, '服务器', 501);
INSERT INTO "hhb"."category" VALUES (401, 400, 'MySQL', 401);
INSERT INTO "hhb"."category" VALUES (503, 500, '热门服务端语言', 503);
INSERT INTO "hhb"."category" VALUES (500, 0, '其它', 500);
INSERT INTO "hhb"."category" VALUES (502, 500, '开发工具', 502);
INSERT INTO "hhb"."category" VALUES (200, 0, 'Java', 200);
INSERT INTO "hhb"."category" VALUES (201, 200, '基础应用', 201);

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS "hhb"."content";
CREATE TABLE "hhb"."content" (
  "id" int8 NOT NULL DEFAULT nextval('"hhb".content_id_seq'::regclass),
  "content" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "hhb"."content"."id" IS 'id';
COMMENT ON COLUMN "hhb"."content"."content" IS '内容';
COMMENT ON TABLE "hhb"."content" IS '文档内容';

-- ----------------------------
-- Records of content
-- ----------------------------

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS "hhb"."doc";
CREATE TABLE "hhb"."doc" (
  "id" int8 NOT NULL DEFAULT nextval('"hhb".doc_id_seq'::regclass),
  "ebook_id" int8 NOT NULL DEFAULT 0,
  "parent" int8 NOT NULL DEFAULT 0,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4,
  "view_count" int4 DEFAULT 0,
  "vote_count" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "hhb"."doc"."id" IS 'id';
COMMENT ON COLUMN "hhb"."doc"."ebook_id" IS '电子书id';
COMMENT ON COLUMN "hhb"."doc"."parent" IS '父id';
COMMENT ON COLUMN "hhb"."doc"."name" IS '名称';
COMMENT ON COLUMN "hhb"."doc"."sort" IS '顺序';
COMMENT ON COLUMN "hhb"."doc"."view_count" IS '阅读数';
COMMENT ON COLUMN "hhb"."doc"."vote_count" IS '点赞数';
COMMENT ON TABLE "hhb"."doc" IS '文档';

-- ----------------------------
-- Records of doc
-- ----------------------------
INSERT INTO "hhb"."doc" VALUES (1, 1, 0, '文档1', 1, 0, 0);
INSERT INTO "hhb"."doc" VALUES (3, 1, 0, '文档2', 2, 0, 0);
INSERT INTO "hhb"."doc" VALUES (2, 1, 1, '文档1.1', 1, 0, 0);
INSERT INTO "hhb"."doc" VALUES (4, 1, 3, '文档2.1', 1, 0, 0);
INSERT INTO "hhb"."doc" VALUES (5, 1, 3, '文档2.2', 2, 0, 0);
INSERT INTO "hhb"."doc" VALUES (6, 1, 5, '文档2.2.1', 1, 0, 0);

-- ----------------------------
-- Table structure for ebook
-- ----------------------------
DROP TABLE IF EXISTS "hhb"."ebook";
CREATE TABLE "hhb"."ebook" (
  "id" int8 NOT NULL DEFAULT nextval('"hhb".ebook_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "category1_id" int8,
  "category2_id" int8,
  "description" varchar(200) COLLATE "pg_catalog"."default",
  "cover" varchar(200) COLLATE "pg_catalog"."default",
  "doc_count" int4 NOT NULL DEFAULT 0,
  "view_count" int4 NOT NULL DEFAULT 0,
  "vote_count" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "hhb"."ebook"."id" IS 'id';
COMMENT ON COLUMN "hhb"."ebook"."name" IS '名称';
COMMENT ON COLUMN "hhb"."ebook"."category1_id" IS '分类1';
COMMENT ON COLUMN "hhb"."ebook"."category2_id" IS '分类2';
COMMENT ON COLUMN "hhb"."ebook"."description" IS '描述';
COMMENT ON COLUMN "hhb"."ebook"."cover" IS '封面';
COMMENT ON COLUMN "hhb"."ebook"."doc_count" IS '文档数';
COMMENT ON COLUMN "hhb"."ebook"."view_count" IS '阅读数';
COMMENT ON COLUMN "hhb"."ebook"."vote_count" IS '点赞数';
COMMENT ON TABLE "hhb"."ebook" IS '电子书';

-- ----------------------------
-- Records of ebook
-- ----------------------------
INSERT INTO "hhb"."ebook" VALUES (3, 'Python 入门教程', NULL, NULL, '零基础入门 Python 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO "hhb"."ebook" VALUES (4, 'Mysql 入门教程', NULL, NULL, '零基础入门 Mysql 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO "hhb"."ebook" VALUES (1, 'Spring Boot 入门教程', NULL, NULL, '零基础入门 Java 开发，企业级应用开发最佳首选框架', NULL, 6, 0, 0);
INSERT INTO "hhb"."ebook" VALUES (2, 'Vue 入门教程', NULL, NULL, '零基础入门 Vue 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO "hhb"."ebook" VALUES (5, 'Oracle 入门教程', NULL, NULL, '零基础入门 Oracle 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for ebook_snapshot
-- ----------------------------
DROP TABLE IF EXISTS "hhb"."ebook_snapshot";
CREATE TABLE "hhb"."ebook_snapshot" (
  "id" int8 NOT NULL DEFAULT nextval('"hhb".ebook_snapshot_id_seq'::regclass),
  "ebook_id" int8 NOT NULL DEFAULT 0,
  "date" date NOT NULL,
  "view_count" int4 NOT NULL DEFAULT 0,
  "vote_count" int4 NOT NULL DEFAULT 0,
  "view_increase" int4 NOT NULL DEFAULT 0,
  "vote_increase" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "hhb"."ebook_snapshot"."id" IS 'id';
COMMENT ON COLUMN "hhb"."ebook_snapshot"."ebook_id" IS '电子书id';
COMMENT ON COLUMN "hhb"."ebook_snapshot"."date" IS '快照日期';
COMMENT ON COLUMN "hhb"."ebook_snapshot"."view_count" IS '阅读数';
COMMENT ON COLUMN "hhb"."ebook_snapshot"."vote_count" IS '点赞数';
COMMENT ON COLUMN "hhb"."ebook_snapshot"."view_increase" IS '阅读增长';
COMMENT ON COLUMN "hhb"."ebook_snapshot"."vote_increase" IS '点赞增长';

-- ----------------------------
-- Records of ebook_snapshot
-- ----------------------------
INSERT INTO "hhb"."ebook_snapshot" VALUES (77, 1, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (78, 3, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (95, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (97, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (99, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (98, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (100, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (109, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (126, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (138, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (156, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (166, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (169, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (171, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (172, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (177, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (204, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (208, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (209, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (212, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (214, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (216, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (219, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (222, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (223, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (226, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (242, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (246, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (250, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (264, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (278, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (290, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (296, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (300, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (308, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (318, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (326, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (331, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (342, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (357, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (366, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (368, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (375, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (394, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (395, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (398, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (417, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (418, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (419, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (428, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (433, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (435, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (440, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (80, 5, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (94, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (115, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (121, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (137, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (140, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (141, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (149, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (160, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (164, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (170, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (182, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (188, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (202, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (203, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (218, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (230, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (247, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (255, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (258, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (262, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (263, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (265, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (269, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (284, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (302, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (307, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (329, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (332, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (340, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (347, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (392, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (397, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (412, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (423, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (79, 2, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (82, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (89, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (93, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (106, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (108, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (113, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (114, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (117, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (119, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (125, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (127, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (132, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (153, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (163, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (175, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (174, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (184, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (185, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (186, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (197, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (213, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (229, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (235, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (248, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (277, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (281, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (283, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (285, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (289, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (303, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (323, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (324, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (330, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (333, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (334, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (338, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (343, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (348, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (353, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (355, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (356, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (359, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (360, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (362, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (372, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (373, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (381, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (384, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (385, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (386, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (389, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (390, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (396, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (401, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (404, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (408, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (415, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (420, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (422, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (430, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (436, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (441, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (83, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (92, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (96, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (101, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (102, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (111, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (116, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (130, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (135, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (136, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (143, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (144, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (150, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (157, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (161, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (189, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (192, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (195, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (196, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (206, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (207, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (215, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (233, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (238, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (241, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (243, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (254, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (268, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (270, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (274, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (287, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (288, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (291, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (294, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (301, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (319, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (322, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (344, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (346, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (349, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (363, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (377, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (378, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (387, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (411, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (425, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (427, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (426, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (434, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (437, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (81, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (85, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (103, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (105, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (120, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (122, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (128, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (131, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (146, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (168, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (190, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (193, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (200, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (211, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (221, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (234, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (237, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (251, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (272, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (276, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (280, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (286, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (297, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (311, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (313, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (316, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (317, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (320, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (321, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (328, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (335, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (339, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (361, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (364, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (367, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (379, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (380, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (382, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (383, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (432, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (87, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (88, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (110, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (112, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (124, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (134, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (142, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (152, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (176, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (180, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (194, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (205, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (210, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (217, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (225, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (228, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (253, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (252, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (257, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (261, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (275, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (279, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (282, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (293, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (304, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (306, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (312, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (325, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (345, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (352, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (354, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (369, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (371, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (376, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (393, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (391, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (402, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (406, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (409, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (410, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (424, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (431, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (444, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (76, 4, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (86, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (91, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (123, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (129, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (139, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (145, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (148, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (154, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (155, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (162, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (173, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (178, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (181, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (187, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (191, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (201, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (232, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (236, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (239, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (240, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (245, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (249, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (256, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (259, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (266, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (271, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (298, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (314, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (315, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (336, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (341, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (350, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (351, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (358, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (365, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (388, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (405, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (414, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (416, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (429, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (438, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (439, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (442, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (443, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (445, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (84, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (90, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (104, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (107, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (118, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (133, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (147, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (151, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (158, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (159, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (165, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (167, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (179, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (183, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (198, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (199, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (220, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (224, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (227, 4, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (231, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (244, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (260, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (267, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (273, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (292, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (295, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (299, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (305, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (309, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (310, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (327, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (337, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (370, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (374, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (399, 2, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (400, 1, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (403, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (407, 3, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (413, 5, '2023-03-27', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (421, 4, '2023-03-27', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "hhb"."user";
CREATE TABLE "hhb"."user" (
  "id" int8 NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  "login_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "password" varchar(32) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "hhb"."user"."id" IS '主键';
COMMENT ON COLUMN "hhb"."user"."login_name" IS '登录名';
COMMENT ON COLUMN "hhb"."user"."name" IS '昵称';
COMMENT ON COLUMN "hhb"."user"."password" IS '密码';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "hhb"."user" VALUES (2, 'admin', '管理员', 'e70e2222a9d67c4f2eae107533359aa4');
INSERT INTO "hhb"."user" VALUES (295397698687864832, 'test2', '测试2', 'e70e2222a9d67c4f2eae107533359aa4');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"hhb"."category_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"hhb"."content_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"hhb"."doc_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"hhb"."ebook_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"hhb"."ebook_snapshot_id_seq"', 446, true);

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "hhb"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");
