<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listRegisterMeterDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#---                 Modify by Anubha Saini on 09/10/2017    --->
<#-- #####################################################################################################-->
<#--This ftl is used to show All Meter Detail -->

<#setting locale="en">
    
<form method="post" name="listMeterDetail" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
		    <ul>
		 	 <div class="h3" align="center"><b>${uiLabelMap.listMeterDetail}</b></div> 
		   </ul>
	   </div>
	   <div class="screenlet-body min-scroll-div">
	     		
    <#assign commonUrl="registerMeterDetails?searchOptions_collapsed=${(parameters.searchOptions_collapsed)?default(\"false\")}&amp;" />
    <#assign messageMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
    <#assign commonDisplaying = Static["org.apache.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
    <@htmlTemplate.nextPrev commonUrl=commonUrl listSize=listSize viewSize=viewSize viewIndex=viewIndex highIndex=highIndex commonDisplaying=commonDisplaying/>
    
   <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
            <td><center>${uiLabelMap.sno}</center></td>
	       	<td><center>${uiLabelMap.meterNo}</center></td>
	        <td><center>${uiLabelMap.meterCondition}</center></td>
	        <td><center>${uiLabelMap.dateofpurchase}</center></td>
	        <td><center>${uiLabelMap.meterStatus}</center></td>
            <td><center>${uiLabelMap.CommonEdit}</center></td>
            <td><center>${uiLabelMap.Remove}</center></td>
            <td><center>${uiLabelMap.ActiveDeactive}</center></td>
            
           
          </tr>
			 <#if (materDetailList)?has_content>
			<#assign count = 1>
			<#list materDetailList as materDetailList>
		 
            <tr> <td><center>${count?if_exists}</center></td>
             <td><center>${materDetailList.meterNo?if_exists}</center></td>
           	 <td><center>${materDetailList.meterCondition?if_exists}</center></td>
           	<td><center><#if materDetailList.purchaseDate?has_content>${materDetailList.purchaseDate?if_exists}</#if></center></td> 
           	 <td><center>
            <#assign std = '${materDetailList.status?if_exists}'>
                           <#if std =="A">
                           Active
                           <#else>
                           Deactive
                           </#if>
                           
                           </center></td>
                          <td><center>
                           <#if std =="A">
                          <a title="Edit Meter Details" href='<@ofbizUrl>editMeterDetail?meterId=${materDetailList.meterId?if_exists}</@ofbizUrl>' class="buttontext">${uiLabelMap.edit}</a>
                          <#else>
                          <a class="buttontextdisabled" title="Disabled">${uiLabelMap.edit}</a>
                          </#if>
                          </center></td>
                          <td><center>                   
                           <#if std =="A" || std =="D">
                          <a title="Remove" href="javascript:editZoneValidate('listMeterDetail','delete','${materDetailList.meterId?if_exists}');" class="buttontext">${uiLabelMap.Remove}</a>
                          <#else>
                         <a title="Disabled"class="buttontext" data-disabled="true">${uiLabelMap.Remove}</a>
                          </#if>
                          </center></td>
                          
                          
                          <td><center>
                          <#if std =="A">
                          <a title="Deactive" href="javascript:editZoneForm('listMeterDetail','status','${materDetailList.meterId?if_exists}','D');" class="buttontext">${uiLabelMap.Deactive}</a>
                          <#else>
                          <a title="Active" href="javascript:editZoneForm('listMeterDetail','status','${materDetailList.meterId?if_exists}','A');" class="buttontext">Active</a>

                          </#if>
                          </center></td>
                  </tr> 
                  <#assign count = count + 1>
						</#list>
						</#if>
          
                  <input type="hidden" name="meterId" value="" style="width:140px"  />
                  <input type="hidden" name="activestatus" value="" style="width:140px"  />
  			      <input type="hidden" name="status" value="" style="width:140px"  />	
           		
           		
           		
       		</tbody>
     		</table>
		</div>
	</div>   
</form>
<script language="JavaScript" type="text/javascript" />
function editZoneValidate(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	    //alert(""+id);
	     form.status.value = stat;
	     //alert(stat);
	     form.meterId.value=id;
	     form.activestatus.value = activestd;
            var r=confirm("Are you sure, you want to Remove the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateMeterDetail</@ofbizUrl>";
	    form.submit();
	}          }

	function editZoneForm(formname,stat,id,activestd)
	{
	     var form =document[formname];	
	   //alert(""+activestd);
	     form.status.value = stat;
	      //alert(stat);
	     form.meterId.value=id;
	     form.activestatus.value = activestd;
	       
	     if((activestd=="D") ||(activestd=="A"))
	     {
            var r=confirm("Are you sure, you want to Active/Deactive the Record ?")
            if (r==true)
               {
        form.action="<@ofbizUrl>updateMeterDetail</@ofbizUrl>";
	    form.submit();
	} }}	
  	
 	


</script>