set feedback off
set heading off
set verify off
set echo off

spool D:\IS380SQL\Project\Due3\Aging.txt

-- Minh Le
-- Final Deliverable
-- IS 380 Project

prompt
prompt ****** OPEN RA AGING REPORT ******
prompt

-- display the current date
select 'Today''s Date: ', to_char(sysdate, 'mm/dd/yyyy') from dual;

-- let user inputs number of day he/she wants to check
accept vDay prompt 'Please enter number of days to query: '

set heading on
--show the record
column RA# heading 'RA|Number' format 99999
column RA_Status heading 'RA|Status' format a6
column DateOpen heading 'Date|Open' format a10
column Prod_num heading 'Prod|Num' format a4
column Pname heading 'Product|Description' format a11
column RequestQty heading 'Request|Qty' format 9999
column UnitPrice heading 'Unit|Price' format 9999.99
column RequestAmt_$ heading 'Request|Amount' format 9999.99
column DaysOpen heading 'Days|Open' format 999

select RA#, RA_Status, to_char(RAdateOpen, 'mm/dd/yyyy') DateOpen, RA.Prod_num, Pname, RequestQty, RA.UnitPrice, RequestAmt_$, trunc(sysdate)-trunc(RAdateOpen) DaysOpen
from RA, Product
where RA_Status = 'Open' and RA.Prod_num = Product.Prod_num and trunc(RAdateOpen) <= trunc(sysdate) - trunc(&vDay) order by DaysOpen desc;

set heading off
set echo on

spool off