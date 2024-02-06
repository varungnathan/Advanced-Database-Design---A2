DROP TABLE IF EXISTS account;
create table if not exists account
(
account_number char(5) not null primary key,
branch_name varchar(10),
balance double
);


--

insert into account values('A-101', 'Downtown',   500);
insert into account values('A-102', 'Perryridge', 400);
insert into account values('A-201', 'Brighton',   900);
insert into account values('A-215', 'Mianus',     700);
insert into account values('A-217', 'Brighton',   750);
insert into account values('A-222', 'Redwood',    700);
insert into account values('A-305', 'Round Hill', 350);