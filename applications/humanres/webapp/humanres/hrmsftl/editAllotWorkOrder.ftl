<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editAllotWorkorder.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   08/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for Edit Allot Work Order-->


<#setting locale="en">
   
    <form method="post" name="editAllotWorkOrder" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center">${uiLabelMap.editPlumberWork}</div>
			</ul>
		</div>
		    <div class="screenlet-body">
               <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
	                	  <tr><td colspan="4"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                	</tr>
                      <tr>
                          	<td class="label">${uiLabelMap.connectionNo}</td>
             	            <td><input type="text" name="ConnectionNo" value="0987" style="width:240px;" maxlength="20" ></td>
             	            <td class="label">${uiLabelMap.workOrderNo}</td>
             	            <td><input type="text" name="Workorder" value="" style="width:240px;" maxlength="20"></td>
			         </tr>
			         <tr>
			               <td class="label">${uiLabelMap.customerNo}</td></td>
             	           <td><input type="text" name="customerNo" value="10001" style="width:240px;" maxlength="50" ></td>
                           <td class="label">${uiLabelMap.CommonDate}</td>
             	           <td colspan="3">
                           <@htmlTemplate.renderDateTimeField name="applyDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                   </td>
                   </tr>
                    <tr>
                           <td class="label">${uiLabelMap.customerName}</td>
             	           <td><input type="text" name="CustomerName" value="" style="width:240px;" maxlength="20" ></td>
                           <td class="label">${uiLabelMap.plumberName}</td>
             	           <td><input type="text" name="PlumberName" value="" style="width:240px;" maxlength="20" ></td>
                   </tr>
                   <tr>
                           <td class="label">${uiLabelMap.CommonRemark}</td>
                           <td><textarea name="remark" maxlength ="500"></textarea></td>
                           <td class="label">${uiLabelMap.OrderAddress}</td>
                           <td><input name="address" type="text" maxlength="60" value="" </td>
                  </tr>
                      <tr>
                    	  <td colspan="4"><center>
                    	  <div id ="saveBtn">
                    	  <input name="save"   type="button" value="${uiLabelMap.CommonUpdate}" onClick="javascript:editWorkOrder('editAllotWorkOrder');"/>
                    	  <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	  </center>
                     	</td>
                     </tr>
               </tbody>
          </table>
     </div>
 </form>
<script type="text/javascript" language="javascript">

function editWorkOrder(editAllotWorkOrder)
   {
		      var form=document['editAllotWorkOrder'];
		      
		      var sure = confirm("Are you sure, you want to Update the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>allotWorkOrder</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>