<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: applyforbillcorrection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   02/08/2017
<#-- 1.1			Pankaj Trivedi						05/08/2017    	
<#-- 1.1			Pankaj Trivedi						30/10/2017    		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the Complain Registration.-->

<form method="post" name="editCompDetails" action="" class="basic-form">
    	<div class="row">
	    	<div class="alert alert-info">
		    	<ul>
		     		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    		<div class="h3" align="center"><b>${uiLabelMap.editRegisterComplaint}</b></div> 
				</ul>
			</div>
			<#if complRegDetailsList?exists>     
    	    	<#if complRegDetailsList?has_content>
        	    	<#list complRegDetailsList as complRegDetailsList>  
						<div class="screenlet-body">
            				<table cellspacing="0" class="basic-table table-responsive">
                				<tbody>
                					<tr>
	                	  				<tr><td colspan="4"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                					</tr>
                   					<tr>
										<td class="label">${uiLabelMap.customerNo}</td>
										<td><input type="text" name="custNo" id="custNo" value="${complRegDetailsList.custNo?if_exists}" readonly /></td>
											<input type="hidden" name="sequenceId" id="sequenceId" value="${complRegDetailsList.sequenceId?if_exists}" readonly />
											<input type="hidden" name="complaintId" id="complaintId" value="${complRegDetailsList.complaintId?if_exists}" readonly />
										<td class="label">${uiLabelMap.connectionNo}</td>
										<td><input type="text" name="conNo" id="conNo" value="${complRegDetailsList.conNo?if_exists}" /></td>
									</tr>
									<tr>
										<td class="label" >${uiLabelMap.complaintDate}</td>
										<td><input type="text" name="complDate" id="complDate" value="${complRegDetailsList.complDate?if_exists?string('dd/MM/yyyy')}"  readonly /></td>
										<td class="label">${uiLabelMap.essentialDocument}</td>
										<td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
											<input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
											<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
											<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        				</td>
									</tr>
									<tr>
										<td class="label">${uiLabelMap.complaintDescription}</td>
										<td colspan="1"><textarea name="complDescription" id="complDescription" value="" maxlength="3500" >${complRegDetailsList.complDescription?if_exists}</textarea></td>
										<td class="label">${uiLabelMap.complaintType}</td>
										<td colspan="5">
											<#assign TypeofComplaint = "${complRegDetailsList.complaintType?if_exists}" />
	                        				<select name="complaintType" id="complaintType">
	                        					<#if TypeofComplaint=="meter">
		                   							<option value="">Select</option>
		                  							<option value="meter" selected="true">Meter</option>
		                   							<option value="bill">Bill</option>
		                   							<option value="pipedamage">Pipe Damage</option>
		                   							<option value="other">Other</option>
		                   						<#elseif TypeofComplaint == "bill">
		                   							<option value="">Select</option>
		                  							<option value="meter">Meter</option>
		                   							<option value="bill" selected="true">Bill</option>
		                   							<option value="pipedamage">Pipe Damage</option>
		                   							<option value="other">Other</option>
		                   						<#elseif TypeofComplaint == "pipedamage">
		                   							<option value="">Select</option>
		                  							<option value="meter">Meter</option>
		                   							<option value="bill">Bill</option>
		                   							<option value="pipedamage" selected="true">Pipe Damage</option>
		                   							<option value="other">Other</option>
		                   						<#else>
		                   							<option value="">Select</option>
		                  							<option value="meter">Meter</option>
		                   							<option value="bill">Bill</option>
		                   							<option value="pipedamage">Pipe Damage</option>
		                   							<option value="other" selected="true">Other</option>
		                   						</#if>
	                 						</select>
										</td>
									</tr>
									<tr>
										<td class="label">${uiLabelMap.serviceAddress}</td>
										<td colspan="1"><textarea name="serviceAdd" id="serviceAdd" value="" maxlength="3500" >${complRegDetailsList.serviceAdd?if_exists}</textarea></td>
									</tr>
                      				<tr>
                    					<td colspan="4">
                    						<center>
                    	 						<div id ="saveBtn">
                    	 							<input name="save"   type="button" value="Update" onClick="javascript:updateComplaintDetails();"/>
                    	 							<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
                     	 						</div>
                     	 					</center>
                     	 				</td>
                     				</tr>
               					</tbody>
          					</table>
     					</div>
     				</#list>
         		</#if>
      		</#if>
     	</div>
</form>

<script type="text/javascript" language="javascript">

function updateComplaintDetails()
	{
		var form=document['editCompDetails'];
		var sure = confirm("Are you sure, you want to Update the Form ?");
		if( sure == true )
        	{
            	form.action = "<@ofbizUrl>editComplaintDetails</@ofbizUrl>";
			    form.submit();
		        disSubmit('disBttn');    
		    }
	}
</script>
