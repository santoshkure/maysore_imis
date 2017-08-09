<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: forOfficeUseOnly.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#-- 1.1			Pankaj Trivedi	09/08/2017    	
<#-- #####################################################################################################-->
<#--This ftl is used to show the application only use for office.-->

<#setting locale="en">
   
    <form method="post" name="officeUse" action="" class="basic-form">
    	<div class="row">
	    	<div class="alert alert-info">
		    	<ul>
		        	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    		<div class="h3" align="center"><b>${uiLabelMap.forOfficeUseOnly}</b></div>
				</ul>
			</div>
			<div class="screenlet-body">
            	<table cellspacing="0" class="basic-table table-responsive">
            	    <tbody>
                	<br>
                		<tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.waterInspector}</font></td></tr>
                		<tr><td>1.	Water Inspector / Engineer Report.</td></tr>
	            	    <tr><td>I inspected the above applicant house/site. There is no water connection by Vanivilas Water
								Supply office. I verified site and all documents and recommended the application for Legal connection.</td></tr>
                		<tr><td><b>${uiLabelMap.Remark}</b></td></tr>
                		<tr>
                    		<td><textarea name="remark" style="width:240px" maxlength ="500"></textarea></td>
                		</tr>
                		<tr>
                		 	<td colspan="4">
                		 		<center>
                    	 			<div id ="saveBtn">
                    	 				<input name="approve"   type="button" value="${uiLabelMap.approve}" onClick="javascript:approve('officeUse');"/>
                    	 				<input name="reject"   type="button" value="${uiLabelMap.reject}" onClick="javascript:reject('officeUse');"/>
                    	 				<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 			</div>
  	                   	 		</center>
                     	 	</td>
                		</tr>
                	</tbody>
          		</table>
     		</div>
                	
           	<div class="screenlet-body">
            	<table cellspacing="0" class="basic-table table-responsive">
                	<tbody>
                	<br>
                		<tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.measuringDivision}</font></td></tr>
	                	<tr><td>2. Applicants are remitted amount Rs. <b>5000</b> Receipt No:- <b>R21</b>			
	                		To this office, verified all documents of applicants and recommended for Legal water connection order.</td></tr>
						<tr><td><b>${uiLabelMap.Remark}</b></td></tr>
                		<tr>
                    		<td><textarea name="remark1" style="width:240px" maxlength ="500"></textarea></td>
                		</tr>
                	
                		<tr>
                		 	<td colspan="4">
                		 		<center>
                    	 			<div id ="saveBtn">
                    	 				<input name="approve1"   type="button" value="${uiLabelMap.approve}" onClick="javascript:approve1('officeUse');"/>
                    	 				<input name="reject1"   type="button" value="${uiLabelMap.reject}" onClick="javascript:reject1('officeUse');"/>
                    	 				<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 			</div>
                     	 		</center>
                     	 	</td>
                		</tr>
                	</tbody>
          		</table>
     		</div>
            <div class="screenlet-body">
            	<table cellspacing="0" class="basic-table table-responsive">
                	<tbody>
                	<br>
                		<tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.aEE}</font></td></tr>
                		<tr><td>3.Remarks from Assistant Executive Engineer, East / West Sub-Division.</td></tr>
						<tr><td><b>${uiLabelMap.Remark}</b></td></tr>
                		<tr>
                    		<td><textarea name="remark2" style="width:240px" maxlength ="500"></textarea></td>
                		</tr>
                		<tr>
                		 	<td colspan="4">
                		 		<center>
                    	 			<div id ="saveBtn">
                    	 				<input name="approve2"   type="button" value="${uiLabelMap.approve}" onClick="javascript:approve2('officeUse');"/>
                     	 				<input name="reject2"   type="button" value="${uiLabelMap.reject}" onClick="javascript:reject2('officeUse');"/>
                   	 					<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 			</div>
                     	 		</center>
                     	 	</td>
                		</tr>
               		</tbody>
          		</table>
     		</div>
 		</div>
 	</form>

  <script type="text/javascript" language="javascript">

  function approve(officeUse)
   {
		   var form=document['officeUse'];
		      
		      var sure = confirm("Are you sure, you want to Approve the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    function approve1(officeUse)
   {
		   var form=document['officeUse'];
		      
		      var sure = confirm("Are you sure, you want to Approve the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    function approve2(officeUse)
   {
		   var form=document['officeUse'];
		      
		      var sure = confirm("Are you sure, you want to Approve the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    function reject(officeUse)
   {
		   var form=document['officeUse'];
		      
		      var sure = confirm("Are you sure, you want to Reject the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    function reject1(officeUse)
   {
		   var form=document['officeUse'];
		      
		      var sure = confirm("Are you sure, you want to Reject the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    function reject2(officeUse)
   {
		   var form=document['officeUse'];
		      
		      var sure = confirm("Are you sure, you want to Reject the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    </script>
