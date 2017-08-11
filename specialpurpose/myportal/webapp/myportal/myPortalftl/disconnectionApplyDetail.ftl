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
    			<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>disconnectionApply</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
 			 
  			</div>  
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
             	<td>${uiLabelMap.sno}</td>
	        	<td>${uiLabelMap.disConnectionNo}</td>
             	<td>${uiLabelMap.connectionNo}</td>
             	<td>${uiLabelMap.dueAmount}</td>
             	<td>${uiLabelMap.reasonForDisconnection}</td>
             	<td>${uiLabelMap.CommonStatus}</td>
             	 <td>${uiLabelMap.edit}</td>
         	</tr>
      	</thead> 
       		<tr>
		      <td>1</td>
	          <td><a href="viewDisconnectionDetail">CARF1000</a></td>
			  	<td>0987 </td>
			  	<td>0</td> 
			    <td>reasone For Disconnection</td> 
			    <td>Approved</td> 
			    <td><a href="javascript:editDisconnection('listAppliedConnection');" class="buttontext" align="center">${uiLabelMap.edit}</a></td>
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
     
     function editDisconnection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editDisconnection</@ofbizUrl>";
	    form.submit();
	}
</script>






