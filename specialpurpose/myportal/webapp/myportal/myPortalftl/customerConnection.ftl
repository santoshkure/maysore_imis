<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerConnection.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   30/10/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Connection Detail -->

<#setting locale="en">
    
<form method="post" name="listConnectionDetail" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
		   <ul>
    		<li class="h3">${uiLabelMap.listConnectionDetail}</li>
    		<div class="basic-nav" style="margin-top: -37.50px;">
  			</div>  
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
            			<td>${uiLabelMap.status}</td>
           			</tr>
				</thead>
				
			<tbody>
			<#assign i=1>
			<#if customerConnetion?exists>
			<#list customerConnetion as customerConnetion>
					<tr>
						<td>${i?if_exists}</td>
        				<td><#if '${customerConnetion.connectionNo?if_exists}' == "NA">NA
        				<#else><a href="viewCustomerConnectionActionDetail?checkId=${customerConnetion.sequenceId?if_exists}&validId=${customerConnetion.costomerNo?if_exists}">${customerConnetion.connectionNo?if_exists}</a></td>
        				</#if>
        				<td>${customerConnetion.customerId?if_exists}</td>
        				<td>${customerConnetion.connectionCategory?if_exists}</td>
        				<td>${customerConnetion.applicationType?if_exists}</td>
              			<td><#if '${customerConnetion.actionStatus?if_exists}' == "approve">Approved
					<#else>${customerConnetion.actionStatus?if_exists}</#if></td>
           			</tr>
           			<#assign i=i+1>
           			</#list>
           			</#if>
     		</tbody>
       </table>
	  </div>
	</div>   
  </form>