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
    		<li class="h3">${uiLabelMap.listConnectionDetail}</li>
    		<div class="basic-nav" style="margin-top: -37.50px;">
  				<ul>
    				<li>
    				<a title="View PDF" target="blank_" href="<@ofbizUrl>connectionDetailPdf?connectionNo=${connectionNo?if_exists}&customerId=${customerId?if_exists}&applicationType=${applicationType?if_exists}&listSizeView=${listSize?if_exists}</@ofbizUrl>"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a>
    				</li>
  				</ul>
 			 
  			</div>  
    	</ul>
	   </div>
	   	<div class="screenlet-body">
	   			<#assign commonUrl="connectionDetails?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    			<#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    			<#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    			<@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
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
			<#if searchConnectionList?exists>
			<#list searchConnectionList as searchConnectionList>
					<tr>
						<td>${i?if_exists}</td>
        				<td><a href="viewCustomerConnectionActionDetail?checkId=${searchConnectionList.sequenceId?if_exists}&validId=${searchConnectionList.costomerNo?if_exists}">${searchConnectionList.connectionNo?if_exists}</a></td>
        				<td>${searchConnectionList.customerId?if_exists}</td>
        				<td>${searchConnectionList.connectionCategory?if_exists}</td>
        				<td>${searchConnectionList.applicationType?if_exists}</td>
              			<td><a href="<@ofbizUrl>editConnectionDetail?checkId=${searchConnectionList.sequenceId?if_exists}&validId=${searchConnectionList.costomerNo?if_exists}</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
              			<td><a href="<@ofbizUrl>forOfficeUseOnly</@ofbizUrl>" class="buttontext">${uiLabelMap.forOfficeUseOnly}</a></td>
              			<td><a href="<@ofbizUrl>aprForSanction</@ofbizUrl>" class="buttontext">${uiLabelMap.aprForSanction}</a></td>
           			</tr>
           			<#assign i=i+1>
           			</#list>
           			</#if>
     		</tbody>
       </table>
       <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
	  </div>
	</div>   
  </form>