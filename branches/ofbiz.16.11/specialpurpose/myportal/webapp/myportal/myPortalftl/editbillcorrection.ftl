<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editbillcorrection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   02/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for Edit bill correction.-->


<#setting locale="en">
   
    <form method="post" name="BillCorrection" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.editBillCorrection}</b></div>
		    	
			</ul>
	     
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
	                	  <tr><td colspan="4"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                	</tr>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td><input type="text" value="" readonly /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.billId}</td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.billNo}</td>
                        <td><input type="text" value="" readonly /></td>
                     </tr>
                     <tr>
                        <td class="label" >${uiLabelMap.billCorrectionApplyDate}</td>
                        <td><input type="text" name="Bill Correction Apply Date" value="${nowTimestamp?string("dd/MM/yyyy")}"  readonly /></td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        <input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        <input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        <input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        </td>
					  </tr>
					  <tr>
					    <td class="label">${uiLabelMap.issueDetails}</td>
                        <td colspan="1"><textarea name="Issue Details" value="" maxlength="3500" ></textarea></td>
					  </tr>
                      <tr>
                    	 <td colspan="4"><center>
                    	 <div id ="saveBtn">
                    	 <input name="save"   type="button" value="Update" onClick="javascript:createBillDetail('BillCorrection');"/>
                    	 <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 </center>
                     	 </td>
                     </tr>
               </tbody>
          </table>
     </div>
 </form>

  <script type="text/javascript" language="javascript">

  function saveBillDetail(formname)
   {
		   var form=document['BillCorrection'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>searchbillcorrection</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    </script>
