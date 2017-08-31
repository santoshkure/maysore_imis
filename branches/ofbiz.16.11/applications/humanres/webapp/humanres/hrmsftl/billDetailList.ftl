<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: billDetailList.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   23/08/2017         
<#-- #####################################################################################################-->
<#-- This ftl is used to show Current Bill Detail and All Bill Detail after Search -->

<#setting locale="en">

<form method="post" name="billDetailList" action="" class="basic-form">
		<div class="row">
			<div class="alert alert-info">
		    	<ul>
		 	 		<div class="h3" align="center"><b>${uiLabelMap.billDetailList}</b></div> 
		   		</ul>
	   		</div>
	   		<div class="screenlet-body">
		 		<table class="basic-table hover-bar" cellspacing="0">
		 		<thead>
        			<tr class="header-row-2">
        				<td>${uiLabelMap.sno}</td>
        				<td>${uiLabelMap.billNo}</td>
	          			<td>${uiLabelMap.customerNo}</td>
	          			<td>${uiLabelMap.connectionNo}</td>
              			<td>${uiLabelMap.customerName}</td>
              			<td>${uiLabelMap.billingPeriod}</td>
              			<td>${uiLabelMap.viewBill}</td>
              			<td>${uiLabelMap.pdf}</td>
           			</tr>
           		</thead>
           		<tbody>
        			<tr>
        				<td>1</td>
	          			<td>BillNo1</td>
	          			<td>CN10001</td>
              			<td><a href="viewCustomerConnectionActionDetail">CoN100012</a></td>
              			<td>Ravi Kuamr Rai</td>
              			<td>Jul-Aug 2017</td>
              			<td><a href="viewBillDetail" class="buttontext">${uiLabelMap.viewBill}</a></td>
              			<td><a target="blank_" href="viewBillDetailpdf"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a></td>
              			
           			</tr>
           			<tr>
        				<td>2</td>
	          			<td>BillNo2</td>
	          			<td>CN10002</td>
              			<td><a href="viewCustomerConnectionActionDetail">CoN100015</a></td>
              			<td>Rahul Tiwari</td>
              			<td>Jul-Aug 2017</td>
              			<td><a href="viewBillDetail" class="buttontext">${uiLabelMap.viewBill}</a></td>
              			<td><a target="blank_" href="viewBillDetailpdf"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a></td>
           			</tr>
           		</tbody>
        		</table>
	  		
		</div>   
	
 </form>
