<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createWardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	31 July 2017    -->

<#-- #####################################################################################################-->




<form method="post" name="createWardMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">${uiLabelMap.createWardMaster}</li>
      
    </ul>
    
  </div>
	<br/>
	<div class="screenlet-body">
	
		<table class="basic-table" cellspacing="0">
		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
			<tr>
			 <td class="label">${uiLabelMap.wardname}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="30" value="" /></td>    	
			 
			  <td class="label">${uiLabelMap.zoneName}<font color="red" >*</font> </td>
			  <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.zoneName}</option>
				 	<option value="">Mysore Zone</option>
				</select>
			</td>  
			  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="">Hyderabad</option>
				</select>
			</td>  
			
			  <td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="petiDetails" value="" maxlength="150" style="width:400px"></textarea></td>
        	</tr>
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
                    <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="10" value="" /></td>    	
             
                  </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateTypeMaster();"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBackMaster();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
		

<script type="text/javascript" language="javascript">

	<#--function validateTypeMaster()
	{
		
		
		
					
					document.zoneMaster.action= "<@ofbizUrl>saveZoneMaster</@ofbizUrl>";
					document.zoneMaster.submit();
					disSubmit('saveBtn'); 
					//return true;
					//alert("submit");
					
				}
			
	-->
     
	
	
</script>