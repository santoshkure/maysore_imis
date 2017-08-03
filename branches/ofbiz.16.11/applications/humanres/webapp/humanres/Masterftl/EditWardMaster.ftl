<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Siddhi    	    03 Aug 2017    -->

<#-- #####################################################################################################-->
<form method="post" name="editWardMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editWard}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		
			<tr>
			 <td class="label">${uiLabelMap.wardname}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="30" value="Mysore Ward" /></td>    	
			 
			  <td class="label">${uiLabelMap.zoneName}<font color="red" >*</font> </td>
			  <td> 
				<select name="nameOfService" style="width:150px;" >
					<option value="">${uiLabelMap.zoneName}</option>
				 	<option value="" selected="true">Mysore Zone</option>
				</select>
			</td>  
			  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="nameOfService" style="width:150px;" >
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="" selected="true">Hyderabad</option>
				</select>
			</td>  
			
			  <td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="petiDetails" value="" maxlength="150" style="width:400px">Remarks</textarea></td>
        	</tr>
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
                    <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="10" value="31/07/2017" /></td>    	
             
                  </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick=""/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
		

