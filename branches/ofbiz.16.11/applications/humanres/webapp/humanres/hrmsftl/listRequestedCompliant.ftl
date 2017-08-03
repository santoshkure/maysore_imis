<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listRequestCompliant.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Request Compliant -->

<#setting locale="en">
    
<form method="post" name="listRequestCompliant" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
		    <ul>
		 	 <div class="h3" align="center"><b>${uiLabelMap.listRequestComplaint}</b></div> 
		   </ul>
	   </div>
	   <div class="screenlet-body">
			<table class="basic-table hover-bar" cellspacing="0">
		 		<thead>
        			<tr class="header-row-2">
        	  			<td>${uiLabelMap.complaintId}</td>
              			<td>${uiLabelMap.consumerId}</td>
	          			<td>${uiLabelMap.compliantApplyDate}</td>
	          			<td>${uiLabelMap.complaintType}</td>
            			<td>${uiLabelMap.action}</td>
           			</tr>
        		</thead>
           
       		 	<tbody>
					<tr>
        				<td><a href="viewComplaintDetail">CID10001</a></td>
        				<td><a href="viewCustomerRegiApproveDetail">10001</a></td>
	          			<td>02/08/2017</td>
              			<td>Complaint Type</td>
              			<td><a href="actionCompliantRequest" class="buttontext">${uiLabelMap.action}</a></td>
           			</tr>
       		 	</tbody>
     		 </table>
		</div>
	</div>   
</form>