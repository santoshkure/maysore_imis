<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput   22/08/2017	
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search apply for job.-->


<form method="post" name="searchjobdetails" class="basic-form">

 <div class="row">
  <div class="alert alert-info">
    	<ul>
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.applyForJob}</li>
 		</ul>
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		  <tr>
			  <td class="label">${uiLabelMap.jobNo}</td>
			  <td><input type="text" name="jobNo"  value="" /></td>  
			  <td class="label">${uiLabelMap.customerNo}</td>
			  <td><input type="text" name="customerno"  value="" /></td>     
		</tr>
		<tr>
			  <td class="label">${uiLabelMap.connectionNo}</td>
			  <td><input type="text" name="connectionno"  value="" /></td>
			  <td class="label">${uiLabelMap.applicationDate}</td>
			  <td>
              <@htmlTemplate.renderDateTimeField name="applicationDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applicationDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
              </td> 
		</tr>
  
         <tr>
				<td colspan="4">
					<center><div align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick=""/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>