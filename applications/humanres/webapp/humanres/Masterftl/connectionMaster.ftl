<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: connectionMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	23 August 2017     -->
<#--- Modify by   Anubha Saini on 18/09/2017 -->
<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>

<form method="post" name="connectionMaster" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
    		<li class="h3">${uiLabelMap.connectionmaster}</li>
    		<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Connection Master" href="<@ofbizUrl>createConnectionMaster</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
 			</div>    
    	</ul>
  	</div>
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		
			  <tr>
			     <td class="label">${uiLabelMap.connectionType}</td>
			      <td width="25%"><select name="connectionType" style="width:150px;" >
			     <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if connectionMasterLists?exists>
	    	      <#if connectionMasterLists?has_content>
	    	       <#list connectionMasterLists as connectionMasterLists>
 	    	         <option value="${connectionMasterLists.connectionType?if_exists}">${connectionMasterLists.connectionType?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
	     	 </select>(${uiLabelMap.inEnglish})<br>
	     	  <td width="25%"><select name="connectionTypeKan" style="width:150px;" >
			     <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if connectionMasterLists?exists>
	    	      <#if connectionMasterLists?has_content>
	    	       <#list connectionMasterLists as connectionMasterLists>
 	    	         <option value="${connectionMasterLists.connectionTypeKan?if_exists}">${connectionMasterLists.connectionTypeKan?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
	     	 </select>(${uiLabelMap.inKannada})</br>
			       	
            	  </tr>
       		   <tr>
				   <td colspan="8"><center><div id="saveBtn" align="center"><input type="button" title="Search" name="search" value="Search" onclick="javascript:validateFields1('connectionMaster');"></center></td>
			  </tr>
			</tr>
		</table>
		</div>
	</div>
</form>

<#--------------------------Master List------------------------------>
<form method="post" name="listConnectionMaster" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.connectionMasterList}</li>
    </ul>

  </div>
   <div class="screenlet-body min-scroll-div">
    <#assign commonUrl="ConnectionMaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    
   <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}</center></td>
	         <td>${uiLabelMap.connectionType}</td>
	         <td>${uiLabelMap.connectionTypeKan}</td>
             <td>${uiLabelMap.description}</td>
             <td>${uiLabelMap.createdate}</td>
             <td>${uiLabelMap.remark}</td>
              <td>${uiLabelMap.status}</td>
             <td>${uiLabelMap.Edit}</td>
              <td>${uiLabelMap.Remove}</td>
             <td>${uiLabelMap.ActiveDeactive}</td>
            
           
          </tr>
			 <#if (connectionTypeList)?has_content>
			<#assign count = 1>
			<#list connectionTypeList as connectionTypeList>
		 
            <tr> <td><center>${count?if_exists}</center></td>
            <td><center>${connectionTypeList.connectionType?if_exists}</center></td>
           
             <td><center>${connectionTypeList.connectionTypeKan?if_exists}</center></td>
            <td><center>${connectionTypeList.description?if_exists}</center></td>
             <td><center><#if connectionTypeList.createdate?has_content>${connectionTypeList.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 

 			 <td><center>${connectionTypeList.remark?if_exists}</center></td>

            <td><center>
            <#assign std = '${connectionTypeList.status?if_exists}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="A">
                          <a title="Edit Connection Master" href='<@ofbizUrl>editConnectionMaster?ConnectionTypeId=${connectionTypeList.ConnectionTypeId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                          <#else>
                          <a class="buttontextdisabled" title="Disabled">${uiLabelMap.edit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                           <#if std =="A" || std =="D">
                          <a title="Remove" href="javascript:editZoneValidate('listConnectionMaster','delete','${connectionTypeList.ConnectionTypeId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                         <a title="Disabled"class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          <#if std =="A">
                          <a title="Deactive" href="javascript:editZoneForm('listConnectionMaster','status','${connectionTypeList.ConnectionTypeId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a title="Active" href="javascript:editZoneForm('listConnectionMaster','status','${connectionTypeList.ConnectionTypeId?if_exists}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr> 
                  <#assign count = count + 1>
						</#list>
						</#if>
          
                  <input type="hidden" name="ConnectionTypeId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	
      </table>
                  <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
  
   </div>
</div>        

</from>
 <script language="JavaScript" type="text/javascript" />
//code is added by Anubha
function editZoneValidate(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    // alert(""+id);
	     form.status.value = stat;
	     form.ConnectionTypeId.value=id;
	     form.activestatus.value = activestd;
            var r=confirm("Are you sure, you want to Remove the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateConnectionType</@ofbizUrl>";
	    form.submit();
	}          }

	function editZoneForm(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	   // alert(""+activestd);
	     form.status.value = stat;
	     form.ConnectionTypeId.value=id;
	     form.activestatus.value = activestd;
	       
	     if((activestd=="D") ||(activestd=="A"))
	     {
            var r=confirm("Are you sure, you want to Active/Deactive the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateConnectionType</@ofbizUrl>";
	    form.submit();
	} }}	
  	
 	
 	
function validateFields1(formname)
 {
 var form=document[formname];
 var connectionType = form.connectionType.value;
 
 form.action = "<@ofbizUrl>ConnectionMaster</@ofbizUrl>";
  form.submit();
}


</script>
