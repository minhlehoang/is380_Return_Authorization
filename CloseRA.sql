set feedback off
set heading off
set verify off
set echo off

spool D:\IS380SQL\Project\Due3\CloseRA.txt

-- Minh Le
-- Final Deliverable
-- IS 380 Project

prompt
prompt ****** CLOSE a Return Authorization ******
prompt

-- display date
select 'Today''s Date: ', to_char(sysdate, 'dd-MON-yyyy')
from dual;

-- enter RA number
accept vRA_num prompt 'Enter RA Number: '

-- display RA Number and RA Open date
select 'RA Number: ', ltrim(rtrim(RA#))
from RA
where RA# = &vRA_num;

select 'RA Open Date: ', to_char(RAdateOpen, 'dd-MON-yyyy')
from RA
where RA# = &vRA_num; 

-- display customer information
select 'Customer Number: ', Cust_num
from RA
where RA# = &vRA_num;

select '   ' || initcap(ltrim(rtrim(Lastname))) || ', ' || initcap(ltrim(rtrim(Firstname)))
from Customer, RA
where Customer.Cust_num = RA.Cust_num and RA# = &vRA_num;

select '   ' || Address#
from Customer, RA
where Customer.Cust_num = RA.Cust_num and RA# = &vRA_num;

select '   ' || City || ', ' || Statename || ' ' || Zipcode
from Customer, RA
where Customer.Cust_num = RA.Cust_num and RA# = &vRA_num;

select '   ' || '(' || substr(Phone, 1, 3) || ')' || ' ' || substr(Phone, 4, 3) || '-' || substr(Phone, -4)
from Customer, RA
where Customer.Cust_num = RA.Cust_num and RA# = &vRA_num;

-- display product information
select 'Pro Number: ', Product.Prod_num
from Product, RA
where Product.Prod_num = RA.Prod_num and RA# = &vRA_num;

select '   ' || 'Prod Description: ', Pname
from Product, RA
where Product.Prod_num = RA.Prod_num and RA# = &vRA_num;

select '   ' || 'Unit Price: ', ltrim(rtrim(to_char(Product.UnitPrice, '$9999.99')))
from Product, RA
where Product.Prod_num = RA.Prod_num and RA# = &vRA_num; 

-- display reason code and reason description
select 'Reason Code: ', Code.Code_num
from Code, RA
where Code.Code_num = RA.Code_num and RA# = &vRA_num;

select 'Reason Description: ', C_discription
from RA, Code
where RA# = &vRA_num and RA.Code_num = Code.Code_num;

-- display quantity and amount requested to return
select 'Quantity requested to return: ', ltrim(rtrim(RequestQty))
from RA
where RA# = &vRA_num;
select 'Amount requested to return: ', ltrim(rtrim(to_char(RequestAmt_$, '$9999.99')))
from RA
where RA# = &vRA_num;

prompt
prompt
-- enter quantity actual return
accept vActReturnQty prompt 'Please enter actual return quantity: '


update RA
set RAdateClose = sysdate, ActReturnQty = '&vActReturnQty', ActReturnAmt_$ = &vActReturnQty*UnitPrice, RA_Status = 'Closed'
where RA# = &vRA_num;

-- display the close message
prompt ************************************
select '**** Return Authorization --> ' || RA# || ' is now Closed'
from RA
where RA# = &vRA_num;

-- display date closed
select 'Date Closed: ', to_char(RAdateClose, 'dd-MON-yyyy')
from RA
where RA# = &vRA_num;

-- display quantity received
select 'Quantity Received: ', ltrim(rtrim(ActReturnQty))
from RA
where RA# = &vRA_num;

-- display amount credit
select 'Amount Credited: ', ltrim(rtrim(to_char(ActReturnAmt_$, '$9999.99')))
from RA
where RA# = &vRA_num;

commit;

set echo on
spool off