<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: wardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created       Modified By     Modified Date-->
<#--- Anubha Saini    	31 July 2017       Gaurav         17 August 2017-->
<#---                                    Anubha Saini        16 September 2017 -->
<#-- #####################################################################################################-->




<form method="post" name="blockMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.blockMaster}</li>
      <div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>createBlockMaster</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
 			 
  			</div>  
    </ul>
  
  </div>
  

	<div class="screenlet-body">
	
	<div class="screenlet-body no-padding"> 

		<table class="basic-table" cellspacing="0">
		
			<tr>
			 <td class="label">${uiLabelMap.blockName}</td>
			<td><select name="blockId" style="width:150px;" >
				 <option value="">${uiLabelMap.blockName}</option>
				<#-- <option value="">Mysore Block</option>-->
                    <#if blockList?has_content>
					<#list blockList as blockList>
				    <option value="${blockList.blockId}">${blockList.blockName}</option>
				 	
				 	</#list>
					</#if> 
					
				</select>
			  </td>   	
			 
  			 
			  <td class="label">${uiLabelMap.wardname} </td>
			 <td> 
				<select name="wardName" style="width:150px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
				 
					<#if WardMasterList?has_content>
					<#list WardMasterList as WardMasterList>	
				 <option value="${WardMasterList.wardName}">${WardMasterList.wardName}</option>
				 </#list>
					</#if>
				</select>
			</td>  
			  
        	</tr>
        	
        	<#--<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}</td>
                    <td><input type="date" style="width:140px"  name="createdate" autocomplete="off" id="date" maxlength ="30" value="" />
                    <#--<@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                   --> </td>
                  </tr>
        	
				<tr>
				<td colspan="8"><center><div id="saveBtn" align="center"><input type="button"  name="search" value="Search" onclick="javascript:validateDetails('blockMaster');"></center></td>
			</tr>
			
		</table>
		</div>
	</div>
	
	</form>
	<#--END -->
	
	
	<#-- listblockMaster.ftl -->
<form method="post" name="listblockMaster" class="basic-form">
 <div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.blockMasterList}</li>
    </ul>
  
  </div>
   <div class="screenlet-body min-scroll-div">
    <#assign commonUrl="blockMaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
	         <td><center>${uiLabelMap.blockName}<center></td>
	         <#--Add by anubha for kannad conversation -->
	         <td><center>${uiLabelMap.blockName} ${uiLabelMap.inKannada}<center></td>
            <#-- End -->
             <td><center>${uiLabelMap.wardname}</center></td>
         <#--    <td><center>${uiLabelMap.zoneName}</center></td>   -->
             <td><center>${uiLabelMap.cityName}<center></td>
             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.createdate}</center></td>
              <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>
            
         </tr>
         </thead>
     <#if blockTypeList?has_content>
      <#assign count= 1>
     <#list blockTypeList as blockTypeList>
             
         <tr>
		      	<td align="center">${count}</td>
	          	<td><center>${blockTypeList.blockName?if_exists}</center></td>
	          	  <#--Add by anubha for kannad conversation -->
	          	<td><center>${blockTypeList.blockNameKan?if_exists}</center></td>
                 <#-- End-->
	          	 <td><center> 
                   
                         <#if WardMasterList?has_content>
                            <#list WardMasterList as WardMasterList>
                              <#if WardMasterList.wardId?if_exists == blockTypeList.wardId?if_exists>
                               ${WardMasterList.wardName?if_exists}
                              </#if></#list>
                        </#if>   
              </center></td>
		 
			<#--   	<td><center></center></td>   -->
			  	<td><center>${blockTypeList.cityId?if_exists}</center></td> 
			 	<td><center>${blockTypeList.remark?if_exists}</center></td> 
			 	
 			<td><center><#if blockTypeList.createdate?has_content>${blockTypeList.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
			 
			 	<td><center>
                           <#assign std = '${blockTypeList.status}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
			 	
			 	<td><center>
			 	<#if std =="A">
			 	<a title="Edit" href='<@ofbizUrl>editblockmaster?blockId=${blockTypeList.blockId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
			 	<#else>
                <a class="buttontextdisabled" disabled>${uiLabelMap.edit}</a>
                </#if>
			 	</center></td>
				
             <#--<td><center><a href="javascript:editBlockMaster('listblockMaster');" class="buttontext" align="center">Edit</a></center></td>-->
		      <#--	<td><center><a class="buttontext" align="center">Disable</a></center></td>-->


                         <td><center>          
                          <#if std =="A">
                          <a title="Deactive" href="javascript:editofBlockTypeMaster('listblockMaster','status','${blockTypeList.blockId}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a title="Active" href="javascript:editofBlockTypeMaster('listblockMaster','status','${blockTypeList.blockId}','A');" class="buttontext">Active</a>
                          </#if>
                          </center></td>
                          
                          
                          
		                  <td><center>                   
                           <#if std =="A">
                            <a class="buttontextdisabled"  disabled>${uiLabelMap.Remove}</a>
                           
                          <#else>
                           <a title="Remove" href="javascript:editofBlockTypeMaster('listblockMaster','delete','${blockTypeList.blockId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          
                          </#if>
                          </center></td>
		</tr>    
		<#assign count=count+ 1>
        </#list>
        </#if>
            
                       <input type="hidden" name="blockId" value="" style="width:140px"  />
                       <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			           <input type="hidden" name="status" value="" style="width:140px"  />	
      </table>
              <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>   
           </div>
      </div>

 </form>
 
 <#-----------------------Java Script for Block Master------------->

<script type="text/javascript" language="javascript">

	<#--function validateTypeMaster()
	{
		
		
		
					
					document.zoneMaster.action= "<@ofbizUrl>saveZoneMaster</@ofbizUrl>";
					document.zoneMaster.submit();
					disSubmit('saveBtn'); 
					//return true;
					//alert("submit");
					
				}
			
	-->
     function editBlockMaster(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editblockmaster</@ofbizUrl>";
	    form.submit();
	}
	
	
	
	 function editofBlockTypeMaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.blockId.value=id;
	     form.activestatus.value = activestd;
        if(stat == "delete")
         {
         var r=confirm("Are you sure, you want to Remove the Form ?")
         if (r==true)
         {
      
          form.action="<@ofbizUrl>editBlockTypeMasters</@ofbizUrl>";
         form.submit();
         }
    
         }
        else if(stat == "status")
        {
           var r=confirm("Are you sure, you want to Active/Deactive the Form ?")
          if (r==true)
          { 
        form.action="<@ofbizUrl>editBlockTypeMasters</@ofbizUrl>";
	    form.submit();
	}}}
	
	
	
	
	function validateDetails(formname)
	{
	     var form =document[formname];	
	    form.submit();
	}
</script>