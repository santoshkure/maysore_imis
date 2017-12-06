<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: buildingMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Nikhil Pathak   	24 August 2017              -->
<#--- Modify by   Anubha Saini on 23/09/2017 -->
<#-- #####################################################################################################-->

 <form method="post" name="buildingMaster" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
    		<li class="h3">${uiLabelMap.buildingmaster}</li>
    		<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Building Master" href="<@ofbizUrl>createBuildingMaster</@ofbizUrl>">
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
			       <td class="label">${uiLabelMap.buildingType}</td>
			     
			     <td width="25%"><select name="buildingType" style="width:150px;" >
			     <option value=''>${uiLabelMap.CommonSelect}</option>
	    	  			 <#if buildingLists?exists>
	    	     			 <#if buildingLists?has_content>
	    	      				 <#list buildingLists as buildingLists>
 	    	         				<option value="${buildingLists.buildingType?if_exists}">${buildingLists.buildingType?if_exists}</option>
 	    	       				 </#list>
	    	     			 </#if>
	    	   			 </#if>
	     	 	</select>${uiLabelMap.inEnglish}<br>
	     	  	<td width="25%"><select name="buildingTypeKan" style="width:150px;" >
			     	<option value=''>${uiLabelMap.CommonSelect}</option>
	    	   			<#if buildingLists?exists>
	    	      			<#if buildingLists?has_content>
	    	       				<#list buildingLists as buildingLists>
 	    	         				<option value="${buildingLists.buildingTypeKan?if_exists}">${buildingLists.buildingTypeKan?if_exists}</option>
 	    	       				</#list>
	    	     			</#if>
	    	   			</#if>
	     	 		</select>${uiLabelMap.inKannada}</br>
			   </tr>
	
			   <tr>
				    <td colspan="8"><center><div id="saveBtn" align="center"><input type="button"  name="search" value="Search" onclick="javascript:validateFields1('buildingMaster');"></center></td>
			  </tr>
			</tr>
		</table>
      </div>
	</div>
</form>

<#--------------------------Master List------------------------------>
 <form method="post" name="listBuildingMaster" class="basic-form">
   <div class="row">
      <div class="alert alert-info">
       <ul>
          <li class="h3">${uiLabelMap.buildingMasterList}</li>
       </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
     <#assign commonUrl="BuildingMaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
  
     <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}</center></td>
	         <td>${uiLabelMap.buildingType}</td>
	         <td>${uiLabelMap.buildingType} ${uiLabelMap.inKannada}</td>
             <td>${uiLabelMap.description}</td>
             <td>${uiLabelMap.createdate}</td>
             <td>${uiLabelMap.remark}</td>
              <td>${uiLabelMap.Status}</td>
             <td>${uiLabelMap.CommonEdit}</td>
             <td>${uiLabelMap.Remove}</td>
             <td>${uiLabelMap.enableDisable}</td>
             
           
          </tr>
			 <#if (buildingMasterListed)?has_content>
			<#assign count = 1>
			<#list buildingMasterListed as buildingMasterListed>
		 
            <tr> <td><center>${count?if_exists}</center></td>
            <td>${buildingMasterListed.buildingType?if_exists}</td>
			  	<td>${buildingMasterListed.buildingTypeKan?if_exists}</td>
			 	<td>${buildingMasterListed.description?if_exists}</td> 
			 	<td><center><#if buildingMasterListed.createdate?has_content>${buildingMasterListed.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 

		  	 	<td>${buildingMasterListed.remark?if_exists}</td> 
		  	 	
		  	 <td><center>
            <#assign std = '${buildingMasterListed.status?if_exists}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="A">
                          <a title="Edit Building Master" href='<@ofbizUrl>editBuildingMaster?buildingId=${buildingMasterListed.buildingId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.CommonEdit}</a>
                          <#else>
                          <a class="buttontextdisabled" title="Disabled">${uiLabelMap.CommonEdit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                           <#if std =="A" || std =="D">
                          <a title="Remove" href="javascript:editZoneValidate('listBuildingMaster','delete','${buildingMasterListed.buildingId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                         <a title="Disabled"class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          <#if std =="A">
                          <a title="Deactive" href="javascript:editZoneForm('listBuildingMaster','status','${buildingMasterListed.buildingId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a title="Active" href="javascript:editZoneForm('listBuildingMaster','status','${buildingMasterListed.buildingId?if_exists}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr> 
                  <#assign count = count + 1>
						</#list>
						</#if>
          
  			      
  			      	 <input type="hidden" name="buildingId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	
      </table>
                 <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
  

  </div>
</form>
<script language="JavaScript" type="text/javascript" />
//code is added by Anubha
function editZoneValidate(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	  //   alert(""+id);
	     form.status.value = stat;
	     form.buildingId.value=id;
	     form.activestatus.value = activestd;
            var r=confirm("Are you sure, you want to Remove the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateBuildingMaster</@ofbizUrl>";
	    form.submit();
	}          }
<#--  
 function editZone(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	   alert(""+stat);
	     form.status.value = stat;
	     form.ConnectionTypeId.value=id;
	     form.activestatus.value = activestd;
         var r=confirm("Are you sure, you want to Remove the Record ?")
         if (r==true)
           {
        form.action="<@ofbizUrl>updateConnectionType</@ofbizUrl>";
	    form.submit();
	}          }-->

	function editZoneForm(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	 //   alert(""+activestd);
	     form.status.value = stat;
	     form.buildingId.value=id;
	     form.activestatus.value = activestd;
	       
	     if((activestd=="D") ||(activestd=="A"))
	     {
            var r=confirm("Are you sure, you want to Active/Deactive the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateBuildingMaster</@ofbizUrl>";
	    form.submit();
	} }}	
  	
 	
 	
function validateFields1(formname)
 {
 var form=document[formname];
 var buildingType = form.buildingType.value;
 
 form.action = "<@ofbizUrl>BuildingMaster</@ofbizUrl>";
  form.submit();
}


</script>
