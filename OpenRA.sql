set feedback off
set heading off
set verify off
set echo off

spool D:\IS380SQL\Project\Due2\OpenRA.txt

-- Minh Le
-- Second Deliverable
-- IS 380 Project

prompt
prompt ****** OPEN a Return Authorization ******
prompt
-- display date
select 'Today''s date: ', to_char(sysdate, 'dd-MON-yyyy')
from dual;

-- enter customer name
accept vCust_num prompt 'Enter Customer Number: '

-- display customer information
select '   ' || 'Customer Name: ' || initcap(ltrim(rtrim(Lastname))) || ', ' || initcap(ltrim(rtrim(Firstname)))
from Customer
where Cust_num = '&vCust_num';
select '   ' || 'Shipping Address: ' || ltrim(rtrim(Address#))
from Customer
where Cust_num = '&vCust_num';
select '   ' || 'City, State Zip: ' || ltrim(rtrim(City)) || ', ' || ltrim(rtrim(Statename)) || ' ' || ltrim(rtrim(Zipcode))
from Customer
where Cust_num = '&vCust_num';
select '   ' || 'Phone: ', '(' || substr(Phone, 1, 3) || ')' || ' ' || substr(Phone, 4, 3) || '-' || substr(Phone, -4)
from Customer
where Cust_num = '&vCust_num';

-- enter product information
accept vProduct_num prompt 'Enter Product Number: '

-- display product information
select '   ' || 'Prod Number: ', Prod_num
from Product
where Prod_num = '&vProduct_num';
select '   ' || 'Product Description: ' || Pname
from Product
where Prod_num = '&vProduct_num';
select '   ' || 'Unit Price: ', ltrim(rtrim(to_char(UnitPrice, '$9999.99')))
from Product
where Prod_num = '&vProduct_num';

-- enter return quantity
accept vReturnQty prompt 'Enter the return quantity: ';

-- display amount return
select '   ' || 'Amount returned: ', ltrim(rtrim(to_char(&vReturnQty*UnitPrice, '$9999.99')))
from Product 
where Prod_num = '&vProduct_num';

prompt

-- Display return reason
prompt Please choose from the following reason code:

set heading on
column Code_num heading 'Reason|Code' format a7
column C_discription heading 'Reason|Discription'
select Code_num, C_discription
from Code;
set heading off

prompt

-- enter the reason code
accept vCode prompt 'Enter the reason code: ';

-- insert information into the RA table
insert into RA(RA#, RAdateOpen, RA_Status, Cust_num, Prod_num, Code_num, UnitPrice, RequestQty, RequestAmt_$)
select max_num, sysdate, 'Open', '&vCust_num', '&vProduct_num', '&vCode', UnitPrice, '&vReturnQty', &vReturnQty*UnitPrice
from Customer, Product, Code, Counter
where Customer.Cust_num = '&vCust_num' and Product.Prod_num = '&vProduct_num' and Code.Code_num = '&vCode';

-- display the return message
select '***** Return Authorization --> ' || max_num || ' is now Open'
from counter;
prompt ***** Please print the return label. Thank you! *****

select 'Return Authorization Number: ', ltrim(rtrim(max_num))
from counter;
prompt Mail to: 1213 Warehouse Road,
prompt          Gainesville, FL 13802

update counter set max_num = max_num + 1;
commit;

set echo on
spool off