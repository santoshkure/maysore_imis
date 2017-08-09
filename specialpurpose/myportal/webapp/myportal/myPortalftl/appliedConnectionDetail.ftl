<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: appliedConnectionDetail.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   07/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search bill correction.-->

<form method="post" name="connectionDetail" class="basic-form">
<div class="row">
  		<div class="alert alert-info">
    		<ul>		   			
    			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    			<li class="h3">${uiLabelMap.searchAppliedConnection}</li>
 			</ul>
  		</div>
	
	<div class="screenlet-body">
		<table class="basic-table" cellspacing="0">
		
			<tr>
			 	<td class="label">${uiLabelMap.connectionRequestNo} </font></td>
			 	<td><input type="text" name="connectionRequestNo"  value="" /></td>   
			</tr>
			
            <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchConnection(connectionDetail);"/>
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
      <li class="h3">${uiLabelMap.listAppliedConnection}</li>
    </ul>
    
  </div>
   	<div class="screenlet-body min-scroll-div">
    	<table class="basic-table" cellspacing="0">
    	<thead>
         	<tr class="header-row-2">
             	<td>${uiLabelMap.sno}</td>
	        	<td>${uiLabelMap.connectionRequestNo}</td>
             	<td>${uiLabelMap.customerNo}</td>
             	<td>${uiLabelMap.applicationType}</td>
             	<td>${uiLabelMap.connectionType}</td>
             	<td>${uiLabelMap.CommonStatus}</td>
             	<td>${uiLabelMap.applyForWaterSupply}</td>
         	</tr>
      	</thead> 
       		<tr>
		      	<td>1</td>
	          	<td><a href="viewConnectionDetail" align="center">CARF1000</a></td>
			  	<td>0987 </td>
			  	<td>53536</td> 
			    <td>applicationType</td> 
			    <td>Approved</td>
			    <td><a href="createAppForWaterSupply" class="buttontext" align="center">${uiLabelMap.applyForWaterSupply}</a></td>
		   	</tr>    
        </table>
	</div>
</div>
</form>
 
<script type="text/javascript" language="javascript">
     
     function searchConnection(formname)
     {
		   var form=document['connectionDetail'];
               form.action = "<@ofbizUrl>appliedConnectionDetail</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
</script>






