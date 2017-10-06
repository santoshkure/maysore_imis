<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editbuildingMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017     Anubha Saini on 20/09/2017-->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
<form method="post" name="editbuildingMaster" class="basic-form">

	  <div class="row">
              <div class="alert alert-info">
                    <ul>
                             <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
                              <li class="h3">${uiLabelMap.editBuildingmaster}</li>
                    </ul>
       </div>
	         <div class="screenlet-body">
		           <table class="basic-table" cellspacing="0">
		           <#if buildingMasterListed?has_content>
 				 <#list buildingMasterListed as buildingMasterListed>
		              <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		            <tr>
		            <td class="label">${uiLabelMap.BuildingType}<font color="red" >*</font> </td>
			       <td>
			           <input type="text" name="buildingType" onchange="javascript:trimFunction(this)" value="${buildingMasterListed.buildingType?if_exists}" style="width:140px"  />(${uiLabelMap.inEnglish})<br> 
               	       <input type="text" style="width:150px" maxlength="50" name="buildingTypeKan" id="buildingTypeKan" value="${buildingMasterListed.buildingTypeKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br>
					</td>
						
			             <td class="label">${uiLabelMap.description}</td>
			             <td><input type="text" style="width:140px"  name="description" maxlength ="30" value="${buildingMasterListed.description?if_exists}"/></td>    	
			             
                </tr>
                <tr> 
                      <td class="label">${uiLabelMap.remark}</td>
			            <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px">${buildingMasterListed.remark?if_exists}</textarea></td>
                 </tr>
            	<tr>
				    <td colspan="4">
					    <center><div id="submit" align="center">
					    <input type="button" name="update" value="${uiLabelMap.update}" onclick="validateParametered('editbuildingMaster','edit')"/>
					   <#--  <input name="update" value="${uiLabelMap.CommonUpdate}" type="button" onClick="validateParametered('editbuildingMaster','edit')"> -->
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}"/>
					</div>
				</center>
		      </td>
		    </tr>
		     <input type="Hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
		   		 <input type="Hidden" name="buildingId" value="${buildingMasterListed.buildingId?if_exists}" style="width:140px"  />
		          <input type="Hidden" name="activestatus" value="${buildingMasterListed.status?if_exists}" style="width:140px"  />
		       </#list>
				</#if>
				<input type="hidden" name="status" value="" style="width:140px"/>
		</table>
	</div>
  </div>
</form>


<script language="JavaScript" type="text/javascript" />
   
       function validateParametered(formname,stat)
	{
	var form =document[formname];
	 var buildingType = form.buildingType.value;
	 var buildingTypeKan = form.buildingTypeKan.value;
   //var createdate = form.createdate.value;
   
    if(notEmptyField(buildingType,"Building Type should not be empty.")) 
 {
 	if(notEmptyField(buildingTypeKan,"Building Type in Kannad should not be empty.")) 
 {
 	if(alphabhetValidation1(buildingType,"Building Type ${uiLabelMap.alphabetical}"))
 {
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
	    // alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>updateBuildingMaster</@ofbizUrl>";
	    form.submit();
	
	}}}}}
</script>
 