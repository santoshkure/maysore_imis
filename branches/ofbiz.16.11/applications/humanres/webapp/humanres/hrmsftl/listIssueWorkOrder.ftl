<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listIssueWorkOrder.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Requested for connection Customer List  -->

<#setting locale="en">

<form method="post" name="listIssueWorkOrder" action="" class="basic-form">
		<div class="row">
			<div class="alert alert-info">
		    	<ul>
		 	 		<div class="h3" align="center"><b>${uiLabelMap.listIssueWorkOrder}</b></div> 
		   		</ul>
	   		</div>
	   		<div class="screenlet-body">
		 		<table class="basic-table hover-bar" cellspacing="0">
		 		</thead>
        				<tr class="header-row-2">
        					<td>${uiLabelMap.sno}</td>
	          				<td>${uiLabelMap.workOrderNo}</td>
              				<td>${uiLabelMap.applicationDate}</td>
              				<td>${uiLabelMap.CommonEdit}</td>
           				</tr>
           		</thead>
       		 	<tbody>
						<tr>
							<td>1</td>
        					<td><a href="viewIssueWorkOrder">BillNo10001</a></td>
              				<td>02/08/2017</td>
              				<td><a href="editIssueWorkOrder" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
           				</tr>
       		 	</tbody>
     	 	</table>
	  	</div>
   	</div>   
</form>