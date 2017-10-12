<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createNewMeterDetail.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   01/08/2017		
<#---                 Modify by Anubha Saini on 09/10/2017    --->
<#-- #####################################################################################################-->
<#--This ftl is used to Create Meter Detail -->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">


    <form method="post" name="createNewMeterDetail" action="" class="basic-form">
    <div class="row">
    <div class="alert alert-info">
  <ul>
  <li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  <div class="h3" align="center"><b>Register Meter Detail</b></div> 
</ul>
</div>
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	
                		<tr><td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                		
                	<tr>
                		<td class='label'>${uiLabelMap.meterNo} <font color="red">*</td>
                    	<td><input name="meterNo"  type="text" maxlength="60" value="" onchange="javascript:allnumeric(this,'${uiLabelMap.meterNo} ${uiLabelMap.shouldBeNumericMsg}')" ></td>
                    
                    	<td class='label'>${uiLabelMap.meterConstant} <font color="red">*</td>
                    	<td><input name="meterConstant"  type="text" maxlength="60" value="" ></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.meterCondition}</td>
                    	<td><input name="meterCondition"  type="text" maxlength="60" value="" ></td>
                    
                     	<td class='label'>${uiLabelMap.meterExisting}</td>
                    	<td><input name="meterExisting"  type="text" maxlength="60" value="" ></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.meterCost} <font color="red">*</td>
                    	<td><input name="meterCost"  type="text" maxlength="60" value="" onchange="javascript:allnumeric(this,'${uiLabelMap.meterNo} ${uiLabelMap.shouldBeNumericMsg}')" ></td>
                    
                     <#--  	<td class='label'>${uiLabelMap.meterStatus}</td>
                    	<td><input name="meterStatus"  type="text" maxlength="60" value="" ></td>-->
                    	<td class='label'>${uiLabelMap.CommonRemark}</td>
                     	<td><textarea name="remark" value="" maxlength="150" style="width:400px"></textarea></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.dateofpurchase} <font color="red">*</td>
                    	<td>
                    		<input type="text" name="purchaseDate" autocomplete="off" id="purchaseDate" style="width:140px;" maxlength="10" style="width:140px;" onchange=""/>
        			       	<a href="javascript:call_cal(document.createNewMeterDetail.purchaseDate);">
       				       	<img src="/images/cal.gif" width="16" height="16" border="0" alt="View Calendar" title="View Calendar"/></a>
                    	</td>
                    	<td colspan="1" class='label'>${uiLabelMap.officeName} <font color="red">*</td>
                    	<td colspan="3">
                    	<select name="officeId" style="width:160px">
		        		<option value="">${uiLabelMap.CommonSelect}</option>
		        			<#if officeList?exists>
	    	      				<#if officeList?has_content>
	    	       					<#list officeList as officeList>
 	    	         					<option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
 	    	       					</#list>
	    	     				</#if>
	    	   				</#if>
	    	   			</select></td>
                     </tr>
                     
                    <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="save" type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveRegistrationDetail();"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>

<script type="text/javascript" language="javascript">

 function saveRegistrationDetail()
   {
		       var form=document['createNewMeterDetail'];
		       var meterNo = form.meterNo.value;
			   var meterConstant = form.meterConstant.value;
			   var meterCost = form.meterCost.value;
			   var purchaseDate = form.purchaseDate.value;
			   var officeId = form.officeId.value;
			   
			    if(notEmptyField(meterNo,"${uiLabelMap.meterNo} ${uiLabelMap.notEmpty}"))
     				{
			   	if(notEmptyField(meterConstant,"${uiLabelMap.meterConstant} ${uiLabelMap.notEmpty}"))
     				{
     				if(notEmptyField(meterCost,"${uiLabelMap.meterCost} ${uiLabelMap.notEmpty}"))
     				{
     				if(notEmptyField(purchaseDate,"${uiLabelMap.dateofpurchase} ${uiLabelMap.notEmpty}"))
     				{
     				if(notEmptyField(officeId,"${uiLabelMap.officeName} ${uiLabelMap.notEmpty}"))
     				{
		       var sure = confirm("Are you sure, you want to Save the Form ?");
                       if( sure == true )
                       {
                        form.action = "<@ofbizUrl>saveMeterDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('saveBtn');    
		                } 
		                }
		                }
		                }
		                }
		                }
    }
    
    </script>