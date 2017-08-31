<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewBillDetail.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   23/08/2017
<#-- #####################################################################################################-->
<#-- This ftl is used to show Bill --->
<style>
	.basic-form table tr td{
		border:none;
		border-bottom: 2px solid #b3b074;
		background-color: #dce06966;
		padding:5px;
		padding-left:25px
	}
</style>
<#setting locale="en">
<form method="post" name="viewBill" action="" class="basic-form">
   <div class="row">
    <div class="alert alert-info">
  		<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  			<div class="h3" align="center"><b> Bill Detail Jul-Aug 2017</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0" style="width:64%; margin: 0 auto;border: 2px solid #898431;">
        <tr>
			 	<td colspan="6" style="text-align: center;"><img src="/rainbowstone/images/imis-logo.png" width="150px"></img></td>
			</tr>
			 <tr>
			 	<td class="label">${uiLabelMap.billNo}</td>
             	<td><b>BillNo1</b></td>
			 	<td class="label">${uiLabelMap.customerNo}</td>
             	<td>CustNo10001</td>
             	<td class="label">${uiLabelMap.connectionNo}</td>
             	<td>CN10001</td>
			</tr>
			
			<tr>
			 	<td class="label">${uiLabelMap.customerName}</td>
             	<td>Ravi Kuamr Rai</td>
             	<td class="label">${uiLabelMap.fatherName}</td>
             	<td>Raju Kuamr Rai</td>
             	<td class="label">${uiLabelMap.mobileNo}</td>
             	<td>9685889585</td>
			</tr>
			<tr>
			<td class="label">${uiLabelMap.CommonEmail}</td>
             	<td>acve@gmail.com</td>
             	<td class="label">${uiLabelMap.HrmsAddress}</td>
             	<td colspan="3">Sahu Colony Mysore</td>
             	</tr>
             	
             	 <tr>
			 	<td class="label">${uiLabelMap.billingPeriod}</td>
             	<td><b>jul-Aug 2017</b></td>
			 	<td class="label">${uiLabelMap.billDate}</td>
             	<td>23/08/2017</td>
             	<td class="label">${uiLabelMap.dueDate}</td>
             	<td>23/08/2017</td>
			</tr>
			
			 <tr style="padding: 15px;border-bottom: 3px solid #5393c9;">
			 	<td class="label">${uiLabelMap.meterNo}</td>
             	<td >MN10001</td>
			 	<td class="label">${uiLabelMap.connectionType}</td>
             	<td >Domestic</td>
             	<td class="label">${uiLabelMap.tariffPlan}</td>
             	<td >Tariff 10001 plan</td>
			</tr>
			
			<tr>
			 	<td colspan ="2" class="label"><center>${uiLabelMap.currentReading}</center></td>
			 	<td colspan ="2" class="label"><center>${uiLabelMap.previousReding}</center></td>
             	<td colspan ="2" class="label"><center>${uiLabelMap.totalUsed}</center></td>
			</tr>
			
			<tr style="padding: 15px;border-bottom: 3px solid #5393c9;">
             	<td colspan ="2"><center>1200</center></td>
             	<td colspan ="2"><center>1000</center></td>
             	<td colspan ="2"><center>200 (HCF)</center></td>
			</tr>
			
			<tr>
			 	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>${uiLabelMap.previousBill}</center></td>
			 	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>${uiLabelMap.previousPayments}</center></td>
             	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>${uiLabelMap.balanceAmount}</center></td>
             	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>${uiLabelMap.currentCharges}</center></td>
			 	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>${uiLabelMap.totalAmountDue}</center></td>
             	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>${uiLabelMap.payableAfterDueDate}</center></td>
			</tr>
			
			<tr style="padding: 15px;border-bottom: 3px solid #5393c9;">
             	<td colspan ="1" style="border-right: 2px dotted #28404d;"><center>1000</center></td>
             	<td colspan ="1" style="border-right: 2px dotted #28404d;"><center>500</center></td>
             	<td colspan ="1" style="border-right: 2px dotted #28404d;"><center>500</center></td>
             	<td colspan ="1" style="border-right: 2px dotted #28404d;"><center>1100</center></td>
             	<td colspan ="1" style="border-right: 2px dotted #28404d;"><center><b><font color="#483d8b">1600</font></b></center></td>
             	<td colspan ="1" style="border-right: 2px dotted #28404d;"><center>1800</center></td>
			</tr>
			<tr>
				<td colspan="2" class="label" style="border-color: #28404d; background-color: #cfe6ff; border-right: 2px solid #28404d;"><center>${uiLabelMap.previouseMonthDetail}</center></td>
			 	<td colspan="4" class="label" style="border-color: #28404d; background-color: #cfe6ff; border-right: 2px solid #28404d;"><center>${uiLabelMap.summaryofCurrentCharges}</center></td>
			</tr>
			
			<tr>
				<td style="border-color: #28404d; background-color: #cfe6ff;"><b>${uiLabelMap.CommonMonth}</b></td>
			    <td style="border-color: #28404d; background-color: #cfe6ff; border-right: 2px solid #28404d;"><b>${uiLabelMap.billAmount}</b></td>
			 	<td colspan="2" class="label" style="background-color: #f6f3f2;"><left>Water Charges (200 HCF * 5)</left></td>
             	<td colspan="2" style="background-color: #FFF;"><center>1000</center></td>
			</tr>
			
			<tr>
				<td style="border-color: #28404d; background-color: #cfe6ff;">June</td>
			    <td style="border-color: #28404d; background-color: #cfe6ff; border-right: 2px solid #28404d;">1000</td>
			 	<td colspan="2" class="label" style="background-color: #f6f3f2;"><left>${uiLabelMap.GST}</left></td>
             	<td colspan="2" style="background-color: #FFF;"><center>100</center></td>
			</tr>
			
			<tr>
				<td style="border-color: #28404d; background-color: #cfe6ff;">May</td>
				<td style="border-color: #28404d; background-color: #cfe6ff; border-right: 2px solid #28404d;">100</td>
			 	<td colspan="2" class="label" style="background-color: #f6f3f2;"><left>Other Charges</left></td>
             	<td colspan="2" style="background-color: #FFF;"><center>0</center></td>
			</tr>
			
			<tr>
				<td style="border-color: #28404d; background-color: #cfe6ff;">April</td>
				<td style="border-color: #28404d; background-color: #cfe6ff; border-right: 2px solid #28404d;">100</td>
			 	<td colspan="2" class="label" style="background-color: #f6f3f2;"><left>${uiLabelMap.totalcurrentbillamount}</left></td>
             	<td colspan="2" style="background-color: #FFF;"><b><center>1100</center></b></td>
			</tr>
			
			<tr>
			 	<td colspan="6" class="label" style="background-color: #b6c2ce; font-size: smaller;">Note:- Bill generated as per tariff plan and unit cunsumption.</td>
			</tr>
			
        </table>
    </div>
   </div>
</form>