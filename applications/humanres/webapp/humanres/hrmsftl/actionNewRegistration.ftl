<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionNewRegistration.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->

<#setting locale="en">
    
    <form method="post" name="actionNewRegistration" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<div class="h3" align="center"><b>Action Registration Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.PersonalDetail}</font></td>
                </tr>
                
                <tr>
                    <td class="label">${uiLabelMap.tital}</td>
                    <td>Mr.</td>
                  </tr>
                  
                  <tr>
                      	<td class="label">${uiLabelMap.firstName}</td>
                        <td> Ravi</td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>  Kumar</td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td> Rai</td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td> 29/04/1994</td>
                        
                        <td class="label">${uiLabelMap.gender}</td>
                        <td> Male</td>
                        
   						<td class="label">${uiLabelMap.maritalStatus}</td>
   						<td>Single</td>
   					</tr>
            
                    <tr>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>RajKumar Rai</td>
                        
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>Ramkali Rai</td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>1234 4567 7891 4567</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td> OBC </td>
                        <td class="label">${uiLabelMap.cast}</td>
                        <td> Kalar</td>
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>Indian</td>
                    </tr>
                    
                    <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.CurrentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address}</td>
                        <td> Sector 3, Lane No. 1 Sahu Colony Pune</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td> 45/ 12</td>
                        <td class="label">${uiLabelMap.wardNo}</td>
                        <td> 15 </td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td> Aajad Ward</td>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>Ekshubhit Bungalow</td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>Bhainsdehi</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.city}</td>
                        <td>Mysore</td>
                        <td class="label">${uiLabelMap.state}</td>
                        <td>Karnataka</td>
                        <td class="label">${uiLabelMap.country}</td>
                        <td>India</td>
                    </tr>
                    
                        <tr>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>8978789885</td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>7878978789</td>
                        <td class="label">${uiLabelMap.eMail}</td>
                        <td>example@gmail.com</td>
                    </tr>
                   
                    <tr>
                    	<td colspan="6">
                    	<center>
                    	<input name="Approve"   type="submit" value="Approve""/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</td>
                    </tr>
                    
            </tbody>
        </table>
    </div>
</form>