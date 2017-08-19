<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created   Modified By  Date Modified-->
<#--- Siddhi    	    03 Aug 2017      Ganesh       17/08/2017-->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editCommunityMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editCommunity}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	
	
	<#if communityTypeList?has_content>
 				 <#list communityTypeList as communityTypeList>
		
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			         <tr>
						   <td class="label" >${uiLabelMap.communityname} <font color="red">*</font></td>
					       <td><input type="text" maxlength="20" name="communityname" onchange="javascript:trimFunction(this)" value="${communityTypeList.communityname?if_exists}" style="width:140px">
					      <#-- <td class="label" >${uiLabelMap.createdate}</td>
                           <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>-->
					 <tr>
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="remark" onchange="javascript:trimFunction(this)" value="${communityTypeList.remark?if_exists}" style="width:140px" maxlength ="150">${communityTypeList.remark?if_exists}</textarea></td>
                     </tr>
        	
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editCommunityTypeMaster('editCommunityMaster','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
		  <input type="hidden" name="communityId" value="${communityTypeList.communityId?if_exists}" style="width:140px"/>
 	      <input type="hidden" name="status" value="" style="width:140px"/>
			</#list>
		    </#if>
	
		</table>
		</div>
	</div>
</form>
	
<#-----------------------Java Script for Community Master------------->	

 <script language="JavaScript" type="text/javascript" />


    
    function editCommunityTypeMaster(formname,stat)
	{
	var form =document[formname];
	var communityname = form.communityname.value;
   //var createdate = form.createdate.value;
   
    if(notEmptyField(communityname,"Community Name should not be empty.")) 
    {
    var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 
    
	     	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editCommunityTypeMaster</@ofbizUrl>";
	    form.submit();
	
	}}}
	
 </script>
		

