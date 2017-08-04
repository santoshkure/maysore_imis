<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: ApproveCustomerList.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Requested for connection Customer List  -->

<#setting locale="en">

<form method="post" name="listApproveDetail" action="" class="basic-form">
		<div class="row">
			<div class="alert alert-info">
		    	<ul>
		 	 		<div class="h3" align="center"><b>${uiLabelMap.listCustomerDetail}</b></div> 
		   		</ul>
	   		</div>
	   		<div class="screenlet-body">
		 		<table class="basic-table hover-bar" cellspacing="0">
		 		<thead>
        			<tr class="header-row-2">
        				<td>${uiLabelMap.sno}</td>
	          			<td>${uiLabelMap.customerName}</td>
	          			<td>${uiLabelMap.customerAddress}</td>
              			<td>${uiLabelMap.Contact}</td>
              			<td>${uiLabelMap.registrationDate}</td>
              			<td>${uiLabelMap.action}</td>
           			</tr>
           		</thead>
           		<tbody>
        			<tr>
        				<td>1</td>
        				<td><a href="viewCustomerRegistrationDetail">Ravi Kuamr Rai</a></td>
	          			<td>Sahu Colony</td>
              			<td>4545454554</td>
              			<td>02/08/2017</td>
              			<td><a href="actionNewRegistration" class="buttontext">${uiLabelMap.action}</a></td>
           			</tr>
           		</tbody>
        		</table>
	  		
		</div>   
	
 </form>
