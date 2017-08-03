<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listConnectionDetails.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Connection Detail -->

<#setting locale="en">
    
<form method="post" name="listConnectionDetail" action="" class="basic-form">
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
        	  			<td>Connection No</td>
              			<td>${uiLabelMap.customerId}</td>
	          			<td>${uiLabelMap.customerName}</td>
	          			<td>Connection Type</td>
             			<td>${uiLabelMap.contact}</td>
             			<td>${uiLabelMap.applyDate}</td>
            			<td>${uiLabelMap.approveDate}</td>
            			<td>${uiLabelMap.CommonStatus}</td>
            			<td>${uiLabelMap.CommonEdit}</td>
           			</tr>
				</thead>
				
			<tbody>
					<tr>
        				<td><a href="viewCustomerConnectionDetail">CNMCC10001</a></td>
        				<td><a href="">10001</a></td>
        				<td>Ravi Kumar Rai</td>
        				<td>permanent</td>
              			<td>0123345677</td>
              			<td>02/08/2017</td>
              			<td>02/08/2017</td>
              			<td>Approved</td>
              			<td><a href="<@ofbizUrl>editConnectionDetail</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
           			</tr>
     		</tbody>
       </table>
	  </div>
	</div>   
  </form>