<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: GrievanceActionEmpPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#-- 1.0			Anubha Saini	  21/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


   		 <form method="post" name="actionGrievance" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		<#--  <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.createIllegalToLegal}</span></div> -->
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.approveRejectGrievance}</b></div>
	    		</ul>
  				</div>
  				
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
                     <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="approve"   type="button" value="${uiLabelMap.approve}" onClick="javascript:actionGreivanceDetail(this);"/>
                    	<input name="reject"   type="button" value="${uiLabelMap.reject}" onClick="javascript:actionGreivanceDetail(this);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
              
        		</table>
 
	</div>
   <#--	</div>-->

   
</form>
<script type="text/javascript" language="javascript">

function actionGreivanceDetail(Msg)
   {
		      var form=document['actionGrievance'];
		      var tempMsgCheck = Msg.value;
		      var sure = confirm("Are you sure, you want to "+tempMsgCheck+" the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>
