<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: veiwGrievanceEmpPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#-- 1.0			Anubha Saini	  19/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


   		 <form method="post" name="veiwGrievanceEmp" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		<#--  <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.createIllegalToLegal}</span></div> -->
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.veiwGrievance}</b></div>
	    		</ul>
	    		<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>connectionApply</@ofbizUrl>">
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    				</li>
  				</ul>
 			 </div> 
  				</div>
  				<div id="printId1">
  				<table cellspacing="0" class="basic-table table-responsive">
  				
  							
        			<tr>
        			<td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceReceipt}</b></font></td>
	              		
                	</tr>
                	
        			<tr>
                      	<td class="label">${uiLabelMap.receiptNo}</td>
                        <td colspan="12">RECP1001</td>
                       
                 </tr>
                 <tr><td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceDetail}</b></font></td></tr>
                 <tr>
                 		<td class="label">${uiLabelMap.grievanceDate}</td>
   						<td colspan="12">08/08/2017</td>
				</tr>
					<tr>	
						<td class="label" >${uiLabelMap.grievancePetitionDate}</td>
   						<td>08/08/2017</td>
                  
                    	<td class="label" >${uiLabelMap.typeOfGrievance}</td>
 						<td colspan="4">Internal</td> 
                  	</tr>  
                  
                 
                  
                  	<tr>
                    		<td class="label">${uiLabelMap.name}</td>
                         	<td >Anshul</td>
                       		<td class="label">${uiLabelMap.OrderAddress}</td>
                        	<td colspan="4">Warje</td> 
                  	</tr>
                    <tr>
                    		<td class="label">${uiLabelMap.mobileNo}</td>
                        	<td>8878365123</td>
                        	<td class="label">${uiLabelMap.CommonEmail}</td>
                        	<td colspan="4">
                        	${uiLabelMap.yourEMail}
                        	</td>
                    </tr>
                    <tr>
                    		<td class="label">${uiLabelMap.grievanceDetail}</td>
                       	 	<td colspan="1">grievance Detail</td>
                    		<td class="label">${uiLabelMap.assentialDocument}</td>
				        	<td colspan="4">GrievanceDetail.doc
                        	</td>
                    </tr>
                    
              
        		</table>
 
	</div>
   </div>

   
</form>

