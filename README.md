<h1 align="center">IS 380 Final Project</h1>
<h3 align= "center">Database Management</h3>

<h4 align="center">CALIFORNIA STATE UNIVERSITY, LONG BEACH</h4>
<h4 align="center">IS 380 – Database Management</h4>
<h4 align="center">Fall 2014 Term – Session 1</h4>

<h1 align="center">Project Description</h1>
<p>
	Things ‘n Things is an online company that sells hundreds of various products on its e-Commerce store, each product has a product number, description, and unit price.
	When customers are unsatisfied with their products, they return the products to Things ‘n Things, and Things ‘n Things issues credit to the customer. Each customer has a customer number and profile (such as name, address, etc.). 
	To return, the customer contacts our users at the Operations department and provides the product number, reason of the return, and how many units they are returning. 
	A return authorization is now ‘O’pened for this return with a return authorization (RA) number. Customer then mails the products to our warehouse. Our warehouse notifies our Operations department when it receives the products.
	Our Operations department then issues credits to the customer, and the return authorization is now ‘C’losed. 
	In addition to the processing of returns and credits, our management also wants to know why customers return (by reason code), how many returns have not been closed, and so on an so forth.
	Thing ‘n things have asked you to design a relational database (Entity Relationship Diagram and normalized tables) for the return process, and to complete the following five programs to process returns and produce reports for the management.
</p>
<h1 align="center">Program 1 - OpenRA.sql</h1>
<p>
	To open a return authorization (RA), the user would run the OpenRA.sql program. The system first prompts the greeting message and automatically displays today’s date. 
	The system then prompts the user to enter the customer number. Customer name (last name first, comma, then first name), address and phone are displayed. The system then prompts for the product number. 
	Product description and unit price is displayed. The system then asks for the return quantity and calculates return amount. Return reason codes are displayed and the user chooses one reason code from the list. 
	At this point, the system updates these data to the database, and assigned a unique RA Number to this return. The return status is ‘O’pen. The RA number and status is displayed for the user. A sample screen is as follows. 
	The bold underlined text indicates user input; everything else is displayed automatically.
</p>
<p>
	SQL> start a:OpenRA.sql<br>
	****** OPEN a Return Authorization ******<br>
	Today's Date: 22-MAR-2014<br>
	Enter Customer Number: 102<br>
	Customer Name: Jones, Elaine<br>
	Shipping Address: 123 Main Street<br>
	City, State Zip: Los Angeles, CA 91001<br>
	Phone: (323) 511-1199<br>
	Enter Product Number: P1<br>
	Prod Number: P1<br>
	Prod Description: Pencil<br>
	Unit Price: $2.00<br>
	Enter the return quantity: 20<br>
	Amount returned: $40.00<br>
	Please choose from the following reason code:<br>
	Reason Reason<br>
	Code Description<br>
	---------------------------------<br>
	1 Unsatisfied quality<br>
	2 Defective product<br>
	3 Cannot assemble<br>
	4 Different from description<br>
	5 Arrive too late<br>
	Enter the reason code: 1<br>
	***** Return Authorization --> 1001 is now Open<br>
	***** Please print the return label. Thank you! *****<br>
	Return Authorization Number: 1001<br>
	Mail to: 1213 Warehouse Road<br>
	Gainesville, FL 13802
</p>

<p>
	Note 1: Since the unit price may change over time, you need to store the unit price and amount credited information under each RA.<br>
	Note 2: At this moment, we trust the users to enter a valid reason code.<br>
	Note 3: To simplify the matter, the customer can only return one product at a time.<br>
	Note 4: The screen shots format are for your reference -- you do not need to count spaces or line spaces to match the screen shots, but you do need to display all information found on the screen shots with a similar appearance.<br>
</p>

<h1 align="center">Program 2 - CloseRA.sql</h1>
<p>
	The RA information is transmitted to the warehouse and the warehouse waits for the return to come in. The warehouse notifies us when the actual return is received. 
	The user runs the CloseRA program to update this information to the system.
	The system would first ask the user to enter the RA number, and displays all details of that return. The system then asks how many units have been received. 
	The system updates the RA close date, quantity received, amount credited, and set the RA status to ‘C’losed.
	Here is the sample screen shot:
</p>

<p>
	SQL> start a:CloseRA.sql<br>
	****** CLOSE a Return Authorization ******<br>
	Today’s Date: 31-MAR-2014<br>
	Enter RA Number: 1001<br>
	RA Number: 1001<br>
	RA Open Date: 22-MAR-2014<br>
	Customer Number: 102<br>
	Jones, Elaine<br>
	123 Main Street<br>
	Los Angeles, CA 91001<br>
	(323) 511-1199<br>
	Prod Number: P1<br>
	Prod Description: Pencil<br>
	Unit Price: $2.00<br>
	Reason Code: 1<br>
	Reason Description: Unsatisfied quality<br>
	Quantity requested to return: 20<br>
	Amount requested to return: $40.00<br>
	Please enter actual return quantity: 18<br>
	************************************<br>
	***** Return Authorization --> 1001 is now Closed<br>
	Date Closed: 31-MAR-2014<br>
	Quantity Received: 18<br>
	Amount Credited: $36.00
</p>

<h1 align="center">Program 3 - QueryRA.sql</h1>

<p>
	QueryRA.sql is a program to display details of the RA. In other words, the user enters the RA number, and details of the RA are displayed, like the following:
</p>

<p>
	SQL> start a:queryra<br>
	****** Return Authorization DETAIL Report ******<br>
	Enter RA Number: 1001<br>
	RA Number: 1001<br>
	RA Status: Closed<br>
	Customer Number: 102<br>
	Jones, Elaine<br>
	123 Main Street<br>
	Los Angeles, CA 91001<br>
	(323) 511-1199<br>
	Prod Number: P1<br>
	Prod Description: Pencil<br>
	Unit Price: $2.00<br>
	Reason Code: 1<br>
	Reason Description: Unsatisfied quality<br>
	RA Open Date: 22-MAR-2014<br>
	RA close Date: 31-MAR-2014<br>
	Quantity requested to return: 20<br>
	Amount requested to return: $40.00<br>
	Quantity received: 18<br>
	Amount credited: $36.00
</p>

<h1 align="center">Program 4 - Aging.sql</h1>
<p>
	Many RAs sit there open for a long time and the customers never bother to mail in the products. 
	The manager wants to know, how many RAs have been Opened for x number of days and have not been closed (this is typically called the “aging” report).
	Here is a sample of the report. Please sort your report by the longest DaysOpen first.
</p>
<p>
	SQL> start a:aging<br>
	****** OPEN RA AGING Report ******<br>
	Today’s Date: 10/28/2014<br>
	Please enter number of days to query: 30<br>
	<table>
		<tr>
			<th>RA <br> Number</th>
			<th>RA <br> Status</th>
			<th>Date <br> Open</th>
			<th>Prod <br> Num</th>
			<th>Product <br> Description</th>
			<th>Request <br> Qty</th>
			<th>Unit <br> Price</th>
			<th>Request <br> Amount</th>
			<th>Days <br> Open</th>
		</tr>
		<tr>
			<td>1008</td>
			<td>O</td>
			<td>4/11/2014</td>
			<td>P1</td>
			<td>Pencil</td>
			<td>42</td>
			<td>2.00</td>
			<td>84.00</td>
			<td>205</td>
		</tr>
		<tr>
			<td>1010</td>
			<td>O</td>
			<td>7/28/2014</td>
			<td>P5</td>
			<td>Eraser</td>
			<td>15</td>
			<td>3.00</td>
			<td>45.00</td>
			<td>92</td>
		</tr>
	</table>


<h1 align="center">Program 5 - ByReason.sql</h1>
<p>
	The management wants to know, for each product, what are the reasons for return.
	By running the ByReason program, the manager can see for each product, each reason, the number of return authorization, total request quantity and total request amount of returns. 
	Please note that, even the customers never mail in the products, by calling our Operations department, it indicates unsatisfaction of our products. 
	So this query should look at ALL return authorizations regardless of status. Here is a sample report:
</p>
<p>
	SQL> start a:byReason<br>
	****** Return Product BY REASON Report ******<br>
	<table>
		<tr>
			<th>Prod <br> Num</th>
			<th>Product <br> Description</th>
			<th>Reason <br> Code</th>
			<th>Reason <br> Description</th>
			<th>No of <br> Returns</th>
			<th>Total <br> Qty</th>
			<th>Total <br> Amount</th>
		</tr>
		<tr>
			<td>P1</td>
			<td>Pencil</td>
			<td>1</td>
			<td>Unsatisfied quality</td>
			<td>25</td>
			<td>1,220</td>
			<td>$2,440.00</td>
		</tr>
		<tr>
			<td>P1</td>
			<td>Pencil</td>
			<td>2</td>
			<td>Defective product</td>
			<td>3</td>
			<td>10</td>
			<td>$20.00</td>
		</tr>
		<tr>
			<td>P2</td>
			<td>Pen</td>
			<td>1</td>
			<td>Unsatisfied quality</td>
			<td>1</td>
			<td>3</td>
			<td>$4.50</td>
		</tr>
		<tr>
			<td>P2</td>
			<td>Pen</td>
			<td>5</td>
			<td>Arrive too late</td>
			<td>1</td>
			<td>500</td>
			<td>$750.00</td>
		</tr>
	</table>
</p>

