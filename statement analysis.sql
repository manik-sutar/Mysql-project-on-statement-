##creating database 
create database Gourish_statement;

## using present database 
use Gourish_statement ;

#imported data  from csv file downloaded data 

##read data from statement 
select * from statement;

#3how many months are in dataset 
select Month from statement group by month ; 

# maximumn balance in statement

select max(balance) from statement;

#which date and month  as well as balance 

select Txn_Date,month,description,Ref_No from statement 
where balance=(select max(balance) from statement);

##Or 

select * from statement 
where balance=(select max(balance) from statement);

#few details are leftblank so i think we neeed to visit to banck so i updated that rows  
UPDATE statement 
SET Ref_no = 'Contact bank for ref_number'
WHERE Ref_no IS NULL OR Ref_no = '';

SET SQL_SAFE_UPDATES=0;

# minimun balance in statement
select min(balance) from statement;

#Ref_ no and data and description for min balance 
select * from statement
where balance=(select min(balance) from statement);

select min(Credit) from statement;
select * from  statement 

##second highest value credited 

where credit>(select min(Credit) from statement)
order by credit asc 
limit 1;

select max(debit) from statement;
select * from statement 
where debit=(select max(debit) from statement);

select min(debit) from statement ;

select sum(credit),month  from statement
group by month ;

select sum(debit),month  from statement
group by month ;

## top five credit  amount from account total monthwise 
select sum(credit),month 
 from statement 
 group by month 
order by sum(credit) desc limit 5;

## top five debit  amount from account total monthwise 
select sum(debit),month 
 from statement 
 group by month 
order by sum(debit) desc limit 5;

## top five balance  amount in  account total monthwise 
select sum(balance),month 
 from statement 
 group by month 
order by sum(balance) desc limit 5;

#top five crdit and debit and balance 
select * from statement 
order by credit desc limit 5; 
select * from statement 
order by debit  desc limit 5; 
select * from statement 
order by balance desc limit 5; 

#avarage crdit and debit and balance 
select avg(debit),avg(credit),avg(balance) from statement;

# sum of crdit and debit and balance 
select sum(credit),sum(debit),sum(balance) from statement;

# which month has hishest credit debit and balance 
select sum(credit),month from statement 
group by month 
order by sum(credit)
desc limit 1;

select sum(debit),month from statement 
group by month 
order by sum(debit)
desc limit 1;

select sum(balance ),month from statement 
group by month 
order by sum(balance)
desc limit 1;

select * from statement 
where month='April';

select * from statement 
where month='April' and credit>20000
order by credit desc;

 select * from statement 
where month='April' and credit>20000
order by credit desc limit 1;

select max(credit) from statement 
where month="april";

select * from statement 
where credit=(select max(credit) from statement 
where month="april") ;

select * from statement 
where credit=(select max(credit) from statement 
where month="may") ;

select * from statement 
where credit=(select max(credit) from statement 
where month="june") ;

select * from statement 
where credit=(select max(credit) from statement 
where month="may") ;

select *from statement 
where credit=(select max(credit) from statement 
where month='August') ;

SET SQL_SAFE_UPDATES = 0;

alter table statement 
add column bank_type varchar(50); 

alter table statement 
drop column bank_type;

alter table statement 
add column pan_number varchar(50);

alter table statement 
change column pan_number Pan_No varchar(50);

