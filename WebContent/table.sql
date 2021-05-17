create table tbl_cust_201004(
	cust_id  char(4) primary key,
	cust_name varchar2(10),
	cust_birth char(8),
	cust_tel1 char(3),
	cust_tel2 char(4),
	cust_tel3 char(4),
	cust_gender char(1),
	city char(2)
)
drop table tbl_cust_201004;
select * from TBL_CUST_201004;
insert into TBL_CUST_201004 values('1001','김요한','20030205','010','2133','9701','M','10');
insert into TBL_CUST_201004 values('1002','박요한','20040206','010','6565','5462','F','20');
insert into TBL_CUST_201004 values('1003','필요한','20050607','010','6363','8753','M','40');
insert into TBL_CUST_201004 values('1004','즁요한','20060408','010','0205','2100','F','30');
insert into TBL_CUST_201004 values('1005','요염한','20071220','010','1234','9999','F','10');


create table tbl_order_201004(
	i_code number(8),
	v_code char(5),
	cust_id  char(4),
	i_date date
)
select B.i_code, A.cust_id,A.cust_name ,B.v_code,C.v_name,B.i_date from TBL_CUST_201004 A,TBL_ORDER_201004 B,TBL_INJECTION_201004 C where A.cust_id = B.cust_id and B.v_code = C.v_code
drop table tbl_order_201004;
select * from TBL_ORDER_201004;
insert into TBL_ORDER_201004 values(20200001,'A0001','1001','2019-02-05');
insert into TBL_ORDER_201004 values(20200002,'A0002','1002','2019-02-07');
insert into TBL_ORDER_201004 values(20200003,'A0003','1003','2019-02-08');
insert into TBL_ORDER_201004 values(20200004,'A0004','1004','2019-02-09');
insert into TBL_ORDER_201004 values(20200005,'A0005','1005','2019-02-10');

select B.i_code, A.cust_id,A.cust_name ,B.v_code,C.v_name,B.i_date from TBL_CUST_201004 A,TBL_ORDER_201004 B,TBL_INJECTION_201004 C where A.cust_id = B.cust_id and B.i_code = C.i_code;

drop table tbl_injection_201004;

create table tbl_injection_201004(
	v_code char(5),
	v_name varchar2(20),
	i_age varchar2(20)
)

insert into tbl_injection_201004 values('A0001','코로나','20');
insert into tbl_injection_201004 values('A0002','메로나','20');
insert into tbl_injection_201004 values('A0003','바나나','20');
insert into tbl_injection_201004 values('A0004','와나나','20');
insert into tbl_injection_201004  values('A0005','어쩌나','20');

select A.v_code,B.v_name,count(B.v_name) count 
from  TBL_ORDER_201004 A , TBL_INJECTION_201004 B where A.v_code = B.v_code 
group by A.v_code,B.v_name order by A.v_code asc;


