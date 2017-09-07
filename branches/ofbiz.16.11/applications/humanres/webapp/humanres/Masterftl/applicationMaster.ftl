<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: applicationMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017     -->

<#-- #####################################################################################################-->

 <form method="post" name="applicationMaster" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
    		<li class="h3">${uiLabelMap.applicationmaster}</li>
    		  <div class="basic-nav" style="margin-top: -80px;">
  				   <ul>
    				    <li>
							    <a title="Create Zone Master" href="<@ofbizUrl>createApplicationMaster</@ofbizUrl>">
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
			       <td class="label">${uiLabelMap.applicationType}</td>
			      <td> 
				    <select name="applicationType" style="width:150px;">
					   <option value="">${uiLabelMap.CommonSelect}</option>
				 	   <option value="">Temporary</option>
				 	   <option value="">Parmanent</option>
				   </select>
			    </td> 
			        <td class="label" >${uiLabelMap.description}</td>
		            <td><input type="text" name="Desctiption" style="width:140px" maxlength ="150"/></td> 	
        	</tr> 
		     <tr>
		            <td class="label" >${uiLabelMap.remark}</td>
		            <td><textarea name="remark" style="width:140px" maxlength ="150"></textarea></td>
		   
		            <td class="label" >${uiLabelMap.createdate}</td>
		            <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"/></td>
	         </tr>
       		   <tr>
				    <td colspan="8"><center><div id="saveBtn" align="center"><input type="button"  name="search" value="Search" onclick="javascript:applicationMasterType('applicationMaster');"></center></td>
			  </tr>
			</tr>
		</table>
		</div>
	</div>
</form>

<#--------------------------Master List------------------------------>
<form method="post" name="listApplicationMaster" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.applicationMasterList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
	         <td>${uiLabelMap.applicationType}</td>
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
	          	<td>Temporary</td>
			  	<td>Hyderabad</td>
			 	<td>Remarks</td> 
		  	 	<td>23/08/2017</td> 
				<td><a href="javascript:editApplicationMaster('listApplicationMaster');" class="buttontext">Edit</a></td>
		      	<td><a href="javascript:enableApplicationMaster('listApplicationMaster');" class="buttontext">Disable</a></td>
		      	<td><a href="javascript:removeApplicationMaster('listApplicationMaster');"class="buttontext">Remove</a></td>
		  </tr>    
       </table>
    </div>
  </div>
 </form>
<script type="text/javascript" language="javascript">

	function applicationMasterType()
	  {
					document.applicationMaster.action= "<@ofbizUrl>ApplicationMaster</@ofbizUrl>";
					document.applicationMaster.submit();
					disSubmit('saveBtn'); 
					return true;
					alert("submit");
	  }
	function editApplicationMaster(formname)
	  {
	     var form =document[formname];	
         form.action="<@ofbizUrl>editApplicationMaster</@ofbizUrl>";
	     form.submit();
	  }
	function enableApplicationMaster(formname)
	 {
	var r=confirm("Are you sure, you want to Enable/Disable the Form ?")
        if (r==true)
     {
	      var form =document[formname];	
          form.action="<@ofbizUrl>ApplicationMaster</@ofbizUrl>";
	      form.submit();
	 }
    } 
	function removeApplicationMaster(formname)
	 {
	  var r=confirm("Are you sure, you want to Remove the Form ?")
      if (r==true)
      {
	      var form =document[formname];	
          form.action="<@ofbizUrl>ApplicationMaster</@ofbizUrl>";
	      form.submit();
	  }
	 }
</script>