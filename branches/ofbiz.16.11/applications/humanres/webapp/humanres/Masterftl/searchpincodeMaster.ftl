<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchpincodeMaster.ftl----->
<#--- Author                 Date Created      Modified By   Date Modified  --->
<#--- Siddhi Rajput          01/08/2017        Anil Kumar    17/08/2017 --->
<#-- #####################################################################################################-->

<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en_US">
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" class="basic-form" name="pincodemaster" action="">
<div class="row">   
 <div class="alert alert-info">
   <ul>
      <li class="h3">${uiLabelMap.pincodemaster}</li>
      <div class="basic-nav" style="margin-top: -80px;">
          <ul>
              <li>
                 <a title="Create PinCode Master" href="<@ofbizUrl>PincodeMaster</@ofbizUrl>">
                 <i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
                  </a>
               </li>
         </ul>
      </div>
    </ul>
   
  </div>
     <div class="screenlet-body">
      <table class="basic-table" cellspacing="0">
                
       
         <tr>
           <td class="label" >${uiLabelMap.pincode}</td>
           <td><input type="text" name="pinCode" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="7"/></tr>
      
        <tr>
            <td colspan="4"><center>
            <div id ="saveBtn">
                <input name="save" value="${uiLabelMap.search}" type="button" onClick="validateParameters('pincodemaster')">
                <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
            </div>
            </td>
                       
        </tr>
         </table>
  </div>
</div>
</form>
<#------------------------------------PinCode Master List------------------------>

<form method="post" name="Listpincodemaster" action="" class="basic-form">
   
      <div class="row">
      <div class="alert alert-info">
        <ul>
           <div align="center" style="font-size:12px"><b>${uiLabelMap.pinmasterlist}</b></div>
        </ul>
      </div>
      <div class="screenlet-body">
      
       <#assign commonUrl="SearchPincodeMaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    
      <table class="basic-table hover-bar" rowspacing="5">
      <thead>
        <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}</center></td>
             <td><center>${uiLabelMap.pincode}</center></td>
             <td><center>${uiLabelMap.createdate}<center></td>
             <td><center>${uiLabelMap.remark}<center></td>
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}<center></td>    
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.activeDeactive}</center></td>  
        </tr>
        </thead>  
        
	    <#if pinCodeMasterList?has_content>
       <#assign count= 1>
       <#list pinCodeMasterList as pinCodeMasterList>
   
	     
             <tr>
                <td><center>${count}</center></td>
                <td><center>${pinCodeMasterList.pinCode?if_exists}</center></td>
	            <td><center><#if pinCodeMasterList.dateOfCreatePin?has_content>${pinCodeMasterList.dateOfCreatePin?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
                
                 <td><center>${pinCodeMasterList.cityRemark?if_exists}</center></td>
                <#--<td><center>Active</center></td>--->
                 <td><center>
	             <#assign std = '${pinCodeMasterList.status?if_exists}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
	            </center></td>
                <#--<td align="center"><center><a href="javascript:editpincodeMaster('Listpincodemaster');" class="buttontext">${uiLabelMap.edit}</a></center></td>-->
                <td><center>
                 <#if std =="A">
                 <a title="Edit" href='<@ofbizUrl>editpincodemaster?pinCodeId=${pinCodeMasterList.pinCodeId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                 <#else>
                 <a class="buttontextdisabled"  disabled>${uiLabelMap.edit}</a>
                 </#if>
                </center></td>
                <td><center>                   
                 <#if std =="D">
                 <a title="Remove" href="javascript:editofPincodemaster('Listpincodemaster','delete','${pinCodeMasterList.pinCodeId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                 <#else>
                 <a class="buttontextdisabled" disabled>${uiLabelMap.Remove}</a>
                 </#if>
                </center></td>
                <#--<td><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>--->
                <td><center>
                 <#if std =="A">
                 <a title="Deactive" href="javascript:editofPincodemaster('Listpincodemaster','status','${pinCodeMasterList.pinCodeId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                 <#else>
                 <a title="Active" href="javascript:editofPincodemaster('Listpincodemaster','status','${pinCodeMasterList.pinCodeId?if_exists}','A');" class="buttontext">Active</a>
                 </#if>
                </center></td>
                <#--<td align="center"><center><a class="buttontext">${uiLabelMap.Remove}</a></center></td>-->
                <#-- <td align="center"><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>--->
            </tr>
         
                     <#assign count=count+ 1>
                     </#list>
                     </#if>      
                        <input type="hidden" name="pinCodeId" value="" style="width:140px"  />
                        <input type="hidden" name="activestatus" value="" style="width:140px"  />
                        <input type="hidden" name="status" value="" style="width:140px"  />
                      
     </table> 
         <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>  
   </div>
</div>
 </form>
     
<#-----------------------Java Script for PinCode Master------------->
     
<script language="JavaScript" type="text/javascript" />
     function editpincodeMaster(formname)
    {
         var form =document[formname];   
        form.action="<@ofbizUrl>editpincodemaster</@ofbizUrl>";
        form.submit();
    }
    
    
  function editofPincodemaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.pinCodeId.value=id;
	     form.activestatus.value = activestd;
	       if(stat == "delete")
      {
      var r=confirm("Are you sure, you want to Remove the Form ?")
      if (r==true)
      {

        form.action="<@ofbizUrl>editofPincodemaster</@ofbizUrl>";
	    form.submit();
	}
	}else if(stat == "status")
      {
          var r=confirm("Are you sure, you want to Active/Deactive the Form ?")
          if (r==true)
          { 
          form.action="<@ofbizUrl>editofPincodemaster</@ofbizUrl>";
      form.submit();
      }
      }
     }
	
	function validateParameters(formname)
 {
 var form=document[formname];
                   form.submit();
}
	
</script>