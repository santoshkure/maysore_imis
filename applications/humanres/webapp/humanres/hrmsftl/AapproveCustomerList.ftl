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
    		<li class="h3">${uiLabelMap.listCustomerDetail}</li>
    		<div class="basic-nav" style="margin-top: -37.50px;">
  				<ul>
    				<li>
    				<a title="View PDF" target="blank_" href="<@ofbizUrl>customerRegiDetailPdf?nameOfCustomer=${nameOfCustomer?if_exists}&registrationNo=${registrationNo?if_exists}&listSizeView=${listSize?if_exists}</@ofbizUrl>"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a>
    				</li>
  				</ul>
 			 
  			</div>  
    	</ul>
	   		</div>
	   		<div class="screenlet-body">
	   		<#assign commonUrl="approveCustomerDetail?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
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
            <#if searchRegistList?exists>
            <#list searchRegistList as searchRegistList>
        			<tr>
        				<td>${i?if_exists}</td>
        				<td title="View Details"><a href="viewCustomerRegistrationDetail?regis=${searchRegistList.registrationId?if_exists}">${searchRegistList.registrationId?if_exists}</a></td>
	          			<td>${searchRegistList.firstName?if_exists}</td>
	          			<td>${searchRegistList.lastName?if_exists}</td>
	          			<td>${searchRegistList.genderId?if_exists}</td>
	          			<td>${searchRegistList.address?if_exists}</td>
              			<td>${searchRegistList.mobileNumber?if_exists}</td>
              			<td>${searchRegistList.submittedDate?if_exists}</td>
              			<td><a href="actionNewRegistration?regis=${searchRegistList.registrationId?if_exists}" class="buttontext">${uiLabelMap.action}</a></td>
              			</tr>
              			<#assign i = i+1>      
    		</#list>
    		</#if>
           		</tbody>
        		</table>
	  		<@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
		</div>   
	
 </form>
