alter table TBG.LNE_ACCOUNTS enable validate CONSTRAINT LNE_ACCOUNTS_PK;
alter table TBG.LNE_AGREEMENTS enable validate CONSTRAINT LNE_AGREEMENTS_PK;
alter table TBG.LNE_AGR_PURPOSE enable validate CONSTRAINT LNE_AGR_PURPOSE_PK;
alter table TBG.LNE_COLLATERAL enable validate CONSTRAINT LNE_COLLATERAL_PK;
alter table TBG.LNE_COLLATERAL_ITEM enable validate CONSTRAINT LNE_COLLATERAL_ITEM_PK;
alter table TBG.LNE_COLLAT_INSURANCE enable validate CONSTRAINT LNE_COLLAT_INSURANCE_PK;
alter table TBG.LNE_CONDITIONS enable validate CONSTRAINT LNE_CONDITIONS_PK;
alter table TBG.LNE_OPERATION enable validate CONSTRAINT LNE_OPERATION_PK;
alter table TBG.LNE_OPERATION_CHARGED enable validate CONSTRAINT LNE_OPERATION_CHARGED_PK;
alter table TBG.LNE_RATE enable validate CONSTRAINT LNE_RATE_PK0;
alter table TBG.LNE_SCHEDULE enable validate CONSTRAINT LNE_SCHEDULE_PK;
alter table TBG.LNE_SCHEDULE_HIST enable validate CONSTRAINT LNE_SCHEDULE_HIST_PK;


select count(*) from TBG.LNE_AGR_PURPOSE;
SELECT * FROM TBG.LNE_SCHEDULE_HIST WHERE HIST_ID = 4;
update TBG.LNE_SCHEDULE_HIST set MODIFIED_BY = 'VEUG' WHERE HIST_ID = 4; -- VEU
commit;
update TBG.LNE_SCHEDULE_HIST set MODIFIED_BY = 'VEU' where HIST_ID = 4; -- TBGMIGR
commit;

SELECT * FROM TBG.LNE_SCHEDULE WHERE SCHED_ID = 1582829;
update TBG.LNE_SCHEDULE set UPDATED_BY = 'TBGMIGG' WHERE SCHED_ID = 1582829;
commit;
update TBG.LNE_SCHEDULE set UPDATED_BY = 'TBGMIGR' where SCHED_ID = 1582829; -- TBGMIGR
commit;

SELECT * FROM TBG.LNE_RATE WHERE RATE_ID = 1334211;
update TBG.LNE_RATE set UPDATED_BY = 'TBGMIGG' WHERE RATE_ID = 1334211;
commit;
update TBG.LNE_RATE set UPDATED_BY = 'TBGMIGR' where RATE_ID = 1334211; -- TBGMIGR
commit;


SELECT * FROM TBG.LNE_OPERATION_CHARGED WHERE OPER_ID = 313420;
update TBG.LNE_OPERATION_CHARGED set UPDATED_BY = 'PYUVG' where OPER_ID = 313420; -- PYUV
commit;
update TBG.LNE_OPERATION_CHARGED set UPDATED_BY = 'PYUV' where OPER_ID = 313420; -- TBGMIGR
commit;


SELECT * FROM TBG.LNE_OPERATION WHERE OPER_NO = 6422;
update TBG.LNE_OPERATION set UPDATED_BY = 'TBGMIGG' where OPER_NO = 6422; -- TBGMIGR
commit;
update TBG.LNE_OPERATION set UPDATED_BY = 'TBGMIGR' where OPER_NO = 6422; -- TBGMIGR
commit;


SELECT * FROM TBG.LNE_CONDITIONS WHERE COND_ID = 2;
update TBG.LNE_CONDITIONS set UPDATED_BY = 'TBGMIGG' where COND_ID = 2; -- TBGMIGR
commit;
update TBG.LNE_CONDITIONS set UPDATED_BY = 'TBGMIGR' where COND_ID = 2; -- TBGMIGR
commit;

SELECT * FROM TBG.LNE_COLLAT_INSURANCE WHERE INS_ID = 68;
update TBG.LNE_COLLAT_INSURANCE set UPDATED_BY = 'KAGG' where INS_ID = 68; -- KAG
commit;

SELECT * FROM TBG.LNE_COLLATERAL_ITEM where NO = 211;
update TBG.LNE_COLLATERAL_ITEM set UPDATED_BY = 'TBGMIGG' where NO = 211; -- TBGMIGR
commit;
update TBG.LNE_COLLATERAL set UPDATED_BY = 'TBGMIGR' where NO = 6; -- TBGMIGR
commit;

SELECT * FROM TBG.LNE_COLLATERAL where NO = 6;
update TBG.LNE_COLLATERAL set UPDATED_BY = 'TBGMIGG' where NO = 6; -- TBGMIGR
commit;
update TBG.LNE_COLLATERAL set UPDATED_BY = 'TBGMIGR' where NO = 6; -- TBGMIGR
commit;

select * from TBG.LNE_AGREEMENTS where AGR_NO = 16546;
update TBG.LNE_AGREEMENTS set CREATED_BY = 'VEU1' where AGR_NO = 16546; -- VEU
commit;
update TBG.LNE_AGREEMENTS set CREATED_BY = 'VEU' where AGR_NO = 16546; -- VEU
commit;


select * from TBG.LNE_ACCOUNTS where ID=2;
update TBG.LNE_ACCOUNTS set UPDATED_BY = 'TBGMIGG' where ID = 2; -- TBGMIGR
commit;
update TBG.LNE_ACCOUNTS set UPDATED_BY = 'TBGMIGR' where ID = 2; -- TBGMIGR
commit;



desc TBG.LNE_AGR_PURPOSE;
select count(*) from TBG.LNE_AGR_PURPOSE;
select * from TBG.LNE_AGR_PURPOSE where ID = 4220;
update TBG.LNE_AGR_PURPOSE set UPDATED_BY = 'TBGMIGG' where ID = 4220; -- TBGMIGR
commit;

update TBG.LNE_AGR_PURPOSE set UPDATED_BY = 'TBGMIGR' where ID = 4220; -- TBGMIGR
commit;

select 
    BRANCH, AGR_NO, START_DATE, SCHEDULE_TYPE_C, REMAINDER, PARENT_DATE, DOSR_DATE, UPDATED, UPDATED_BY, PRC_CALC_MODE, 
    SCHED_TYPE, EFFECT_RATE, PSK, ACT_PAY_FLAG, GR_CODE, EFFECT_RATE_2, LOST_INCOME, PRC_CALC_DATE, EXT_FLAG, EDIT_COND, 
    EDIT_PSK, EP, MIDDLE_PAYMENT, RESTRUCT_FLAG, INDIV_PSK, HDR_ID, LAST_PMT_DATE
from "TBG"."LNE_SCHEDULE_HDR";

select AGR_NO, START_DATE from "TBG"."LNE_SCHEDULE_HDR";


SELECT name, pdb, CON_ID FROM   v$services ORDER BY name;
alter session set container = FXLT1;
select * from prokunin_dba.tst_tab;

drop table PROKUNIN_DBA.TST_TAB;
/*
create table PROKUNIN_DBA.TST_TAB
(
  col1     integer      not null,
  col2	   varchar2(20),
  PRIMARY KEY(col1)
);
*/
CREATE TABLE "PROKUNIN_DBA"."TST_TAB" 
   (	"COL1" NUMBER(*,0) NOT NULL ENABLE, 
	"COL2" VARCHAR2(10 CHAR), 
	 PRIMARY KEY ("COL1")
); 
insert into "PROKUNIN_DBA"."TST_TAB" values (1, '1234567890');
commit
insert into "PROKUNIN_DBA"."TST_TAB" values (2, '1234567890');
commit

insert into "PROKUNIN_DBA"."TST_TAB" values (3, 'qwertyuiop');
commit

insert into "PROKUNIN_DBA"."TST_TAB" values (4, 'asdfghjkl;');
commit

insert into "PROKUNIN_DBA"."TST_TAB" values (5, 'asdfghjkl');
commit

insert into "PROKUNIN_DBA"."TST_TAB" values (6, 'ячсмитьбю.');
commit
--alter session set container=CDB$ROOT;
--ALTER SYSTEM SWITCH LOGFILE;
select * from "PROKUNIN_DBA"."TST_TAB" ;


------- ORIGINAL
  CREATE TABLE "PROKUNIN_DBA"."LNE_SCHEDULE_HDR" 
   (	"BRANCH" VARCHAR2(8 CHAR) NOT NULL ENABLE, 
	"AGR_NO" NUMBER NOT NULL ENABLE, 
	"START_DATE" DATE NOT NULL ENABLE, 
	"SCHEDULE_TYPE_C" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"REMAINDER" NUMBER NOT NULL ENABLE, 
	"PARENT_DATE" DATE, 
	"DOSR_DATE" DATE, 
	"UPDATED" TIMESTAMP (6) DEFAULT LOCALTIMESTAMP, 
	"UPDATED_BY" VARCHAR2(30 CHAR) DEFAULT coalesce(sys_context('userenv','client_identifier'), user), 
	"PRC_CALC_MODE" VARCHAR2(30 CHAR), 
	"SCHED_TYPE" VARCHAR2(30 CHAR), 
	"EFFECT_RATE" NUMBER, 
	"PSK" NUMBER, 
	"ACT_PAY_FLAG" VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE, 
	"GR_CODE" VARCHAR2(30 CHAR), 
	"EFFECT_RATE_2" NUMBER, 
	"LOST_INCOME" VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE, 
	"PRC_CALC_DATE" DATE, 
	"EXT_FLAG" VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE, 
	"EDIT_COND" VARCHAR2(1 CHAR) DEFAULT 'N', 
	"EDIT_PSK" VARCHAR2(1 CHAR) DEFAULT 'N', 
	"EP" NUMBER, 
	"MIDDLE_PAYMENT" NUMBER, 
	"RESTRUCT_FLAG" VARCHAR2(1 CHAR) DEFAULT 'N', 
	"INDIV_PSK" VARCHAR2(1 CHAR) DEFAULT 'N', 
	"HDR_ID" NUMBER DEFAULT null NOT NULL ENABLE, 
	"LAST_PMT_DATE" DATE, 
	 CONSTRAINT "LNE_SCHEDULE_HDR_PK" PRIMARY KEY ("AGR_NO", "START_DATE")
   ) ;

   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."BRANCH" IS 'Код филиала.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."AGR_NO" IS 'Внутренний номер договора.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."START_DATE" IS 'Дата, с которой начинает действовать график погашения.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."SCHEDULE_TYPE_C" IS 'Код операции (пролонгация, выдача ссуды, изменение графика).';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."REMAINDER" IS 'Остаток ссуды на момент построения графика.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."UPDATED" IS 'Дата изменения записи.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."UPDATED_BY" IS 'Пользователь, занесший изменения в запись.';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."PRC_CALC_MODE" IS 'DEPRECATED';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."SCHED_TYPE" IS 'Тип построения графика(ONE,MANY,ANNUITET)';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."EFFECT_RATE" IS 'Эффективная ставка';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."PSK" IS 'ПСК';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."ACT_PAY_FLAG" IS 'Признак актуального для текущих расчетов графика';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."GR_CODE" IS 'Тип ставки для расчета ПСК с учетом выпадающих доходов';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."EFFECT_RATE_2" IS 'Эффективная ставка  с учетом выпадающих доходов';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."LOST_INCOME" IS 'флаг расчета по ставке для выпадающих доходов';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."PRC_CALC_DATE" IS 'Дата начала расчета %%';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."EXT_FLAG" IS 'Признак загрузки графика извне';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."EDIT_COND" IS 'Признак ручного редактирования графика';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."EDIT_PSK" IS 'Признак редактирования ПСК';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."EP" IS 'сумма ежемесячного платежа(ссуда+%% для аннуитета, ссуда для дифференцированного)';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."MIDDLE_PAYMENT" IS 'Средний платеж';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."RESTRUCT_FLAG" IS 'Признак реструктуризации';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."INDIV_PSK" IS 'Признак расчета ПСК для индивидуального графика';
   COMMENT ON COLUMN "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"."LAST_PMT_DATE" IS 'Дата последнего платежа по ОД';
   COMMENT ON TABLE "PROKUNIN_DBA"."LNE_SCHEDULE_HDR"  IS 'Таблица истории заголовка графиков погашения.';


select * from "TBG"."LNE_SCHEDULE_HDR";
select count(*) from "TBG"."LNE_SCHEDULE_HDR";
select max(UPDATED) from TBG.LNE_SCHEDULE_HDR;
select * from "TBG"."LNE_SCHEDULE_HDR" where START_DATE = '14.06.23';
select * from "TBG"."LNE_SCHEDULE_HDR" where UPDATED > TO_TIMESTAMP('2023-04-24 13:36:47', 'YYYY-MM-DD HH24:MI:SS')
select * from "TBG"."LNE_SCHEDULE_HDR" where agr_no=33442;
update "TBG"."LNE_SCHEDULE_HDR" set updated_by = 'LNE_TEST' where agr_no=33442;
commit;
update "TBG"."LNE_SCHEDULE_HDR" set updated_by = 'LNE_ROBOT' where agr_no=33442;
commit

ALTER TABLE TBG.LNE_SCHEDULE_HDR drop   CONSTRAINT LNE_SCHEDULE_HDR_PK;
ALTER TABLE TBG.LNE_SCHEDULE_HDR ADD (
  CONSTRAINT LNE_SCHEDULE_HDR_PK
  PRIMARY KEY
  (AGR_NO, START_DATE)
  );
alter table TBG.LNE_SCHEDULE_HDR enable validate CONSTRAINT LNE_SCHEDULE_HDR_PK;


select * from "TBG"."LNE_SCHEDULE_HDR" where UPDATED_BY = 'LNE_ROBOT';
insert into "PROKUNIN_DBA"."LNE_SCHEDULE_HDR" select * from "TBG"."LNE_SCHEDULE_HDR" where agr_no=33442;
commit;
select * from "PROKUNIN_DBA"."LNE_SCHEDULE_HDR";
truncate table "PROKUNIN_DBA"."LNE_SCHEDULE_HDR";


update "PROKUNIN_DBA"."LNE_SCHEDULE_HDR" set updated_by = 'LNE_TEST' where agr_no=33442;
commit
update "PROKUNIN_DBA"."LNE_SCHEDULE_HDR" set updated_by = 'LNE_ROBOT' where agr_no=33442;
commit