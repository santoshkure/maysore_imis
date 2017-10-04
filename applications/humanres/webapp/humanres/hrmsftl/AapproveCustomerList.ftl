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
        				<td>${uiLabelMap.registrationNo}</td>
	          			<td>${uiLabelMap.firstName}</td>
	          			<td>${uiLabelMap.lastName}</td>
	          			<td>${uiLabelMap.gender}</td>
	          			<td>${uiLabelMap.customerAddress}</td>
              			<td>${uiLabelMap.mobileNo}</td>
              			<td>${uiLabelMap.registrationDate}</td>
              			<td>${uiLabelMap.action}</td>
           			</tr>
           		</thead>
           		<tbody>
        			<#assign i=1>
            <#if registeredConsumerList?exists>
            <#list registeredConsumerList as registeredConsumerList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td title="View Details"><a href="viewCustomerRegistrationDetail?regis=${registeredConsumerList.registrationId?if_exists}">${registeredConsumerList.registrationId?if_exists}</a></td>
	          			<td>${registeredConsumerList.firstName?if_exists}</td>
	          			<td>${registeredConsumerList.lastName?if_exists}</td>
	          			<td>${registeredConsumerList.genderId?if_exists}</td>
	          			<td>${registeredConsumerList.address?if_exists}</td>
              			<td>${registeredConsumerList.mobileNumber?if_exists}</td>
              			<td>${registeredConsumerList.submittedDate?if_exists}</td>
              			<td><a href="actionNewRegistration?regis=${registeredConsumerList.registrationId?if_exists}" class="buttontext">${uiLabelMap.action}</a></td>
              			</tr>
              			<#assign i = i+1>      
    		</#list>
    		</#if>
           		</tbody>
        		</table>
	  		
		</div>   
	
 </form>
