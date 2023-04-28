--- Таблица для тестов на базе-источнике
create table PROKUNIN_DBA.TST_TAB
(
  col1     integer      not null,
  col2	   varchar2(20),
  PRIMARY KEY(col1)
);

COMMENT ON TABLE "PROKUNIN_DBA"."TST_TAB"  IS 'Таблица для тестирования GG';

create table prokunin_dba.tst_tab2 (col1 integer not null, col2 varchar(10), col3 varchar(20), primary key(col1));

COMMENT ON TABLE "PROKUNIN_DBA"."TST_TAB2"  IS 'Таблица2 для тестирования GG';


-- Таблиц для тестово на базе-приемнике

 CREATE TABLE "PROKUNIN_DBA"."LNE_ACC_PATTERN_TYPE_C" 
   (	"PATTERN_TYPE_C" VARCHAR2(1) NOT NULL ENABLE, 
	"NAME" VARCHAR2(256) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(256), 
	"ACCT_OPEN_FLAG" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
	 CONSTRAINT "LNE_ACC_PATTERN_TYPE_C_PK" PRIMARY KEY ("PATTERN_TYPE_C")
   ) ;

COMMENT ON TABLE "PROKUNIN_DBA"."LNE_ACC_PATTERN_TYPE_C"  IS 'Справочник типов шаблонов счетов';



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

   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."MODULE" IS 'Имя модуля (ЯДРО, КРЕДИТЫ, ДЕПОЗИТЫ и т. д.).';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."BRANCH" IS 'Код филиала.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."AGR_NO" IS 'Внутренний номер договора.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."ACC_CODE" IS 'Код типа счета из таблицы T_Cr_Acc_Type.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."START_DATE" IS 'Дата, начиная с которой, остатки на счете правильные.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."ACC_ID" IS 'Номер счета.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."AGR_FLAG" IS 'Флаг привязки к договору, если NULL - счет обслуживает несколько договоров.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."UPDATED" IS 'Дата изменения записи.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."UPDATED_BY" IS 'Пользователь, занесший изменения в запись.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."ACCT_ID" IS 'уникальный идентификатор счета';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."PATTERN" IS 'Прототип, по которому открыт счет';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."PATTERN_TYPE" IS 'вид прототипа';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_ACCOUNTS"."OPER_NO" IS 'Ссылка на операцию, в рамках которой создан счёт';
   COMMENT ON TABLE "PROKUNIN_DBA"."LNE_ACCOUNTS"  IS 'Таблица счетов кредитных договоров.';


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

   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."BRANCH" IS 'Код филиала.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AGR_NO" IS 'Внутренний номер договора.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."DATE_OP" IS 'Дата проведения операции.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."INT_DATE" IS 'Дата окончания периода';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OPER" IS 'Тип операции.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AMOUNT_CUR" IS 'Сумма в валюте договора';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."DOC_NO" IS 'Номер документа.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."TR_NO" IS 'Номер транзакции.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."FVIRTUAL" IS 'Признак того что в основе операции нет проводок.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."STINT_DATE" IS 'Дата начала периода';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OPER_NO" IS 'Номер операции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."VIRTUAL_PAY" IS 'Признак виртуальности погашения комиссии';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."PR_KOM_DATE" IS 'Дата выноса на просрочку комиссии';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."COLLATERAL_NO" IS 'Номер договора обеспечения';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."CM_CODE" IS 'Код комиссии';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."DOC_NO_FIX" IS 'Номер корректирующего документа';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."PARENT_OPER_NO" IS 'Ключ родительской операции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."SCT_CODE" IS 'Код сценария обработки операции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OBJECT_KEY" IS 'Ссылка на Системный номер в таблице Хронологии исполнения операции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."STATUS" IS 'Код статуса документа';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AMOUNT" IS 'Сумма в валюте операции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."NDS_AMOUNT_CUR" IS 'В тч ндс в валюте договора';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."NDS_AMOUNT" IS 'В тч ндс в валюте операции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."PAYMENT_PURPOSE" IS 'Назначение платежа';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."COLL_ITEM_NO" IS 'Ссылка на системный номер предмета обеспечения';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."SENDING_TO_NOTARY" IS 'Признак отправки уведомления в нотариат';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."EARLY_FLAG" IS 'Признак досрочного погашения';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."GR_TYPE_OP_C" IS 'Тип операции в пластике: наличная, безналичная';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."GREIS_FLAG" IS 'Для операций начисления %% признак, что начисление по грейс-ставке';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."MIN_PAY_FLAG" IS 'Признак минимального платежа';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."OVERDUE_FLAG" IS 'Признак просрочки начисленной комиссии';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."AUXILIARY_FLG" IS 'Вспомогательный флаг, у несущественных комиссий Y - признак необходимости амортизации';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."LOG_ID" IS 'Ссылка на идентификатор лога MGC_LOG_HDR для отката групповых процедур';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."IFRS_TAB" IS 'Источник МСФО оперции';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_OPERATION"."CURRENCY_NO_2" IS 'Валюта счета ДТ (при погашении кредита)';
   COMMENT ON TABLE "PROKUNIN_DBA"."LNE_OPERATION"  IS 'Таблица операций для кредитных договоров.';


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

   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."MODULE" IS 'Имя модуля (ЯДРО, КРЕДИТЫ, ДЕПОЗИТЫ и т. д.).';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."BRANCH" IS 'Код филиала.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."AGR_NO" IS 'Внутренний номер договора.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."ACC_CODE" IS 'Код типа счета из таблицы T_Cr_Acc_Type.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."START_DATE" IS 'Дата, начиная с которой, остатки на счете правильные.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."ACC_ID" IS 'Номер счета.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."AGR_FLAG" IS 'Флаг привязки к договору, если NULL - счет обслуживает несколько договоров.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."UPDATED" IS 'Дата изменения записи.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."UPDATED_BY" IS 'Пользователь, занесший изменения в запись.';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."ACCT_ID" IS 'уникальный идентификатор счета';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."PATTERN" IS 'Прототип, по которому открыт счет';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."PATTERN_TYPE" IS 'вид прототипа';
   COMMENT ON COLUMN "TBG"."LNE_ACCOUNTS"."OPER_NO" IS 'Ссылка на операцию, в рамках которой создан счёт';
   COMMENT ON TABLE "TBG"."LNE_ACCOUNTS"  IS 'Таблица счетов кредитных договоров.';


oracle@solaris:~$ export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
oracle@solaris:~$ sqlplus / as sysdba
