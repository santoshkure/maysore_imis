<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: SearchEmployee.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Prabhu    	17August2017    -->

<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">
<form method="post" name="findEmployees" action="" class="basic-form">
			<div class="row">
			    <div class="alert alert-info">
				<ul>
					<#-- <li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li> -->
			      <div class="h3" align="center"><b>Search Employee</b></div> 
			        <div class="basic-nav" style="margin-top: -36px;">
			                       <li> <a title="" href="<@ofbizUrl>NewEmployee</@ofbizUrl>"></li>
			
			          <ul>
			            <li>
			                <a title="Create Employee" href="<@ofbizUrl>NewEmployee</@ofbizUrl>">
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
			              	<td class="label">${uiLabelMap.employeeId}</td>
			             	<td><input type="text" name="employeeId" value="" style="width:240px;" maxlength="50"></td>
			             	<td class="label">Office Name</td>
			                <td>
			                	<select name="officeId" style="width:90px;">
			                   			<option value="">Select</option>
			                   			
			                   	</select>
			                </td>
						 </tr>
						 
						 
			        </table>
			        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
			    </div>
			</div>
</form>



<form method="post" name="listEmployee" action="" class="basic-form">

       <div class="row">
           <div class="alert alert-info">
             <ul>
                <li class="h3">Employee List</li>
             </ul>
          <br class="clear"/>
       </div>
       
         <div class="screenlet-body min-scroll-div">
       <div class="screenlet-body">
       
        <#assign commonUrl="findEmployees?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    
    <table class="basic-table hover-bar" cellspacing="0">
  <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
             <td><center>${uiLabelMap.employeeId}<center></td>
             <td><center>${uiLabelMap.Name}</center></td>
             <td><center>Present Office</center></td>

             <td><center>Designation</center></td>
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>${uiLabelMap.edit}</center></td>
             <td><center>${uiLabelMap.approve}</center></td>
             <td><center>${uiLabelMap.view}</center></td>
         </tr>
   </thead>
   <#if employeeList?has_content>
   <#assign count= 1>
   <#list employeeList as employeeList>

                   <tr>
                          <td><center>${count}</center></td>
                          <td><center>${employeeList.employeeCode?if_exists}</center></td>
                          <td><center>${employeeList.title?if_exists} ${employeeList.firstName?if_exists} ${employeeList.lastName?if_exists}</center></td>
                          <td><center>
                          
                           <#assign officeId  = "${employeeList.officeId?if_exists}">	
		        <#if officeList?exists>
	    	      <#if officeList?has_content>
	    	       <#list officeList as officeList>
	    	       <#if "${officeList.partyId?if_exists}" == "${officeId?if_exists}">
	    	           ${officeList.officeSiteName?if_exists}
	    	         <#else>
 	    	        
 	    	         </#if>
 	    	       </#list>
	    	     </#if>
	    	   </#if></center></td>
                          <td><center>
                          <#assign designation  = "${employeeList.designation?if_exists}">
        <#if designationMasterList?exists>
	    	      <#if designationMasterList?has_content>
	    	       <#list designationMasterList as designationMasterList>
	    	       <#if "${designationMasterList.designationId?if_exists}" == "${designation?if_exists}">
	    	           ${designationMasterList.designationName?if_exists}
	    	         <#else>
 	    	        
 	    	         </#if> 	    	         
 	    	       </#list>
	    	     </#if>
	    	   </#if></center></td>
                           <td><center>
                           <#assign std = '${employeeList.status?if_exists}'>
                           <#if std =="REGISTERED">
                           Registered
                           <#else>
                           Approved
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="REGISTERED">
                          <a href='<@ofbizUrl>editview?regId=${employeeList.registrationId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                          <#else>
                         <a class="buttontextdisabled"  disabled>${uiLabelMap.edit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                           <#if std =="REGISTERED">
                           <#assign flag = "y">
                          <a href='<@ofbizUrl>approveView?regId=${employeeList.registrationId?if_exists}&flag=${flag}</@ofbizUrl>' class="buttontext">${uiLabelMap.approve}</a>
                          <#else>
                         <a class="buttontextdisabled" disabled>${uiLabelMap.approve}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          
                          <a href='<@ofbizUrl>viewEmployee?regId=${employeeList.registrationId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.view}</a>
                          
                          
                          </center></td>
                  </tr> 
                   <#assign count=count+ 1>
                     </#list>
                     </#if> 
                     
                       <input type="hidden" name="officeTypeId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	

      </table>
      
      <#assign commonUrl="findEmployees?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    </div>
  </div>
</div>
 </form>