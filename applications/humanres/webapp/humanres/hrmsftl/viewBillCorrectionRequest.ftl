<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewBillCorrectionRequest.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Bill Correction Request Detail-->

<#setting locale="en">
    
    <form method="post" name="viewBillCorrectionRequest" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewBillCorrectionRequestDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.correctionNo}</td>
                    <td colspan="3" >10001</td>
                  </tr>
                  
                  <tr>
                     <td class='label'>${uiLabelMap.customerNo}</td></td>
                    	<td>10001</td>
                    	
                     	<td class='label'>${uiLabelMap.connectionNo}</td>
                    	<td>AB10001</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.billNo}</td>
                    	<td>MCCM100010</td>
                    	
                     	<td class='label'>${uiLabelMap.issueDetail}</td>
                    	<td>Issue Details</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.applyDate}</td>
                    	<td>02/08/2017</td>
                    	
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td>
                    	<td>Doccument</td>
                    
                     </tr>
                    
            </tbody>
        </table>
    </div>
</form>