<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: castMaster.ftl----->
<#--- Author             	Date Created   Modified By  Date Modified--->
<#--- Siddhi Rajput      	31/07/2017	    Ganesh        17/08/2017--->
<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en_US">
<#---added by nikhil for language change to kannada --->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<#-- --end -->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
<form method="post" class="basic-form" name="castemaster" action="">
<div class="row">	
 <div class="alert alert-info">
   <ul>
	 <div align="center" style="font-size:12px"><b>${uiLabelMap.castemaster}</b></div>
  </ul>
 </div>
 	<div class="screenlet-body">
 	 <table class="basic-table" cellspacing="0">
 				
		<tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
 		<tr>
		   <td class="label" >${uiLabelMap.castename} <font color="red">*</font></td>
		   <td><input type="text" name="castename" onchange="javascript:trimFunction(this)" id="castename" style="width:140px" maxlength ="20" onchange="javascript:checkCasteName();"/>${uiLabelMap.inEnglish}<br>
		       <input type="text" style="width:140px" maxlength="20" name="castenameKan" id="casteMasterKan" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);"/>${uiLabelMap.inKannada}<br>
		  <#-- <td class="label" >${uiLabelMap.createdate}</td>
		   <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>-->
	  
		
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td><textarea name="remark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150"></textarea></td>
	    </tr>
	   
		<tr>
			<td colspan="4"><center>
			<div id ="saveBtn">
				<input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('castemaster')">
				<input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
			</div>
			</td>
						
		</tr>
		 </table>
  </div>
</div>
</form>

<#------------------------------------Caste Master List------------------------>

<form method="post" name="Listcastemaster" action="" class="basic-form">
	
      <div class="row">
      <div class="alert alert-info">
        <ul>
	       <div align="center" style="font-size:12px"><b>${uiLabelMap.castemasterlist}</b></div>
        </ul>
      </div>
      <div class="screenlet-body">
      <table class="basic-table hover-bar" rowspacing="5">
      <thead>
        <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}</center></td>
	         <td><center>${uiLabelMap.castename}</center></td>
	         <td><center>${uiLabelMap.castename} ${uiLabelMap.inKannada}</center></td>
	         <td><center>${uiLabelMap.createdate}<center></td>
	         <td><center>${uiLabelMap.remark}<center></td>
	         
            <td><center>${uiLabelMap.Status}</center></td> 
             <td><center>${uiLabelMap.edit}<center></td>     
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>   
        </tr>
	    </thead> 
	    
	      <#if casteTypeList?has_content>
          <#assign count= 1>
          <#list casteTypeList as casteTypeList>
	      
		     <tr>
	            <td><center>${count}</center></td>
	            <td><center>${casteTypeList.castename?if_exists}</center></td>
	            <td><center>${casteTypeList.castenameKan?if_exists}</center></td>
	            <td><center><#if casteTypeList.createdate?has_content>${casteTypeList.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
	            <td><center>${casteTypeList.remark?if_exists}</center></td>
	            
	            <td><center>
                <#assign std = '${casteTypeList.status?if_exists}'>
                <#if std =="A">
                Active
                <#else>
                Deactive
                </#if>
                </center></td>
                          
	            <td><center>
	            <#if std =="A">
	            <a title="Edit" href='<@ofbizUrl>editcastemaster?casteId=${casteTypeList.casteId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
	             <#else>
                <a class="buttontextdisabled"  disabled>${uiLabelMap.edit}</a>
                </#if>
                </center></td>
	            
	            
	            <td><center>                   
                <#if std =="D">
                <a title="Remove" href="javascript:editcastemaster('Listcastemaster','delete','${casteTypeList.casteId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                <#else>
                <a class="buttontextdisabled"  disabled>${uiLabelMap.Remove}</a>
                </#if>
                </center></td>
                          
                <td><center>
                <#if std =="A">
                <a title="Deactive" href="javascript:editcastemaster('Listcastemaster','status','${casteTypeList.casteId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                <#else>
                <a title="Active" href="javascript:editcastemaster('Listcastemaster','status','${casteTypeList.casteId?if_exists}','A');" class="buttontext">Active</a>
                </#if>
                </center></td>
	            
            </tr>
            <#assign count=count+ 1>
            </#list>
            </#if>
            
                  <input type="hidden" name="casteId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />
        </table>    
       </div>
      </div>
	 </form> 
	 
<#-----------------------Java Script for Caste Master------------->	 

<script language="JavaScript" type="text/javascript" />

function validateParameters(formName)
{
  var form=document[formName];
  var castename = form.castename.value;
 
  if(notEmptyField(castename,"Caste Name should not be empty.")) 
     {
  var r=confirm("Are you sure, you want to save the Form ?")
  if (r==true)
     { 
	  form.action = "<@ofbizUrl>saveCasteMaster</@ofbizUrl>";
	  form.submit();
	  disSubmit('saveBtn');
     }
     }
}

function editcastemaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.casteId.value=id;
	     form.activestatus.value = activestd;
	      if(stat == "delete")
	      {
	      var r=confirm("Are you sure, you want to Remove the Form ?")
	      if (r==true)
	      {
	      
          form.action="<@ofbizUrl>editCasteTypeMaster</@ofbizUrl>";
	      form.submit();
	      }
	    
	      }else if(stat == "status")
	      {
          var r=confirm("Are you sure, you want to Active/Deactive the Form ?")
          if (r==true)
          { 
          form.action="<@ofbizUrl>editCasteTypeMaster</@ofbizUrl>";
	      form.submit();
	      }
	      }
     }	

 <#--function editcastemaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.casteId.value=id;
	     form.activestatus.value = activestd;

        form.action="<@ofbizUrl>editCasteTypeMaster</@ofbizUrl>";
	    form.submit();
	}-->
	
 <#--function editCasteMaster(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editcastemaster</@ofbizUrl>";
	    form.submit();
	}-->
<#-- function checkCasteName()
   { 
     document.getElementById('castename').setAttribute('style','width:140px;color:black;');
     
       var url = '<@ofbizUrl>ajaxCheckCasteName</@ofbizUrl>';
      
       var nameofcaste = document.castemaster.nameofcaste.value;
          
          var parameter= "&nameofcaste="+nameofcaste;
          var ajaxRequest = new Ajax.Request(
                    url,
                    {
                        method: 'get',
                        parameters: parameter,
                        asynchronous: true,                   
                        onComplete: setCasteName                               
                    });
   
    }

  function setCasteName(xmlHttpRequest, responseHeader)
   {   
   		
   		var jsonvalue = xmlHttpRequest.responseJSON;
   		var msg = jsonvalue[0];
   		if(msg == "")
   		{
   		return true;
   		}
   		else
   		{
        alert(msg);
   		document.castemaster.nameofcaste.value="";
   	    return true;
   			
   		}   
    }--> 
</script>