<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editGrievanceCusPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Modified by --->
<#-- 1.0			Anubha Saini	  19/08/2017         Siddhi
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


   		 <form method="post" name="editGrievanceCustomer" action="" class="basic-form">
   		
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.editGrievance}</b></div>
	    		</ul>
  				</div>
  				
  				<table cellspacing="0" class="basic-table table-responsive">
  			<#if grievanceDetailsList?exists>     
             <#if grievanceDetailsList?has_content>
               <#list grievanceDetailsList as grievanceDetailsList>   
  							
        			<tr>
        			<td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceReceipt}</b></font></td>
	              		
                	</tr>
                	 <input type="hidden" name="sequenceId" value="${grievanceDetailsList.sequenceId?if_exists}">
        			<tr>
                      	<td class="label">${uiLabelMap.receiptNo}</td>
                        <td colspan="12"><input name="receiptNo"  type="text" maxlength="10" value="${grievanceDetailsList.receiptNo?if_exists}" readonly></td>
                       
                 </tr>
                 <tr><td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceDetail}</b></font></td></tr>
                 <tr>
                 		<td class="label">${uiLabelMap.grievanceDate}</td>
   						<td colspan="12">
   						   <input type="text" name="grievanceDate" autocomplete="off" value="<#if grievanceDetailsList.grievanceDate?has_content>${grievanceDetailsList.grievanceDate?if_exists?string('dd/MM/yyyy')}</#if>" id="grievanceDate" style="width:140px;" maxlength="10" style="width:140px;" onchange=""/>
        			       <a href="javascript:call_cal(document.editGrievanceCustomer.grievanceDate);">
   						</td>
						
				</tr>
					<tr>	
						<td class="label" >${uiLabelMap.grievancePetitionDate}</td>
   						<td>
						<input type="text" name="grievancePetitionDate" autocomplete="off" value="<#if grievanceDetailsList.grievancePetitionDate?has_content>${grievanceDetailsList.grievancePetitionDate?if_exists?string('dd/MM/yyyy')}</#if>" id="grievancePetitionDate" style="width:140px;" maxlength="10" style="width:140px;" onchange=""/>
        			    <a href="javascript:call_cal(document.editGrievanceCustomer.grievancePetitionDate);">
       				    <img src="/images/cal.gif" width="16" height="16" border="0" alt="View Calendar" title="View Calendar"/></a></td>
                  
                    	<td class="label" >${uiLabelMap.typeOfGrievance}</td>
 						<td colspan="4">
 						<#assign TypeofGrivance = "${grievanceDetailsList.typeOfGrievance?if_exists}" />
                    	<select name="typeOfGrievance" id="typeOfGrievance">
                    	<#if TypeofGrivance=="Internal">
		                <option value=''>Select</option>
                        <option value="Internal" selected="true">Internal</option> 
                        <option value="External">External</option>
                        <#elseif TypeofGrivance == "External">
                   		<option value=''>Select</option>
                   		<option value="Internal">Internal</option>
                   		<option value="External" selected="true">External</option>
                   		<#else>	
                   		<option value=''>Select</option>
                   		<option value="Internal">Internal</option>
                   		<option value="External">External</option>
                   		</#if>
                 		</select>
             			</td> 
             			
                  	</tr>  
                  
                  	 <tr>
                    		<td class="label">${uiLabelMap.name}</td>
                         	<td><input name="grevNameEn"  type="text" maxlength="50" value="${grievanceDetailsList.grievanceNameEN?if_exists}">${uiLabelMap.InEnglish}
                         	<br><input name="grevNameKn"  type="text" maxlength="50" value="${grievanceDetailsList.grievanceNameKN?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);">${uiLabelMap.Inkannada}</br></td>
                       		<td class="label">${uiLabelMap.OrderAddress}</td>
                        	<td colspan="4"><textarea name="grevAddEn"  maxlength="300" style="width:400px">${grievanceDetailsList.grievanceAddEn?if_exists}</textarea>${uiLabelMap.InEnglish}
                        	<br><textarea name="grevAddKn" maxlength="300" style="width:400px" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);">${grievanceDetailsList.grievanceAddKn?if_exists} </textarea>${uiLabelMap.Inkannada}</br></td> 
                      </tr>  	
                     <tr>
                    		<td class="label">${uiLabelMap.mobileNo}</td>
                        	<td>
                        	<input name="mobileNo" type="text" maxlength="25" value="${grievanceDetailsList.mobileNo?if_exists}" placeholder="${uiLabelMap.yourMobile}">
                        	</td>
                        	<td class="label">${uiLabelMap.CommonEmail}</td>
                        	<td colspan="4">
                        	<input name="eMail" type="text" maxlength="40" value="${grievanceDetailsList.eMail?if_exists}" placeholder="${uiLabelMap.yourEMail}">
                        	</td>
                    </tr>
                    <tr>
                    		<td class="label">${uiLabelMap.grievanceDetail}</td>
                       	 	<td colspan="1"><textarea name="grievanceDetailEn"  maxlength="500" >${grievanceDetailsList.grievanceDetailEn?if_exists}</textarea>${uiLabelMap.InEnglish}
                       	 	<br><textarea name="grievanceDetailKn"  maxlength="500" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);">${grievanceDetailsList.grievanceDetailKn?if_exists}</textarea>${uiLabelMap.Inkannada}</br></td>
                    		<td class="label">${uiLabelMap.assentialDocument}</td>
				        	<td colspan="4"><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        	<input type="button" onclick="javascript:resetVal(document.editGrievanceCustomer.fileLoc);" value="Reset"/>
                        	<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        	<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        	</td>
                    </tr>
                    
                    <tr>
                    	<td colspan="12">
                    	<div id="saveBtn"><center>
                    	<input name="Update" type="button" value="${uiLabelMap.update}" onClick="javascript:updateGrievanceDetails();"/>
                    	 <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     	</div></center>
                     	</td>
                    </tr>
        		</table>
           </#list>
         </#if>
      </#if>
	</div>
 
</form>

    <script type="text/javascript" language="javascript">
 
function updateGrievanceDetails()
   {
	var form=document['editGrievanceCustomer'];
    var sure = confirm("Are you sure, you want to Update the Form ?");
                     if( sure == true )
                        {
                        form.action = "<@ofbizUrl>updateGrievanceCusPortal</@ofbizUrl>";
			            form.submit();
		                disSubmit('saveBtn');    
		                } 
    }
    
    
    </script>