<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: disconnectionApplyPage.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->
   <script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
    <script language="javascript" src="/images/jquery/plugins/validate/additional-methods.js"  type="text/javascript"></script>

   		 <form method="post" name="disconnectionApply" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		 <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.disconnectionApply}</span></div>
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
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
                        <td><input name="customerNo"  type="text" maxlength="10" value="1001" placeholder="${uiLabelMap.customerNo}"></td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td><input name="consumerNo"  type="text" maxlength="10" value="2001" placeholder="${uiLabelMap.connectionNo}"></td>
                        
                    </tr>
                    
                     <tr>
                      	<td class="label">${uiLabelMap.dueAmount}</td>
                        <td><input name="consumerNo"  type="text" maxlength="10" value="" placeholder="${uiLabelMap.dueAmount}"></td>
                        <td class="label">${uiLabelMap.reasoneForDisconnection}<font color="red" >*</font></td>
                        <td colspan="4"><textarea name="reasoneForDisconnection" value="" maxlength="150" style="width:400px"></textarea></td>
                        
                    </tr>
                     <tr>
                      	<td class="label">${uiLabelMap.applicationDate}</td>
                        <td><input name="applicationDate"  type="date" maxlength="10" value="03/08/2017" placeholder="${uiLabelMap.applicationDate}"></td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td>
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(document.connectionApply.fileLoc);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 				</td>
                        
                    </tr>
                    
                    <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="save"   type="button" value="${uiLabelMap.save}" onClick="javascript:saveRegistrationDetail(connectionApply);"/>
                    	 <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
                     	</center>
                     	</td>
                    </tr>
        		</table>
 
	</div>
   <#--	</div>-->

   
</form>

    <script type="text/javascript" language="javascript">
<#-- 
function saveRegistrationDetail(RegisterPerson)
   {
		      var form=document['RegisterPerson'];
		      var tital =   form.tital.value;
		      var firstName =   form.firstName.value;
		      var middleName =   form.middleName.value;
		      var dateOfBirth =   form.dateOfBirth.value;
		      var gender =   form.gender.value;
		      var maritalStatus =   form.maritalStatus.value;
		      var fatherName =   form.fatherName.value;
		      var motherName =   form.motherName.value;
		      var aadharCardNo =   form.aadharCardNo.value;
		      var cummunity =   form.cummunity.value;
		      var cast =   form.cast.value;
		      var nationality =   form.nationality.value;
		      var cast =   form.cast.value;
		      var address =   form.address.value;
		      var mobileNo =   form.mobileNo.value;
		      var eMail =   form.eMail.value;
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }-->
    
    </script>