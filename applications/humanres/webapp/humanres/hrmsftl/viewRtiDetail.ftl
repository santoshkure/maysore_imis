<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewRtiDetail.ftl.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Rti Detail -->

<#setting locale="en">
    
    <form method="post" name="viewMeterDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewRtiDetail}</b></div> 
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
                    <td class="label">${uiLabelMap.rtiRefrenceNo}</td>
                    <td>RTI10001</td>
                    
                     <td class="label">${uiLabelMap.applicantName}</td>
                    <td>Ravi Kumar Rai</td>
                  </tr>
                  
                  <tr>
                     <td class='label'>${uiLabelMap.Address}</td>
                    	<td>Applicant address</td>
                    	
                     	<td class='label'>${uiLabelMap.CommonEmail}</td>
                    	<td>Example@gmail.com</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.contact}</td>
                    	<td>Meter Existing</td>
                    	
                     	<td class='label'>${uiLabelMap.applyDate}</td>
                    	<td>02/08/2017</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.neededInformation}</td>
                    	<td>Needed Information Detail</td>
                    	
                     	<td class='label'>${uiLabelMap.supportingDocument}</td>
                    	<td>Supporting Document if any</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.feePaymentType}</td>
                    	<td>Online</td>
                    	
                     	<td class='label'>online Application payment Refrence id</td>
                    	<td>Mysore Office</td>
                     </tr>
                  
                  	<tr>
                     
                     	<td class='label'>Application paid amount</td>
                    	<td>1000</td>
                    	
                     	<td class='label'>Application payment status</td>
                    	<td>Paid</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.rtiStatus}</td>
                    	<td>status</td>
                    	
                     	<td class='label'>${uiLabelMap.bplCardNo}</td>
                    	<td>1234 4567 7894</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.uploadBplCard}</td>
                    	<td>Online.doc</td>
                     </tr>
            </tbody>
        </table>
    </div></div>
</form>