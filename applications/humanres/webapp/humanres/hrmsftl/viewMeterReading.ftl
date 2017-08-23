<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput   23/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view meter reading details -->

<#setting locale="en">
   
    <form method="post" name="viewmeterreading" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		     <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		     <div class="h3" align="center"><b>${uiLabelMap.viewMeterReading}</b></div> 
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	
                <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                    <tr>
                        <td class="label">${uiLabelMap.connectionId}</td>
                        <td>10001</td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td>CNMCC10001</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td>Domestic</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td>Permanent</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>22/08/2017</td>
                       
                    </tr>
                     <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.customerDetail}</font></td></tr>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                         <td>10001</td>
                        <td class="label">${uiLabelMap.firstName}</td>
                        <td>Ravi</td>
                       
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>Nath </td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td>Sharma</td>
                      
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>15/05/1987</td>
                      	
                        <td class="label">${uiLabelMap.gender}</td>
                        <td>Male</td>
                       
                    </tr>
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.readingDetail}</font></td></tr>
                    <tr>
                        <td class="label">${uiLabelMap.previousReading}</td>
                        <td>1100</td>
                        <td class="label">${uiLabelMap.currentReading}</td>
                        <td>1500</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.totalpayableUnit}</td>
                        <td>2600</td>
                        <td class="label">${uiLabelMap.previousBalance}</td>
                        <td>5500</td>
                    </tr>
                     <tr>
                        <td class="label">${uiLabelMap.surcharges}</td>
                        <td>12%</td>
                        <td class="label">${uiLabelMap.tariffTaxDetails}</td>
                        <td>tarifftax</td>
                        
                    </tr>
                     <tr>
                        <td class="label">${uiLabelMap.totalPayableAmount}</td>
                        <td>13000</td>
                        <td class="label">${uiLabelMap.billgenerationDate}</td>
                        <td>22/08/2017</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.lastDateSubmission}</td>
                        <td>23/08/2017</td>
                        <td class="label">${uiLabelMap.amountAftDueDate}</td>
                        <td>24/08/2017</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.readingDate}</td>
                        <td>23/08/2017</td>
                        <td class="label">${uiLabelMap.remark}</td>
                        <td>remarks</td>
                    </tr>
          </table>
     </div>
     
  
 </form>

  
  