<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerPortalHome.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   	02/08/2017		
<#-- 1.1           Shubham malviya 	07/08/2017								--->
<#-- #####################################################################################################-->
<#--This ftl is used to show the Employee Dash Board of MCC which contain essential information .-->

<#setting locale="en">

<form name="employeeDashBoard" method="post" action="">
<#--External java script File-->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<#-- End -->

	<div class="row">
    	<div class="alert alert-info">
    		<ul>
	      		<div><b>Customer Dash Board</b></div> 
      		</ul>
      	</div>
		</br>
		<#-- Services Part for Employee and Admin -->
   		<div class="col-md-3">
   			<div class="alert alert-info">
   				<ul>
      				<div><b>Customer Services</b></div> 
   				</ul>
   		 	</div>
   			<div class="row" style="background:#f5f5f5;">
				<ul class="arrow-link">
					<li>
						<a href="connectionApply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for New Connection </a>
					</li>
					<li>
						<a href="createIllegalToLegal"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Illigal to Legal Connection</a>
					</li>
					<li>
						<a href="searchConnectionApply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Connection Detail</a>
					</li>
					<li>
						<a href="disconnectionApply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Disconnection </a>
					</li>
					<li>
						<a href="disconnectionApplyDetail"><i class="fa fa-arrow-right" aria-hidden="true"></i> Disconnection Detail</a>
					</li>
					<li>
						<a href="kattaChangeRequest"><i class="fa fa-arrow-right" aria-hidden="true"></i> Khata Change Request </a>
					</li>
					<li>
						<a href="khataChangeDetail"><i class="fa fa-arrow-right" aria-hidden="true"></i> Khata Change Detail</a>
					</li>
					<li>
						<a href="createcustomerbillcorrection"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Bill Correction </a>
					</li>
					<li>
						<a href="searchbillcorrection"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Correction Details </a>
					</li>
					<li>
						<a href="createregisterComplain"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register Complaint </a>
					</li>
					<li>
						<a href="searchcomplainregister"><i class="fa fa-arrow-right" aria-hidden="true"></i> Complaint Details </a>
					</li>
					<li>
						<a href="billhistory"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill History </a>
					</li>
					<li>
						<a href="billpayment"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Payment </a>
					</li>
					<li>
						<a href="billpaymentHistory"><i class="fa fa-arrow-right" aria-hidden="true"></i> Payment History </a>
					</li>
					<li>
						<a href="billcalculator"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Calculator </a>
					</li>
					<li>
						<a href="searchapplyforjob"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Job </a>
					</li>
					<li>
						<a href="createRTIapplication"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application</a>
					</li>
					<li>
						<a href="RTIappdetails"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application Details </a>
					</li>
					<li>
						<a href="updatecustomerdetails"><i class="fa fa-arrow-right" aria-hidden="true"></i> Update Personal Detail </a>
					</li>
					<li>
						<a href="createGrievanceCusPortal"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply Grievance </a>
					</li>
					<li>
						<a href="searchGrievanceCusPortal"><i class="fa fa-arrow-right" aria-hidden="true"></i> Grievance Detail </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Application Status </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> FAQ </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Help </a>
					</li>
				</ul>
			</div>	
   		</div>
   		<#-- End -->
		<#-- Analysis Graph for Employee -->
   		<div class="col-md-9"> 
   			<div class="alert alert-info">
   				<ul>
      				<div align="center" vertical-align="middle"><b>Analysis Report</b></div> 
   				</ul>
			</div>
			<#-- <div class="row" style="background:#f5f5f5; padding-top: 15px;">
				<div class="col-md-4" id="container" style="height: 200px;  margin: 0 auto"></div>
				<div class="col-md-4"id="container1" style="height: 200px; margin: 0 auto"></div>
				<div class="col-md-4" id="container2" style=" height: 200px;  margin: 0 auto"></div>
			</div>-->
			<div class="row" style="background:#f5f5f5;">
				<div class="col-md-12" id="container3" style="height: 300px;  margin: 0 auto"></div>
			</div>
			<div class="row" style="background:#f5f5f5;">
				<div class="col-md-12" id="container4" style="height: 300px;  margin: 0 auto"></div>
			</div>
   		</div>
   		<#-- End -->
	</div>
</form>

<script>
<#-- Start Forth Graph -->

$.getJSON('https://www.highcharts.com/samples/data/jsonp.php?filename=usdeur.json&callback=?', function (data) {

    Highcharts.chart('container3', {
        chart: {
            zoomType: 'x'
        },
        title: {
            text: 'Last Two Year Water Consumption'
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
                    'Pinch To Zoom' : 'Pinch the chart to zoom in'
        },
        xAxis: {
            type: 'datetime'
        },
        yAxis: {
            title: {
                text: 'Gallon'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                marker: {
                    radius: 2
                },
                lineWidth: 1,
                states: {
                    hover: {
                        lineWidth: 1
                    }
                },
                threshold: null
            }
        },

        series: [{
            type: 'area',
            name: 'USD to EUR',
            data: data
        }]
    });
});
</script>
<#-- Forth End -->

<#-- Start Fifth Graph -->
<script>
	Highcharts.chart('container4', {
    	chart: {
        	type: 'column'
    },
    title: {
        text: 'Last Five Year Bill Amount'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
            '2013',
            '2014',
            '2015',
            '2016',
            '2017'            
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
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Total Billing',
        data: [14900.9, 17100.5, 10600.4, 12900.2, 14400.0]

    }, {
        name: 'Total Paid',
        data: [8300.6, 7800.8, 9800.5, 9300.4, 10600.0]

    }]
});
</script>

 

