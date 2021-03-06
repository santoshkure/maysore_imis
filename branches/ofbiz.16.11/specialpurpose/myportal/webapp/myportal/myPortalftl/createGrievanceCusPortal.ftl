<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createGrievanceCusPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Modified by  --->
<#-- 1.0			Anubha Saini	  19/08/2017         Siddhi
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


<form method="post" name="createGrievanceCustomer" action="" class="basic-form">
	<div class="row" >
    	<div class="alert alert-info">
			<ul>
    			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    			<div class="h3" align="center"><b>${uiLabelMap.createGrievance}</b></div>
	    	</ul>
  		</div>
		<table cellspacing="0" class="basic-table table-responsive">
			<tr>
	           	<td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
            </tr>
            <tr>
               	<td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceDetail}</b></font></td>
            </tr>
            <tr>
             	<td class="label">${uiLabelMap.grievanceDate}</td>
   				 <td>
                      <@htmlTemplate.renderDateTimeField name="grievanceDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                 </td>
			</tr>
			<tr>	
				<td class="label" >${uiLabelMap.grievancePetitionDate}</td>
   				 <td>
                      <@htmlTemplate.renderDateTimeField name="grievancePetitionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate_1" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                 </td>
               	<td class="label" >${uiLabelMap.typeOfGrievance}</td>
				<td colspan="4">
	               	<select name="typeOfGrievance">
               			<option value="">Select</option>
               			<option value="Internal">Internal</option>
               			<option value="External">External</option>
              		</select>
           		</td> 
            </tr>  
           	<tr>
           		<td class="label">${uiLabelMap.name}</td>
               	<td><input name="grevNameEn" type="text" maxlength="50" value="">${uiLabelMap.inEnglish}
                	<br><input name="grevNameKn"  type="text" maxlength="50" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);">${uiLabelMap.inkannada}</br></td>
           		<td class="label">${uiLabelMap.OrderAddress}</td>
               	<td colspan="4"><textarea name="grevAddEn" value="" maxlength="300" style="width:400px"></textarea>${uiLabelMap.inEnglish}
                   	<br><textarea name="grevAddKn" value="" maxlength="300" style="width:400px" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);"></textarea>${uiLabelMap.inkannada}</br></td> 
           	</tr>
            <tr>
              	<td class="label">${uiLabelMap.mobileNo}</td>
               	<td>
                   	<input name="mobileNo" type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourMobile}">
               	</td>
               	<td class="label">${uiLabelMap.CommonEmail}</td>
               	<td colspan="4">
                   	<input name="eMail" type="text" maxlength="40" value="" placeholder="${uiLabelMap.yourEMail}">
                </td>
           	</tr>
            <tr>
                <td class="label">${uiLabelMap.grievanceDetail}</td>
                <td colspan="1"><textarea name="grievanceDetailEn" value="" maxlength="500" ></textarea>${uiLabelMap.inEnglish}
                    <br><textarea name="grievanceDetailKn" value="" maxlength="500" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);"></textarea>${uiLabelMap.inkannada}</br></td>
                <td class="label">${uiLabelMap.essentialDocument}</td>
				<td colspan="4"><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                    	<input type="button" onclick="javascript:resetVal(fileLoc);" value="Reset"/>
                    	<input type="Hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                    	<input type="Hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                </td>
            </tr>
            <tr>
                <td colspan="12">
	               <div id="saveBtn">
	                   	<center>
    	                	<input name="save" type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveRegistrationDetail();"/>
        	            	<input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     	</center>
                   </div>
                </td>
            </tr>
		</table>
	</div>
</form>

<script type="text/javascript" language="javascript">
 
 	function saveRegistrationDetail()
   	{
		var form=document['createGrievanceCustomer'];
	    var sure = confirm("Are you sure, you want to Save the Form ?");
        if( sure == true )
        {
        	form.action = "<@ofbizUrl>Grievancedetails</@ofbizUrl>";
			form.submit();
		    disSubmit('saveBtn');    
		} 
	}
</script>