<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: zoneMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created    Updated on     By -->
<#--- Anubha Saini    	31 July 2017    18Aug 2017      Saurabh Gupta       -->
 <#---                                  16 Sep 2017      Anubha Saini  -->
<#-- #####################################################################################################-->
<form method="post" name="zoneMaster" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
    		<li class="h3">${uiLabelMap.zonemaster}</li>
    		<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>createZoneMaster</@ofbizUrl>">
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
			 <td class="label">${uiLabelMap.zoneName} </td>
			  <td width="25%"><select name="zoneName" style="width:150px;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if ZoneMasterLists?exists>
	    	      <#if ZoneMasterLists?has_content>
	    	       <#list ZoneMasterLists as ZoneMasterLists>
 	    	         <option value="${ZoneMasterLists.zoneName?if_exists}">${ZoneMasterLists.zoneName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
	     	 </select>
                    </td>
 			 
			  <td class="label">${uiLabelMap.cityName} </td>
			  <td> 
				<select name="cityName" style="width:150px;" >
				    <option value=''>Select</option>
				 	<option value="Mysore">Mysore</option>
				</select>
			</td>  
		  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.officeName} </td>
 		 	 <td width="25%"><select name="officeName" style="width:150px;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if officeMasterLists?exists>
	    	      <#if officeMasterLists?has_content>
	    	       <#list officeMasterLists as officeMasterLists>
 	    	         <option value="${officeMasterLists.officeSiteName?if_exists}">${officeMasterLists.officeSiteName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
	        	</select>
             </td>
			
		  <#--	  <td width='20%' align='right' class="label">${uiLabelMap.createdate}</td>
                  <td>
                     <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                 
					<td><input type="date" style="width:140px"  name="createDated" autocomplete="off" id="remark" maxlength ="10" value="" /></td> 
					   -->
		     	<input type="Hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
        	</tr>
       		<tr>
				<td colspan="8"><center><div id="saveBtn" align="center"><input type="button" title="Search" name="search" value="Search" onclick="javascript:validateFields1('zoneMaster');"></center></td>
			</tr>
 		</table>
		</div>
	</div>
</form>

<#--------------------------Master List------------------------------>
<form method="post" name="listzoneMaster" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.zoneNameList}</li>
    </ul>

  </div>
   <div class="screenlet-body min-scroll-div">
     <#assign commonUrl="ZoneMaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}</center></td>
	         <td><center>${uiLabelMap.zoneName}</center></td>
	            <#-- Add by Anubha -->
	           <td><center>${uiLabelMap.zoneName} ${uiLabelMap.inKannada}</center></td>
             <td><center>${uiLabelMap.cityName}</center></td>
             <td><center>${uiLabelMap.officeName}<center></td>
             <td><center>${uiLabelMap.createdate}</center></td>
             <td><center>${uiLabelMap.remark}</center></td>
              <td><center>${uiLabelMap.Status}</center></td>
          <#--    <td><center>${uiLabelMap.createdate}</center></td>-->
             <td><center>${uiLabelMap.Edit}</center></td>
              <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>
           
          </tr>
			 <#if (allOfficeZoneListed)?has_content>
			<#assign count = 1>
			<#list allOfficeZoneListed as allOfficeZoneListed>
		 
            <tr> <td><center>${count?if_exists}</center></td>
            <td><center>${allOfficeZoneListed.zoneName?if_exists}</center></td>
              <#-- Add by Anubha -->
             <td><center>${allOfficeZoneListed.zoneNameKan?if_exists}</center></td>
            <td><center>${allOfficeZoneListed.cityName?if_exists}</center></td>
            <td><center>${allOfficeZoneListed.officeName?if_exists}</center></td>
 			<td><center><#if allOfficeZoneListed.createdate?has_content>${allOfficeZoneListed.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
            <td><center>${allOfficeZoneListed.remark?if_exists}</center></td>
           
            <td><center>
            <#assign std = '${allOfficeZoneListed.status?if_exists}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="A">
                          <a title="Edit Zone Master" href='<@ofbizUrl>editzonemaster?zoneId=${allOfficeZoneListed.zoneId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                          <#else>
                          <a class="buttontextdisabled" title="Disabled">${uiLabelMap.edit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                          <#if std =="A" || std =="D">
                          <a title="Remove" href="javascript:editZoneValidate('listzoneMaster','delete','${allOfficeZoneListed.zoneId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                         <a title="Disabled"class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          <#if std =="A">
                          <a title="Deactive" href="javascript:editZoneForm('listzoneMaster','status','${allOfficeZoneListed.zoneId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a title="Active" href="javascript:editZoneForm('listzoneMaster','status','${allOfficeZoneListed.zoneId?if_exists}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr> 
                  <#assign count = count + 1>
						</#list>
						</#if>
          
                  <input type="hidden" name="zoneId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	
      </table>
                  <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
   </div>
</div>        

</from>
 <script language="JavaScript" type="text/javascript" />
//code is added by saurabh
function editZoneValidate(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    // alert(""+id);
	     form.status.value = stat;
	     form.zoneId.value=id;
	     form.activestatus.value = activestd;
            var r=confirm("Are you sure, you want to Remove the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateZoneDet</@ofbizUrl>";
	    form.submit();
	}          }

 function editZone(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    // alert(""+stat);
	     form.status.value = stat;
	     form.zoneId.value=id;
	     form.activestatus.value = activestd;
         var r=confirm("Are you sure, you want to Remove the Record ?")
         if (r==true)
           {
        form.action="<@ofbizUrl>updateZoneDet</@ofbizUrl>";
	    form.submit();
	}          }

	function editZoneForm(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+activestd);
	     form.status.value = stat;
	     form.zoneId.value=id;
	     form.activestatus.value = activestd;
	       
	     if((activestd=="D") ||(activestd=="A"))
	     {
            var r=confirm("Are you sure, you want to Active/Deactive the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateZoneDet</@ofbizUrl>";
	    form.submit();
	} }}	
  	
 	function validateFields1(formname)
 {
 var form=document[formname];
 var zoneName = form.zoneName.value;
 
         form.action = "<@ofbizUrl>ZoneMaster</@ofbizUrl>";
                   form.submit();
}



</script>