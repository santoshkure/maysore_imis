<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: communityMaster.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   31/07/2016		
<#-- #####################################################################################################-->
<#--This ftl is used to show the community name -->

<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">
 
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
					       <td><input type="text" maxlength="20" name="communityname" value="" style="width:140px">
					       <td class="label" >${uiLabelMap.createdate}</td>
                           <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px" readonly /></td>
					 <tr>
                           <td class="label" >${uiLabelMap.remark}</td>
                           <td><textarea name="remark" style="width:140px" maxlength ="150"></textarea></td>
                     </tr>
                     <tr>
                          <td colspan="4"><center>
                          <div id ="saveBtn">
                          <input name="save" value="${uiLabelMap.CommonSave}" type="button" onClick="validateParameters('castmaster')">
                          <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
                      </div>
                    </td>
                  </tr>
               </table>
            </div>
        </div>
    </form>

<#------------------------------------Community Master List------------------------>
<form method="post" name="Listcommunitymaster" action="" class="basic-form">

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
             <td><center>${uiLabelMap.createdate}</center></td>
             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.activeDeactive}</center></td>
         </tr>
   </thead>
                   <tr>
                          <td><center>1</center></td>
                          <td><center>mysore</center></td>
                          <td><center>31/08/2017</center></td>
                          <td><center>remark</center></td>
                           <td><center>Act</center></td>
                          <td><center><a href="javascript:editCommunityMaster('Listcommunitymaster');" class="buttontext">${uiLabelMap.edit}</a></center></td>
                          <td><center><a class="buttontext">${uiLabelMap.Remove}</a></center></td>
                          <td><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>
                  </tr>    
      </table>
    </div>
  </div>
</div>
 </form>
 
 <#-----------------------Java Script for Community Master------------->
<script language="JavaScript" type="text/javascript" />

function validateParameters(formName)
{
  var form=document[formName];
  var ctype = form.communityname.value;
    if(notEmptyField(communityname,"community name should not be empty.")) 
    {
		  form.action = "<@ofbizUrl>savecommunitymaster</@ofbizUrl>";
		  form.submit();
		  disSubmit('saveBtn');
    }
    }
    
    function editCommunityMaster(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editcommunitymaster</@ofbizUrl>";
	    form.submit();
	}
 </script>