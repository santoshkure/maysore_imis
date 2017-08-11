<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewApplyForJob.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   11/08/2017	
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for view Apply For Job.-->

<#setting locale="en">
   
    <form method="post" name="viewApplyForJob" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.viewApplyForJob}</b></div>
			</ul>
		</div>
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}<font color="red">*</font></td>
                        <td>1000</td>
                        <td class="label">${uiLabelMap.connectionNo}<font color="red">*</font></td>
                        <td>0987</td>
                   </tr>
                    <tr>
                        <td class="label" >${uiLabelMap.applicationDate}</td>
                        <td>23/07/2017</td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td>Issuefile.doc </td>
				   </tr>
				   <tr>
				        <td class="label" >${uiLabelMap.serviceDate}</td>
                        <td>04/07/2017</td>
				        <td class="label" >${uiLabelMap.serviceTime}</td>
                        <td>10 am</td>
				   </tr>
				   <tr>
				        <td class="label" >${uiLabelMap.feeAmount}</td>
                        <td>10rs/-</td>
                        <td class="label">${uiLabelMap.typeOfJob}</td>
                            <td colspan="5">Borewell </td>
				     </tr>
					 <tr>
					    <td class="label">${uiLabelMap.detailOfJob}</td>
                        <td colspan="1"></td>
                        <td class="label">${uiLabelMap.serviceAddress}</td>
                        <td colspan="1">Karan Plaza,Mysore</td>
					 </tr>
               </tbody>
          </table>
 </form>