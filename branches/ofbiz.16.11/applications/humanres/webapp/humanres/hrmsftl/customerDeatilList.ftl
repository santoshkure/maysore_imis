<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerDetailList.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Customer Detail -->

<#setting locale="en">
    
<form method="post" name="listcustomerDetail" action="" class="basic-form">
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
              		<td>${uiLabelMap.customerNo}</td>
	          		<td>${uiLabelMap.customerName}</td>
	          		<td>${uiLabelMap.customerAddress}</td>
             		<td>${uiLabelMap.contact}</td>
             		<td>${uiLabelMap.registrationDate}</td>
            		<td>${uiLabelMap.actionDate}</td>
            		<td>${uiLabelMap.CommonStatus}</td>
            		<td>${uiLabelMap.CommonEdit}</td>
           		</tr>
           </thead>
        
        <tbody>
        		<tr>
        			<td>1</td>
        			<td><a href="viewCustomerRegiApproveDetail">10001</a></td>
        			<td>Ravi Kumar Rai</td>
	          		<td>Sector 3, Lane No. 1 Sahu Colony Pune</td>
              		<td>0123345677</td>
              		<td>02/08/2017</td>
              		<td>02/08/2017</td>
              		<td>Approved</td>
              		<td><a href="<@ofbizUrl>editCustomerDetail</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
           		</tr>
     	</tbody>
       </table>
	  </div>
	</div>   
	
  </form>
