<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: applyforbillcorrection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   02/08/2017
<#-- 1.1			Pankaj Trivedi						05/08/2017    		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the Complain Registration.-->

<#setting locale="en">
   
    <form method="post" name="complainregistration" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		     <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.registerComplaint}</b></div> 
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
                        <td class="label" >${uiLabelMap.complaintDate}</td>
                        <td><input type="text" name="ComplaintDate" value="${nowTimestamp?string("dd/MM/yyyy")}"  readonly /></td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        <input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        <input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        <input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        </td>
					  </tr>
					  <tr>
					    <td class="label">${uiLabelMap.complaintDescription}</td>
                        <td colspan="1"><textarea name="ComplaintDescription" value="" maxlength="3500" ></textarea></td>
                        <td class="label">${uiLabelMap.complaintType}</td>
                        <td colspan="5">
	                        <select name="complaint">
		                   		<option value="">Select</option>
		                  		<option value="meter">Meter</option>
		                   		<option value="bill">Bill</option>
		                   		<option value="pipe damage">Pipe Damage</option>
		                   		<option value="other">Other</option>
	                 		</select>
             			</td>
					  </tr>
					  <tr>
							<td class="label">${uiLabelMap.serviceAddress}</td>
    	                    <td colspan="1"><textarea name="ComplaintDescription" value="" maxlength="3500" ></textarea></td>
                      </tr>
                      <tr>
                    	 <td colspan="4"><center>
                    	 <div id ="saveBtn">
                    	 <input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveBillDetail('BillCorrection');"/>
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
		   var form=document['formname'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                    if( sure == true )
                    {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		            } 
    }
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
