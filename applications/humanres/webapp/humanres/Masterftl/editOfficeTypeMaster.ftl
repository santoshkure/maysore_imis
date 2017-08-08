<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editofficeTypeMaster.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			    Prabhu       05/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to show the community name -->



<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editOfficeTypeMaster" action="" class="basic-form">
<#assign parentId = "IMIS">
<div class="row">	
		    <div class="alert alert-info">
		      <ul>
		         <div align="center" style="font-size:12px"><b>${uiLabelMap.HrmsOfficeTypeEdit}</b></div>		         
			  </ul>
		    </div>
 			   <div class="screenlet-body">
 				 <table class="basic-table" cellspacing="0">
 				 <#if officeTypeList?has_content>
 				 <#list officeTypeList as officeTypeList>
 				   <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
 				    <tr>
						   <td class="label" >${uiLabelMap.HrmsOfficeTypeName} <font color="red">*</font></td>
                           <td><input type="text" name="officeTypeName" value=${officeTypeList.ofcTypeName?if_exists} style="width:140px"  /></td>
                            <td class="label" >${uiLabelMap.HrmsOfficeTypeId} <font color="red">*</font></td>
					       <td><input type="text" maxlength="20" name="officeTypeId" value="${officeTypeList.ofcTypeId?if_exists}" style="width:140px" disabled="disabled" readonly>

					 <tr>
					 <td class="label" >Parent Type Id <font color="red">*</font></td>
					       <td><input type="text" maxlength="20" name="parentTypeId" value="${parentId}" style="width:140px" readonly disabled="disabled">
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="remark" style="width:240px" maxlength ="310">${officeTypeList.remarks?if_exists}</textarea></td>
                     </tr>
                     <tr>
                          <td colspan="4"><center>
                          <div id ="saveBtn">
                          <input name="save" value="${uiLabelMap.CommonUpdate}" type="button" onClick="editofcTypeMaster('editOfficeTypeMaster','edit')">
                          <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
                      </div>
                    </td>
                  </tr>
                                    <input type="hidden" name="activestatus" value="${officeTypeList.status?if_exists}" style="width:140px"  />

				</#list>
				</#if>
                 			      <input type="hidden" name="status" value="" style="width:140px"  />

               </table>
            </div>
        </div>
    </form>
    
     <#-----------------------Java Script for Community Master------------->
<script language="JavaScript" type="text/javascript" />


    
    function editofcTypeMaster(formname,stat)
	{
	var form =document[formname];
	var officeTypeName = form.officeTypeName.value;
   var officeTypeId = form.officeTypeId.value;
    if(notEmptyField(officeTypeName,"Office Type name should not be empty.")) 
    {
    if(notEmptyField(officeTypeId,"Office Type Id should not be empty.")) 
    {
	     	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editofcTypeMaster</@ofbizUrl>";
	    form.submit();
	}
	}}
	
 </script>