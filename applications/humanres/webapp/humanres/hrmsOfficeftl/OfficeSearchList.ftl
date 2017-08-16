<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: OfficeSearchList.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- PRABHU         	31 July 2017    -->

<#-- #####################################################################################################-->



<form method="post" name="officeSearchList" action="" class="basic-form"> 
 <div class="row">
 <div class="alert alert-info">
<ul>
<li class = "h3">Office List</li>
</ul>
</div>
  <div class="screenlet-body no-padding">
    <#assign commonUrl="office?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
      <table class="basic-table table-responsive hover-bar" cellspacing="0">
        <tr class="header-row-2">
       <td>${uiLabelMap.HRMSOfficeId}</td>
                <td>${uiLabelMap.HrmsOfficeName}</td>
                <td>${uiLabelMap.HrmsOfficeType}</td>
                <td>${uiLabelMap.HrmsOfficeStatus}</td>
                 <td>${uiLabelMap.CommonEdit}</td>
        </tr>
        <#assign alt_row = false>
        <#list allOfficeList as allOfficeList>
         
            <tr><#if alt_row> class="alternate-row"</#if>
            <td>${allOfficeList.partyId}</td>
            <td>${allOfficeList.officeSiteName?if_exists}</td>
            <td>${allOfficeList.groupName}</td>
            
            <#assign status = '${allOfficeList.statusId?if_exists}'>
            <#if status?has_content>
            <#if status = "PARTY_ENABLED">
            <td>ENABLED</td>
            <#else>
            <td>DISABLED</td>
            </#if>
            <#else>
            <td></td>
            </#if>
            <td class="button-col">
            <a href='<@ofbizUrl>editOfficeDetails?officeId=${allOfficeList.partyId}</@ofbizUrl>'>${uiLabelMap.CommonEdit}</a>
                        
                        </td>
            </tr>
         
          </#list>
      </table>
          <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>

  </div>
</div>        

</from>