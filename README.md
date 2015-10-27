<h1 align="center">IS 380 Final Project</h1>
<h3 align= "center">Database Management</h3>

<h4 align="center">CALIFORNIA STATE UNIVERSITY, LONG BEACH</h4>
<h4 align="center">IS 380 – Database Management</h4>
<h4 align="center">Fall 2014 Term – Session 1</h4>

<h1>Project Description</h1>
<p>
	Things ‘n Things is an online company that sells hundreds of various products on its e-Commerce store, each product has a product number, description, and unit price.
	When customers are unsatisfied with their products, they return the products to Things ‘n Things, and Things ‘n Things issues credit to the customer. Each customer has a customer number and profile (such as name, address, etc.). 
	To return, the customer contacts our users at the Operations department and provides the product number, reason of the return, and how many units they are returning. 
	A return authorization is now ‘O’pened for this return with a return authorization (RA) number. Customer then mails the products to our warehouse. Our warehouse notifies our Operations department when it receives the products.
	Our Operations department then issues credits to the customer, and the return authorization is now ‘C’losed. 
	In addition to the processing of returns and credits, our management also wants to know why customers return (by reason code), how many returns have not been closed, and so on an so forth.
	Thing ‘n things have asked you to design a relational database (Entity Relationship Diagram and normalized tables) for the return process, and to complete the following five programs to process returns and produce reports for the management.
</p>
<h1>Program 1 - OpenRA.sql</h1>
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
