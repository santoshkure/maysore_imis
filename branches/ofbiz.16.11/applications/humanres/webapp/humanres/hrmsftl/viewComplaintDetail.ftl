<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewComplaintDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Complaint Detail -->

<#setting locale="en">
    
    <form method="post" name="viewComplaintDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewCompliantDetail}</b></div> 
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
                    <td class="label">${uiLabelMap.complaintNo}</td>
                    <td>CID10001</td>
                    
                     <td class="label">${uiLabelMap.customerNo}</td>
                    <td>10001</td>
                  </tr>
                  
                  <tr>
                  <td class="label">${uiLabelMap.connectionNo}</td>
                  <td>100001</td>
                  
                   <td class="label">${uiLabelMap.complaintType}</td>
                    <td>Complaint</td>
                    
                    
                     </tr>
                     
                     <tr>
                     <td class="label">${uiLabelMap.complaintDescription}</td>
                    <td>Complaint Description</td>
                     	<td class='label'>${uiLabelMap.compliantApplyDate}</td></td>
                    	<td>02/08/2017</td>
                    	
                     	
                    
                     </tr>
                     
                     <tr>
                     <td class='label'>${uiLabelMap.assentialDoccument}</td></td>
                    	<td>example.doc</td>
                     </tr>
                     	
         			</tbody>
       			</table>	
    	</div></div>
</form>