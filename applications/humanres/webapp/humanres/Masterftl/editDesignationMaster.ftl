<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editDesignationMaster.ftl----->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anil Kumar    	26 Aug 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editDesigMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editdesignation}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	 <#if designationMasterList?has_content>
 	 <#list designationMasterList as designationMasterList>
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
	  <tr>
		   <td class="label" >${uiLabelMap.designationname} <font color="red">*</font></td>
		   <td><input type="text" name="designationName" onchange="javascript:trimFunction(this)" style="width:140px" value="${designationMasterList.designationName?if_exists}" maxlength ="25"/></td>
		    <td class="label" >${uiLabelMap.designationtypeid} <font color="red">*</font></td>
		   <td><input type="text" name="designationTypeId" onchange="javascript:trimFunction(this)" style="width:140px" value="${designationMasterList.designationTypeId?if_exists}"maxlength ="10"/></td>
		   <#--<td class="label" >${uiLabelMap.createdate}</td>
		   <td><input type="text" name="dateOfCreatePin" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>-->
	    </tr>
		<tr>
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td><textarea name="designationRemark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150">${designationMasterList.description?if_exists}</textarea></td>
	    </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editofDesignationMaster('editDesigMaster','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
			 <input type="hidden" name="activestatus" value="${designationMasterList.status?if_exists}" style="width:140px"  />
			 <input type="hidden" name="designationId" value="${designationMasterList.designationId?if_exists}" style="width:140px"  />
			</#list>
		    </#if>
		       <input type="hidden" name="status" value="" style="width:140px"/>				
		</table>
		</div>
	</div>
	
	</form>
	
	   <#-----------------------Java Script for Designation Master------------->
	
	<script language="JavaScript" type="text/javascript" />


    
    function editofDesignationMaster(formname,stat)
	{
	var form =document[formname];
	var designationName = form.designationName.value;
    var designationTypeId = form.designationTypeId.value;
	
	if(notEmptyField(designationName,"Designation Name should not be empty.")) 
    {
      if(notEmptyField(designationTypeId,"Designation Id should not be empty.")) 
     {
        var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editofDesignationMaster</@ofbizUrl>";
	    form.submit();
	    }
	}
	}
	}
	
 </script>

