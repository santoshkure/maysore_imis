<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: OfficeSearch.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- PRABHU         	31 July 2017    -->

<#-- #####################################################################################################-->



<form method="post" name="officeSearch" action="" class="basic-form">
<div class="row">
   
 
	
	<div class="alert alert-info">
				<ul>
					
			      <div class="h3" align="center"><b>${uiLabelMap.OfficeSearch}</b></div> 
			        <div class="basic-nav" style="margin-top: -36px;">
			                       <li> <a title="" href="<@ofbizUrl>newOffice</@ofbizUrl>"></li>
			
			          <ul>
			            <li>
			                <a title="Create Office" href="<@ofbizUrl>newOffice</@ofbizUrl>">
			                    <i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
			                </a>
			            </li>
			          </ul>
			        </div>
				</ul>
			    
			  </div>


<div class="screenlet-body">


		
		<table  class="basic-table" cellspacing="0">
		
		<tr>
			<td class="label" width="25%">${uiLabelMap.HrmsOfficeName} &nbsp;</td> 
			<td  width="25%"><input type="text" name="officeName" onchange="javascript:trimFunction(this)" value="" maxlength="140" style="width:302px;"/></td>
			<td class="label">&nbsp;&nbsp;${uiLabelMap.HrmsOfficeType}&nbsp;&nbsp;</td> 
			<td width="25%"><select name="officeType" style="width:132px;margin:5px 0 5px 0;" onchange="javascript:getParentOffice(this);">
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if officeTypeLists?exists>
	    	      <#if officeTypeLists?has_content>
	    	       <#list officeTypeLists as officeTypeLists>
	    	       		
	    	         		<option value="${officeTypeLists.ofcTypeId?if_exists}">${officeTypeLists.ofcTypeName?if_exists}</option>
	    	         	
	    	       </#list>
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>
			</tr>
		</table></div>





<div class="button-bar" align="center">
                  <td align="right"><input type="submit" value="${uiLabelMap.CommonSearch}" onclick="return validateFields1('editOffice');"/>
                  
        </div>
 </div>
</div>
</from>

<Script>
function validateFields1(formname)
 {
 var form=document[formname];
form.action = "<@ofbizUrl>searchOffice</@ofbizUrl>";
                   form.submit();
}
</Script>