<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editDisconnection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   09/08/2017 

<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->



<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editDisconnectionApply" class="basic-form">

<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.editDisconnection}</b></div>
	    		</ul>
  				</div>


					<table cellspacing="0" class="basic-table table-responsive">
        		
        					<input type="hidden" name="customerId" value="" <li><a title="This is your Reference Id"/>
         					<input type="hidden" name="connectionId" value="" <li><a title="This is your Reference Id"/>
         					<input type="hidden" name="disconnectionId" value="" <li><a title="This is your Disconnection Id"/>
         					<input type="hidden" name="refrenceNo" value="" <li><a title="This is your Refrence No."/>
        		
        			<tr>
	              		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
                	</tr>
        			<tr>
                      	<td class="label">${uiLabelMap.customerNo}</td>
                        <td><input name="customerNo"  type="text" maxlength="10" readonly value="${userLogin.userLoginId}" placeholder="${uiLabelMap.customerNo}"></td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td><input name="consumerNo"  type="text" maxlength="10" readonly value="CAN101" placeholder="${uiLabelMap.connectionNo}"></td>
                        
                    </tr>
                    <tr>
                    	
                    		<td class="label">${uiLabelMap.typeOfDisconnection}</td>
                         <td>
                    		<select name="${uiLabelMap.typeOfDisconnection}">
                   				<option value="">Select</option>
                   				<option value="">Temporary</option>
                   				<option value="">Permanent</option>
                   			
                 			</select>
             			</td>
                    	
                    </tr>
                     <tr>
                      	<td class="label">${uiLabelMap.dueAmount}</td>
                        <td><input name="consumerNo"  type="text" maxlength="10" readonly value="No Dues"></td>
                        <td class="label">${uiLabelMap.reasonForDisconnection}</td>
                        <td colspan="4"><textarea name="reasonForDisconnection" value="Residential" maxlength="3000" style="width:400px"></textarea></td>
                        
                    </tr>
                     <tr>
                      	<td class="label">${uiLabelMap.applicationDate}</td>
                        <td><input name="applicationDate"  type="date" maxlength="10" readonly value="0708/2017"></td>
                        <td class="label">${uiLabelMap.essentialDocument}</td>
                        <td>
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(fileLoc);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 				</td>
                        
                    </tr>
                    
                 	<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="Update"   type="button" value="${uiLabelMap.CommonEdit}" onClick="javascript:editDisconnectionDetail(editDisconnectionApply);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
        		</table>
 
	</div>
   <#--	</div>-->

   
</form>

<script type="text/javascript" language="javascript">

function editDisconnectionDetail(editDisconnectionApply)
   {
		      var form=document['editDisconnectionApply'];
		      
		      var sure = confirm("Are you sure, you want to Edit the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>disconnectionApplyDetail</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
</script>