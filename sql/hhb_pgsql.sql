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

 Date: 24/03/2023 17:53:30
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
INSERT INTO "hhb"."category" VALUES (100, 0, '前端开发', 100);
INSERT INTO "hhb"."category" VALUES (101, 100, 'Vue', 101);
INSERT INTO "hhb"."category" VALUES (202, 200, '框架应用', 202);
INSERT INTO "hhb"."category" VALUES (102, 100, 'HTML & CSS', 102);
INSERT INTO "hhb"."category" VALUES (300, 0, 'Python', 300);
INSERT INTO "hhb"."category" VALUES (400, 0, '数据库', 400);
INSERT INTO "hhb"."category" VALUES (302, 300, '进阶方向应用', 302);
INSERT INTO "hhb"."category" VALUES (501, 500, '服务器', 501);
INSERT INTO "hhb"."category" VALUES (200, 0, 'Java', 200);
INSERT INTO "hhb"."category" VALUES (201, 200, '基础应用', 201);
INSERT INTO "hhb"."category" VALUES (401, 400, 'MySQL', 401);
INSERT INTO "hhb"."category" VALUES (503, 500, '热门服务端语言', 503);
INSERT INTO "hhb"."category" VALUES (500, 0, '其它', 500);
INSERT INTO "hhb"."category" VALUES (502, 500, '开发工具', 502);
INSERT INTO "hhb"."category" VALUES (301, 300, '基础应用', 301);

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
INSERT INTO "hhb"."ebook_snapshot" VALUES (79, 2, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (77, 1, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (78, 3, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (80, 5, '2023-03-24', 0, 0, 0, 0);
INSERT INTO "hhb"."ebook_snapshot" VALUES (76, 4, '2023-03-24', 0, 0, 0, 0);

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
SELECT setval('"hhb"."ebook_snapshot_id_seq"', 81, true);
