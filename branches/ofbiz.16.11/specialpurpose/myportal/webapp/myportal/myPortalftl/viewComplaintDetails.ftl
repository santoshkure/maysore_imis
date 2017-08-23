<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewComplainDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   11/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the view Complain Registration.-->

<#setting locale="en">
   
    <form method="post" name="viewComplainDetails" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		     <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.viewregisterComplaint}</b></div> 
			</ul>
			<div class="basic-nav" style="margin-top: -37px;">
  						<ul>
    					<li>
							<a>
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
                         <td>1002</td>
                         <td class="label">${uiLabelMap.connectionNo}</td>
                         <td>11254</td>
                     </tr>
                     <tr>
                         <td class="label" >${uiLabelMap.complaintDate}</td>
                         <td>05/08/2017</td>
                         <td class="label">${uiLabelMap.assentialDocument}</td>
                         <td>Issue.doc</td>
                        </td>
					  </tr>
					  <tr>
					     <td class="label">${uiLabelMap.complaintDescription}</td>
                         <td colspan="1">Meter Is not working fine</td>
                         <td class="label">${uiLabelMap.complaintType}</td>
                         <td colspan="5">Meter</td>
					  </tr>
					  <tr>
							<td class="label">${uiLabelMap.serviceAddress}</td>
    	                    <td colspan="1">Assi,mysore</td>
                      </tr>
               </tbody>
          </table>
          </div>
 </form>