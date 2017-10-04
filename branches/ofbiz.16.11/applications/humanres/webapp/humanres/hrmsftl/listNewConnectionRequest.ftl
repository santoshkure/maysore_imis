<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listNewConnectionRequest.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show New Connection Request -->

<#setting locale="en">

<form method="post" name="listNewConnection" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
		    <ul>
		 	 <div class="h3" align="center"><b>${uiLabelMap.listCustomerRequestDetail}</b></div> 
		   </ul>
	   </div>
		<div class="screenlet-body">
		 <table class="basic-table hover-bar" cellspacing="0">
		 <thead>
        	<tr class="header-row-2">
        	  <td>${uiLabelMap.sno}</td>
              <td>${uiLabelMap.customerId}</td>
	          <td>${uiLabelMap.connectionCategory}</td>
	          <td>${uiLabelMap.applicationType}</td>
              <td>${uiLabelMap.typeOfBuilding}</td>
              <td>${uiLabelMap.applicationDate}</td>
              <td>${uiLabelMap.action}</td>
           </tr>
           
          </thead>
           		<tbody>
           		<#assign i=1>
           		<#if actionConnectionList?exists>
           		<#list actionConnectionList as actionConnectionList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td><a href="viewCustomerConnectionDetail?checkId=${actionConnectionList.sequenceId?if_exists}&regId=${actionConnectionList.customerId?if_exists}">${actionConnectionList.customerId?if_exists}</a></td>
        				<td>${actionConnectionList.connectionCategory?if_exists}i</td>
	          			<td>${actionConnectionList.applicationType?if_exists}</td>
              			<td>${actionConnectionList.typeOfBuilding?if_exists}</td>
              			<td>${actionConnectionList.applicationDate?if_exists}</td>
              			<td><a href="actionNewConnection?checkId=${actionConnectionList.sequenceId?if_exists}&regId=${actionConnectionList.customerId?if_exists}" class="buttontext">${uiLabelMap.action}</a></td>
           			</tr>
           			<#assign i=i+1>
           			</#list>
           			</#if>
           		</tbody>
        		</table>
	  </div>
	</div>   
</form>
