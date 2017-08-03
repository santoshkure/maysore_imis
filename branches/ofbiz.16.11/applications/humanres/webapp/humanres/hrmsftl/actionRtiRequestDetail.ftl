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
  				<div class="h3" align="center"><b>Action Meter Change Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
             
                	<tr>
                     <td class="label">RTI refrence No</td>
                     <td>RTI10001</td>
                     <td class="label">Applicant Name</td>
					 <td>Ravi Kumar Rai</td>
                   </tr>
                  
                   <tr>
					 <td class='label'>Applicant address</td>
                     <td>Applicant address</td>
                     <td class='label'>Applicant email</td>
                     <td>Example@gmail.com</td>
                    
                    </tr>
                     
                    <tr>
                      <td class='label'>Applicant contact No.</td>
                      <td>Meter Existing</td>
                      <td class='label'>Application Date</td>
                      <td>02/08/2017</td>
                    </tr>
                     
                    <tr>
                     
                       <td class='label'>Needed Information</td>
                       <td>Needed Information Detail</td>
                       <td class='label'>Supporting Document if any</td>
                       <td>Supporting Document if any</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>fee payment type</td>
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
                     	<td class='label'>RTI status</td>
                    	<td>status</td>
                     	<td class='label'>BPL card No.</td>
                    	<td>1234 4567 7894</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>upload copy of BPL card</td>
                    	<td>Online.doc</td>
                     </tr>
                  
                  		<tr>
                    	<td colspan="6">
                    	<center>
                    	<input name="Action"   type="submit" value="Reply"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</tr>
                     	
         		</tbody>
       		</table>	
    </div>
</form>