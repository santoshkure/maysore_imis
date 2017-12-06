<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createConnectionMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	23 August 2017     -->
<#--- Modify by   Anubha Saini on 18/09/2017 -->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>

<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">


 <form method="post" name="createConnectionMaster" class="basic-form">

	  <div class="row">
              <div class="alert alert-info">
                    <ul>
                          <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
                          <li class="h3">${uiLabelMap.createConnectionMaster}</li>
                    </ul>
       </div>
	       <div class="screenlet-body">
		        <table class="basic-table" cellspacing="0">
		              <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		           <tr>
		               <td class="label">${uiLabelMap.connectionType}<font color="red" >*</font> </td>
		                <td><input type="text" style="width:150px" maxlength="50" name="connectionType" id="connectionType" value="" onchange="javascript:validateName(this);"/>${uiLabelMap.inEnglish}<br> 
               			<#-- Kannad language conversation -->
               			<input type="text" style="width:150px" maxlength="50" name="connectionTypeKan" id="connectionTypeKan" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br>
            	 	</td>
			           <td class="label">${uiLabelMap.description}</td>
			           <td><input type="text" style="width:140px"  name="description" maxlength ="30" value=""/></td>    	
			           
                </tr>
                <tr>     
                      <td class="label">${uiLabelMap.remark}</td>
			          <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px"></textarea></td>
               </tr>
               		 <input type="Hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
               
            	 <tr>
                          <td colspan="4"><center>
                          <div id ="saveBtn">
                          <input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('createConnectionMaster')">
                          <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
                      </div>
                    </td>
                  </tr>
		</table>
	</div>
  </div>
</form>

<script type="text/javascript" language="javascript">
	
	  function validateParameters(formName)
      {
		   var form=document[formName];
		   var connectionType = form.connectionType.value;
		    var connectionTypeKan = form.connectionTypeKan.value;
		  // var description = form.description.value;
   		   
   		      var createdate = form.createdate.value;
 		  // alert(""+createdate);
		    if(notEmptyField(connectionType,"Connection Type should not be empty.")) 
		     {
		     if(notEmptyField(connectionTypeKan,"Connection Type in Kannad should not be empty.")) 
		     {
		     if(alphabhetValidation1(connectionType,"Connection Type ${uiLabelMap.alphabetical}"))
               {
		      
	            
		          var r=confirm("Are you sure, you want to Save the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>saveConnectionType</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		       
		         }		     }}}}
        
	

  
</script>