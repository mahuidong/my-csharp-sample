/*
CREATED		2012/8/14
MODIFIED		2012/8/15
PROJECT		
MODEL		
COMPANY		
AUTHOR		
VERSION		
DATABASE		ORACLE 9I 
*/









ALTER TABLE "MR_DEPT" DROP CONSTRAINT "FK_MR_DEPT_T"
/
ALTER TABLE "MR_DEPT_USER" DROP CONSTRAINT "FK_MR_DEPT_USER_D"
/
ALTER TABLE "MR_DEPT_USER" DROP CONSTRAINT "FK_MR_DEPT_USER_U"
/
ALTER TABLE "MR_USER_MODULE" DROP CONSTRAINT "FK_MR_USER_MODULE_U"
/
ALTER TABLE "MR_USER_ACTION" DROP CONSTRAINT "FK_MR_USER_ACTION_U"
/
ALTER TABLE "MR_USER_ROLE" DROP CONSTRAINT "FK_MR_USER_ROLE_U"
/
ALTER TABLE "MR_ACTION" DROP CONSTRAINT "FK_MR_ACTION_M"
/
ALTER TABLE "MR_USER_MODULE" DROP CONSTRAINT "FK_MR_USER_MODULE_M"
/
ALTER TABLE "MR_ROLE_MODULE" DROP CONSTRAINT "FK_MR_ROLE_MODULE_M"
/
ALTER TABLE "MR_USER_ACTION" DROP CONSTRAINT "FK_MR_USER_ACTION_A"
/
ALTER TABLE "MR_ROLE_ACTION" DROP CONSTRAINT "FK_MR_ROLE_ACTION_A"
/
ALTER TABLE "MR_USER_ROLE" DROP CONSTRAINT "FK_MR_USER_ROLE_R"
/
ALTER TABLE "MR_ROLE_MODULE" DROP CONSTRAINT "FK_MR_ROLE_MODULE_R"
/
ALTER TABLE "MR_ROLE_ACTION" DROP CONSTRAINT "FK_MR_ROLE_ACTION_R"
/



DROP TABLE "MR_ROLE_ACTION"
/
DROP TABLE "MR_ROLE_MODULE"
/
DROP TABLE "MR_USER_ROLE"
/
DROP TABLE "MR_ROLE"
/
DROP TABLE "MR_USER_ACTION"
/
DROP TABLE "MR_USER_MODULE"
/
DROP TABLE "MR_ACTION"
/
DROP TABLE "MR_MODULE"
/
DROP TABLE "MR_DEPT_USER"
/
DROP TABLE "MR_USER"
/
DROP TABLE "MR_DEPT"
/
DROP TABLE "MR_DEPT_TYPE"
/


-- CREATE TYPES SECTION





-- CREATE TABLES SECTION


CREATE TABLE "MR_DEPT_TYPE" (
	"DEPT_TYPE" VARCHAR2 (20) NOT NULL ,
	"DEPT_TYPE_DESC" VARCHAR2 (100) NOT NULL ,
	"STATUS" SMALLINT DEFAULT 1 NOT NULL ,
 CONSTRAINT "PK_MR_DEPT_TYPE" PRIMARY KEY ("DEPT_TYPE") 
) 
/

CREATE TABLE "MR_DEPT" (
	"DEPT_CODE" VARCHAR2 (20) NOT NULL ,
	"DEPT_TYPE" VARCHAR2 (20) NOT NULL ,
	"PARENT_CODE" VARCHAR2 (20),
	"DEPT_NAME" VARCHAR2 (20) NOT NULL ,
	"STATUS" SMALLINT DEFAULT 1 NOT NULL ,
 CONSTRAINT "PK_MR_DEPT" PRIMARY KEY ("DEPT_CODE") 
) 
/

CREATE TABLE "MR_USER" (
	"USER_CODE" VARCHAR2 (20) NOT NULL ,
	"USER_NAME" VARCHAR2 (20) NOT NULL ,
	"STATUS" SMALLINT DEFAULT 1 NOT NULL ,
 CONSTRAINT "PK_MR_USER" PRIMARY KEY ("USER_CODE") 
) 
/

CREATE TABLE "MR_DEPT_USER" (
	"DEPT_CODE" VARCHAR2 (20) NOT NULL ,
	"USER_CODE" VARCHAR2 (20) NOT NULL ,
 CONSTRAINT "PK_MR_DEPT_USER" PRIMARY KEY ("DEPT_CODE","USER_CODE") 
) 
/

CREATE TABLE "MR_MODULE" (
	"MODULE_CODE" VARCHAR2 (20) NOT NULL ,
	"PARENT_CODE" VARCHAR2 (20),
	"MODULE_NAME" VARCHAR2 (20) NOT NULL ,
	"MODULE_EXPAND" VARCHAR2 (100),
	"STATUS" SMALLINT DEFAULT 1 NOT NULL ,
 CONSTRAINT "PK_MR_MODULE" PRIMARY KEY ("MODULE_CODE") 
) 
/

CREATE TABLE "MR_ACTION" (
	"ACTION_CODE" VARCHAR2 (20) NOT NULL ,
	"MODULE_CODE" VARCHAR2 (20) NOT NULL ,
	"ACTION_NAME" VARCHAR2 (20) NOT NULL ,
	"ACTION_EXPAND" VARCHAR2 (100),
	"DEFAULT_RULE" SMALLINT DEFAULT 0 NOT NULL ,
	"STATUS" SMALLINT DEFAULT 1 NOT NULL ,
 CONSTRAINT "PK_MR_ACTION" PRIMARY KEY ("ACTION_CODE") 
) 
/

CREATE TABLE "MR_USER_MODULE" (
	"USER_CODE" VARCHAR2 (20) NOT NULL ,
	"MODULE_CODE" VARCHAR2 (20) NOT NULL ,
 CONSTRAINT "PK_MR_USER_MODULE" PRIMARY KEY ("USER_CODE","MODULE_CODE") 
) 
/

CREATE TABLE "MR_USER_ACTION" (
	"USER_CODE" VARCHAR2 (20) NOT NULL ,
	"ACTION_CODE" VARCHAR2 (20) NOT NULL ,
 CONSTRAINT "PK_MR_USER_ACTION" PRIMARY KEY ("USER_CODE","ACTION_CODE") 
) 
/

CREATE TABLE "MR_ROLE" (
	"ROLE_CODE" VARCHAR2 (20) NOT NULL ,
	"ROLE_NAME" VARCHAR2 (20) NOT NULL ,
	"STATUS" SMALLINT DEFAULT 1 NOT NULL ,
 CONSTRAINT "PK_MR_ROLE" PRIMARY KEY ("ROLE_CODE") 
) 
/

CREATE TABLE "MR_USER_ROLE" (
	"USER_CODE" VARCHAR2 (20) NOT NULL ,
	"ROLE_CODE" VARCHAR2 (20) NOT NULL ,
 CONSTRAINT "PK_MR_USER_ROLE" PRIMARY KEY ("USER_CODE","ROLE_CODE") 
) 
/

CREATE TABLE "MR_ROLE_MODULE" (
	"MODULE_CODE" VARCHAR2 (20) NOT NULL ,
	"ROLE_CODE" VARCHAR2 (20) NOT NULL ,
 CONSTRAINT "PK_MR_ROLE_MODULE" PRIMARY KEY ("MODULE_CODE","ROLE_CODE") 
) 
/

CREATE TABLE "MR_ROLE_ACTION" (
	"ROLE_CODE" VARCHAR2 (20) NOT NULL ,
	"ACTION_CODE" VARCHAR2 (20) NOT NULL ,
 CONSTRAINT "PK_MR_ROLE_ACTION" PRIMARY KEY ("ROLE_CODE","ACTION_CODE") 
) 
/



--------------------------------------------------------------------------------
-- ���ű��ĸ��ӹ�ϵ
--------------------------------------------------------------------------------

ALTER TABLE MR_DEPT ADD CONSTRAINT FK_MR_DEPT_PARENT  FOREIGN KEY (PARENT_CODE)  REFERENCES  MR_DEPT
/
--------------------------------------------------------------------------------
-- ����ģ����ĸ��ӹ�ϵ
--------------------------------------------------------------------------------

ALTER TABLE MR_MODULE ADD CONSTRAINT FK_MR_MODULE_PARENT  FOREIGN KEY (PARENT_CODE)  REFERENCES  MR_MODULE
/



-- CREATE INDEXES SECTION



-- CREATE SECTION FOR PKS, AKS AND UNIQUE CONSTRAINTS, WHICH HAVE TO BE GENERATED AFTER INDEXES



-- CREATE FOREIGN KEYS SECTION

ALTER TABLE "MR_DEPT" ADD CONSTRAINT "FK_MR_DEPT_T" FOREIGN KEY ("DEPT_TYPE") REFERENCES "MR_DEPT_TYPE" ("DEPT_TYPE") 
/

ALTER TABLE "MR_DEPT_USER" ADD CONSTRAINT "FK_MR_DEPT_USER_D" FOREIGN KEY ("DEPT_CODE") REFERENCES "MR_DEPT" ("DEPT_CODE") 
/

ALTER TABLE "MR_DEPT_USER" ADD CONSTRAINT "FK_MR_DEPT_USER_U" FOREIGN KEY ("USER_CODE") REFERENCES "MR_USER" ("USER_CODE") 
/

ALTER TABLE "MR_USER_MODULE" ADD CONSTRAINT "FK_MR_USER_MODULE_U" FOREIGN KEY ("USER_CODE") REFERENCES "MR_USER" ("USER_CODE") 
/

ALTER TABLE "MR_USER_ACTION" ADD CONSTRAINT "FK_MR_USER_ACTION_U" FOREIGN KEY ("USER_CODE") REFERENCES "MR_USER" ("USER_CODE") 
/

ALTER TABLE "MR_USER_ROLE" ADD CONSTRAINT "FK_MR_USER_ROLE_U" FOREIGN KEY ("USER_CODE") REFERENCES "MR_USER" ("USER_CODE") 
/

ALTER TABLE "MR_ACTION" ADD CONSTRAINT "FK_MR_ACTION_M" FOREIGN KEY ("MODULE_CODE") REFERENCES "MR_MODULE" ("MODULE_CODE") 
/

ALTER TABLE "MR_USER_MODULE" ADD CONSTRAINT "FK_MR_USER_MODULE_M" FOREIGN KEY ("MODULE_CODE") REFERENCES "MR_MODULE" ("MODULE_CODE") 
/

ALTER TABLE "MR_ROLE_MODULE" ADD CONSTRAINT "FK_MR_ROLE_MODULE_M" FOREIGN KEY ("MODULE_CODE") REFERENCES "MR_MODULE" ("MODULE_CODE") 
/

ALTER TABLE "MR_USER_ACTION" ADD CONSTRAINT "FK_MR_USER_ACTION_A" FOREIGN KEY ("ACTION_CODE") REFERENCES "MR_ACTION" ("ACTION_CODE") 
/

ALTER TABLE "MR_ROLE_ACTION" ADD CONSTRAINT "FK_MR_ROLE_ACTION_A" FOREIGN KEY ("ACTION_CODE") REFERENCES "MR_ACTION" ("ACTION_CODE") 
/

ALTER TABLE "MR_USER_ROLE" ADD CONSTRAINT "FK_MR_USER_ROLE_R" FOREIGN KEY ("ROLE_CODE") REFERENCES "MR_ROLE" ("ROLE_CODE") 
/

ALTER TABLE "MR_ROLE_MODULE" ADD CONSTRAINT "FK_MR_ROLE_MODULE_R" FOREIGN KEY ("ROLE_CODE") REFERENCES "MR_ROLE" ("ROLE_CODE") 
/

ALTER TABLE "MR_ROLE_ACTION" ADD CONSTRAINT "FK_MR_ROLE_ACTION_R" FOREIGN KEY ("ROLE_CODE") REFERENCES "MR_ROLE" ("ROLE_CODE") 
/


-- CREATE OBJECT TABLES SECTION



-- CREATE XMLTYPE TABLES SECTION



-- CREATE FUNCTIONS SECTION



-- CREATE SEQUENCES SECTION




-- CREATE PACKAGES SECTION





-- CREATE SYNONYMS SECTION



-- CREATE TABLE COMMENTS SECTION

COMMENT ON TABLE "MR_DEPT_TYPE" IS '��������'
/
COMMENT ON TABLE "MR_DEPT" IS 'MR_DEPT'
/
COMMENT ON TABLE "MR_USER" IS '�û�'
/
COMMENT ON TABLE "MR_DEPT_USER" IS '����-�û���ϵ'
/
COMMENT ON TABLE "MR_MODULE" IS '����ģ��'
/
COMMENT ON TABLE "MR_ACTION" IS 'ģ�鶯��'
/
COMMENT ON TABLE "MR_USER_MODULE" IS '�û�-ģ���ϵ'
/
COMMENT ON TABLE "MR_USER_ACTION" IS '�û�-������ϵ'
/
COMMENT ON TABLE "MR_ROLE" IS '��ɫ'
/
COMMENT ON TABLE "MR_USER_ROLE" IS '�û�-��ɫ��ϵ'
/
COMMENT ON TABLE "MR_ROLE_MODULE" IS '��ɫ-ģ���ϵ'
/
COMMENT ON TABLE "MR_ROLE_ACTION" IS '��ɫ-������ϵ'
/

-- CREATE ATTRIBUTE COMMENTS SECTION

COMMENT ON COLUMN "MR_DEPT_TYPE"."DEPT_TYPE" IS '��������'
/
COMMENT ON COLUMN "MR_DEPT_TYPE"."DEPT_TYPE_DESC" IS '������������'
/
COMMENT ON COLUMN "MR_DEPT_TYPE"."STATUS" IS '״̬'
/
COMMENT ON COLUMN "MR_DEPT"."DEPT_CODE" IS '���ű��'
/
COMMENT ON COLUMN "MR_DEPT"."DEPT_TYPE" IS '��������(ʵ�岿�š����ⲿ�š����е�)'
/
COMMENT ON COLUMN "MR_DEPT"."PARENT_CODE" IS '�ϼ����ű��'
/
COMMENT ON COLUMN "MR_DEPT"."DEPT_NAME" IS '������'
/
COMMENT ON COLUMN "MR_DEPT"."STATUS" IS '״̬'
/
COMMENT ON COLUMN "MR_USER"."USER_CODE" IS '�û�����'
/
COMMENT ON COLUMN "MR_USER"."USER_NAME" IS '�û���'
/
COMMENT ON COLUMN "MR_USER"."STATUS" IS '״̬'
/
COMMENT ON COLUMN "MR_DEPT_USER"."DEPT_CODE" IS '���ű��'
/
COMMENT ON COLUMN "MR_DEPT_USER"."USER_CODE" IS '�û�����'
/
COMMENT ON COLUMN "MR_MODULE"."MODULE_CODE" IS 'ģ����'
/
COMMENT ON COLUMN "MR_MODULE"."PARENT_CODE" IS '��ģ����'
/
COMMENT ON COLUMN "MR_MODULE"."MODULE_NAME" IS 'ģ������'
/
COMMENT ON COLUMN "MR_MODULE"."MODULE_EXPAND" IS 'ģ����չ��Ϣ'
/
COMMENT ON COLUMN "MR_MODULE"."STATUS" IS '״̬'
/
COMMENT ON COLUMN "MR_ACTION"."ACTION_CODE" IS '��������'
/
COMMENT ON COLUMN "MR_ACTION"."MODULE_CODE" IS 'ģ����'
/
COMMENT ON COLUMN "MR_ACTION"."ACTION_NAME" IS '��������'
/
COMMENT ON COLUMN "MR_ACTION"."ACTION_EXPAND" IS '������չ��Ϣ'
/
COMMENT ON COLUMN "MR_ACTION"."DEFAULT_RULE" IS 'Ĭ�Ͽ��ñ�־'
/
COMMENT ON COLUMN "MR_ACTION"."STATUS" IS '״̬'
/
COMMENT ON COLUMN "MR_USER_MODULE"."USER_CODE" IS '�û�����'
/
COMMENT ON COLUMN "MR_USER_MODULE"."MODULE_CODE" IS 'ģ�����'
/
COMMENT ON COLUMN "MR_USER_ACTION"."USER_CODE" IS '�û�����'
/
COMMENT ON COLUMN "MR_USER_ACTION"."ACTION_CODE" IS '��������'
/
COMMENT ON COLUMN "MR_ROLE"."ROLE_CODE" IS '��ɫ����'
/
COMMENT ON COLUMN "MR_ROLE"."ROLE_NAME" IS '��ɫ����'
/
COMMENT ON COLUMN "MR_ROLE"."STATUS" IS '״̬'
/
COMMENT ON COLUMN "MR_USER_ROLE"."USER_CODE" IS '�û�����'
/
COMMENT ON COLUMN "MR_USER_ROLE"."ROLE_CODE" IS '��ɫ����'
/
COMMENT ON COLUMN "MR_ROLE_MODULE"."MODULE_CODE" IS 'ģ����'
/
COMMENT ON COLUMN "MR_ROLE_MODULE"."ROLE_CODE" IS '��ɫ����'
/
COMMENT ON COLUMN "MR_ROLE_ACTION"."ROLE_CODE" IS '��ɫ����'
/
COMMENT ON COLUMN "MR_ROLE_ACTION"."ACTION_CODE" IS '��������'
/

