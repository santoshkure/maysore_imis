<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchVendor.ftl----->
<#--- Author         Date Created      Modified By   Date Modified  --->
<#--- GANESH          30/08/2017        GANESH          07/10/2017 --->
<#-- #####################################################################################################-->
<br><br>
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en_US">
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" class="basic-form" name="vendorbill" action="">
<div class="row">   
 <div class="alert alert-info">
   <ul>
      <li class="h3">${uiLabelMap.vendor}</li>
      <div class="basic-nav" style="margin-top: -40px;">
      <#--  <#if security.hasPermission('VENDOR_CREATE',userLogin)>-->
          <ul>
              <li>
                 <a title="Create Vendor/Bill Reader" href="<@ofbizUrl>createVendorBill</@ofbizUrl>">
                 <i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
                  </a>
               </li>
         </ul>
        <#-- </#if>-->
      </div>
    </ul>
   
  </div>
  
 
  
     <div class="screenlet-body">
      <table class="basic-table" cellspacing="0">
                
       
         <tr>
           <td class="label" >${uiLabelMap.RegistrationName}</td>
           <td><input type="text" name="tenderName" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="7"/></td>
        </tr>
      
        <tr>
            <td colspan="4"><center>
            <div id ="saveBtn">
                <input name="save" value="${uiLabelMap.search}" type="button" onClick="validateParameters('vendorbill')">
                <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
            </div>
            </td>
                       
        </tr>
         </table>
  </div>
</div>
</form>
<#------------------------------------Vendor Tab List------------------------>

<form method="post" name="ListVendor" action="" class="basic-form">
   
      <div class="row">
      <div class="alert alert-info">
        <ul>
           <div align="center" style="font-size:12px"><b>${uiLabelMap.vendorlist}</b></div>
        </ul>
      </div>
      <div class="screenlet-body">
      
     <#assign commonUrl="SearchVendor?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
     <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
     <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
     <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    
      <table class="basic-table hover-bar" rowspacing="5">
      <thead>
        <tr class="header-row-2">
             <td><center>${uiLabelMap.SNO}<center></td>
             <td><center>${uiLabelMap.RegistrationType}</center></td>
             <td><center>${uiLabelMap.RegistarionId}</center></td>
             <td><center>${uiLabelMap.RegistrationName}<center></td>           
             <td><center>${uiLabelMap.DateofRegister}</center></td>  
             <td><center>${uiLabelMap.ProjectName}<center></td>  
             <td><center>${uiLabelMap.Status}</center></td>
			 <td><center>${uiLabelMap.ActiveStatus}</center></td> 
			  <#if security.hasPermission('VENDOR_EDIT',userLogin)>            
             <td><center>${uiLabelMap.edit}</center></td>
             </#if>
             <#if security.hasPermission('VENDOR_VIEW',userLogin)> 
             <td><center>${uiLabelMap.View}</center></td>
             </#if>
             <#if security.hasPermission('VENDOR_APPROVE',userLogin)> 
             <td><center>${uiLabelMap.approve}</center></td>
             </#if>
             <#if security.hasPermission('VENDOR_ACT_DEACT',userLogin)> 
 			 <td><center>${uiLabelMap.activeDeactive}</center></td>
 			  </#if>                
          
        
        </tr>
        </thead>  
        
	   <#if vendorList?has_content>
       <#assign count= 1>
       <#list vendorList as vendorList>
   
	     
             <tr>
                <td><center>${count}</center></td>
			    <td><center><#if "${vendorList.registrationType?if_exists}" == "VENDOR">
			    ${uiLabelMap.Vendor}
			    <#elseif  "${vendorList.registrationType?if_exists}" == "BILLREADER">
			    ${uiLabelMap.BillReader}
			    <#elseif  "${vendorList.registrationType?if_exists}" == "PLUMBER">
			    ${uiLabelMap.Plumber}
			    
			    </#if></center></td>   
			           
                 <td><center>${vendorList.registarionId?if_exists}</center></td>
                 <td><center>${vendorList.tenderName?if_exists}</center></td>
                 <td><center><#if vendorList.dateRegistration?has_content>${vendorList.dateRegistration?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
                 <td><center>${vendorList.name?if_exists}</center></td>
                   
                                                  
                
            
                <#--<td><center>Active</center></td>--->
                <td><center>
	             <#assign std = '${vendorList.status?if_exists}'>
                           <#if std =="A">
                           ${uiLabelMap.approved}
                           <#else>
                           
                           ${uiLabelMap.Registered}
                           </#if>
	            </center></td>
	            
	             <td><center>
	             <#assign actstd = '${vendorList.activeStatus?if_exists}'>
                           <#if actstd =="ACTIVE">
                           Active
                           <#elseif actstd =="DEACTIVE">
                           Deactive
                           </#if>
	            </center></td>
                <#--<td align="center"><center><a href="javascript:editpincodeMaster('Listpincodemaster');" class="buttontext">${uiLabelMap.edit}</a></center></td>-->
                 <#if security.hasPermission('VENDOR_EDIT',userLogin)>      
                <td><center>
                <#if std =="A">
                <a class="buttontextdisabled"  disabled>${uiLabelMap.edit}</a>
                <#else>
                <a title="Edit" href='<@ofbizUrl>editVendor?registarionId=${vendorList.registarionId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                </#if>
                </center></td>
                  </#if> 
                <#if security.hasPermission('VENDOR_VIEW',userLogin)>      
                <td><center>                   
                <a title="View" href="javascript:editofVendor('ListVendor','view','${vendorList.registarionId?if_exists}');" class="buttontext">${uiLabelMap.View}</a>
                </center></td>
                <#--<td><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>--->
                <td><center>
                  </#if> 
                
                 <#if security.hasPermission('VENDOR_APPROVE',userLogin)>      
               	<#if std =="A">
               	<a class="buttontextdisabled"  disabled>${uiLabelMap.approve}</a>
               	<#else>
                <a title="Approve" href="javascript:editofVendor('ListVendor','status','${vendorList.registarionId?if_exists}','D');" class="buttontext">${uiLabelMap.approve}</a>
                </#if> 
                 </center></td> 
                  </#if> 
                
                 <#if security.hasPermission('VENDOR_ACT_DEACT',userLogin)>      
                 <#assign activeStd = '${vendorList.activeStatus?if_exists}'>
                <td><center>
                <#if std =="A">
                
                <#if activeStd =="ACTIVE">
                
                <a title="Active/Deactive" href="javascript:updateVendorStat('ListVendor','${vendorList.regId?if_exists}','DEACTIVE');" class="buttontext">${uiLabelMap.Deactive}</a>
                <#else>
                  <a title="Active/Deactive" href="javascript:updateVendorStat('ListVendor','${vendorList.regId?if_exists}','ACTIVE');" class="buttontext">${uiLabelMap.Active}</a>
              
              </#if>
               	<#else>
               	 	<a class="buttontextdisabled"  disabled>${uiLabelMap.Active}</a>
                
                </#if>              
                </center></td>
                
                  </#if> 
             </tr>
        
                     <#assign count=count+ 1>
                     </#list>
                     </#if>      
                        <input type="hidden" name="registarionId" value="" style="width:140px"  />
                        <input type="hidden" name="activestatus" value="" style="width:140px"  />
                        <input type="hidden" name="status" value="" style="width:140px"  />
                        
     </table> 
         <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
   </div>
</div>
 </form>
     
<#-----------------------Java Script for Vendor Tab------------->
     
<script language="JavaScript" type="text/javascript" />
     function editVendor(formname)
    {
         var form =document[formname];   
        form.action="<@ofbizUrl>editVendor</@ofbizUrl>";
        form.submit();
    }
    
    
  function editofVendor(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.registarionId.value=id;
	     form.activestatus.value = activestd;
	       if(stat == "view")
      {
      
        form.action="<@ofbizUrl>viewVendor</@ofbizUrl>";
	    form.submit();
	
	}else if(stat == "status")
      {
           
          form.action="<@ofbizUrl>approveVendor</@ofbizUrl>";
      form.submit();
     
      }
     }
	
	function updateVendorStat(formname,id,activestd)
	{
	var form =document[formname];	
	     //alert(""+id);
	    
	     form.registarionId.value=id;
	     form.activestatus.value = activestd;
	     
           
          form.action="<@ofbizUrl>updateVendorStatus</@ofbizUrl>";
      form.submit();
     
      
	}
	
	function validateParameters(formname)
 {
 var form=document[formname];
                   form.submit();
}
	
</script>
