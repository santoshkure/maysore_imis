<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listRegisterMeterDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Meter Detail -->

<#setting locale="en">
    
<form method="post" name="listMeterDetail" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
		    <ul>
		 	 <div class="h3" align="center"><b>${uiLabelMap.listMeterDetail}</b></div> 
		   </ul>
	   </div>
	   <div class="screenlet-body">
			<table class="basic-table hover-bar" cellspacing="0">
			<thead>
        		<tr class="header-row-2">
        			<td>${uiLabelMap.sno}</td>
              		<td>${uiLabelMap.meterNo}</td>
	          		<td>${uiLabelMap.meterCondition}</td>
	          		<td>${uiLabelMap.meterStatus}</td>
            		<td>${uiLabelMap.CommonEdit}</td>
       		</thead>
        
       		 <tbody>
				<tr>
				    <td>1</td>
        			<td><a href="viewMeterDetail">10001</a></td>
	          		<td>Good</td>
              		<td>Running</td>
              		<td><a href="editMeterDetail" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
           		</tr>
       		</tbody>
     		</table>
		</div>
	</div>   
</form>
