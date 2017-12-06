<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: kattaChangeRequest.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   04/08/2017 
<#-- 1.1			Pankaj Trivedi						05/08/2017    
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->
   
   
   <form method="post" name="khataChangeReq" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		<#--  <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.changeKhata}</span></div>-->
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.changeKhataRequest}</b></div>
	    		</ul>
  				</div>
  					
				
        		<table cellspacing="0" class="basic-table table-responsive">
        		
        					<input type="hidden" name="khataChangeId" value="" <li><a title="This is your khataChange Id"/>
         					<input type="hidden" name="khataChgangeNo" value="" <li><a title="This is your khata Chgange No"/>
         					<input type="hidden" name="customerId" value="" <li><a title="This is your customer Id"/>
         					<input type="hidden" name="connectionId" value="" <li><a title="This is your connection Id"/>
        		
        			<tr>
	              		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
                	</tr>
                	
                	
        			<tr>
                      	<td class="label">${uiLabelMap.customerNo}</td>
                        <td><input name="customerNo"  type="text" maxlength="10" readonly value="${userLogin.userLoginId}"></td>
                        
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td><input name="connectionNo"  type="text" maxlength="10" readonly value="CON2001""></td>
                        
                    </tr>
                    
                     
                     <tr>
                      	<td class="label">${uiLabelMap.applicationDate}</td>
                        <td><input name="applicationDate"  type="date" maxlength="10" readonly value="${nowTimestamp?string("dd/MM/yyyy")}" placeholder="${uiLabelMap.applicationDate}"></td>
                        <td class="label">${uiLabelMap.essentialDocument}</td>
                        <td>
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(fileLoc);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 				</td>
                    </tr>
                   
                    <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.oldConnectionDetail}</font></td></tr>
                    <tr>
                    <td class="label">${uiLabelMap.connectionCategory}</td>
                         <td>
                    	<select disabled name="${uiLabelMap.connectionCategory}" >
                   			<option value="">Select</option>
                   			<option value="">Household</option>
                   			<option value="">Non-household</option>
                   			<option value="">Commercial</option>
                   			
                 		</select>
             		</td>
                        <td class="label">${uiLabelMap.applicationType}<font color="red" >*</font></td>
                         <td>Residential.doc</td>
             		<tr>
                   <td class="label">${uiLabelMap.typeOfBuilding}</td>
 						<td>
                    	<select disabled name="typeOfBuilding" >
                   			<option value="">Select</option>
                   			<option value="">Residential</option>
                   			<option value="">Industrial</option>
                   			
                 		</select>
             			</td>   
   						<td class="label">${uiLabelMap.applicationDate}</td>
   						<td>
						<#--<@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
						--><input name=""  type="date" maxlength="10" readonly value="02/08/2017" placeholder="02/08/2017"></td>
   						
   					</tr>
                    <tr>
	                         
	                         <td class="label">${uiLabelMap.essentialDocument}</td>
							<td>
		     				<input type="file" name="fileLoc1"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName1'),document.getElementById('fileLocFileType1'));"/>
		    				<input type="button" onclick="javascript:resetVal(fileLoc1);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName1" id="fileLocFileName1" value=""/>
		    				<input type="hidden" name="fileLocFileType1" id="fileLocFileType1" value=""/>
		 					</td>
                    </tr>
                    
                    	 <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.newchangeKhata}</font></td></tr>
	               	
                     <tr>
	                         
	                        <td class="label">${uiLabelMap.newKhataNo}</td>
	                        <td><input name="newKhataNo"  type="text" maxlength="7" value=""></td>
                    </tr>
                   
                    <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveRegistrationDetail(khataChangeReq);"/>
                    	 <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     	</center>
                     	</td>
                    </tr>
        		</table>
 
	</div>
   <#--	</div>-->

   
</form>

    <script type="text/javascript" language="javascript">
 
function saveRegistrationDetail(khataChangeReq)
   {
		      var form=document['khataChangeReq'];
		     <#-- var tital =   form.tital.value;
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
		   -->   
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>khataChangeDetail</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    </script>