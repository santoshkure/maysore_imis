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
		 	 <div class="h3" align="center"><b>${uiLabelMap.listConnectionDetail}</b></div> 
		   </ul>
	   </div>
	   	<div class="screenlet-body">
			<table class="basic-table hover-bar" cellspacing="0">
				<thead>
        			<tr class="header-row-2">
        				<td>${uiLabelMap.sno}</td>
              			<td>${uiLabelMap.connectionNo}</td>
	          			<td>${uiLabelMap.customerNo}</td>
            			<td>${uiLabelMap.connectionCategory}</td>
            			<td>${uiLabelMap.applicationType}</td>
            			<td>${uiLabelMap.CommonEdit}</td>
            			<td>${uiLabelMap.forOfficeUseOnly}</td>
            			<td>${uiLabelMap.aprForSanction}</td>
           			</tr>
				</thead>
				
			<tbody>
			<#assign i=1>
			<#if connectionList?exists>
			<#list connectionList as connectionList>
					<tr>
						<td>${i?if_exists}</td>
        				<td><a href="viewCustomerConnectionActionDetail?checkId=${connectionList.sequenceId?if_exists}&validId=${connectionList.costomerNo?if_exists}">${connectionList.connectionNo?if_exists}</a></td>
        				<td>${connectionList.customerId?if_exists}</td>
        				<td>${connectionList.connectionCategory?if_exists}</td>
        				<td>${connectionList.applicationType?if_exists}</td>
              			<td><a href="<@ofbizUrl>editConnectionDetail?checkId=${connectionList.sequenceId?if_exists}&validId=${connectionList.costomerNo?if_exists}</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
              			<td><a href="<@ofbizUrl>forOfficeUseOnly</@ofbizUrl>" class="buttontext">${uiLabelMap.forOfficeUseOnly}</a></td>
              			<td><a href="<@ofbizUrl>aprForSanction</@ofbizUrl>" class="buttontext">${uiLabelMap.aprForSanction}</a></td>
           			</tr>
           			<#assign i=i+1>
           			</#list>
           			</#if>
     		</tbody>
       </table>
	  </div>
	</div>   
  </form>