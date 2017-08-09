<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createAllotWorkOrder.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   08/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Allot WorkOrder  -->

<#setting locale="en">
<form method="post" name="createAllotWorkOrder" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  					<div class="h3" align="center">${uiLabelMap.createPlumberWorkOrder}</div> 
			</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
          
             <td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>        
        
        	 <tr>
              	<td class="label">${uiLabelMap.connectionNo}<font color="red">*</font></td>
             	<td><input type="text" name="ConnectionNo" value="" style="width:240px;" maxlength="20" readonly></td>
             	<td class="label">${uiLabelMap.workOrderNo}<font color="red">*</font></td>
             	<td><input type="text" name="Workorder" value="" style="width:240px;" maxlength="20"></td>
             	
			 </tr>
			 <tr>
			    <td class="label">${uiLabelMap.customerNo}</td>
             	<td><input type="text" name="customerNo" value="" style="width:240px;" maxlength="50" readonly></td>
			     
              	 <td class="label">${uiLabelMap.CommonDate}</td>
             	 <td colspan="3">
                      <@htmlTemplate.renderDateTimeField name="applyDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                 </td>
             </tr>
             <tr>
                <td class="label">${uiLabelMap.customerName}</td>
             	<td><input type="text" name="CustomerName" value="" style="width:240px;" maxlength="20" readonly></td>
                <td class="label">${uiLabelMap.plumberName}</td>
             	<td><input type="text" name="PlumberName" value="" style="width:240px;" maxlength="20" readonly></td>
             </tr>
             <tr>
                <td class="label">${uiLabelMap.CommonRemark}</td>
                <td><textarea name="remark" maxlength ="500"></textarea></td>
                <td class="label">${uiLabelMap.OrderAddress}</td>
                <td><input name="address" type="text" maxlength="60" value="" readonly</td>
             </tr>
        <tr>
                    	<td colspan="4">
                    		<center>
                    			<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveAllotWorkOrder(createAllotWorkOrder);"/>
                    			<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                      		</center>
                      	</td>
                       </tr>
                    
                </tbody>
             </table>
        </div>
        </div>
    </div>
    </form>

 <script type="text/javascript" language="javascript">

   function saveAllotWorkOrder(createAllotWorkOrder)
   {
		      var form=document['createAllotWorkOrder'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                               form.action = "<@ofbizUrl>allotWorkOrder</@ofbizUrl>";
			                   form.submit();
		                       disSubmit('disBttn');    
		                } 
    }
    
    </script>