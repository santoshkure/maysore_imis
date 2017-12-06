<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: wardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created    Modify by       Modify date -->
<#--- Anubha Saini    	31 July 2017    Saurabh Gupta    14 aug 2017          -->
<#---                                   Anubha Saini    	16 Sep 2017 -->
<#-- #####################################################################################################-->
<form method="post" name="wardMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.wardmaster}</li>
     <div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>createWardMaster</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
 			 
  			</div>  
    </ul>
   </div>
	<br/>
	<div class="screenlet-body">
		<table class="basic-table" cellspacing="0">
		
			<tr>
			 <td class="label">${uiLabelMap.zoneName} </td>
			<td width="25%"><select name="zoneId" style="width:150px;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>             	    	       	    	        

	    	   <#if ZoneMasterList?exists>
	    	      <#if ZoneMasterList?has_content>
	    	       <#list ZoneMasterList as ZoneMasterList>
	         		  <option value="${ZoneMasterList.zoneId?if_exists}">${ZoneMasterList.zoneName?if_exists}</option>
 	    	       </#list>
	    	      
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>
 			 <td class="label">${uiLabelMap.wardname}</td>
 			 <td width="25%"><select name="wardName" style="width:150px;" >
			 
     			<option value=''>${uiLabelMap.CommonSelect}</option>     
				<#if WardMasterLists?exists>
	    	      <#if WardMasterLists?has_content>
	    	       <#list WardMasterLists as WardMasterLists>
	         		  <option value="${WardMasterLists.wardName?if_exists}">${WardMasterLists.wardName?if_exists}</option>
 	    	       </#list>
	    	      
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>		 
			  
			  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.cityName} </td>
			  <td> 
				<select name="cityName" style="width:150px;" >
				  <option value=''>Select</option>
				 	<option value="Mysore">Mysore</option>
				</select>
			</td> 
			
		 <#--	 <td width='20%' align='right' class="label">${uiLabelMap.createdate}</td>
                   <td>
                      <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>
                    <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="10" value="" /></td>   --> 	
             </tr>
        	
        	<tr>
				<td colspan="8"><center><div id="saveBtn" align="center"><input type="button" title="Search" name="search" value="Search" onclick="javascript:validateFieldvar('wardMaster');"></center></td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
	
	
	
 <form method="post" name="listwardMaster" class="basic-form">
  <div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.wardMasterList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <#assign commonUrl="Wardmaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
	         <td><center>${uiLabelMap.wardname}<center></td>
	         <#-- Add by Anubha -->
	          <td><center>${uiLabelMap.wardname} ${uiLabelMap.inKannada}<center></td>
             <td><center>${uiLabelMap.zoneName}</center></td>
             <td><center>${uiLabelMap.cityName}<center></td>
             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.createdate}</center></td>
             <td><center>${uiLabelMap.Status}</center></td>
              <td><center>${uiLabelMap.edit}</center></td>
            <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>
           
         </tr>
       </thead>  
       
        <#if (allOfficeWardListed)?has_content>
		<#assign count = 1>
		<#list allOfficeWardListed as allOfficeWardListed>
		 
             <tr> <td><center>${count?if_exists}</center></td>
            <td><center>${allOfficeWardListed.wardName?if_exists}</center></td>
           <#-- Add by Anubha -->
             <td><center>${allOfficeWardListed.wardNameKan?if_exists}</center></td>
            <td><center> 
                   
                         <#if ZoneMasterList?has_content>
                            <#list ZoneMasterList as ZoneMasterList>
                              <#if ZoneMasterList.zoneId?if_exists == allOfficeWardListed.zoneId?if_exists>
                               ${ZoneMasterList.zoneName?if_exists}
                              </#if></#list>
                        </#if>   
              </center></td>
            <td><center>${allOfficeWardListed.cityName}</center></td>
             <td><center>${allOfficeWardListed.wardRemark}</center></td>
 			<td><center><#if allOfficeWardListed.createdate?has_content>${allOfficeWardListed.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
             
         <#--   <td><center><#if allOfficeWardListed.wardRemark?if_exists>
            ${allOfficeWardListed.wardRemark?if_exists}<#else>NA</#if></center></td> -->
       
        <td><center>
            <#assign std = '${allOfficeWardListed.status?if_exists}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="A">
                          <a title="Edit Ward Master" href='<@ofbizUrl>editwardmaster?wardId=${allOfficeWardListed.wardId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                          <#else>
                           <a class="buttontextdisabled" title="Disabled">${uiLabelMap.edit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                           <#if std =="A" || std =="D">
                          <a title="Remove" href="javascript:editWard('listwardMaster','delete','${allOfficeWardListed.wardId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                        <#--   <a class="buttontextdisabled" title="Disabled">${uiLabelMap.Remove}</a>-->
                           <a title="Disabled"class="buttontext" data-disabled="">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          <#if std =="A">
                          <a title="Deactive" href="javascript:editWardForm('listwardMaster','status','${allOfficeWardListed.wardId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a title="Active" href="javascript:editWardForm('listwardMaster','status','${allOfficeWardListed.wardId?if_exists}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr> 
                  <#assign count = count + 1>
						</#list>
						</#if>
          
                 <input type="hidden" name="wardId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	
      </table>
              <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
  
  </div>
</div>        

</from>
 <script language="JavaScript" type="text/javascript" />
//code is added by saurabh
 function editWardvalidate(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    // alert(""+stat);
	     form.status.value = stat;
	     form.wardId.value=id;
	     form.activestatus.value = activestd;

        form.action="<@ofbizUrl>updateWardDet</@ofbizUrl>";
	    form.submit();
	}
	function editWard(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    // alert(""+stat);
	     form.status.value = stat;
	     form.wardId.value=id;
	     form.activestatus.value = activestd;
            var r=confirm("Are you sure, you want to Remove the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateWardDet</@ofbizUrl>";
	    form.submit();
	}          }
	
	function editWardForm(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    // alert(""+activestd);
	     form.status.value = stat;
	     form.wardId.value=id;
	     form.activestatus.value = activestd;
	       
	     if((activestd=="D") ||(activestd=="A"))
	     {
            var r=confirm("Are you sure, you want to Active/Deactive the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateWardDet</@ofbizUrl>";
	    form.submit();
	}          }}
	function validateFieldvar(formname)
 {
 var form=document[formname];
  var zoneId = form.zoneId.value;
   // alert(""+zoneName);
   
         form.action = "<@ofbizUrl>Wardmaster</@ofbizUrl>";
                   form.submit();
}
</script>