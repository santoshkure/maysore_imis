<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: communityMaster.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created  Modified By	Date Modified--->
<#---1.0			Nikhil Pathak   31/07/2016		Ganesh        17/08/2017--->
<#-- #####################################################################################################-->
<#--This ftl is used to show the community name -->


<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">
<#---added by nikhil for language change to kannada ---->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script> 
<#-- ------end -->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="communityMaster" action="" class="basic-form">
<div class="row">	
		    <div class="alert alert-info">
		      <ul>
		         <div align="center" style="font-size:12px"><b>${uiLabelMap.communitymaster}</b></div>
			  </ul>
		    </div>
 			   <div class="screenlet-body">
 				 <table class="basic-table" cellspacing="0">
 				   <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
 				    <tr>
						   <td class="label" >${uiLabelMap.communityname} <font color="red">*</font></td>
					       <td><input type="text" maxlength="20" name="communityname" onchange="javascript:trimFunction(this)" value="" style="width:140px">${uiLabelMap.inEnglish}<br>
					       <input type="text" style="width:140px" maxlength="20" name="communityNameKan" id="communityMasterKan" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br>
					      <#-- <td class="label" >${uiLabelMap.createdate}</td>
                          <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>-->
                         <#--<@htmlTemplate.renderDateTimeField name="createdate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>-->
                           
					 
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="remark" onchange="javascript:trimFunction(this)" style="width:140px" maxlength ="150"></textarea></td>
                           
                      </tr>
                     <tr>
                          <td colspan="4"><center>
                          <div id ="saveBtn">
                          <input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParametered('communityMaster')">
                          <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
                      </div>
                    </td>
                  </tr>
               </table>
            </div>
        </div>
    </form>

<#------------------------------------Community Master List------------------------>
<form method="post" name="Listcommunity" action="" class="basic-form">

       <div class="row">
           <div class="alert alert-info">
             <ul>
                <li class="h3">${uiLabelMap.communityNameList}</li>
             </ul>
           <br class="clear"/>
       </div>
       
         <div class="screenlet-body min-scroll-div">
       <div class="screenlet-body">
    <table class="basic-table hover-bar" cellspacing="0">
  <thead>
  
  
  
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
             <td><center>${uiLabelMap.communityname}<center></td>
             <td><center>${uiLabelMap.communityname} ${uiLabelMap.inKannada}<center></td>
             <td><center>${uiLabelMap.createdate}</center></td>
             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>
         </tr>
   </thead>
   
   
      <#if communityTypeList?has_content>
      <#assign count= 1>
      <#list communityTypeList as communityTypeList>
      
	     <tr>
            <td><center>${count}</center></td>
            <td><center>${communityTypeList.communityname?if_exists}</center></td>
            <td><center>${communityTypeList.communityNameKan?if_exists}</center></td>
           <#-- <td><center><#if communityTypeList.createdate?has_content>${communityTypeList.createdate?if_exists?string("dd/MM/yyyy")}</center></td>-->
           <td><center><#if communityTypeList.createdate?has_content>${communityTypeList.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
            
            <td><center>${communityTypeList.remark?if_exists}</center></td>
           
                   <td><center>
                   <#assign std = '${communityTypeList.status?if_exists}'>
                   <#if std =="A">
                    Active
                   <#else>
                    Deactive
                   </#if>
                   </center></td>
                   
                       
                       
                   <td><center>
	               <#if std =="A">
                   <a title="Edit" href='<@ofbizUrl>editcommunitymaster?communityId=${communityTypeList.communityId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                   <#else>
                   <a class="buttontextdisabled"  disabled>${uiLabelMap.edit}</a>
                   </#if>
                   </center></td>
                  
                  
                    <td><center>                   
                    <#if std =="D">
                    <a title="Remove" href="javascript:editofcTypeMaster('Listcommunity','delete','${communityTypeList.communityId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                    <#else>
                    <a class="buttontextdisabled"  disabled>${uiLabelMap.Remove}</a>
                    </#if>
                    </center></td>
                        
                    <td><center>
                    <#if std =="A">
                    <a title="Deactive" href="javascript:editofcTypeMaster('Listcommunity','status','${communityTypeList.communityId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                    <#else>
                    <a title="Active" href="javascript:editofcTypeMaster('Listcommunity','status','${communityTypeList.communityId?if_exists}','A');" class="buttontext">Active</a>
                    </#if>
                    </center></td>
                    </tr>    
                  
             
                 <#assign count=count+ 1>
                 </#list>
                 </#if> 
                    <input type="hidden" name="communityId" value="" style="width:140px"  />
              <input type="hidden" name="activestatus" value="" style="width:140px"  />
		      <input type="hidden" name="status" value="" style="width:140px"  />  
      
      </table>
    </div>
  </div>
</div>
 </form>
 
 <#-----------------------Java Script for Community Master------------->
 
 
 
 
<script language="JavaScript" type="text/javascript" />



function validateParametered(formName)
{
  var form=document[formName];
  var communityname = form.communityname.value;
  //var createdate = form.createdate.value;
  //alert(""+createdate);
  
    if(notEmptyField(communityname,"Community Name should not be empty.")) 
     {
     var r=confirm("Are you sure, you want to save the Form ?")
     if (r==true)
     { 
	  form.action = "<@ofbizUrl>saveCommunityMaster</@ofbizUrl>";
	  form.submit();
	  disSubmit('saveBtn');
     }
     }
}


 function editofcTypeMaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     
       
	     form.status.value = stat;
	     form.communityId.value=id;
	     form.activestatus.value = activestd;
	     if(stat == "delete")
	     {
	      var r=confirm("Are you sure, you want to Remove the Form ?")
	      if (r==true)
	      {
          form.action="<@ofbizUrl>editCommunityTypeMaster</@ofbizUrl>";
          form.submit();
          }
          }else if(stat == "status")
          {
          var r=confirm("Are you sure, you want to Active/Deactive the Form ?")
          if (r==true)
          {
      form.action="<@ofbizUrl>editCommunityTypeMaster</@ofbizUrl>";
      form.submit();
      }
      }
   }


 <#--function editofcTypeMaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     
       
	     form.status.value = stat;
	     form.communityId.value=id;
	     form.activestatus.value = activestd;

        form.action="<@ofbizUrl>editCommunityTypeMaster</@ofbizUrl>";
    form.submit();
}-->

	
	
	
	
	
 </script>