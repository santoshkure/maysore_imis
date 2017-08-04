<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerbillcorrection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   04/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for create Apply For Job.-->

<#setting locale="en">
   
    <form method="post" name="ApplyForJob" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.createApplyForJob}</b></div>
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
	                	  <tr><td colspan="4"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                	</tr>
                    <tr>
                        <td class="label">${uiLabelMap.consumerNo}<font color="red">*</font></td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.connectionNo}<font color="red">*</font></td>
                        <td><input type="text" value="" readonly /></td>
                   </tr>
                    <tr>
                        <td class="label" >${uiLabelMap.applicationDate}</td>
                        <td><input type="text" name="Application Date" value="${nowTimestamp?string("dd/MM/yyyy")}"  readonly /></td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        <input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        <input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        <input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        </td>
				   </tr>
				   <tr>
				        <td class="label" >${uiLabelMap.serviceDate}</td>
                        <td><input type="text" name="Service Date" value="" /></td>
				        <td class="label" >${uiLabelMap.serviceTime}</td>
                        <td><input type="text" name="Service Time" value="" /></td>
				   </tr>
				   <tr>
				        <td class="label" >${uiLabelMap.feeAmount}</td>
                        <td><input type="text" name="Fee Amount" value="" maxlength="10"/></td>
                        <td class="label">${uiLabelMap.typeOfJob}</td>
                            <td colspan="5">
	                        <select name="job">
		                   		<option value="">Select</option>
		                  		<option value="tanker">Tanker Request</option>
		                   		<option value="borwell">Borwell Request</option>
		                   		<option value="maintanance">Maintanance Request</option>
		                   		<option value="other">Other</option>
	                 	   </select></td>
				     </tr>
					 <tr>
					    <td class="label">${uiLabelMap.detailOfJob}</td>
                        <td colspan="1"><textarea name="detail Of Job" value="" maxlength="3000" ></textarea></td>
                        <td class="label">${uiLabelMap.serviceAddress}</td>
                        <td colspan="1"><textarea name="Service Address" value="" maxlength="500" ></textarea></td>
					 </tr>
                      <tr>
                    	 <td colspan="4"><center>
                    	 <div id ="saveBtn">
                    	 <input name="save"   type="button" value="Save" onClick="javascript:createapplyjob('ApplyForJob');"/>
                    	 <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 </center>
                     	 </td>
                     </tr>
               </tbody>
          </table>
     </div>
 </form>

  <script type="text/javascript" language="javascript">

  function createapplyjob(formname)
   {
		   var form=document['ApplyForJob'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>searchapplyforjob</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    </script>
