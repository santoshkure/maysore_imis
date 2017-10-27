<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: veiwGrievanceCusPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Modified by Siddhi   --->
<#-- 1.0			Anubha Saini	  19/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


<form method="post" name="veiwGrievanceCustomer" action="" class="basic-form">
	<div class="row" >
    	<div class="alert alert-info">
			<ul>
    			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    			<div class="h3" align="center"><b>${uiLabelMap.veiwGrievance}</b></div>
	    	</ul>
	    	<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
						<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
   					</li>
				</ul>
		 	</div> 
  		</div>
  		<div class="screenlet-body" id="printId1">
  			<table cellspacing="0" class="basic-table table-responsive" rules="all">
  				<#if grievanceDetailsList?exists>     
                	<#if grievanceDetailsList?has_content>
                    	<#list grievanceDetailsList as grievanceDetailsList>		
        				<tr>
        					<td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceReceipt}</b></font></td>
                		</tr>
              				<input type="hidden" name="sequenceId" value="${grievanceDetailsList.sequenceId?if_exists}" style="width:150px">  
        				<tr>
                      		<td class="label">${uiLabelMap.receiptNo}</td>
                        	<td colspan="12">${grievanceDetailsList.receiptNo?if_exists}</td>
                 		</tr>
		                <tr>
		                	<td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceDetail}</b></font></td>
		                </tr>
                    	<tr>
                 			<td class="label">${uiLabelMap.grievanceDate}</td>
   							<td colspan="12"><#if grievanceDetailsList.grievanceDate?has_content>${grievanceDetailsList.grievanceDate?if_exists?string('dd/MM/yyyy')}</#if></td>
				    	</tr>
						<tr>	
							<td class="label">${uiLabelMap.grievancePetitionDate}</td>
   							<td><#if grievanceDetailsList.grievancePetitionDate?has_content>${grievanceDetailsList.grievancePetitionDate?if_exists?string('dd/MM/yyyy')}</#if></td>
                    		<td class="label" >${uiLabelMap.typeOfGrievance}</td>
 							<td colspan="4">${grievanceDetailsList.typeOfGrievance?if_exists}</td> 
                  		</tr>  
                  		<tr>
                    		<td class="label">${uiLabelMap.name}</td>
                         	<td >${grievanceDetailsList.grievanceNameEN?if_exists}</br>
                         	${grievanceDetailsList.grievanceNameKN?if_exists}</td>
                       		<td class="label">${uiLabelMap.OrderAddress}</td>
                        	<td colspan="4">${grievanceDetailsList.grievanceAddEn?if_exists}</br>
                        	${grievanceDetailsList.grievanceAddKn?if_exists}</td> 
                  		</tr>
                    	<tr>
                    		<td class="label">${uiLabelMap.mobileNo}</td>
                        	<td>${grievanceDetailsList.mobileNo?if_exists}</td>
                        	<td class="label">${uiLabelMap.CommonEmail}</td>
                        	<td colspan="4">${grievanceDetailsList.eMail?if_exists}</td>
                    	</tr>
                    	<tr>
                    		<td class="label">${uiLabelMap.grievanceDetail}</td>
                       	 	<td colspan="1">${grievanceDetailsList.grievanceDetailEn?if_exists}</br>${grievanceDetailsList.grievanceDetailKn?if_exists}</td>
                    		<td class="label">${uiLabelMap.assentialDocument}</td>
				        	<td colspan="4">GrievanceDetail.doc</td>
                    	</tr>
                    	</#list>
 	          		</#if>
 	   	   		</#if>
        	</table>
		</div>
   	</div>
                   	 
</form>

