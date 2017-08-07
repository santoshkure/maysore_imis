<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewBillCorrectionDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   07/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer Bill Correction Detail -->

<#setting locale="en">
    <form method="post" name="viewComplaintDetails" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.viewBillCorrection}</b></div>
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                        <td colspan="1">10001</td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                         <td>987643</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.billNo}</td>
                        <td>1112</td>
                     </tr>
                     <tr>
                        <td class="label" >${uiLabelMap.billCorrectionApplyDate}</td>
                        <td>04/08/2017</td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                       <td>meterReading.doc</td>
                        </td>
					 </tr>
					  <tr>
					    <td class="label">${uiLabelMap.issueDetails}</td>
                        <td colspan="1">Fault In Reading Of Meter</td>
					  </tr>
                      
               </tbody>
          </table>
     </div>
 </form>