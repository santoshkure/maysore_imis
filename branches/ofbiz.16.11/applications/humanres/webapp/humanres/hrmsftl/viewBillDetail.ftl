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
		border-bottom: 1px solid  #e2e2e0 ;
		background-color: #fffefe ;
		padding:5px;
		padding-left:25px
	}
</style>
<#setting locale="en">
<form method="post" name="viewBill" action="" class="basic-form">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
			 	<td colspan="3" style=" text-align: left;"><img src="/rainbowstone/images/logo_mysore.png" face" width="450" height="100"></td>
			<td colspan="3" style=" text-align: right;"><img src="/rainbowstone/images/waterSave.jpeg" face" width="270 height="100"></td>
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
             	<td colspan ="1" class="label" style="border-right: 2px dotted #28404d;"><center>After Due Date</center></td>
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
			
				<td colspan="2" id="container" style="height: 212px; margin: 0 auto"></td>
				<td colspan="4" style="background-color: #f6f3f2;">
				<center><b><font color="#176949">${uiLabelMap.summaryofCurrentCharges}</font></b></center>
				<table>
                <tr>
                    <td colspan="2" >Water Charges (200 HCF * 5)</td>
                    <td colspan="2"> 1000</td>
                </tr>
                <tr>
                    <td colspan="2">GST</td>
                    <td colspan="2"> 100</td>
                </tr>
                <tr>
                    <td colspan="2">SGST</td>
                    <td colspan="2"> 0</td>
                </tr>
                
                <tr>
                    <td colspan="2">CGST</td>
                    <td colspan="2"> 0</td>
                </tr>
                
                <tr>
                    <td colspan="2" style="border-bottom: 2px solid #b582d3;">IGST</td>
                    <td colspan="2" style="border-bottom: 2px solid #b582d3;"> 0</td>
                </tr>
                
                <tr>
                    <td colspan="2"><font color="#483d8b"><b>Total Charge</b></font></td>
                    <td colspan="2"><b><font color="#483d8b">1100</font></b></td>
                </tr>
            </table>
			</td>
			</tr>
			
			<tr>
			 	<td colspan="6" class="label" style="background-color: #b6c2ce; font-size: smaller;">Note:- Bill generated as per tariff plan and unit cunsumption.</td>
			</tr>
			
        </table>
    </div>
   </div>
</form>

<script>

Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: '${uiLabelMap.previouseMonthDetail}'
    },
    
    xAxis: {
        categories: [
            'April',
            'May',
            'June'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Amount (Rs.)'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
        dataLabels: {
                enabled: true
            },
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Bill Amount',
        color: '#00cc00',
        data: [500, 1200, 1000]

    }]
    });
</script>