--- ������� ��� ������ �� ����-���������
create table PROKUNIN_DBA.TST_TAB
(
  col1     integer      not null,
  col2	   varchar2(20),
  PRIMARY KEY(col1)
);

COMMENT ON TABLE "PROKUNIN_DBA"."TST_TAB"  IS '������� ��� ������������ GG';

create table prokunin_dba.tst_tab2 (col1 integer not null, col2 varchar(10), col3 varchar(20), primary key(col1));

COMMENT ON TABLE "PROKUNIN_DBA"."TST_TAB2"  IS '�������2 ��� ������������ GG';


-- ������ ��� ������� �� ����-���������

 CREATE TABLE "PROKUNIN_DBA"."LNE_ACC_PATTERN_TYPE_C" 
   (	"PATTERN_TYPE_C" VARCHAR2(1) NOT NULL ENABLE, 
	"NAME" VARCHAR2(256) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(256), 
	"ACCT_OPEN_FLAG" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
	 CONSTRAINT "LNE_ACC_PATTERN_TYPE_C_PK" PRIMARY KEY ("PATTERN_TYPE_C")
   ) ;

COMMENT ON TABLE "PROKUNIN_DBA"."LNE_ACC_PATTERN_TYPE_C"  IS '���������� ����� �������� ������';



  CREATE TABLE "PROKUNIN_DBA"."LNE_ACCOUNTS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MODULE" VARCHAR2(30), 
	"BRANCH" VARCHAR2(8) NOT NULL ENABLE, 
	"AGR_NO" NUMBER NOT NULL ENABLE, 
	"ACC_CODE" VARCHAR2(30) NOT NULL ENABLE, 
	"START_DATE" DATE NOT NULL ENABLE, 
	"ACC_ID" VARCHAR2(25) NOT NULL ENABLE, 
	"AGR_FLAG" VARCHAR2(1), 
	"UPDATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"UPDATED_BY" VARCHAR2(30) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"CREATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"CREATED_BY" VARCHAR2(30) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"ACCT_ID" NUMBER, 
	"PATTERN" VARCHAR2(30 CHAR), 
	"PATTERN_TYPE" VARCHAR2(1 CHAR), 
	"OPER_NO" NUMBER, 
	 CONSTRAINT "LNE_ACCOUNTS_PK" PRIMARY KEY ("ID")
   ) ;

   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."MODULE" IS '��� ������ (����, �������, �������� � �. �.).';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."BRANCH" IS '��� �������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."AGR_NO" IS '���������� ����� ��������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."ACC_CODE" IS '��� ���� ����� �� ������� T_Cr_Acc_Type.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."START_DATE" IS '����, ������� � �������, ������� �� ����� ����������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."ACC_ID" IS '����� �����.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."AGR_FLAG" IS '���� �������� � ��������, ���� NULL - ���� ����������� ��������� ���������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."UPDATED" IS '���� ��������� ������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."UPDATED_BY" IS '������������, �������� ��������� � ������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."ACCT_ID" IS '���������� ������������� �����';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."PATTERN" IS '��������, �� �������� ������ ����';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."PATTERN_TYPE" IS '��� ���������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."OPER_NO" IS '������ �� ��������, � ������ ������� ������ ����';
   COMMENT ON TABLE "PROKUNIN_DBA"."LNE_ACCOUNTS"  IS '������� ������ ��������� ���������.';


CREATE TABLE "PROKUNIN_DBA"."LNE_OPERATION" 
   (	"BRANCH" VARCHAR2(8) NOT NULL ENABLE, 
	"AGR_NO" NUMBER NOT NULL ENABLE, 
	"DATE_OP" DATE NOT NULL ENABLE, 
	"INT_DATE" DATE, 
	"OPER" VARCHAR2(30) NOT NULL ENABLE, 
	"AMOUNT_CUR" NUMBER, 
	"DOC_NO" NUMBER, 
	"TR_NO" NUMBER, 
	"FVIRTUAL" VARCHAR2(1), 
	"UPDATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"UPDATED_BY" VARCHAR2(30) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"CREATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"CREATED_BY" VARCHAR2(30) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"CURRENCY_NO" VARCHAR2(3), 
	"ST_DATE" DATE, 
	"STINT_DATE" DATE, 
	"COM_FLAG" VARCHAR2(1), 
	"DOC_NO_COM" NUMBER, 
	"DOC_NO_TMP" VARCHAR2(10), 
	"OPER_NO" NUMBER, 
	"VIRTUAL_PAY" VARCHAR2(3), 
	"PR_KOM_DATE" DATE, 
	"COLLATERAL_NO" NUMBER, 
	"CM_CODE" VARCHAR2(30), 
	"DOC_NO_FIX" NUMBER, 
	"PARENT_OPER_NO" NUMBER, 
	"SCT_CODE" VARCHAR2(30), 
	"OBJECT_KEY" NUMBER, 
	"STATUS" VARCHAR2(8), 
	"AMOUNT" NUMBER, 
	"NDS_AMOUNT_CUR" NUMBER, 
	"NDS_AMOUNT" NUMBER, 
	"PAYMENT_PURPOSE" VARCHAR2(240), 
	"COLL_ITEM_NO" NUMBER, 
	"SENDING_TO_NOTARY" VARCHAR2(1), 
	"EARLY_FLAG" VARCHAR2(1) DEFAULT 'N', 
	"GR_TYPE_OP_C" VARCHAR2(30), 
	"GREIS_FLAG" VARCHAR2(1), 
	"MIN_PAY_FLAG" VARCHAR2(1) DEFAULT 'N', 
	"IFRS_OPER_NO" NUMBER, 
	"IFRS_FLAG" VARCHAR2(10), 
	"OVERDUE_FLAG" VARCHAR2(1) DEFAULT 'N', 
	"AUXILIARY_FLG" VARCHAR2(3) DEFAULT null, 
	"LOG_ID" NUMBER, 
	"IFRS_TAB" VARCHAR2(50), 
	"CURRENCY_NO_2" VARCHAR2(3), 
	 CONSTRAINT "LNE_OPERATION_PK" PRIMARY KEY ("OPER_NO")
   )  ;

   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."BRANCH" IS '��� �������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AGR_NO" IS '���������� ����� ��������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."DATE_OP" IS '���� ���������� ��������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."INT_DATE" IS '���� ��������� �������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OPER" IS '��� ��������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AMOUNT_CUR" IS '����� � ������ ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."DOC_NO" IS '����� ���������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."TR_NO" IS '����� ����������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."FVIRTUAL" IS '������� ���� ��� � ������ �������� ��� ��������.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."STINT_DATE" IS '���� ������ �������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OPER_NO" IS '����� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."VIRTUAL_PAY" IS '������� ������������� ��������� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."PR_KOM_DATE" IS '���� ������ �� ��������� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."COLLATERAL_NO" IS '����� �������� �����������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."CM_CODE" IS '��� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."DOC_NO_FIX" IS '����� ��������������� ���������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."PARENT_OPER_NO" IS '���� ������������ ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."SCT_CODE" IS '��� �������� ��������� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OBJECT_KEY" IS '������ �� ��������� ����� � ������� ���������� ���������� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."STATUS" IS '��� ������� ���������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AMOUNT" IS '����� � ������ ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."NDS_AMOUNT_CUR" IS '� �� ��� � ������ ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."NDS_AMOUNT" IS '� �� ��� � ������ ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."PAYMENT_PURPOSE" IS '���������� �������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."COLL_ITEM_NO" IS '������ �� ��������� ����� �������� �����������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."SENDING_TO_NOTARY" IS '������� �������� ����������� � ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."EARLY_FLAG" IS '������� ���������� ���������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."GR_TYPE_OP_C" IS '��� �������� � ��������: ��������, �����������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."GREIS_FLAG" IS '��� �������� ���������� %% �������, ��� ���������� �� �����-������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."MIN_PAY_FLAG" IS '������� ������������ �������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OVERDUE_FLAG" IS '������� ��������� ����������� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AUXILIARY_FLG" IS '��������������� ����, � �������������� �������� Y - ������� ������������� �����������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."LOG_ID" IS '������ �� ������������� ���� MGC_LOG_HDR ��� ������ ��������� ��������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."IFRS_TAB" IS '�������� ���� �������';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."CURRENCY_NO_2" IS '������ ����� �� (��� ��������� �������)';
   COMMENT ON TABLE "PROKUNIN_DBA"."LNE_OPERATION"  IS '������� �������� ��� ��������� ���������.';


  CREATE TABLE "TBG"."LNE_ACCOUNTS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MODULE" VARCHAR2(30), 
	"BRANCH" VARCHAR2(8) NOT NULL ENABLE, 
	"AGR_NO" NUMBER NOT NULL ENABLE, 
	"ACC_CODE" VARCHAR2(30) NOT NULL ENABLE, 
	"START_DATE" DATE NOT NULL ENABLE, 
	"ACC_ID" VARCHAR2(25) NOT NULL ENABLE, 
	"AGR_FLAG" VARCHAR2(1), 
	"UPDATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"UPDATED_BY" VARCHAR2(30) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"CREATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"CREATED_BY" VARCHAR2(30) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"ACCT_ID" NUMBER, 
	"PATTERN" VARCHAR2(30), 
	"PATTERN_TYPE" VARCHAR2(1), 
	"OPER_NO" NUMBER, 
	 CONSTRAINT "LNE_ACCOUNTS_PK" PRIMARY KEY ("ID")
   ) 
  TABLESPACE "TS_BELL_TABLE" ;

   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."MODULE" IS '��� ������ (����, �������, �������� � �. �.).';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."BRANCH" IS '��� �������.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."AGR_NO" IS '���������� ����� ��������.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."ACC_CODE" IS '��� ���� ����� �� ������� T_Cr_Acc_Type.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."START_DATE" IS '����, ������� � �������, ������� �� ����� ����������.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."ACC_ID" IS '����� �����.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."AGR_FLAG" IS '���� �������� � ��������, ���� NULL - ���� ����������� ��������� ���������.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."UPDATED" IS '���� ��������� ������.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."UPDATED_BY" IS '������������, �������� ��������� � ������.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."ACCT_ID" IS '���������� ������������� �����';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."PATTERN" IS '��������, �� �������� ������ ����';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."PATTERN_TYPE" IS '��� ���������';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."OPER_NO" IS '������ �� ��������, � ������ ������� ������ ����';
   COMMENT ON TABLE "TBG"."LNE_ACCOUNTS"  IS '������� ������ ��������� ���������.';


oracle@solaris:~$ export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
oracle@solaris:~$ sqlplus / as sysdba
