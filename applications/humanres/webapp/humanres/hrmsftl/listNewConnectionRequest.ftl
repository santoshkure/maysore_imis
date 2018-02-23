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
    					<a href="javascript:getExcel();">
         				<img  border="0" src="/solr/img/filetypes/xls.png" width="20" height="20"  title="Click Here To Export List in Excel" /></a></blink></li>
    				</li>
    				<li>
    				<a title="View PDF" target="blank_" href="<@ofbizUrl>applyConnectionDetailPdf?customerId=${customerId?if_exists}&applicationType=${applicationType?if_exists}&listSizeView=${listSize?if_exists}</@ofbizUrl>"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a>
    				</li>
  				</ul>
 			 
  			</div>  
		   </ul>
	   </div>
		<div class="screenlet-body">
		<#assign commonUrl="approveNewConnection?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    			<#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    			<#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    			<@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
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
        				<td><#if connectionCategoryName?has_content><#list connectionCategoryName as CategoryList><#if '${CategoryList.ConnectionTypeId?if_exists}' == '${searchApplyConnectionList.connectionCategory?if_exists}'> ${CategoryList.connectionType?if_exists}</#if></#list></#if></td>
	          			<td><#if applicationTypeName?has_content><#list applicationTypeName as applicationTypeName><#if '${applicationTypeName.applicationTypeeId?if_exists}' == '${searchApplyConnectionList.applicationType?if_exists}'> ${applicationTypeName.applicationType?if_exists}</#if></#list></#if></td>
              			<td><#if buildingTypeName?has_content><#list buildingTypeName as buildingTypeName><#if '${buildingTypeName.buildingId?if_exists}' == '${searchApplyConnectionList.applicationType?if_exists}'> ${buildingTypeName.buildingType?if_exists}</#if></#list></#if></td>
              			<td>${searchApplyConnectionList.applicationDate?if_exists}</td>
              			<td><a href="actionNewConnection?checkId=${searchApplyConnectionList.sequenceId?if_exists}&regId=${searchApplyConnectionList.customerId?if_exists}" class="buttontext">${uiLabelMap.action}</a></td>
           			</tr>
           			<#assign i=i+1>
           			</#list>
           			</#if>
           		</tbody>
        		</table>
        		<@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
	  </div>
	</div>   
					<input type="hidden" name="xlsApplicationType" value="${applicationType?if_exists}"/>
                  	<input type="hidden" name="xlsCustomerId" value="${customerId?if_exists}"/>
</form>

<script>
function getExcel()
	{
	     var form =document['listNewConnection'];	
	     
        form.action="<@ofbizUrl>connectionRegistration</@ofbizUrl>";
	    form.submit();
	}
	
</script>