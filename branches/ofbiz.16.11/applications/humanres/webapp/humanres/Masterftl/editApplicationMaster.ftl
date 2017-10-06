<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editApplicationMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017     -->
<#--- Modify by   Anubha Saini on 19/09/2017 -->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
 <form method="post" name="editApplicationMaster" class="basic-form">

	  <div class="row">
              <div class="alert alert-info">
                    <ul>
                             <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
                              <li class="h3">${uiLabelMap.editApplicationMaster}</li>
                    </ul>
       </div>
	         <div class="screenlet-body">
		           <table class="basic-table" cellspacing="0">
		           
		           <#if applicationMasterListed?has_content>
 				 <#list applicationMasterListed as applicationMasterListed>
 				 
		              <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		              
		              
		               
		            <tr>
		                <td class="label">${uiLabelMap.applicationType}<font color="red" >*</font> </td>
			           <td><input type="text" style="width:150px" maxlength="50" name="applicationType" id="applicationType" value="${applicationMasterListed.applicationType?if_exists}" onchange="javascript:validateName(this);"/>(${uiLabelMap.inEnglish})<br> 
               			<#-- Kannad language conversation -->
               			<input type="text" style="width:150px" maxlength="50" name="ApplicationTypeKan" id="ApplicationTypeKan" value="${applicationMasterListed.ApplicationTypeKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br>
			       
			             <td class="label">${uiLabelMap.description}</td>
			             <td><input type="text" style="width:140px"  name="description" maxlength ="30" value="${applicationMasterListed.description?if_exists}"/></td>    	
			         
                </tr>
                <tr> 
                 		 <td class="label">${uiLabelMap.remark}</td>
			            <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px">${applicationMasterListed.remark?if_exists}</textarea></td>
                 </tr>
                <input type="Hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
					<tr>
				     <td colspan="4">
					    <center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="validateTypeMaster('editApplicationMaster','edit')"/>
					    <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
					</div>
				</center>
		      </td>
		    </tr>
		     <input type="hidden" name="applicationTypeeId" value="${applicationMasterListed.applicationTypeeId?if_exists}" style="width:140px"  />
		      <input type="hidden" name="activestatus" value="${applicationMasterListed.status?if_exists}" style="width:140px"  />
						
            	
            	 </#list>
				</#if>
			<input type="hidden" name="status" value="" style="width:140px"/>
		</table>
	</div>
  </div>
</form>
 <script language="JavaScript" type="text/javascript" />
 
       function validateTypeMaster(formname,stat)
	{
	var form =document[formname];
	var applicationType = form.applicationType.value;
	var ApplicationTypeKan = form.ApplicationTypeKan.value;
   //var createdate = form.createdate.value;
   
     if(notEmptyField(applicationType,"Application Type should not be empty.")) 
		     {
		     if(notEmptyField(ApplicationTypeKan,"Application Type in Kannad should not be empty.")) 
		     {
		     if(alphabhetValidation1(applicationType,"Application Type ${uiLabelMap.alphabetical}"))
             {
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>updateApplicationMaster</@ofbizUrl>";
	    form.submit();
	
	}}}}}
</script>      
