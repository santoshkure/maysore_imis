<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: registerNewMeterDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Meter Detail -->

<#setting locale="en">
<form method="post" name="searchMeterDetail" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
	<ul>
      <div class="h3" align="center"><b>${uiLabelMap.searchMeterDetail}</b></div> 
        <div class="basic-nav" style="margin-top: -36px;">
          <ul>
            <li>
                <a title="${uiLabelMap.registerNewMeterDetail}" href="<@ofbizUrl>createNewMeter</@ofbizUrl>">
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
              	<td class="label">${uiLabelMap.meterId}</td>
             	<td><input type="text" name="meterId" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.meterNo}</td>
             	<td><input type="text" name="meterNo" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 
			 <tr>
             	<td class="label">${uiLabelMap.meterCondition}</td>
                <td>
                	<select name="meterCondition" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="select">select</option>
                   			<option value="select">select</option>
                   	</select>
                </td>
                <td class="label" colspan="1">${uiLabelMap.meterStatus}</td>
                <td colspan="3">
                	<select name="meterStatus" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="select">select</option>
                   			<option value="select">select</option>
                   	</select>
                </td>
                </tr>
                
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

