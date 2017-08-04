<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewKhataChangeDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Khata Change Detail -->

<#setting locale="en">
    
<form method="post" name="viewKhataChangeDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewKhataChangeRequesrDetail}</b></div> 
			</ul>
		</div>
        	<table cellspacing="0" class="basic-table table-responsive">
             	<tbody>
              
                	<tr>
                    	<td class="label">${uiLabelMap.khataChangeId}</td>
                    	<td>CID10001</td>
                     	<td class="label">${uiLabelMap.khataChangeNo}</td>
                    	<td>10001</td>
                  	</tr>
                  	
                  	<tr>
                  		<td class="label">${uiLabelMap.consumerId}</td>
                  		<td>100001</td>
                  
                   		<td class="label">${uiLabelMap.connectionId}</td>
                    	<td>Complaint</td>
                     </tr>
                     
                     <tr>
                     	<td class="label">${uiLabelMap.applyDate}</td>
                    	<td>02/08/2017</td>
                    
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td>
                    	<td>example.doc</td>
                     </tr>
                    
         		</tbody>
       		</table>	
    </div>
</form>