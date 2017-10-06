<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createBuildingMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	23 August 2017     -->
<#--- Modify by   Anubha Saini on 20/09/2017 -->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
 <form method="post" name="createBuildingMaster" class="basic-form">

	  <div class="row">
              <div class="alert alert-info">
                    <ul>
                          <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
                          <li class="h3">${uiLabelMap.createBuildingMaster}</li>
                    </ul>
       </div>
	         <div class="screenlet-body">
		           <table class="basic-table" cellspacing="0">
		              <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		            <tr>
		                <td class="label">${uiLabelMap.BuildingType}<font color="red" >*</font> </td>
			           	<td>
			           	<input type="text" style="width:150px" maxlength="50" name="buildingType" id="buildingType" value="" onchange="javascript:validateName(this);"/>(${uiLabelMap.inEnglish})<br> 
               			<#-- Kannad language conversation -->
               			<input type="text" style="width:150px" maxlength="50" name="buildingTypeKan" id="buildingTypeKan" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br>
			            </td>
			            
			             <td class="label">${uiLabelMap.description}</td>
			             <td><input type="text" style="width:140px"  name="description" maxlength ="30" value=""/></td>    	
			            
                	</tr>
                	<tr> 
                        <td class="label">${uiLabelMap.remark}</td>
			            <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px"></textarea></td>
                    </tr>
            		<tr>
				     <td colspan="4">
					    <center><div id="submit" align="center">
                          <input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('createBuildingMaster')">
                          <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >

					</div>
				</center>
		      </td>
		    </tr>
		    <input type="Hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
		</table>
	</div>
  </div>
</form>


	
	
<script type="text/javascript" language="javascript">
	
      function validateParameters(formName)
      {
		   var form=document[formName];
		   var buildingType = form.buildingType.value;
		    var buildingTypeKan = form.buildingTypeKan.value;
		  // var description = form.description.value;
   		   
   		      var createdate = form.createdate.value;
 		  // alert(""+createdate);
		    if(notEmptyField(buildingType,"Building Type should not be empty.")) 
		     {
		     if(notEmptyField(buildingTypeKan,"Building Type in Kannad should not be empty.")) 
		     {
		     if(alphabhetValidation1(buildingType,"Building Type ${uiLabelMap.alphabetical}"))
               {
		      
	            
		          var r=confirm("Are you sure, you want to Save the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>saveBuildingMaster</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		       
		         }		     }}}}
        
	
</script>