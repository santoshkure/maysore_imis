<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createForAgreementLetter.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#-- 1.0			Anubha Saini						10/08/2017    
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for create Application for water supply.-->


<#setting locale="en">
   
    <form method="post" name="createAppForAgreementLetter" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.createAppForAgreementLetter}</b></div>
		    	
			</ul>
	     
		</div>
		<div class="screenlet-body">
		
<pre>
	 ${uiLabelMap.statement}
	        ${uiLabelMap.shreeSheemati} <b>Name of Customer</b> ${uiLabelMap.lineOneForAgreement}
		
		  
</pre>

            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                
                <tr>
							<td class="label"><center>${uiLabelMap.agreementLetter}</center></td>
							<td>
		     				<input type="file" name="fileLoc" onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(fileLoc);" value="Reset"/>
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 					</td>
                    </tr>
                    <tr>
                    	<td colspan="4"><center>
                    		<div id ="saveBtn">
                    		<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:createAgreementLetter();"/>
                    		<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     		</center>
                     	</td>
                    </tr>
               </tbody>
          </table>
     </div>
 </form>

  <script type="text/javascript" language="javascript">

  function createAgreementLetter()
   {
		   var form=document['createAppForAgreementLetter'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                        {
                        form.action = "<@ofbizUrl>searchConnectionApply</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
</script>