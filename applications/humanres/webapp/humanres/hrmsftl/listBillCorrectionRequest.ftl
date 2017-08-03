<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listRtiApplyRequest.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Requested for connection Customer List  -->

<#setting locale="en">

<form method="post" name="listRtiApplyRequest" action="" class="basic-form">
		<div class="row">
			<div class="alert alert-info">
		    	<ul>
		 	 		<div class="h3" align="center"><b>${uiLabelMap.listBillCorrectionRequest}</b></div> 
		   		</ul>
	   		</div>
	   		<div class="screenlet-body">
		 		<table class="basic-table hover-bar" cellspacing="0">
		 		</thead>
        				<tr class="header-row-2">
	          				<td>${uiLabelMap.billCorrectionId}</td>
	          				<td>${uiLabelMap.billCorrectionNo}</td>
              				<td>${uiLabelMap.customerId}</td>
              				<td>${uiLabelMap.applyDate}</td>
              				<td>${uiLabelMap.action}</td>
           				</tr>
           		</thead>
       		 	<tbody>
						<tr>
        					<td><a href="viewBillCorrectionRequest">BillNo10001</a></td>
        					<td>KCNO10001</td>
	          				<td>10001</td>
              				<td>02/08/2017</td>
              				<td><a href="actionBillCorrection" class="buttontext">${uiLabelMap.action}</a></td>
           				</tr>
       		 	</tbody>
     	 	</table>
	  	</div>
   	</div>   
</form>