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
    				<li>
    				<a href="javascript:getExcel();">
         				<img  border="0" src="/solr/img/filetypes/xls.png" width="20" height="20"  title="Click Here To Export List in Excel" /></a></blink></li>
    				</li>
    				<li>
    				<a title="View PDF" target="blank_" href="<@ofbizUrl>customerDetailPdf?nameOfCustomer=${nameOfCustomer?if_exists}&customerId=${customerId?if_exists}&listSizeView=${listSize?if_exists}</@ofbizUrl>"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a>
    				</li>
  				</ul>
  	</div>
  	
	   </div>
	   <div class="screenlet-body">
	   <#assign commonUrl="customerDeatil?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
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
            		<td>${uiLabelMap.actionDate}</td>
            		<td>${uiLabelMap.CommonStatus}</td>
            		<td>${uiLabelMap.CommonEdit}</td>
            		<td>${uiLabelMap.CommonDisable}/${uiLabelMap.CommonEnable}</td>
           		</tr>
           </thead>
        
        <tbody>
        		<#assign i=1>
        		<#if searchCustomerList?exists>
        		<#list searchCustomerList as searchCustomerList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td><a href="viewCustomerRegiApproveDetail?conId=${searchCustomerList.customerId?if_exists}">${searchCustomerList.customerId?if_exists}</a></td>
	          			<td>${searchCustomerList.firstName?if_exists}</td>
              			<td>${searchCustomerList.mobileNumber?if_exists}</td>
              			<td>${searchCustomerList.address?if_exists}</td>
              			<td>${searchCustomerList.actionDate?if_exists}</td>
              			<td>${searchCustomerList.actionStatus?if_exists}</td>
              			<td><a href="<@ofbizUrl>editCustomerDetail?conId=${searchCustomerList.customerId?if_exists}</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
           				<td>
           				<#if '${searchCustomerList.actionStatus?if_exists}' == "Disable">
           				<a title="Enable" href="javascript:disableEnableCustomer('listcustomerDetail','Enable','${searchCustomerList.customerId?if_exists}','Y');" class="buttontext">${uiLabelMap.CommonEnable}</a>
           				<#else>
           				<a title="Disable" href="javascript:disableEnableCustomer('listcustomerDetail','Disable','${searchCustomerList.customerId?if_exists}','N');" class="buttontext">${uiLabelMap.CommonDisable}</a>
           				</#if>
           				</td>
           				
           			</tr>
           			<#assign i = i+1>      
           		</#list>
           		</#if>
     	</tbody>
       </table>
       <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
	  </div>
	</div>   
					<input type="hidden" name="customerId" value="" style="width:140px"  />
                  	<input type="hidden" name="activestatus" value="" style="width:140px"  />
                  	<input type="hidden" name="status" value="" style="width:140px"  />
                  	<input type="hidden" name="listSizeView" value="" style="width:140px"  />
                  	<input type="hidden" name="xlsCustomerId" value="${customerId?if_exists}"/>
                  	<input type="hidden" name="xlsNameOfCustomer" value="${nameOfCustomer?if_exists}"/>
  </form>
  
  <script>
  function disableEnableCustomer(formname,status,id,activestd)
	{
	     var form =document[formname];	
	     form.customerId.value=id;
	     form.activestatus.value = activestd;
	     form.status.value = status;
	       
	     if((activestd=="N") ||(activestd=="Y"))
	     {
            var r=confirm("Are you sure, you want to "+status+" Customer ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>disEnbCustomer</@ofbizUrl>";
	    form.submit();
	} }}	
	
	function getExcel()
	{
	     var form =document['listcustomerDetail'];	
	     
        form.action="<@ofbizUrl>customerDetailXLS</@ofbizUrl>";
	    form.submit();
	}
	
</script>