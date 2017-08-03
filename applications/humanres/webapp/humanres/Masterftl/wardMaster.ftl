<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: wardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	31 July 2017    -->

<#-- #####################################################################################################-->




<form method="post" name="wardMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.wardmaster}</li>
      <div class="basic-nav" style="margin-top: -80px;">
  				<ul>
    				<li>
						<a title="Create Zone Master" href="<@ofbizUrl>createWardMaster</@ofbizUrl>">
							<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
						</a>
    				</li>
  				</ul>
 			</div> 
    </ul>
    
  </div>
	<br/>
	<div class="screenlet-body">
		<table class="basic-table" cellspacing="0">
		
			<tr>
			 <td class="label">${uiLabelMap.zoneName} </td>
			  <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.zoneName}</option>
				 	<option value="">Mysore Zone</option>
				</select>
			</td> 
			
			 <td class="label">${uiLabelMap.wardname}</td>
 <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.wardname}</option>
				 	<option value="">Mysore Ward</option>
				</select>
			</td> 			 
			  
			  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.cityName} </td>
			  <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="">Hyderabad</option>
				</select>
			</td> 
			
			 <td width='20%' align='right' class="label">${uiLabelMap.createdate}</td>
                    <#--<td>
                      <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>-->
                    <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="10" value="" /></td>    	
             </tr>
        	
        	<tr>
				<td colspan="8"><center><div id="saveBtn" align="center"><input type="button"  name="search" value="Search" onclick="javascript:validateDetails('searchPetitionDetails');"></center></td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
 <form method="post" name="listwardMaster" class="basic-form">
  <div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.wardMasterList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
	         <td><center>${uiLabelMap.wardname}<center></td>
             <td><center>${uiLabelMap.zoneName}</center></td>
             <td><center>${uiLabelMap.cityName}<center></td>
             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.createdate}</center></td>
             
              <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
         </tr>
       </thead>  
       
        <tr>
		      	<td align="center">1</td>
	          	<td><center>Mysore Ward</center></td>
			  	<td><center>Mysore Zone </center></td>
			  	<td><center>Hyderabad</center></td> 
			 	<td><center>Remarks</center></td> 
		  	 	<td><center>31/07/2017</center></td> 
				<td><center><a href="javascript:editWardMaster('listwardMaster');" class="buttontext" align="center">Edit</a></center></td>
		      	<td><center><a class="buttontext" align="center">Disable</a></center></td>
		      	<td><center><a class="buttontext" align="center">Remove</a></center></td>
					     
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
     function editWardMaster(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editwardmaster</@ofbizUrl>";
	    form.submit();
	}
	
	
</script>