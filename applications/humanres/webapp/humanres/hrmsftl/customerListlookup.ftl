<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerListLookup.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/11/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Customer List in Lookup-->

<#setting locale="en">
    
<form method="post" name="lookuplistCustomerDetail" action="" class="basic-form">
	   <div class="screenlet-body">
	   <#assign commonUrl="customerLookupDetail?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
	   
		<table class="basic-table hover-bar" cellspacing="0">
			<thead>
        		<tr class="header-row-2">
        			<td>${uiLabelMap.sno}</td>
              		<td>${uiLabelMap.customerId}</td>
	          		<td>${uiLabelMap.customerName}</td>
	          		<td>${uiLabelMap.contact}</td>
	          		<td>${uiLabelMap.customerAddress}</td>
           		</tr>
           </thead>
        
        <tbody>
        		<#assign i=1>
        		<#if lookupSearchList?exists>
        		<#list lookupSearchList as lookupSearchList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td><a onclick="set_value('${lookupSearchList.customerId?if_exists}')">${lookupSearchList.customerId?if_exists}</a></td>
	          			<td>${lookupSearchList.firstName?if_exists}</td>
              			<td>${lookupSearchList.mobileNumber?if_exists}</td>
              			<td>${lookupSearchList.address?if_exists}</td>
           			</tr>
           			<#assign i = i+1>      
           		</#list>
           		</#if>
     	</tbody>
       </table>
       <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
	  </div>
	</div>   
  </form>