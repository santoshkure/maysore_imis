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
      <div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>connectionApply</@ofbizUrl>">
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    				</li>
  				</ul>
 			 
  			</div>  
    </ul>
    
  </div>
  <div id="printId1">
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
</div>
</form>

<script type="text/javascript" language="javascript">

	function editConnection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editConnectionApply</@ofbizUrl>";
	    form.submit();
	}
	
    	<#--  	 function commonPS(divId)
         {
		   	var html="<html>";
					html+= document.getElementById(divId).innerHTML;
				html+="</html>";
				
				var printWin = window.open('','','left=0,top=0,width=10,height=5,toolbar=0,scrollbars=0,status=0');
				printWin.document.write(html);
				printWin.document.close();
				printWin.focus();
				printWin.print();
				printWin.close();
         } 
	-->
	
</script>