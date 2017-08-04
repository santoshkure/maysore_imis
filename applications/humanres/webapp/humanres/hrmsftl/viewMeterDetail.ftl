<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewMeterDetail.ftl.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Meter Detail -->

<#setting locale="en">
    
    <form method="post" name="viewMeterDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<div class="h3" align="center"><b>${uiLabelMap.viewMeterDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.meterNo}</td>
                    <td colspan="5">10001</td>
                  </tr>
                  
                  <tr>
                     <td class='label'>${uiLabelMap.meterConstant}</td>
                    	<td>Meter Constant</td>
                    	
                     	<td class='label'>${uiLabelMap.meterCondition}</td>
                    	<td>Good</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.meterExisting}</td>
                    	<td>Meter Existing</td>
                    	
                     	<td class='label'>${uiLabelMap.meterCost}</td>
                    	<td>1000</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.meterStatus}</td>
                    	<td>Running</td>
                    	
                     	<td class='label'>${uiLabelMap.CommonRemark}</td>
                    	<td>Remark For Meter</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.dateofpurchase}</td>
                    	<td>02/08/2017</td>
                    	
                     	<td class='label'>${uiLabelMap.commonOfficeName}</td>
                    	<td>Mysore Office</td>
                     </tr>
                  
            </tbody>
        </table>
    </div>
</form>