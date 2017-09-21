<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created  Modified By  Date Modified-->
<#--- Siddhi    	    03 Aug 2017    Ganesh         17/08/2017-->
<#-- #####################################################################################################-->
<#---added by nikhil for language change to kannada ---->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
<#-- --end -->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editCasteMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editCaste}</li>
 		</ul>
    	
  </div>

	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	<#if casteTypeList?has_content>
 				 <#list casteTypeList as casteTypeList>
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
	   <tr>
		   <td class="label" >${uiLabelMap.castename} <font color="red">*</font></td>
		   <td><input type="text" name="castename" onchange="javascript:trimFunction(this)" style="width:140px" value="${casteTypeList.castename?if_exists}" maxlength ="20">(${uiLabelMap.inEnglish})<br>
		       <input type="text" style="width:140px" maxlength="20" name="castenameKan" id="casteMasterKan" value="${casteTypeList.castenameKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);"/>(${uiLabelMap.inKannada})<br>
		   <#--<td class="label" >${uiLabelMap.createdate}</td>
		   <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>-->
	   
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td><textarea name="remark" onchange="javascript:trimFunction(this)" value="${casteTypeList.remark?if_exists}" style="width:140px" maxlength ="150">${casteTypeList.remark?if_exists}</textarea></td>
	    </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editCasteTypeMaster('editCasteMaster','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
			  <input type="hidden" name="activestatus" value="${casteTypeList.status?if_exists}" style="width:140px"  />
									<input type="hidden" maxlength="20" name="casteId" value="${casteTypeList.casteId?if_exists}" style="width:140px"  />
			
				</#list>
				</#if>
				   <input type="hidden" name="status" value="" style="width:140px"/>
				
		</table>
		</div>
	</div>
	
	</form>
	
		
<#-----------------------Java Script for Caste Master------------->
   
<script language="JavaScript" type="text/javascript" />


    
    function editCasteTypeMaster(formname,stat)
	{
	var form =document[formname];
	var castename = form.castename.value;
   //var createdate = form.createdate.value;
  
    if(notEmptyField(castename,"Caste Name should not be empty.")) 
    {
     var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
    
         //alert(""+stat);
	     form.status.value = stat;
         form.action="<@ofbizUrl>editCasteTypeMaster</@ofbizUrl>";
	     form.submit();
	
	}}
	}
	
 </script>
