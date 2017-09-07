<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: buildingMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017              -->

<#-- #####################################################################################################-->

 <form method="post" name="buildingMaster" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
    		<li class="h3">${uiLabelMap.buildingmaster}</li>
    		  <div class="basic-nav" style="margin-top: -80px;">
  				   <ul>
    				    <li>
							    <a title="Create Zone Master" href="<@ofbizUrl>createBuildingMaster</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
							    </a>
    				   </li>
  				  </ul>
  			</div>  
    	</ul>
  	</div>
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
			    <tr>
			       <td class="label">${uiLabelMap.buildingType}</td>
			      <td> 
				    <select name="buildingType" style="width:150px;">
					   <option value="">${uiLabelMap.CommonSelect}</option>
				 	   <option value="">Residential</option>
				 	   <option value="">Commercial</option>
				   </select>
			    </td> 
			        <td class="label" >${uiLabelMap.description}</td>
		            <td><input type="text" name="Description" style="width:140px" maxlength ="150"/></td> 	
        	</tr> 
		     <tr>
		            <td class="label" >${uiLabelMap.remark}</td>
		            <td><textarea name="remark" style="width:140px" maxlength ="150"></textarea></td>
		   
		            <td class="label" >${uiLabelMap.createdate}</td>
		            <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"/></td>
	         </tr>
       		   <tr>
				    <td colspan="8"><center><div id="saveBtn" align="center"><input type="button"  name="search" value="Search" onclick="javascript:buildingMasterType('buildingMaster');"></center></td>
			  </tr>
			</tr>
		</table>
      </div>
	</div>
</form>

<#--------------------------Master List------------------------------>
 <form method="post" name="listBuildingMaster" class="basic-form">
   <div class="row">
      <div class="alert alert-info">
       <ul>
          <li class="h3">${uiLabelMap.buildingMasterList}</li>
       </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
      <table class="basic-table" cellspacing="0">
         <thead>
             <tr class="header-row-2">
                <td>${uiLabelMap.sno}</td>
	            <td>${uiLabelMap.buildingType}</td>
                <td>${uiLabelMap.description}</td>
                <td>${uiLabelMap.remark}</td>
                <td>${uiLabelMap.createdate}</td>
                <td>${uiLabelMap.Edit}</td>
                <td>${uiLabelMap.enableDisable}</td>
                <td>${uiLabelMap.Remove}</td>
           </tr>
         </thead> 
           <tr>
		      	<td>1</td>
	          	<td>Residential</td>
			  	<td>Hyderabad</td>
			 	<td>Remarks</td> 
		  	 	<td>23/08/2017</td> 
				<td><a href="javascript:editBuildingMaster('listBuildingMaster');" class="buttontext">Edit</a></td>
		      	<td><a href="javascript:enableBuildingMaster('listBuildingMaster');" class="buttontext">Disable</a></td>
		      	<td><a href="javascript:removeBuildingMaster('listBuildingMaster');" class="buttontext">Remove</a></td>
		   </tr>    
        </table>
     </div>
  </div>
</form>
<script type="text/javascript" language="javascript">

	function buildingMasterType()
	{
					document.buildingMaster.action= "<@ofbizUrl>BuildingMaster</@ofbizUrl>";
					document.buildingMaster.submit();
					disSubmit('saveBtn'); 
					return true;
					alert("submit");
	}
	function editBuildingMaster(formname)
	{
	     var form =document[formname];	
         form.action="<@ofbizUrl>editBuildingMaster</@ofbizUrl>";
	     form.submit();
	}
	function enableBuildingMaster(formname)
	{
	var r=confirm("Are you sure, you want to Enable/Disable the Form ?")
        if (r==true)
        {
	     var form =document[formname];	
         form.action="<@ofbizUrl>BuildingMaster</@ofbizUrl>";
	     form.submit();
	}
	}
	function removeBuildingMaster(formname)
	{
	var r=confirm("Are you sure, you want to Remove the Form ?")
        if (r==true)
        {
	     var form =document[formname];	
         form.action="<@ofbizUrl>BuildingMaster</@ofbizUrl>";
	     form.submit();
	}
	}
</script>