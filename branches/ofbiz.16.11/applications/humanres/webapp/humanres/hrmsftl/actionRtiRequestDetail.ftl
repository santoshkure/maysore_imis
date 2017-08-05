<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionRtiRequestDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to action Rti Request Detail -->

<#setting locale="en">
    
    <form method="post" name="actionRtiRequestDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.rtiReplyDetail}</td></b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
             
                	<tr>
                     <td class="label">${uiLabelMap.rtiRefrenceNo}</td>
                     <td>RTI10001</td>
                     <td class="label">${uiLabelMap.applicantName}</td>
					 <td>Ravi Kumar Rai</td>
                   </tr>
                  
                   <tr>
					 <td class='label'>${uiLabelMap.Address}</td>
                     <td>Applicant address</td>
                     <td class='label'>${uiLabelMap.CommonEmail}</td>
                     <td>Example@gmail.com</td>
                    
                    </tr>
                     
                    <tr>
                      <td class='label'>${uiLabelMap.contact}</td>
                      <td>Meter Existing</td>
                      <td class='label'>${uiLabelMap.applyDate}</td>
                      <td>02/08/2017</td>
                    </tr>
                     
                    <tr>
                     
                       <td class='label'>${uiLabelMap.neededInformation}</td>
                       <td>Needed Information Detail</td>
                       <td class='label'>${uiLabelMap.supportingDocument}</td>
                       <td>Supporting Document if any</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.feePaymentType}</td>
                    	<td>Online</td>
                    	
                     	<td class='label'>online Application payment Refrence id</td>
                    	<td>Mysore Office</td>
                     </tr>
                  
                  	<tr>
                     
                     	<td class='label'>Application paid amount</td>
                    	<td>1000</td>
                     	<td class='label'>Application payment status</td>
                    	<td>Paid</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.rtiStatus}</td>
                    	<td>status</td>
                     	<td class='label'>${uiLabelMap.bplCardNo}</td>
                    	<td>1234 4567 7894</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.uploadBplCard}</td>
                    	<td>Online.doc</td>
                     </tr>
             
					<tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.replyDetail}</font></td></tr>

					<tr>
                     
                     	<td class='label'>${uiLabelMap.replyInformation}</td>
                    	<td><textarea name="replyInformation" maxlength ="500"></textarea></td>
                     	<td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td>
                        <input type="file" name="assentialDoccument" id="ddd" type="text" maxlength="25" value="" >
                        </td>
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.actionDate}</td>
                    	<td>04/08/2017</td>
                     	<td class="label">${uiLabelMap.CommonRemark}</td>
                        <td><textarea name="CommonStatus" maxlength ="500"></textarea></td>
                     </tr>
                     
                  		<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="action"   type="button" value="${uiLabelMap.action}" onClick="javascript:actionRtiReply(actionRtiRequestDetail);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>

<script type="text/javascript" language="javascript">

function actionRtiReply(actionRtiRequestDetail)
   {
		      var form=document['actionRtiRequestDetail'];
		      
		      var sure = confirm("Are you sure, you want to Reply the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>