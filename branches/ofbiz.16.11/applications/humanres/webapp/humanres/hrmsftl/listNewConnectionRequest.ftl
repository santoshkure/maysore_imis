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
		 	 <li class="h3">${uiLabelMap.listCustomerRequestDetail}</li>
    		<div class="basic-nav" style="margin-top: -37.50px;">
  				<ul>
    				<li>
    				<a title="View PDF" target="blank_" href="<@ofbizUrl>applyConnectionDetailPdf?customerId=${customerId?if_exists}&applicationType=${applicationType?if_exists}&listSizeView=${listSize?if_exists}</@ofbizUrl>"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a>
    				</li>
  				</ul>
 			 
  			</div>  
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
           		<#if searchApplyConnectionList?exists>
           		<#list searchApplyConnectionList as searchApplyConnectionList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td><a href="viewCustomerConnectionDetail?checkId=${searchApplyConnectionList.sequenceId?if_exists}&regId=${searchApplyConnectionList.customerId?if_exists}">${searchApplyConnectionList.customerId?if_exists}</a></td>
        				<td>${searchApplyConnectionList.connectionCategory?if_exists}i</td>
	          			<td>${searchApplyConnectionList.applicationType?if_exists}</td>
              			<td>${searchApplyConnectionList.typeOfBuilding?if_exists}</td>
              			<td>${searchApplyConnectionList.applicationDate?if_exists}</td>
              			<td><a href="actionNewConnection?checkId=${searchApplyConnectionList.sequenceId?if_exists}&regId=${searchApplyConnectionList.customerId?if_exists}" class="buttontext">${uiLabelMap.action}</a></td>
           			</tr>
           			<#assign i=i+1>
           			</#list>
           			</#if>
           		</tbody>
        		</table>
	  </div>
	</div>   
</form>
