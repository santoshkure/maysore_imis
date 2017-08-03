<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: castMaster.ftl----->
<#--- Author             	Date Created      --->
<#--- Siddhi Rajput      	31/07/2017	  --->
<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en_US">
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
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
		   <td><input type="text" name="nameofcaste" id="castename" style="width:140px" maxlength ="20" onchange="javascript:checkCasteName();"/></td>
		   <td class="label" >${uiLabelMap.createdate}</td>
		   <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>
	    </tr>
		<tr>
		   <td class="label" >${uiLabelMap.remark}</td>
		   <td><textarea name="remark" style="width:140px" maxlength ="150"></textarea></td>
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
	         <td><center>${uiLabelMap.createdate}<center></td>
             <td><center>${uiLabelMap.Status}</center></td> 
             <td><center>${uiLabelMap.edit}<center></td>     
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.activeDeactive}</center></td>   
        </tr>
	    </thead>   
		     <tr>
	            <td><center>1</center></td>
	            <td><center>General</center></td>
	            <td><center>01/08/2017</center></td>
	            <td><center>Active</center></td>
	            <td align="center"><center><a href="javascript:editCasteMaster('Listcastemaster');" class="buttontext">${uiLabelMap.edit}</a></center></td>
                <td align="center"><center><a class="buttontext">${uiLabelMap.Remove}</a></center></td>
                <td align="center"><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>
            </tr>
        </table>    
       </div>
       </div>
	 </form> 

<script language="JavaScript" type="text/javascript" />

function validateParameters(formName)
{
  var form=document[formName];
  var nameofcaste = form.nameofcaste.value;
    if(notEmptyField(nameofcaste,"Caste Name should not be empty.")) 
     {
	  form.action = "<@ofbizUrl>saveCasteMaster</@ofbizUrl>";
	  form.submit();
	  disSubmit('saveBtn');
     }
     
}
 function editCasteMaster(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editcastemaster</@ofbizUrl>";
	    form.submit();
	}
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