<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: disconnectionApplyDetail.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   07/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show Disconnection Applied And Action Detail -->

<form method="post" name="disconnectionDetail" class="basic-form">
<div class="row">
  		<div class="alert alert-info">
    		<ul>		   			
    			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    			<li class="h3">${uiLabelMap.searchAppliedDisconnection}</li>
 			</ul>
  		</div>
	
	<div class="screenlet-body">
		<table class="basic-table" cellspacing="0">
		
			<tr>
			 	<td class="label">${uiLabelMap.disConnectionNo}</font></td>
			 	<td><input type="text" name="disConnectionNo"  value="" /></td>   
			 	
			 	<td class="label">${uiLabelMap.connectionNo}</font></td>
			 	<td><input type="text" name="connectionNo"  value="" /></td>   
			</tr>
			
            <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchDisconnection(disconnectionDetail);"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
	
	<#--------------------------Bill correction List------------------------------>
<form method="post" name="listAppliedConnection" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.listAppliedDisConnection}</li>
    </ul>
    
  </div>
   	<div class="screenlet-body min-scroll-div">
    	<table class="basic-table" cellspacing="0">
    	<thead>
         	<tr class="header-row-2">
             	<td><center>${uiLabelMap.sno}<center></td>
	        	<td><center>${uiLabelMap.disConnectionNo}<center></td>
             	<td><center>${uiLabelMap.connectionNo}</center></td>
             	<td><center>${uiLabelMap.dueAmount}<center></td>
             	<td><center>${uiLabelMap.reasonForDisconnection}</center></td>
             	<td><center>${uiLabelMap.CommonStatus}</center></td>
             	<td><center>${uiLabelMap.viewDetail}</center></td>
         	</tr>
      	</thead> 
       		<tr>
		      	<td align="center">1</td>
	          	<td><center>CARF1000</center></td>
			  	<td><center>0987 </center></td>
			  	<td><center>0</center></td> 
			    <td><center>reasone For Disconnection</center></td> 
			    <td><center>Approved</center></td> 
			 	<td><center><a href="viewDisconnectionDetail" class="buttontext" align="center">${uiLabelMap.viewDetail}</a></center></td>
		   	</tr>    
        </table>
	</div>
</div>
</form>
 
<script type="text/javascript" language="javascript">
     
     function searchDisconnection(formname)
     {
		   var form=document['disconnectionDetail'];
               form.action = "<@ofbizUrl>disconnectionApplyDetail</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
</script>






