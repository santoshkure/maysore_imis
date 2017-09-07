<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editApplicationMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017     -->

<#-- #####################################################################################################-->

 <form method="post" name="editApplicationMaster" class="basic-form">

	  <div class="row">
              <div class="alert alert-info">
                    <ul>
                             <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
                              <li class="h3">${uiLabelMap.editApplicationMaster}</li>
                    </ul>
       </div>
	         <div class="screenlet-body">
		           <table class="basic-table" cellspacing="0">
		              <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		            <tr>
		                <td class="label">${uiLabelMap.applicationType}<font color="red" >*</font> </td>
			        <td> 
				        <select name="applicationType" style="width:150px;">
				          <option value="">${uiLabelMap.CommonSelect}</option>
					      <option value="">Temporary</option>
				 	      <option value="">Parmanent</option>
				        </select>
			        </td>  
			             <td class="label">${uiLabelMap.description}</td>
			             <td><input type="text" style="width:140px"  name="description" maxlength ="30" value=""/></td>    	
			         
                </tr>
                <tr> 
                        <td width='20%' align='right' class="label">${uiLabelMap.createdate}</td>
                       <td>
                         <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                       </td>
                    
			            <td class="label">${uiLabelMap.remark}</td>
			            <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px"></textarea></td>
                 </tr>
            	<tr>
				     <td colspan="4">
					    <center><div id="submit" align="center">
						<input type="button" submit="" value="Update" onclick="javascript:validateTypeMaster();"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}"/>
					</div>
				</center>
		      </td>
		    </tr>
		</table>
	</div>
  </div>
</form>
<script type="text/javascript" language="javascript">

     function validateTypeMaster()
	{
	 var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
					document.editApplicationMaster.action= "<@ofbizUrl>ApplicationMaster</@ofbizUrl>";
					document.editApplicationMaster.submit();
					disSubmit('saveBtn'); 
					return true;
					alert("submit");
		}			
	}
</script>