<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Ganesh   	         7 oct 2017      -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="viewVendor" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.viewVendorDetails}</li>
 		</ul>
    	
  </div>
  
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	 <#if vendorList?has_content>
 	 <#list vendorList as vendorList>
		
				
	       <tr>
			  <td class="label">${uiLabelMap.RegistrationType}</td>
			  <td><#if "${vendorList.registrationType?if_exists}" == "VENDOR">
			  Vendor
			  <#elseif  "${vendorList.registrationType?if_exists}" == "BILLREADER">
			  Bill Reader
			  <#elseif  "${vendorList.registrationType?if_exists}" == "PLUMBER">
			  Plumber
			  </#if></td>         
              <td class="label">${uiLabelMap.RegistarionId}</td>
			  <td>${vendorList.registarionId?if_exists}</td> 
         	</tr>
         	
         	<tr>
         	 <td class="label">${uiLabelMap.RegistrationName}</td>
			 <td>${vendorList.tenderName?if_exists}</td> 
           	 <td class="label">${uiLabelMap.DateofRegister}</td>
			 <td>${vendorList.dateRegistration?if_exists}</td> 
         	</tr>
         	
         	<tr>
         	 <td class="label">${uiLabelMap.ProjectName}</td>
			 <td>${vendorList.name?if_exists}</td> 
           	 <td class="label">${uiLabelMap.officeName}</td>
			 <td> <#assign officeId = '${vendorList.officeName?if_exists}'>
	                	<#if officeList?exists>
			    	      <#if officeList?has_content>
			    	       <#list officeList as officeList>			    	       	 
				    	       	 <#if officeId == officeList.partyId?if_exists>
				    	         	${officeList.officeSiteName?if_exists}
				    	         
				    	         	
				    	         </#if>			    	        
			    	       </#list>
			    	     </#if>
			    	   </#if></td> 
         	</tr>
         	
         	<tr>
         	 <td class="label">${uiLabelMap.DateofProject}</td>
			 <td>${vendorList.dateofTender?if_exists}</td>
         	 <td class="label">${uiLabelMap.Address}</td>
			 <td>${vendorList.presentAddress?if_exists}</td> 
           	 <!--<td class="label">${uiLabelMap.PhoneNumber}</td>
			 <td>${vendorList.phoneNumber?if_exists}</td>--> 
         	</tr>
         
           	
			<tr>
         	 <td class="label">${uiLabelMap.Email}</td>
			 <td>${vendorList.email?if_exists}</td> 
           	 <td class="label">${uiLabelMap.State}</td>
			 <td>${vendorList.state?if_exists}</td> 
         	</tr>
           	
			<tr>
         	 <td class="label">${uiLabelMap.Pincode}</td>
			 <td>${vendorList.pinCode?if_exists}</td> 
			 <td class="label">${uiLabelMap.PhoneNumber}</td>
			 <td>${vendorList.phoneNumber?if_exists}
            </tr>
           	  
           <#if "${vendorList.status?if_exists}" == "A">
           <tr>
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td>${vendorList.remark?if_exists}</td>
	       </tr> 
	       </#if>
    	
			 <input type="hidden" name="activestatus" value="${vendorList.status?if_exists}" style="width:140px"  />
			 <input type="hidden" name="regId" value="${vendorList.regId?if_exists}" style="width:140px"  />
			
			</#list>
		    </#if>
		       <input type="hidden" name="status" value="" style="width:140px"/>				
		</table>
		</div>
	</div>
	
	</form>
