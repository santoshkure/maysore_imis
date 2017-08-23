<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewDisconnectionDetail.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   07/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the Disconnection Detail -->


<form method="post" name="connectionApply" action="" class="basic-form">
   		<div class="row" >
    			<div class="alert alert-info">
					<ul>
    					<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    					<div class="h3" align="center"><b>${uiLabelMap.disconnectionApply}</b></div>
	    			</ul>
	    			<div class="basic-nav" style="margin-top: -37px;">
  						<ul>
    					<li>
							<a>
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    					</li>
  						</ul>
 			 		</div>
  				</div>
  				<div id="printId1">
  				<table cellspacing="0" class="basic-table table-responsive">
  				
        			<tr>
                      	<td class="label">${uiLabelMap.disConnectionNo}</td>
                        <td>CARF1000</td>
                       
                 	</tr>
                    
                     <tr>
                    	 <td class="label">${uiLabelMap.connectionNo}</td>
                         <td>Domestic</td>
                         
                        	<td class="label">${uiLabelMap.dueAmount}</td>
                         <td>No Dues</td>
             		 </tr>
             		 
             		 <tr>
                    	 <td class="label">${uiLabelMap.reasonForDisconnection}</td>
                         <td>Residential</td>
                         
                        	<td class="label">${uiLabelMap.applicationDate}</td>
                         <td>0708/2017</td>
             		 </tr>
             		 
             		 <tr>
                    	 <td class="label">${uiLabelMap.assentialDoccument}</td>
                         <td>Residential.doc</td>
                         
             		 </tr>
             		 
             		 <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.actionDetail}</font></td></tr>
             		 
             		  <tr>
                    	 <td class="label">${uiLabelMap.CommonStatus}</td>
                         <td>Approved</td>
                         
                        	<td class="label">${uiLabelMap.actionDate}</td>
                         <td>0708/2017</td>
             		 </tr>
             		 
        		</table>
 	</div>
	</div>
   <#--	</div>-->

   
</form>