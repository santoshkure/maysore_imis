<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editConnectionMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017     -->
<#--- Modify by   Anubha Saini on 18/09/2017 -->
<#-- #####################################################################################################-->

<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
 <form method="post" name="editConnectionMaster" class="basic-form">

	  <div class="row">
              <div class="alert alert-info">
                    <ul>
                             <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
                              <li class="h3">${uiLabelMap.editConnectionMaster}</li>
                    </ul>
       </div>
	       <div class="screenlet-body">
		        <table class="basic-table" cellspacing="0">
		        <#if connectionTypeList?has_content>
 				 <#list connectionTypeList as connectionTypeList>
		            <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		          
		           <tr>
		              
			          <td class="label">${uiLabelMap.connectionType}<font color="red" >*</font> </td>
		               <td><input type="text" name="connectionType" onchange="javascript:trimFunction(this)" value="${connectionTypeList.connectionType?if_exists}" style="width:140px"  />${uiLabelMap.inEnglish}<br> 
               				<input type="text" style="width:150px" maxlength="50" name="connectionTypeKan" id="connectionTypeKan" value="${connectionTypeList.connectionTypeKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br>
						</td>
			           <td class="label">${uiLabelMap.description}</td>
			           <td><input type="text" style="width:140px"  name="description" maxlength ="30" value="${connectionTypeList.description?if_exists}"/></td>    	
			          
                </tr>
                <tr> 
                      <td class="label">${uiLabelMap.remark}</td>
			          <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px">${connectionTypeList.remark?if_exists}</textarea></td>
               </tr>
               <input type="Hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
            	<tr>
				    <td colspan="4">
					   <center><div id="submit" align="center">
						<input name="update" value="${uiLabelMap.CommonUpdate}" type="button" onClick="validateTypeMaster('editConnectionMaster','edit')">
					     <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
					</div>
				</center>
		      </td>
		      </tr>
		        
		          <input type="hidden" name="ConnectionTypeId" value="${connectionTypeList.ConnectionTypeId?if_exists}" style="width:140px"  />
		          <input type="hidden" name="activestatus" value="${connectionTypeList.status?if_exists}" style="width:140px"  />
		          
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
	var connectionType = form.connectionType.value;
	var connectionTypeKan = form.connectionTypeKan.value;
   //var createdate = form.createdate.value;
   
  if(notEmptyField(connectionType,"Connection Type should not be empty.")) 
 {
  if(notEmptyField(connectionTypeKan,"Connection Type in Kannad should not be empty.")) 
 {
  if(alphabhetValidation1(connectionType,"Connection Type ${uiLabelMap.alphabetical}"))
 {
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>updateConnectionType</@ofbizUrl>";
	    form.submit();
	
	}}}}}
</script>              