set feedback off
set heading on
set verify on
set echo off

spool D:\IS380SQL\Project\Due3\ByReason.txt

-- Minh Le
-- Final Deliverable
-- IS 380 Project

prompt
prompt ****** Return Product BY REASON Report ******
prompt

column Prod_num heading 'Prod|Num' format a5
column Pname heading 'Product|Description' format a11
column Code_num heading 'Reason|Code' format a6
column C_discription heading 'Reason|Description' format a23
column count(RA#) heading 'No of|Returns'  format 9999
column sum(RequestQty) heading 'Total|Qty' format 9999
column sum(RequestAmt_$) heading 'Total|Amount'format $9999.99

select RA.Prod_num, Pname, RA.Code_num, C_discription, count(RA#), sum(RequestQty), sum(RequestAmt_$)
from RA, Product, Code
where RA.Prod_num = Product.Prod_num and RA.Code_num = Code.Code_num
group by RA.Prod_num, Pname, RA.Code_num, C_discription;

set echo on
spool off