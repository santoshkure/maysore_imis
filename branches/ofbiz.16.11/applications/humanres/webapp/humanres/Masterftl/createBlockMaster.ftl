<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createBlockMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created      Modified By     Modified Date   -->
<#--- Anubha Saini    	31 July 2017       Gaurav         17 August 2017 -->
<#---                                       Anubha Saini    	16 Sep 2017 -->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<#--Add javascript by anubha for kannad conversation -->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
<#-- End-->
<form method="post" name="createBolckMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">${uiLabelMap.createBlockMaster}</li>
    </ul>
    
  </div>
	
	<div class="screenlet-body">
	
		<table class="basic-table" cellspacing="0">
		<tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		
		
		
			<tr>
			 <td class="label">${uiLabelMap.blockName}<font color="red" >*</font></td>
              
			 <td><input type="text" style="width:140px"  name="blockName"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remark" maxlength ="30" value="" />${uiLabelMap.inEnglish}<br> 
             <#-- Kannad Language -->
               	<input type="text" style="width:150px" maxlength="50" name="blockNameKan" id="blockNameKan" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br></td>    	
			 
			  <td class="label">${uiLabelMap.wardname}<font color="red" >*</font> </td>
			  <td> 
				<select name="wardName" style="width:150px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
				 
					<#if WardMasterList?has_content>
					<#list WardMasterList as WardMasterList>	
				 <option value="${WardMasterList.wardId}">${WardMasterList.wardName}</option>
				 </#list>
					</#if>
				</select>
			</td>  
			  
        	</tr>
        	
        
        	
        	<tr>
			 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;">
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="Mysore">Mysore</option>
				</select>
			</td>  
			
			<td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="remark" value="" onchange="javascript:trimFunction(this)" maxlength="150" style="width:400px"></textarea></td>
		</tr>
        	<#--<tr>
                    <#-- <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
    <td>               <input type="date" style="width:140px"  name="createdate"  value="" autocomplete="off"  maxlength ="30" />
                   <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>-->
               <#-- <td class="label" >${uiLabelMap.createdate}</td>
              <td><@htmlTemplate.renderDateTimeField name="createdate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="createdate" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                
		         <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>               
                 
                 
                  </tr>-->
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateTypeMaster('createBolckMaster');"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
	
	<#-----------------------Java Script for Block Master------------->

<script type="text/javascript" language="javascript">

	function validateTypeMaster(formName)
	{
		var form = document[formName];
		var blockName = form.blockName.value;
		var wardName = form.wardName.value;
		var cityName = form.cityName.value;
		//var createdate = form.createdate.value;
		
        
		if(notEmptyField(blockName," Block Name should not be empty."))
		{		
		if(notEmptyField(wardName," Ward Name should not be empty."))
		{
		if(notEmptyField(cityName," City Name should not be empty."))
		{		
		//if(notEmptyField(createdate," Create date should not be empty."))
		//{
		var r=confirm("Are you sure, you want to Create the Form ?")
        if (r==true)
        {
       
					document.createBolckMaster.action= "<@ofbizUrl>saveBlockMaster</@ofbizUrl>";
					document.createBolckMaster.submit();
					disSubmit('saveBtn'); 
					//return true;
					//alert("submit");
					
				}
			}
			}
		}
	}
	//}
     
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