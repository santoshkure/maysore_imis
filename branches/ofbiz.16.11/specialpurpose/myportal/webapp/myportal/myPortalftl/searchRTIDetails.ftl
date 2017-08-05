<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchRTIDetails.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Siddhi    	    04 August 2017    -->
<#-- 1.1			Pankaj Trivedi						05/08/2017    

<#-- #####################################################################################################-->
    <script language="javascript" src="/images/jquery/plugins/validate/additional-methods.js"  type="text/javascript"></script>
<form method="post" name="searchRTIDetails" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
   			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.searchRTIApp}</li>
    		<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
					<a title="Create RTI Application" href="<@ofbizUrl>createRTIapplication</@ofbizUrl>">
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
            <td class="label">${uiLabelMap.rtiRefrenceNo}</td>
            <td><input name="RTIreferenceno"  type="text" maxlength="10" value=""></td>
            <td class="label">${uiLabelMap.FormFieldTitle_applicationDate}</td>
             <td>
              <@htmlTemplate.renderDateTimeField name="applicationdate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
             </td>             
       	<tr>
			<td colspan="8"><center><div id="search" align="center"><input type="button"  name="search" value="Search" onclick="javascript:searchRTI('searchRTIDetails');"></center></td>
		</tr>
	</tr>
	</table>
	</div>
	</div>
	
</form>
<form method="post" name="RTIDetailsList" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.RTIApplicationList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
   <div class="">
    <table class="basic-table table-responsive" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
             <td><center>${uiLabelMap.RTIRefNo}<center></td>
	         <td><center>${uiLabelMap.applicantName}<center></td>
             <td><center>${uiLabelMap.FormFieldTitle_applicationDate}</center></td>
             <td><center>${uiLabelMap.modeOfPayment}<center></td>
             <td><center>${uiLabelMap.challanRefrenceNo}</center></td>
             <td><center>${uiLabelMap.applicationBank}</center></td>
             <td><center>${uiLabelMap.RTIStatus}</center></td>
             <td><center>${uiLabelMap.CommonEdit}</center></td>
            
         </tr>
        
      </thead> 
       <tr>
		      	<td align="center">1</td>
	          	<td><center>RTI101</center></td>
			  	<td><center>Ravi Sharma</center></td>
			  	<td><center>04/08/2017</center></td> 
			 	<td><center>Challan</center></td> 
		  	 	<td><center>Ref07</center></td> 
		  	 	<td><center>PNB</center></td>
		  	 	<td><center>Submitted</center></td> 
				<td><center><a href="javascript:editRTIDetails('searchRTIDetails');" class="buttontext" align="center">${uiLabelMap.CommonEdit}</a></center></td>
				     
		</tr>    
      </table>
    </div>
  </div>
</div>
</form>
<script>
function editRTIDetails(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editRTIDetails</@ofbizUrl>";
	    form.submit();
	}
function searchRTI(searchForm)
{
	 var form =document[searchForm];	
        form.action="<@ofbizUrl>RTIappdetails</@ofbizUrl>";
	    form.submit();
}
 </script>