CREATE SCHEMA IF NOT EXISTS "odmp";

CREATE TABLE IF NOT EXISTS "odmp"."org" (
  "id"         INT          NOT NULL AUTO_INCREMENT
  COMMENT '组织机构ID',
  "name"       VARCHAR(50)  NOT NULL
  COMMENT '组织机构名称',
  "full_name"  VARCHAR(200) NULL
  COMMENT '全称',
  "category"   TINYINT      NULL
  COMMENT '行业类型',
  "update_dt"  TIMESTAMP    NULL     DEFAULT CURRENT_TIMESTAMP
  COMMENT '更新时间',
  "updater_id" INT          NULL
  COMMENT '更新人',
  "create_dt"  TIMESTAMP    NULL     DEFAULT '1970-01-01 08:00:01'
  COMMENT '创建时间',
  "creator_id" INT          NULL
  COMMENT '创建人',
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "odmp"."user" (
  "id"         INT          NOT NULL AUTO_INCREMENT
  COMMENT '用户ID',
  "name"       VARCHAR(50)  NOT NULL
  COMMENT '用户名',
  "passwd"     VARCHAR(100) NOT NULL
  COMMENT '用户密码（密文）',
  "phone"      VARCHAR(20)  NULL
  COMMENT '手机号码',
  "email"      VARCHAR(100) NULL
  COMMENT '邮箱地址',
  "pub_key"    VARCHAR(55)  NULL
  COMMENT '用户注册的公钥',
  "org_id"     INT          NOT NULL
  COMMENT 'org表的id，外键约束',
  "update_dt"  TIMESTAMP    NULL     DEFAULT CURRENT_TIMESTAMP
  COMMENT '更新时间',
  "updater_id" INT          NULL
  COMMENT '更新人',
  "create_dt"  TIMESTAMP    NULL     DEFAULT '1970-01-01 08:00:01'
  COMMENT '创建时间',
  "creator_id" INT          NULL
  COMMENT '创建人',
  PRIMARY KEY ("id"),
  CONSTRAINT "org_id_fk"
  FOREIGN KEY ("org_id")
  REFERENCES "odmp"."org" ("id")
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS "odmp"."batch" (
  "id"          INT          NOT NULL AUTO_INCREMENT,
  "batch_id"    INT          NOT NULL
  COMMENT '批次ID，不唯一',
  "file_id"     VARCHAR(45)  NOT NULL
  COMMENT '请求文件的ID',
  "file_path"   VARCHAR(200) NOT NULL
  COMMENT '文件路径（含文件名）',
  "status"      CHAR         NOT NULL
  COMMENT '状态，',
  "sender_id"   INT          NOT NULL
  COMMENT '发送方用户ID',
  "receiver_id" INT          NOT NULL
  COMMENT '接收方用户ID',
  "update_dt"   TIMESTAMP    NULL     DEFAULT CURRENT_TIMESTAMP
  COMMENT '更新时间',
  "updater_id"  INT          NULL
  COMMENT '更新人',
  "create_dt"   TIMESTAMP    NULL     DEFAULT '1970-01-01 08:00:01'
  COMMENT '创建时间',
  "creator_id"  INT          NULL
  COMMENT '创建人',
  PRIMARY KEY ("id"),
  CONSTRAINT "sender_id_fk"
  FOREIGN KEY ("sender_id")
  REFERENCES "odmp"."user" ("id")
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT "receiver_id_fk"
  FOREIGN KEY ("receiver_id")
  REFERENCES "odmp"."user" ("id")
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT "user_id_chk"
  CHECK ("sender_id" <> "receiver_id")
);

CREATE TABLE IF NOT EXISTS "odmp"."client" (
  "id"         INT          NOT NULL AUTO_INCREMENT,
  "access_key" VARCHAR(50)  NOT NULL
  COMMENT '应用访问key',
  "secret"     VARCHAR(100) NOT NULL
  COMMENT '应用共享密钥',
  "ip_range"   varchar(40)  NOT NULL
  COMMENT '白名单ip范围',
  "user_id"    INT          NOT NULL
  COMMENT '用户ID',
  "update_dt"  TIMESTAMP    NULL     DEFAULT CURRENT_TIMESTAMP
  COMMENT '更新时间',
  "updater_id" INT          NULL
  COMMENT '更新人',
  "create_dt"  TIMESTAMP    NULL     DEFAULT '1970-01-01 08:00:01'
  COMMENT '创建时间',
  "creator_id" INT          NULL
  COMMENT '创建人',
  PRIMARY KEY ("id"),
  CONSTRAINT "user_id_fk"
  FOREIGN KEY ("user_id")
  REFERENCES "odmp"."user" ("id")
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);