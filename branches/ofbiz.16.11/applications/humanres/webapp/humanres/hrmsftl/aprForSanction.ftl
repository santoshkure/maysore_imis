<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: aprForSanction.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#-- 1.1			Pankaj Trivedi	09/08/2017    	
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for create Apply For Job.-->

<#setting locale="en">
   
    <form method="post" name="aprForSanction" action="" class="basic-form">
    	<div class="row">
	    	<div class="alert alert-info">
		    	<ul>
		        	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    		<div class="h3" align="center"><b>${uiLabelMap.aprForSanction}</b></div>
				</ul>
			</div>
			<div class="screenlet-body">
            	<table cellspacing="0" class="basic-table table-responsive">
            	    <tbody>
                	<br>
                	<#-- <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.eE}</font></td></tr>-->
                	<tr><td class="label">${uiLabelMap.customerNo}<font color="red">*</font></td>
                        <td><input type="text" value="" name="cusNo" readonly /></td>
                        <td></td><td></td>
                    </tr>
                	<tr>
                		<td class="label">${uiLabelMap.aprNo}<font color="red">*</font></td>
                        <td><input type="text" value="" name="aprNo"  /></td>
                        <td class="label">${uiLabelMap.aprDate}<font color="red">*</font></td>
                        <td><@htmlTemplate.renderDateTimeField name="aprDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_1" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr> 
                    <tr>
                		<td class="label">${uiLabelMap.workOrderNo}<font color="red">*</font></td>
                        <td><input type="text" value="" name="workOrderNo"  /></td>
                        <td class="label">${uiLabelMap.CommonDate}<font color="red">*</font></td>
                        <td><@htmlTemplate.renderDateTimeField name="workOrderDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    </tr> 
                    <tr>
                		<td class="label">${uiLabelMap.docBookNo}<font color="red">*</font></td>
                        <td><input type="text" value="" name="docBookNo"  /></td>
                        <td class="label">${uiLabelMap.docPageNo}<font color="red">*</font></td>
                        <td><input type="text" value="" name="docPageNo" /></td>
                    </tr>
                	<tr>
                		 	<td colspan="4">
                		 		<center>
                    	 			<div id ="saveBtn">
                    	 				<input name="approve"   type="button" value="${uiLabelMap.approve}" onClick="javascript:approveSan('aprForSanction');"/>
                    	 				<input name="reject"   type="button" value="${uiLabelMap.reject}" onClick="javascript:rejectSan('aprForSanction');"/>
                    	 				<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 			</div>
  	                   	 		</center>
                     	 	</td>
                		</tr>
                	</tbody>
          		</table>
     		</div>
                	
 		</div>
 	</form>

  <script type="text/javascript" language="javascript">

  function approveSan(aprForSanction)
   {
		   var form=document['aprForSanction'];
		      
		      var sure = confirm("Are you sure, you want to Approve the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    function rejectSan(aprForSanction)
   {
		   var form=document['aprForSanction'];
		      
		      var sure = confirm("Are you sure, you want to Reject the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } customerbillcorrection
    }
    
    
    </script>
