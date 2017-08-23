<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput   23/08/2017	
<#-- #####################################################################################################-->

<form method="post" name="searchmeterdetails" class="basic-form">

 <div class="row">
  <div class="alert alert-info">
    	<ul>
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.meterReadingDetails}</li>
    		<div class="basic-nav" style="margin-top: -36px;">
            <ul>
            <li>
                <a title="${uiLabelMap.createMeterReading}" href="<@ofbizUrl>createMeterReading</@ofbizUrl>">
                    <i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
                </a>
            </li>
          </ul>
        </div>
 		</ul>
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		  <tr>
			  <td class="label">${uiLabelMap.readingDate}</td>
			  <td>
              <@htmlTemplate.renderDateTimeField name="readingDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="readingDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
              </td>
			  <td class="label">${uiLabelMap.customerNo}</td>
			  <td><input type="text" name="customerno"  value="" /></td>     
		</tr>
		<tr>
			  <td class="label">${uiLabelMap.connectionNo}</td>
			  <td><input type="text" name="connectionno"  value="" /></td>
			  <td class="label">${uiLabelMap.meterNo}</td>
			  <td><input type="text" name="meterNo"  value="" /></td>
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