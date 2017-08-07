<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewComplaintDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   07/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer complaint Detail -->

<#setting locale="en">
    <form method="post" name="viewComplaintDetails" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.viewComplaintDetail}</b></div>
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                     <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                        <td>4005</td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td>78945</td>
                    </tr>
                    
                     <tr>
                        <td class="label" >${uiLabelMap.complaintDate}</td>
                        <td>07/08/2017</td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td>bill.doc </td>
					  </tr>
					  <tr>
					    <td class="label">${uiLabelMap.complaintDescription}</td>
                        <td>Meter is not working Proprely </td>
                        <td class="label">${uiLabelMap.complaintType}</td>
                        <td>Meter</td>
					  </tr>
					  <tr>
							<td class="label">${uiLabelMap.serviceAddress}</td>
    	                    <td colspan="1">Lane-1 Near Sweet Shop Mysore</td>
                      </tr>
               </tbody>
          </table>
     </div>
     
  
 </form>