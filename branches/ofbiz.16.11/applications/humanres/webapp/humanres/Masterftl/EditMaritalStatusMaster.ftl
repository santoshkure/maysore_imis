<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Modified By   Date Modified-->
<#--- Siddhi    	    03 Aug 2017      Anil Kumar    17/08/2017 -->

<#-- #####################################################################################################-->
<#---added by nikhil for language change to kannada ---->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
<#-- --end -->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editMaritalMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editMarital}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	 <#if maritalStatusMasterList?has_content>
 	 <#list maritalStatusMasterList as maritalStatusMasterList>
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			         <tr>
						   <td class="label" >${uiLabelMap.statusname} <font color="red">*</font></td>
					       <td><input type="text" maxlength="11" name="maritalStatus" onchange="javascript:trimFunction(this)" value="${maritalStatusMasterList.maritalStatus?if_exists}" style="width:140px">${uiLabelMap.inEnglish}<br>
					        <input type="text" style="width:140px" maxlength="11" name="maritalStatusKan" id="maritalStatusKan" value="${maritalStatusMasterList.maritalStatusKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br>
					       <#--<td class="label" >${uiLabelMap.createdate}-->
                       <#--    <td><input type="text" name="dateOfCreateMarital" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>
                         <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>-->
	 		             <#--<td><input type="text" name="dateOfCreateMarital" value="<#if maritalStatusMasterList.dateOfCreateMarital?has_content>${maritalStatusMasterList.dateOfCreateMarital?if_exists?string("dd/MM/yyyy")}</#if>" style="width:140px" readonly /></td>--->
					
					</tr>
					
					<tr>
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="maritalRemark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150">${maritalStatusMasterList.maritalRemark?if_exists}</textarea></td>
                     </tr>
        	
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editofMaritalMaster('editMaritalMaster','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
			 <input type="hidden" name="activestatus" value="${maritalStatusMasterList.status?if_exists}" style="width:140px"  />
			 <input type="hidden" name="maritalStatusId" value="${maritalStatusMasterList.maritalStatusId?if_exists}" style="width:140px"  />
			 
			
			</#list>
		    </#if>
		        <input type="hidden" name="status" value="" style="width:140px"/>				
		    
	</table>
  </div>
</div>
  </form>
<#-----------------------Java Script for Marital Status Master------------->
	
<script language="JavaScript" type="text/javascript" />

    function editofMaritalMaster(formname,stat)
	{
	var form =document[formname];
	var maritalStatus = form.maritalStatus.value;
	if(notEmptyField(maritalStatus,"Marital Status should not be empty.")) 
  
    {
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
	     	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editofMaritalMaster</@ofbizUrl>";
	    form.submit();
	   }
	}
	}
	
</script>
		

