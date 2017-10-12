<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editMeterDetail.ftl ----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   02/08/2017	
<#---                 Modify by Anubha Saini on 09/10/2017    --->
<#-- #####################################################################################################-->
<#--This ftl is used to edit Meter Detail -->

<#setting locale="en">

    <form method="post" name="editMeterDetail" action="" class="basic-form">
    <div class="row">
    <div class="alert alert-info">
  <ul>
  <li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  <div class="h3" align="center"><b>${uiLabelMap.editMeterDetail}</b></div> 
</ul>
</div> 
		    <table cellspacing="0" class="basic-table table-responsive">
		     <#if materDetailList?has_content>
 				 <#list materDetailList as materDetailList>
                <tbody>
                	<tr><td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                	<tr>
                		<td class='label'>${uiLabelMap.meterNo} <font color="red">*</td>
                    	<td><input name="meterNo"  type="text" maxlength="60" value="${materDetailList.meterNo?if_exists}" onchange="javascript:allnumeric(this,'${uiLabelMap.meterNo} ${uiLabelMap.shouldBeNumericMsg}')"></td>
                    
                    	<td class='label'>${uiLabelMap.meterConstant} <font color="red">*</td>
                    	<td><input name="meterConstant"  type="text" maxlength="60" value="${materDetailList.meterConstant?if_exists}" ></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.meterCondition}</td>
                    	<td><input name="meterCondition"  type="text" maxlength="60" value="${materDetailList.meterCondition?if_exists}" ></td>
                    
                     	<td class='label'>${uiLabelMap.meterExisting}</td>
                    	<td><input name="meterExisting"  type="text" maxlength="60" value="${materDetailList.meterExisting?if_exists}" ></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.meterCost} <font color="red">*</td>
                    	<td><input name="meterCost"  type="text" maxlength="60" value="${materDetailList.meterCost?if_exists}" onchange="javascript:allnumeric(this,'${uiLabelMap.meterNo} ${uiLabelMap.shouldBeNumericMsg}')"></td>
                    
                     	<#--  <td class='label'>${uiLabelMap.meterStatus}</td>
                    	<td><input name="meterStatus"  type="text" maxlength="60" value="${materDetailList.meterStatus?if_exists}" ></td>-->
                    	
                    	<td class='label'>${uiLabelMap.CommonRemark}</td>
                     	<td><textarea name="remark" value="" maxlength="150" style="width:400px">${materDetailList.remark?if_exists}</textarea></td>
                     </tr>
                     
                     <tr>
                    	<td class='label'>${uiLabelMap.dateofpurchase}</td>
                    	<td>
                    	<input type="text" name="purchaseDate" autocomplete="off" value="<#if materDetailList.purchaseDate?has_content>${materDetailList.purchaseDate?if_exists?string('dd/MM/yyyy')}</#if>" id="purchaseDate" style="width:140px;" maxlength="10" style="width:140px;" onchange=""/>
        			    <a href="javascript:call_cal(document.editMeterDetail.purchaseDate);">
       				    <img src="/images/cal.gif" width="16" height="16" border="0" alt="View Calendar" title="View Calendar"/></a></td>
       				    
		          		<td colspan="1" class='label'>${uiLabelMap.officeName} <font color="red">*</td>
                    	
                     <td><select name="officeId" style="width:160px">
		     			<option value="">${uiLabelMap.CommonSelect}</option>
		     				<#assign officeId  = "${materDetailList.officeId?if_exists}">	
		       					 <#if officeList?exists>
	    	      					<#if officeList?has_content>
	    	       						<#list officeList as officeList>
	    	       							<#if "${officeList.partyId?if_exists}" == "${officeId?if_exists}">
	    	           							<option value="${officeList.partyId?if_exists}" selected>${officeList.officeSiteName?if_exists}</option>
	    	         						<#else>
 	    	         							<option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
 	    	         						</#if>
 	    	       						</#list>
	    	     					</#if>
	    	   					 </#if>
	    	   				</select>
	    	   			</td>
		        	</tr>
                    
                 <tr>
				    <td colspan="4">
					   <center><div id="submit" align="center">
						<input name="update" value="${uiLabelMap.CommonUpdate}" type="button" onClick="validateTypeMaster('editMeterDetail','edit')">
					     <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
					</div>
				</center>
		      </td>
		      </tr>
		        
		          <input type="hidden" name="meterId" value="${materDetailList.meterId?if_exists}" style="width:140px"  />
		          <input type="hidden" name="activestatus" value="${materDetailList.status?if_exists}" style="width:140px"  />
		          
		    </#list>
				</#if>
				<input type="hidden" name="status" value="" style="width:140px"/>
		</table>
    	</div>
</form>

<script language="JavaScript" type="text/javascript" />
   
       function validateTypeMaster(formname,stat)
	{
		var form=document['editMeterDetail'];
		
		       var meterNo = form.meterNo.value;
			   var meterConstant = form.meterConstant.value;
			   var meterCost = form.meterCost.value;
			  // var purchaseDate = form.purchaseDate.value;
			   var officeId = form.officeId.value;
			   
			    	if(notEmptyField(meterNo,"${uiLabelMap.meterNo} ${uiLabelMap.notEmpty}"))
     				{
			   			if(notEmptyField(meterConstant,"${uiLabelMap.meterConstant} ${uiLabelMap.notEmpty}"))
     					{
     						if(notEmptyField(meterCost,"${uiLabelMap.meterCost} ${uiLabelMap.notEmpty}"))
     						{
     							//if(notEmptyField(purchaseDate,"${uiLabelMap.dateofpurchase} ${uiLabelMap.notEmpty}"))
     							//{
     								if(notEmptyField(officeId,"${uiLabelMap.officeName} ${uiLabelMap.notEmpty}"))
     									{
    										var r=confirm("Are you sure, you want to Update the Form ?")
        									if (r==true)
        									{ 
	     									//alert(""+stat);
	     									form.status.value = stat;
        									form.action="<@ofbizUrl>updateMeterDetail</@ofbizUrl>";
	    									form.submit();
											}
										}
								     //}
							      }
								}
							}
						}
	
</script>              