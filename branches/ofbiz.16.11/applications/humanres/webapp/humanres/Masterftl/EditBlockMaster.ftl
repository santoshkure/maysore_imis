<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created    Modified By     Modified Date-->
<#--- Siddhi    	    03 Aug 2017     Gaurav         17 August 2017-->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<#-- Add JavaScript for Kannad language conversation -->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>

<form method="post" name="editBlockMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editBlock}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		<#if blockTypeList?has_content>
 				 <#list blockTypeList as blockTypeList>
 				 
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			<tr>
			
			 <td class="label">${uiLabelMap.blockName}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="blockName"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remark" maxlength ="30" value="${blockTypeList.blockName?if_exists}" />${uiLabelMap.inEnglish}<br> 
               	<#-- Kannad language conversation -->
               	<input type="text" style="width:150px" maxlength="50" name="blockNameKan" id="blockNameKan" value="${blockTypeList.blockNameKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br></td>    	
			     	
			 
			  <td class="label">${uiLabelMap.wardname}<font color="red" >*</font> </td>
			 <td><select name="wardName" autocomplete="off" style="width:152px;margin:5px 0 5px 0;">
              <option value="">${uiLabelMap.CommonSelect}</option>
                <#assign wardNamevar  = "${blockTypeList.wardId?if_exists}">
                         <#if WardMasterList?has_content>
                            <#list WardMasterList as WardMasterList>
                             <#if "${WardMasterList.wardId?if_exists}" == "${wardNamevar?if_exists}">
                               <option value="${WardMasterList.wardId?if_exists}" selected>${WardMasterList.wardName?if_exists}</option>
                            <#else>
                                <option value="${WardMasterList.wardId?if_exists}">${WardMasterList.wardName?if_exists}</option>
                              </#if>
                            </#list>
                        </#if>   
                 </select></td> 
        	</tr>
    	
        	
        	<tr>
        		 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="${blockTypeList.cityId?if_exists}" selected="true">${blockTypeList.cityId?if_exists}</option>
				</select>
			</td> 
			
			<td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="remark"  onchange="javascript:trimFunction(this)" value="${blockTypeList.remark?if_exists}" maxlength="150" style="width:400px">${blockTypeList.remark?if_exists}</textarea></td>
		</tr>
        	<#--<tr>
                   <#-- <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
                    <td><input type="date" style="width:140px"  name="createdate" autocomplete="off" id="date" maxlength ="30" value="${blockTypeList.createdate?if_exists}" />
                     <#-- <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                   </td> 
               <td class="label" >${uiLabelMap.createdate}</td>
              <td><@htmlTemplate.renderDateTimeField name="createdate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="createdate" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                      </tr>-->
        	
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editBlockTypeMaster('editBlockMaster','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
			       <input type="hidden" name="activestatus" value="${blockTypeList.status?if_exists}" style="width:140px"  />
				   <input type="hidden" name="blockId" value="${blockTypeList.blockId?if_exists}" style="width:140px"  />
			
			</#list>
				</#if>
                 <input type="hidden" name="status" value="" style="width:140px"  />

		</table>
		</div>
	</div>
	</form>
	  <#-----------------------Java Script for Block Master------------->
<script language="JavaScript" type="text/javascript" />
	
	
	function editBlockTypeMaster(formname,stat)
	{
	var form =document[formname];
	var blockName = form.blockName.value;
	
    var wardName = form.wardName.value;
   
    var cityName = form.cityName.value;
    //var createdate = form.createdate.value;
   
    if(notEmptyField(blockName,"block name should not be empty.")) 
    {
    if(notEmptyField(wardName,"ward name should not be empty.")) 
    {
	if(notEmptyField(cityName,"city name should not be empty.")) 
    {
    //if(notEmptyField(createdate,"createdate should not be empty.")) 
   // { 
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        {    	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editBlockTypeMasters</@ofbizUrl>";
	    form.submit();
	//}
	}}
	}}}
	function validateConfirmBack() {  
                   var sure = confirm("Are you sure, you want to Cancel the Form ?");
                   if( sure == true )  
                   {
                       history.go(-1);
                }
           }
           
 function trimFunction(field)
   {
   var str = field.value;
   field.value = str.trim();
}          
           
	 </script>
		

