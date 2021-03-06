<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: designationMaster.ftl----->
<#--- Author             	Date Created     
<#--- Anil Kumar            26/08/2017      	   
<#-- #####################################################################################################-->

<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en_US">
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" class="basic-form" name="designationmaster" action="" >
<div class="row">	
 <div class="alert alert-info">
   <ul>
      <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
	 <div align="center" style="font-size:12px"><b>${uiLabelMap.createdesignationmaster}</b></div>
  </ul>
 </div>
 	<div class="screenlet-body">
 	 <table class="basic-table" cellspacing="0">
 				
		<tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
 		<tr>
		   <td class="label" >${uiLabelMap.designationname} <font color="red">*</font></td>
		   <td><input type="text" name="designationName" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="25"/></td>
		    <td class="label" >${uiLabelMap.designationtypeid} <font color="red">*</font></td>
		   <td><input type="text" name="designationTypeId" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="10"/></td>
		   <#--<td class="label" >${uiLabelMap.createdate}</td>
		   <td><input type="text" name="dateOfCreatePin" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>--->
	    </tr>
		<tr>
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td><textarea name="designationRemark" onchange="javascript:trimFunction(this)"  style="width:140px" maxlength ="150"></textarea></td>
	    </tr>
	   
		<tr>
			<td colspan="4"><center>
			<div id ="saveBtn">
				<input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('designationmaster')">
				<input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
			</div>
			</td>
						
		</tr>
		 </table>
  </div>
</div>
</form>

<#-----------------------Java Script for Designation Master------------->

<script language="JavaScript" type="text/javascript" />

function validateParameters(formName)
{
  var form=document[formName];
  var designationName = form.designationName.value;
  var designationTypeId = form.designationTypeId.value;
  if(notEmptyField(designationName,"Designation Name should not be empty.")) 
     {
      if(notEmptyField(designationTypeId,"Designation Id should not be empty.")) 
     {
      var r=confirm("Are you sure, you want to Save the Form ?")
      if (r==true)
      { 
	  form.action = "<@ofbizUrl>saveDesignationMaster</@ofbizUrl>";
	  form.submit();
	  disSubmit('saveBtn');
      }
    }  
}
}
</script>