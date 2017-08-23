<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewMeterChangeRequest.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Meter Change Request Detail-->

<#setting locale="en">
    
    <form method="post" name="viewMeterChangeRequest" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<div class="h3" align="center"><b>${uiLabelMap.viewMeterChangeRequestDetail}</b></div> 
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
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.meterChangeApplicationNo}</td>
                    <td>MCAN10001</td>
                    
                     <td class="label">${uiLabelMap.meterId}</td>
                    <td>M1000101</td>
                  </tr>
                  
                  <tr>
                   <td class="label">${uiLabelMap.connectionId}</td>
                    <td>10001</td>
                    
                  <td class="label">${uiLabelMap.customerId}</td>
                    <td>10001</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.reasonForChange}</td>
                    	<td>Reason</td>
                    	
                     	<td class='label'>${uiLabelMap.feeAmount}</td>
                    	<td>1000</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.feeStatus}</td>
                    	<td>Paid</td>
                    	
                     	<td class='label'>${uiLabelMap.feeRefrenceNo}</td>
                    	<td>Ref1101</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.issueDetail}</td>
                    	<td>Issue Details</td>
                    	
                     	<td class='label'>${uiLabelMap.dateOfApply}</td>
                    	<td>02/08/2017</td>
                     </tr>
                  
                   <tr>
                     
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td></td>
                    	<td colspan="3">Example.doc</td>
                     </tr>
                     
            </tbody>
        </table>
    </div></div>
</form>