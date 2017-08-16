<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: streetMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	31 July 2017    -->

<#-- #####################################################################################################-->




<form method="post" name="StreetMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.streetmaster}</li>
        <div class="basic-nav" style="margin-top: -80px;">
  				<ul>
    				<li>
						<a title="Create Zone Master" href="<@ofbizUrl>createStreetMaster</@ofbizUrl>">
							<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
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
			 <td class="label">${uiLabelMap.streetName}</td>
			<td> 
				<select name="streetId" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.CommonSelect}</option>
				 	<#--<option value="">Mysore Street</option>-->
                    <#if streetList?has_content>
					<#list streetList as streetList>	
					<option value="${streetList.streetId}">${streetList.streetName}</option>				 	
				 	</#list>
					</#if> 
				</select>
			</td>  			 
			  <td class="label">${uiLabelMap.blockName} </td>
			  <td> 
				<select name="blockId" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.CommonSelect}</option>
				 	<#if blockTypeList?has_content>
					<#list blockTypeList as blockTypeList>		
					
				 	<option value="${blockTypeList.blockId}">${blockTypeList.blockName}</option>
				 	
				 	</#list>
					</#if>
				</select>
			</td>  
			  
        	</tr>
        	
        	 <#--<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}</td>
                    <td><input type="date" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="10" value="" />
                  
                    <#-- <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                -->
					
					
                  </tr> 
        	<tr>
				<td colspan="8"><center><div id="saveBtn" align="center"><input type="button"  name="search" value="Search" onclick="javascript:validateDetails('StreetMaster');"></center></td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
<form method="post" name="listStreetMaster" class="basic-form">
 <div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.streetMasterList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <#assign commonUrl="StreetMaster?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    <table class="basic-table" cellspacing="0">
       <thead>  <tr class="header-row-2">
             <td><center>S.No<center></td>
	         <td><center>${uiLabelMap.streetName}<center></td>
             <td><center>${uiLabelMap.blockName}</center></td>
             <td><center>${uiLabelMap.cityName}<center></td>
             <td><center>${uiLabelMap.remark}</center></td>
             <td><center>${uiLabelMap.createdate}</center></td>
               <td><center>${uiLabelMap.status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.enableDisable}</center></td>
             <td><center>${uiLabelMap.Remove}</center></td>
         </tr></thead>
                </thead>
     <#if streetTypeList?has_content>
     <#assign count= 1>
     <#list streetTypeList as streetTypeList>
   
            <tr>
		      	<td align="center">${count}</td>
	          	<td><center>${streetTypeList.streetName?if_exists}</center></td>	          		          	
	          	
	          	
	          	<td><center>
                   
                         <#if blockTypeList?has_content>
                            <#list blockTypeList as blockTypeList>
                              <#if blockTypeList.blockId?if_exists == streetTypeList.blockId?if_exists>
                               ${blockTypeList.blockName?if_exists}
                              </#if></#list>
                        </#if>   
              </center></td>
	          	
	          	
	          	
	          	
	     	 <#--   <td><center>	         
					<#if streetTypeList?has_content>
					<#assign blockId = '${streetTypeList.blockId?if_exists}'>
					</#if>
					<#if blockTypeList?has_content>
					<#list blockTypeList as blockTypeList>		
					<#if blockId == blockTypeList.blockId?if_exists>
				 	${blockTypeList.blockName?if_exists}
				 	</#if>
				 	</#list>
					</#if></center>				
			    </td> -->
			
	       <#-- <td><center>${streetTypeList.blockName?if_exists}</center></td> -->
			 
			 	<td><center>${streetTypeList.cityName?if_exists}</center></td> 
			 	<td><center>${streetTypeList.remark?if_exists}</center></td> 
 	 			<td><center><#if streetTypeList.createdate?has_content>${streetTypeList.createdate?if_exists?string("dd/MM/yyyy")}</#if></center></td> 	
			 	
		  	 
		  	 	<td><center>
                           <#assign std = '${streetTypeList.status}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
			 
		  	 	
				 <#--<td><center><a href="javascript:editStreetMaster('listStreetMaster');"  class="buttontext" align="center">Edit</a></center></td>-->

				<td><center>
				<#if std =="A">
				<a href='<@ofbizUrl>editstreetmaster?streetId=${streetTypeList.streetId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
				<#else>
                <a class="buttontext" data-disabled="true">${uiLabelMap.edit}</a>
                </#if>
				</center></td>

		      <#--	<td><center><a class="buttontext" align="center">Disable</a></center></td>

		      	<td><center><a class="buttontext" align="center">Remove</a></center></td>-->


				 <td><center>
				   <#assign std = '${streetTypeList.status}'>
				 
                          <#if std =="A">
                          <a href="javascript:editofStreetTypeMaster('listStreetMaster','status','${streetTypeList.streetId}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a href="javascript:editofStreetTypeMaster('listStreetMaster','status','${streetTypeList.streetId}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                          
                          
		                 <td><center>                   
                           <#if std =="A">
                          <a href="javascript:editofStreetTypeMaster('listStreetMaster','delete','${streetTypeList.streetId}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                          <a class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
		      	      	     
		</tr>    
            
           <#assign count=count+ 1>
             </#list>
           </#if>
                       <input type="hidden" name="streetId" value="" style="width:140px"  />
                       <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			           <input type="hidden" name="status" value="" style="width:140px"  />	   
      </table>
             <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>      
      
       </div>
      </div>
 </form>

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
     
	function editStreetMaster(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editstreetmaster</@ofbizUrl>";
	    form.submit();
	}
	
	
	 function editofStreetTypeMaster(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	     //alert(""+id);
	     form.status.value = stat;
	     form.streetId.value=id;
	     form.activestatus.value = activestd;

        form.action="<@ofbizUrl>editStreetTypeMasters</@ofbizUrl>";
	    form.submit();
	}
	
	function validateDetails(formname)
	{
	     var form =document[formname];	
	    form.submit();
	}
</script>