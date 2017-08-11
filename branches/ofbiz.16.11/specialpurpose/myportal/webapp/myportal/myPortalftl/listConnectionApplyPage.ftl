<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listConnectionApplyPage.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	03 August 2017    -->

<#-- #####################################################################################################-->

<#--------------------------Connection Apply List------------------------------>
<form method="post" name="connectionList" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.ConnectionList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
   <div class="">
    <table class="basic-table table-responsive" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
	         <td>${uiLabelMap.customerNo}</td>
             <td>${uiLabelMap.connectionNo}</td>
             <td>${uiLabelMap.connectionCategory}</td>
             <td>${uiLabelMap.applicationType}</td>
           
             
             <td>${uiLabelMap.applicationDate}</td>
            
             <td>${uiLabelMap.feeStatus}</td>
              <td>${uiLabelMap.status}</td>
             <td>${uiLabelMap.edit}</td>
             <td>${uiLabelMap.disconnectionApply}</td>
             <td>${uiLabelMap.applyForWaterSupply}</td>
             <td>${uiLabelMap.applyForAgreementLetter}</td>
             <td>${uiLabelMap.applyForDecleaCerti}</td>
             <td>${uiLabelMap.applyForAgreementLetter}</td>
             
         </tr>
        
      </thead> 
       <tr>
		      	<td>1</td>
	          	<td>CAN101</td>
			  
			  	<td><a href="viewConnectionDetail" align="center">CARF1000</a></td>
			  	<td>Household</td> 
			 	<td>Permanent</td> 
		  	 
		  	 	<td>31/07/2017</td>
		  	 	
		  	 	<td>paid</td> 
		  	 	<td>Submitted</td> 
				<td><a href="javascript:editConnection('connectionList');" class="buttontext" align="center">${uiLabelMap.edit}</a></td>
				<td><a class="buttontext" align="center" href="<@ofbizUrl>disconnectionApply</@ofbizUrl>">Disconnect</a></td>
				<td><a href="createAppForWaterSupply" class="buttontext" align="center">${uiLabelMap.waterSupply}</a>
				<a href="viewAppForWaterSupply" class="buttontext" align="center">${uiLabelMap.commonVeiw}</a>
				</td>
				<td><a href="createForAgreementLetter" class="buttontext" align="center">${uiLabelMap.agreementLetter}</a>
				<a href="veiwForAgreementLetter" class="buttontext" align="center">${uiLabelMap.commonVeiw}</a>
				</td>
				<td><a href="createDeclearationCertificate" class="buttontext" align="center">${uiLabelMap.DecleaCerti}</a>
				<a href="veiwForDeclearationCerti" class="buttontext" align="center">${uiLabelMap.commonVeiw}</a>
				</td>
				<td><a href="createAgreementLetter" class="buttontext" align="center">${uiLabelMap.agreementLetter}</a>
				<a href="veiwAgreementLetter" class="buttontext" align="center">${uiLabelMap.commonVeiw}</a>
				</td>
						     
		</tr>    
      </table>
    </div>
  </div>
</div>
</form>

<script type="text/javascript" language="javascript">

	function editConnection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editConnectionApply</@ofbizUrl>";
	    form.submit();
	}
	
     
	
	
</script>