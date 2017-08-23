<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewJobDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   07/08/2017	
  	
<#-- #####################################################################################################-->
<#--This ftl is used to View The Job Details-->

<#setting locale="en">
   
    <form method="post" name="viewJobDetails" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.ViewJobDetail}</b></div>
			</ul>
			<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>connectionApply</@ofbizUrl>">
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    				</li>
  				</ul>
 			 </div>
		</div>
		<div class="screenlet-body" id="printId1">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                        <td>78541</td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td>20011</td>
                   </tr>
                    <tr>
                        <td class="label" >${uiLabelMap.applicationDate}</td>
                        <td>07/08/2017</td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td>jobDetails.doc </td>
				   </tr>
				   <tr>
				        <td class="label" >${uiLabelMap.serviceDate}</td>
                        <td>08/08/2017</td>
				        <td class="label" >${uiLabelMap.serviceTime}</td>
                        <td></td>
				   </tr>
				    <tr>
				        <td class="label" >${uiLabelMap.feeAmount}</td>
                        <td>90 Rs</td>
                        <td class="label">${uiLabelMap.typeOfJob}</td>
                        <td>Borewell</td>
				     </tr>
					 <tr>
					    <td class="label">${uiLabelMap.detailOfJob}</td>
                        <td colspan="1"></td>
                        <td class="label">${uiLabelMap.serviceAddress}</td>
                        <td colspan="1">Type-2 Lane 9 Mysore</td>
					 </tr>
                      
               </tbody>
          </table>
     </div>
 </form>
