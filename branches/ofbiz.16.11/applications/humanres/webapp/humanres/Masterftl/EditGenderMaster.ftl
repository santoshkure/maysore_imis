<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Siddhi    	    03 Aug 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editGenderMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editGender}</li>
 		</ul>
    	
  </div>
	   
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	 <#if genderMasterList?has_content>
 	 <#list genderMasterList as genderMasterList>
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			        <tr>
						   <td class="label" >${uiLabelMap.gendername} <font color="red">*</font></td>
					       <td><input type="text" maxlength="11" name="genderName" onchange="javascript:trimFunction(this)" value="${genderMasterList.genderName?if_exists}" style="width:140px">
					        <td class="label" >${uiLabelMap.createdate}</td>
                           <td><input type="text" name="dateOfCreateGender" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>
					   </tr>
					     <tr>
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="genderRemark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150">${genderMasterList.genderRemark?if_exists}</textarea></td>
                     </tr>
        	
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editofGenderMaster('editGenderMaster','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
			 <input type="hidden" name="activestatus" value="${genderMasterList.status?if_exists}" style="width:140px"  />
			 <input type="hidden" name="genderId" value="${genderMasterList.genderId?if_exists}" style="width:140px"  />
			 
			
			
				</#list>
				</#if>
                   <input type="hidden" name="status" value="" style="width:140px"/>				
		</table>
		</div>
	</div>
	
	</form>
	   <#-----------------------Java Script for Gender Master------------->
	<script language="JavaScript" type="text/javascript" />


    
    function editofGenderMaster(formname,stat)
	{
	var form =document[formname];
	var genderName = form.genderName.value;
	if(notEmptyField(genderName,"Gender Name should not be empty.")) 
  
    {
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
	     	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editofGenderMaster</@ofbizUrl>";
	    form.submit();
	}   }
	}
	
	
 </script>
		

