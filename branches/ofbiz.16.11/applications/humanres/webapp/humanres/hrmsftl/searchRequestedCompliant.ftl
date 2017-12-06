<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchRequestCompliant.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Request Compliant Detail -->

<form method="post" name="searchCompliantDetails" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.searchRequestCompliant}</b></div> 
			</ul>
		</div>
		<div class="screenlet-body">
        	<table class="basic-table" cellspacing="0">
        		<tr>
              		<td class="label">${uiLabelMap.complaintNo}</td>
             		<td><input type="text" name="complaintId" id="complaintId" value="" style="width:240px;" maxlength="50"></td>
             		<td class="label">${uiLabelMap.customerNo}</td>
             		<td><input type="text" name="customerNo" id="customerNo" value="" style="width:240px;" maxlength="50"></td>
			 	</tr>
			 	<tr>
              		<td class="label">${uiLabelMap.compliantApplyDate}</td>
             		<td>
                      	<@htmlTemplate.renderDateTimeField name="complDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>
             		<td class="label">${uiLabelMap.complaintType}</td>
                	<td>
                		<select name="complaintType" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="meter">Meter</option>
                   			<option value="bill">Bill</option>
                   			<option value="pipeDamage">Pipe Damage</option>
                   			<option value="other">Other</option>
                   		</select>
                	</td>
                </tr>
        	</table>
        		<center>
        			<div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchCompDetail();"/>
					</div>
				</center>
    	</div>
	</div>
</form>

<script type="text/javascript" language="javascript">
     
     function searchCompDetail()
     {
		   	var form=document['searchCompliantDetails'];
            form.action = "<@ofbizUrl>complaintRequest</@ofbizUrl>";
			form.submit(); 
     }

</script>

