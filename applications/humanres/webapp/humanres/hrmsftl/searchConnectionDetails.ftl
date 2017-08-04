<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchConnectionDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Connection Detail -->

<#setting locale="en">
<form method="post" name="customerDeatil" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  			<div class="h3" align="center"><b>${uiLabelMap.searchConnectionDetail}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.customerName}</td>
             	<td><input type="text" name="nameOfCustomer" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.customerNo}</td>
             	<td><input type="text" name="customerNo" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 <tr>
              	<td class="label">${uiLabelMap.connectionNo}</td>
             	<td><input type="text" name="connectionNo" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.applicationType}</td>
                <td>
                	<select name="applicationType" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="Permanent">Permanent</option>
                   			<option value="Temporary">Temporary</option>
                   	</select>
                </td>
                </tr>
                <tr>
                <td class="label" colspan="1">${uiLabelMap.CommonStatus}</td>
                <td colspan="3">
                	<select name="status" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="Approved">Approved</option>
                   			<option value="Rejected">Rejected</option>
                   	</select>
                </td>
			 </tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

