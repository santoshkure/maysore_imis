<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: officeTypeMaster.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			    Prabhu       05/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to show the community name -->

<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">
 
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="officeTypeMasterSearch" action="" class="basic-form">
<div class="row">	
		    <div class="alert alert-info">
		      <ul>
		         <div align="center" style="font-size:12px"><b>${uiLabelMap.HrmsOfficeType}</b></div>
			  </ul>
		    </div>
 			   <div class="screenlet-body">
 				 <table class="basic-table" cellspacing="0">
 				   <tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
 				    <tr>
						   <td class="label" >${uiLabelMap.HrmsOfficeTypeName} <font color="red">*</font></td>
                           <td><input type="text" name="officeTypeName" value="" style="width:140px"  /></td>
                            <td class="label" >${uiLabelMap.HrmsOfficeTypeId} <font color="red">*</font></td>
					       <td><input type="text" maxlength="20" name="officeTypeId" value="" style="width:140px">

					 <tr><#assign parentId = "IMIS">
					 <td class="label" >Parent Type Id <font color="red">*</font></td>
					       <td><input type="text" maxlength="20" name="parentTypeId" value="${parentId}" style="width:140px" disabled="disabled" readonly>
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="remark" style="width:240px" maxlength ="310"></textarea></td>
                     </tr>
                     <tr>
                          <td colspan="4"><center>
                          <div id ="saveBtn">
                          <input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('officeTypeMasterSearch')">
                          <#--  --<input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >-->
                      </div>
                    </td>
                  </tr>
               </table>
            </div>
        </div>
    </form>
 <#-----------------------Java Script for Community Master------------->
<script language="JavaScript" type="text/javascript" />

function validateParameters(formName)
{
  var form=document[formName];
  var officeTypeName = form.officeTypeName.value;
   var officeTypeId = form.officeTypeId.value;
    if(notEmptyField(officeTypeName,"Office Type name should not be empty.")) 
    {
    if(notEmptyField(officeTypeId,"Office Type Id should not be empty.")) 
    {
		  form.action = "<@ofbizUrl>saveofcTypemaster</@ofbizUrl>";
		  form.submit();
		  disSubmit('saveBtn');
    }}
    }
    </script>
   
<#------------------------------------Community Master List------------------------>
<form method="post" name="ListofcTypemaster" action="" class="basic-form">

       <div class="row">
           <div class="alert alert-info">
             <ul>
                <li class="h3">${uiLabelMap.OfficeTypeList}</li>
             </ul>
          <br class="clear"/>
       </div>
       
         <div class="screenlet-body min-scroll-div">
       <div class="screenlet-body">
    <table class="basic-table hover-bar" cellspacing="0">
  <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
             <td><center>${uiLabelMap.HrmsOfficeTypeId}<center></td>
             <td><center>${uiLabelMap.HrmsOfficeTypeName}</center></td>
             <td><center>${uiLabelMap.ParentTypeId}</center></td>

             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.activeDeactive}</center></td>
         </tr>
   </thead>
   <#if officeTypeList?has_content>
   <#assign count= 1>
   <#list officeTypeList as officeTypeList>
   
   
                   <tr>
                          <td><center>${count}</center></td>
                          <td><center>${officeTypeList.ofcTypeId}</center></td>
                          <td><center>${officeTypeList.ofcTypeName}</center></td>
                          <td><center>${officeTypeList.parentTypeId}</center></td>
                          <td><center>${officeTypeList.remarks}</center></td>
                           <td><center>
                           <#assign std = '${officeTypeList.status}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="A">
                          <a href='<@ofbizUrl>editofcMaster?officeTypeId=${officeTypeList.ofcTypeId}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                          <#else>
                         <a class="buttontext" data-disabled="true">${uiLabelMap.edit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                           <#if std =="A">
                          <a href="javascript:editofcTypeMaster('ListofcTypemaster','delete','${officeTypeList.ofcTypeId}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                         <a class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          <#if std =="A">
                          <a href="javascript:editofcTypeMaster('ListofcTypemaster','status','${officeTypeList.ofcTypeId}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a href="javascript:editofcTypeMaster('ListofcTypemaster','status','${officeTypeList.ofcTypeId}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr> 
                   <#assign count=count+ 1>
                     </#list>
                     </#if> 
                     
                       <input type="hidden" name="officeTypeId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	

      </table>
    </div>
  </div>
</div>
 </form>
 
 <script language="JavaScript" type="text/javascript" />
    
    function editofcTypeMaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.officeTypeId.value=id;
	     form.activestatus.value = activestd;

        form.action="<@ofbizUrl>editofcTypeMaster</@ofbizUrl>";
	    form.submit();
	}
	
	
 </script>