<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: issueIssueWorkOrder.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0				Shubham Malviya   08/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the issue Issue Work Order -->

<#setting locale="en">
   
    <form method="post" name="issueNewWorkOrder" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		     <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.issueNewWorkOrder}</b></div> 
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
	                	  <tr><td colspan="4"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                	</tr>
                    <tr>
                        <td class="label">${uiLabelMap.workOrderNo}</td>
                        <td><@htmlTemplate.lookupField value='' formName="issueNewWorkOrder" name="issueDetail" id="issueDetail" fieldFormName=""/></td>
                        <td class="label">${uiLabelMap.CommonDate}</td>
                        <td><@htmlTemplate.renderDateTimeField name="date" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.plumberName}</td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td><input type="text" value="" readonly /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.houseOwnerName}</td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.depositReceiptNo}</td>
                        <td><input type="text" value="" readonly /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.ofRs}</td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.CommonDate}</td>
                        <td><@htmlTemplate.renderDateTimeField name="date1" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date1" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td><input type="text" value="" readonly /></td>
                        <td class="label">${uiLabelMap.streetName}</td>
                        <td><input type="text" value="" readonly /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.roadDiggingChargesOfRs}</td>
                        <td colspan="3"><input type="text" value="" readonly /><b>${uiLabelMap.paidtoMysoreNagarapalike}</b></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.stNo}</td>
                        <td><input type="text" value=""  /></td>
                        <td class="label">${uiLabelMap.CommonDate}</td>
                        <td><@htmlTemplate.renderDateTimeField name="date" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.subject}</td>
                        <td><input type="text" value=""  /></td>
                        <td class="label">${uiLabelMap.nonHousehold}</td>
                        <td><input type="text" value=""  /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.receiptNo}</td>
                        <td><input type="text" value=""  /></td>
                        <td class="label">${uiLabelMap.CommonDate}</td>
                        <td><@htmlTemplate.renderDateTimeField name="date2" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.measureEquipmentRate}</td>
                        <td><input type="text" value=""  /></td>
                        <td class="label">${uiLabelMap.receiptNo}</td>
                        <td><input type="text" value=""  /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.CommonDate}</td>
                        <td colspan="3"><@htmlTemplate.renderDateTimeField name="date3" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date3" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr>
                      <tr>
                    	 <td colspan="4"><center>
                    	 <div id ="saveBtn">
                    	 <input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveWorkOrderDetail();"/>
                    	 <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 </center>
                     	 </td>
                     </tr>
               </tbody>
          </table>
     </div>
     
  
 </form>

  <script type="text/javascript" language="javascript">

  function saveWorkOrderDetail()
   {
		   var form=document['issueNewWorkOrder'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                    if( sure == true )
                    {
                        form.action = "<@ofbizUrl>issueWorkOrder</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		            } 
    }
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
