<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created   -->
<#--- Ganesh   	        07 oct 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="approveVendor" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.approveVendorDetails}</li>
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
           	 <td class="label">${uiLabelMap.OfficeName}</td>
			 <td><#assign officeId = '${vendorList.officeName?if_exists}'>
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
           	  
           
         	
         	<tr>
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td><textarea name="remark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150"></textarea></td>
	    </tr>  
	<tr>
		<td colspan="4">
			<center><div id="submit" align="center">
			 <input type="button" name="approve" value="${uiLabelMap.approve}" onclick="approveVendorDetails('approveVendor','approve')"/>
			   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
			</div>
			</center>
		</td>
	</tr>  <input type="hidden" name="mobileNumber" value="${vendorList.phoneNumber?if_exists}" style="width:140px"  />
          <input type="hidden" name="eMail" value="${vendorList.email?if_exists}" style="width:140px"  />
			 <input type="hidden" name="activestatus" value="${vendorList.status?if_exists}" style="width:140px"  />
			 <input type="hidden" name="regId" value="${vendorList.regId?if_exists}" style="width:140px"  />
			
			</#list>
		    </#if>
		       <input type="hidden" name="status" value="" style="width:140px"/>				
		</table>
		</div>
	</div>
	
	</form>
	
	   <#-----------------------Java Script for vendortab------------->
	
    <script language="JavaScript" type="text/javascript" />


    
    function approveVendorDetails(formName)
      {
		   var form=document[formName];
		   var r=confirm("Are you sure, you want to approve?")
                   if (r==true)
                       {
		       form.action = "<@ofbizUrl>approveVendorDetails</@ofbizUrl>";
		       form.submit();
		       disSubmit('saveBtn');
		          
             }
            }
	
 </script>

