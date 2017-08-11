<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editKhataDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   09/08/2017 

<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->

<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editKhataChange" class="basic-form">

<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.editKhataChange}</b></div>
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
                        <td><input name="customerNo"  type="text" maxlength="10" readonly value="CAN1001"></td>
                        
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td><input name="connectionNo"  type="text" maxlength="10" readonly value="CON2001""></td>
                        
                    </tr>
                    
                     
                     <tr>
                      	<td class="label">${uiLabelMap.applicationDate}</td>
                        <td><input name="applicationDate"  type="date" maxlength="10" readonly value="${nowTimestamp?string("dd/MM/yyyy")}" placeholder="${uiLabelMap.applicationDate}"></td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td>
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(document.connectionApply.fileLoc);" value="Reset"/> 
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
                        <td class="label">${uiLabelMap.applicationType}</td>
                         <td>
                    	<select disabled name="applicationType" >
                   			<option value="">Select</option>
                   			<option value="">Permanent</option>
                   			<option value="">Temporary</option>
                   			
                 		</select>
             		</td>
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
	                         
	                         <td class="label">${uiLabelMap.assentialDocument}</td>
							<td>Residential.doc</td>
                    </tr>
                    
                    	 <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.newchangeKhata}</font></td></tr>
	               	
                     <tr>
	                         
	                        <td class="label">${uiLabelMap.newKhataNo}</td>
	                        <td><input name="newKhataNo"  type="text" maxlength="7" value="CARF1000"></td>
                    </tr>
                   
                    <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="Update"   type="button" value="${uiLabelMap.CommonEdit}" onClick="javascript:editKhataChangeDetail(editKhataChange);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
        		</table>
 
	</div>

</form>


<script type="text/javascript" language="javascript">

function editKhataChangeDetail(editKhataChange)
   {
		      var form=document['editKhataChange'];
		      
		      var sure = confirm("Are you sure, you want to Edit the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>disconnectionApplyDetail</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
</script>