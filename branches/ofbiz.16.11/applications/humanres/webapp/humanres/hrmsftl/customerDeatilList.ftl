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
              		<td>${uiLabelMap.customerId}</td>
	          		<td>${uiLabelMap.customerName}</td>
	          		<td>${uiLabelMap.contact}</td>
	          		<td>${uiLabelMap.customerAddress}</td>
            		<td>${uiLabelMap.actionDate}</td>
            		<td>${uiLabelMap.CommonStatus}</td>
            		<td>${uiLabelMap.CommonEdit}</td>
           		</tr>
           </thead>
        
        <tbody>
        		<#assign i=1>
        		<#if actionConsumerList?exists>
        		<#list actionConsumerList as actionConsumerList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td><a href="viewCustomerRegiApproveDetail?conId=${actionConsumerList.customerId?if_exists}">${actionConsumerList.customerId?if_exists}</a></td>
	          			<td>${actionConsumerList.firstName?if_exists}</td>
              			<td>${actionConsumerList.mobileNumber?if_exists}</td>
              			<td>${actionConsumerList.address?if_exists}</td>
              			<td>${actionConsumerList.actionDate?if_exists}</td>
              			<td>${actionConsumerList.actionStatus?if_exists}</td>
              			<td><a href="<@ofbizUrl>editCustomerDetail?conId=${actionConsumerList.customerId?if_exists}</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
           			</tr>
           			<#assign i = i+1>      
           		</#list>
           		</#if>
     	</tbody>
       </table>
	  </div>
	</div>   
	
  </form>
