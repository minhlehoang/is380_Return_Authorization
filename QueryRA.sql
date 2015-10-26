set feedback off
set heading off
set verify off
set echo off

spool D:\IS380SQL\Project\Due2\QueryRA.txt

-- Minh Le
-- Second Deliverable
-- IS 380 Project

prompt
prompt ****** Return Authorization DETAIL Report ******
prompt

-- enter RA number
accept vRA_num prompt 'Enter RA Number: '

-- display RA number and status
select 'RA Number: ', ltrim(rtrim(RA#))
from RA
where RA# = &vRA_num;
select 'RA Status: ', RA_Status
from RA
where RA# = &vRA_num;

-- display customer information
select 'Customer Number: ', ltrim(rtrim(Cust_num))
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

-- display product description
select '   ' || 'Prod Description: ', ltrim(rtrim(Pname))
from Product, RA
where RA# = &vRA_num and Product.Prod_num = RA.Prod_num;

-- display unit price
select '   ' || 'Unit Price: ', ltrim(rtrim(to_char(Product.UnitPrice, '$9999.99')))
from Product, RA
where RA# = &vRA_num and Product.Prod_num = RA.Prod_num;


-- display reason code
select 'Reason Code: ', ltrim(rtrim(Code.Code_num))
from Code, RA
where Code.Code_num = RA.Code_num and RA# = &vRA_num;
select 'Reason Description: ', C_discription
from RA, Code
where RA# = &vRA_num and RA.Code_num = Code.Code_num;

-- display open date and close date
select 'RA Open Date: ', RAdateOpen
from RA
where RA# = &vRA_num;

select 'RA Close Date: ', RAdateClose
from RA
where RA# = &vRA_num;

-- display quantity and amount requested to return
select 'Quantity requested to return: ', ltrim(rtrim(RequestQty))
from RA
where RA# = &vRA_num;

select 'Amount requested to return: ', ltrim(rtrim(to_char(RequestAmt_$, '$9999.99')))
from RA
where RA# = &vRA_num;

-- display quantity received and amount credited
select 'Quantity received: ', ltrim(rtrim(ActReturnQty))
from RA
where RA# = &vRA_num;
select 'Amount credited: ', ltrim(rtrim(to_char(ActReturnAmt_$, '$9999.99')))
from RA
where RA# = &vRA_num;

set echo on
spool off