<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: communityMaster.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   31/07/2016		
<#-- #####################################################################################################-->
<#--This ftl is used to show the Marital Status Of a person -->

<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">
 
 <script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
 <form method="post" name="maritalStatusMaster" action="">
	      <div class="row">	
		     <div class="alert alert-info">
		        <ul>
			       <div align="center" style="font-size:12px"><b>${uiLabelMap.maritalstatusmaster}</b></div>
			   </ul>
		     </div>
 			               <div class="screenlet-body">
 				      <table class="basic-table" cellspacing="0">
 			     <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
 				    <tr>
						   <td class="label" >${uiLabelMap.statusname} <font color="red">*</font></td>
					       <td><input type="text" maxlength="11" name="maritalStatus" onchange="javascript:trimFunction(this)" value="" style="width:140px">
					       <td class="label" >${uiLabelMap.createdate}</td>
                           <td><input type="text" name="dateOfCreateMarital" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly />
                           <#--<@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>-->
				<tr>
                       <td class="label" >${uiLabelMap.remark}</td>
                       <td><textarea name="maritalRemark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150"></textarea></td>
                 </tr>
					 <tr>
                      <td colspan="4"><center>
                      <div id ="saveBtn">
                      <input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('maritalStatusMaster')">
                      <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
                  </div>
                </td>
              </tr>
         </table>
    </div>
</div>
</form>


<#------------------------------------Marital Status Master List------------------------>
<form method="post" name="Listmaritalstatusmaster" action="" class="basic-form">
        <div class="row">
           <div class="alert alert-info">
             <ul>
                <li class="h3">${uiLabelMap.maritalStatus}</li>
             </ul>
          <br class="clear"/>
       </div>
       
         <div class="screenlet-body min-scroll-div">
       <div class="screenlet-body">
    <table class="basic-table hover-bar" cellspacing="0">
   <thead>
         <tr class="header-row-2">
             <td><center>S.No<center></td>
             <td class="label"><center>${uiLabelMap.statusname} </center></td>
		     <td class="label"><center>${uiLabelMap.createdate}</center></td> 
		     <td class="label"><center>${uiLabelMap.remark}</center></td> 
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.activeDeactive}</center></td>
         </tr>
   </thead>
   <#if maritalStatusMasterList?has_content>
   <#assign count= 1>
   <#list maritalStatusMasterList as maritalStatusMasterList>
   
  
                   <tr>
                          <td><center>${count}</center></td>
                          <td><center>${maritalStatusMasterList.maritalStatus?if_exists}</center></td>
                          <td><center>${maritalStatusMasterList.dateOfCreateMarital?if_exists}</center></td>
                          <td><center>${maritalStatusMasterList.maritalRemark?if_exists}</center></td>
                           <#--<td><center>Act</center></td>--->
                            <td><center>
                           <#assign std = '${maritalStatusMasterList.status}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                           
                          <td><center>
                          <a href='<@ofbizUrl>editmaritalmaster?maritalStatusId=${maritalStatusMasterList.maritalStatusId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a></center></td>
                         <#-- <td><center><a href="javascript:editMaritalMaster('Listmaritalstatusmaster');" class="buttontext">${uiLabelMap.edit}</a></center></td>-->
                          <#--<td><center><a class="buttontext">${uiLabelMap.Remove}</a></center></td>--->
                           <td><center>                   
                           <#if std =="A">
                          <a href="javascript:editofMaritalMaster('Listmaritalstatusmaster','delete','${maritalStatusMasterList.maritalStatusId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                         <a class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          <#--<td><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>--->
                             <td><center>
                          <#if std =="A">
                          <a href="javascript:editofMaritalMaster('Listmaritalstatusmaster','status','${maritalStatusMasterList.maritalStatusId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a href="javascript:editofMaritalMaster('Listmaritalstatusmaster','status','${maritalStatusMasterList.maritalStatusId?if_exists}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr>  
                   <#assign count=count+ 1>
                   </#list>
                   </#if>    
                    <input type="hidden" name="maritalStatusId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
                    <input type="hidden" name="status" value="" style="width:140px"  />
                   
       </table>
     </div>
   </div>
 </div>
 </form>
 
<#-----------------------Java Script for Marital Status Master------------->
    <script language="JavaScript" type="text/javascript" />

    function validateParameters(formName)
    {
     var form=document[formName];
     var maritalStatus = form.maritalStatus.value;
    if(notEmptyField(maritalStatus,"Marital Status should not be empty.")) 
    {
    var r=confirm("Are you sure, you want to Save the Form ?")
        if (r==true)
        { 
		  form.action = "<@ofbizUrl>savemaritalstatusmaster</@ofbizUrl>";
		  form.submit();
		  disSubmit('saveBtn');
      }
}
}

  function editofMaritalMaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.maritalStatusId.value=id;
	     form.activestatus.value = activestd;

        form.action="<@ofbizUrl>editofMaritalMaster</@ofbizUrl>";
	    form.submit();
	}
	

  
 </script>
 