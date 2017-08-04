<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listConnectionApplyPage.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	03 August 2017    -->

<#-- #####################################################################################################-->

<#--------------------------Connection Apply List------------------------------>
<form method="post" name="connectionList" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.ConnectionList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
   <div class="">
    <table class="basic-table table-responsive" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
	         <td><center>${uiLabelMap.customerNo}<center></td>
             <td><center>${uiLabelMap.connectionNo}</center></td>
             <td><center>${uiLabelMap.connectionCategory}<center></td>
             <td><center>${uiLabelMap.applicationType}</center></td>
             <td><center>${uiLabelMap.typeOfBuilding}</center></td>
             
             <td><center>${uiLabelMap.applicationDate}</center></td>
             <td><center>${uiLabelMap.feeForConnection}</center></td>
             <td><center>${uiLabelMap.feeStatus}</center></td>
              <td><center>${uiLabelMap.status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.disconnectionApply}</center></td>
             
         </tr>
        
      </thead> 
       <tr>
		      	<td align="center">1</td>
	          	<td><center>1001</center></td>
			  	<td><center><a class="buttontext" align="center">2001</a></center></center></td>
			  	<td><center>Household</center></td> 
			 	<td><center>Permanent</center></td> 
		  	 	<td><center>Residental</center></td> 
		  	 	<td><center>31/07/2017</center></td>
		  	 	<td><center>1000</center></td> 
		  	 	<td><center>paid</center></td> 
		  	 	<td><center>Submitted</center></td> 
				<td><center><a href="javascript:editConnection('connectionList');" class="buttontext" align="center">Edit</a></center></td>
				<td><center><a class="buttontext" align="center" href="<@ofbizUrl>disconnectionApply</@ofbizUrl>">Disconnect</a></center></td>
		      	
					     
		</tr>    
      </table>
    </div>
  </div>
</div>
</form>

<script type="text/javascript" language="javascript">

	function editConnection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editConnectionApply</@ofbizUrl>";
	    form.submit();
	}
	
     
	
	
</script>