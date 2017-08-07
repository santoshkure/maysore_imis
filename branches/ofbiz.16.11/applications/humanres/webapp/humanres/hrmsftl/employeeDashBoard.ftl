<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: employeeDashBoard.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Pankaj Trivedi   31/07/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to show the Employee Dash Board of MCC which contain essential information .-->

<#setting locale="en">

<form name="employeeDashBoard" method="post" action="">
<#--External java script File-->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<#-- End -->

<style>
	DIV.row{
		background:transparent;
	}
	.text-right div{
		font-size: 13px;
		font-weight: 600;
	}
</style>
	<div class="row" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
    	<div class="alert alert-info">
    		<ul>
	      		<div><b>Employee Dash Board</b></div> 
      		</ul>
      	</div>
		</br>
		<#-- Top Panel -->
		<div id="page-wrapper">
        	<div class="row">
            	<div class="col-lg-3 col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-handshake-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>Total Issued Connection</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"><a href="connectionDetails">View Details</a></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tint fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>Water Supply</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user-circle fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>Total Customer</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"><a href="customerDeatil">View Details</a></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-list-alt fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>Total Revenue Collection</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
            </div>
		</div>
		<#-- Services Part for Employee and Admin -->
   		<div class="col-md-3">
   			<div class="alert alert-info">
   				<ul>
      				<div><b>Employee Services</b></div> 
   				</ul>
   		 	</div>
   			<div class="row" style="background:#f5f5f5;">
				<ul class="arrow-link">
					<li>
						<a href="empCreateNewCustomer"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register New Customer </a>
					</li>
					<li>
						<a href="approveCustomerDetail"><i class="fa fa-arrow-right" aria-hidden="true"></i> Approve New Customer </a>
					</li>
					<li>
						<a href="customerDeatil"><i class="fa fa-arrow-right" aria-hidden="true"></i> Customer Details </a>
					</li>
					<li>
						<a href="createNewConnection"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register New Connection </a>
					</li>
					<li>
						<a href="approveNewConnection"><i class="fa fa-arrow-right" aria-hidden="true"></i> Approve New Connection </a>
					</li>
					<li>
						<a href="connectionDetails"><i class="fa fa-arrow-right" aria-hidden="true"></i> Connection Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Edit Personal Data </a>
					</li>
					<li>
						<a href="registerMeterDetails"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register Meter Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Enter Meter Reading </a>
					</li>
					<li>
						<a href="issueWorkOrder"><i class="fa fa-arrow-right" aria-hidden="true"></i> Issue Work Order </a>
					</li>
					<li>
						<a href="allotWorkOrder"><i class="fa fa-arrow-right" aria-hidden="true"></i> Allot Work Order to Plumber </a>
					</li>
					<li>
						<a href="arrangeWaterSupply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Arrange Water Supply </a>
					</li>
					<li>
						<a href="meterChangeReplacement"><i class="fa fa-arrow-right" aria-hidden="true"></i> Meter Change Details</a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Grievance Details </a>
					</li>
					<li>
						<a href="complaintRequest"><i class="fa fa-arrow-right" aria-hidden="true"></i> Complaint Details</a>
					</li>
					<li>
						<a href="khataChangeRequest"><i class="fa fa-arrow-right" aria-hidden="true"></i> Khata Change Details </a>
					</li>
					<li>
						<a href="RtiApplyDetail"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register Employee </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Employee Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> User Permission </a>
					</li>
					<li>
						<a href="EntitySQLProcessorEmpDashboard"><i class="fa fa-arrow-right" aria-hidden="true"></i> Query Engine </a>
					</li>
					<li>
						<a href="billCorrectionRequest"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Correction </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Details </a>
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
			<div class="row" style="background:#f5f5f5;">
				<div class="col-md-12" id="container3" style="height: 300px;  margin: 0 auto"></div>
			</div>
			<div class="row" style="background:#f5f5f5;">
				<div class="col-md-12" id="container4" style="height: 300px;  margin: 0 auto"></div>
			</div>
			<div class="row" style="background:#f5f5f5; padding-top: 15px;">
				<div class="col-md-4" id="container" style="height: 200px;  margin: 0 auto"></div>
				<div class="col-md-4"id="container1" style="height: 200px; margin: 0 auto"></div>
				<div class="col-md-4" id="container2" style=" height: 200px;  margin: 0 auto"></div>
			</div>
			
   		</div>
   		<#-- End -->
	</div>
</form>

 
 
 
<#-- Start First Graph -->
<script>
						Highcharts.getOptions().plotOptions.pie.colors = (function () 
						{
    						var colors = [],
        					base = Highcharts.getOptions().colors[0],
        					i;

    						for (i = 0; i < 10; i += 1) 
    						{
				        		colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
    						}
    						return colors;
						}());

						Highcharts.chart('container', 
						{
    						chart: {
        					plotBackgroundColor: null,
        					plotBorderWidth: null,
       						plotShadow: false,
        					type: 'pie'
    						},
    						title: 
    						{
        						text: 'Issued Connection'
    						},
    						tooltip: {
       						pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    					},	
    					plotOptions: 
    					{
        					pie: {
            					allowPointSelect: true,
           						cursor: 'pointer',
            					size: 100,
            					innerSize: 70,
            					dataLabels: {
                					enabled: true,
                					format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                					style: {
                    				color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                					}	
            					}
        					}
    					},
    					series: [{
        				name: 'Brands',
        				data: [
            			{ name: 'M', y: 56.33 },
            			{ name: 'C', y: 24.03 },
            			{ name: 'F', y: 10.38 }
        				]	
    					}		]
						});
</script>
<#-- First End -->
<#-- Start Second Graph -->
<script>
						Highcharts.getOptions().plotOptions.pie.colors = (function () 
						{
    						var colors = [],
        					base = Highcharts.getOptions().colors[0],
        					i;
	
   		 					for (i = 0; i < 10; i += 1) 
    						{
					        	colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
    						}
    						return colors;
						}());

						Highcharts.chart('container1', 
						{
    						chart: {
        					plotBackgroundColor: null,
        					plotBorderWidth: null,
       						plotShadow: false,
        					type: 'pie'
    						},
    						title: 
    						{
        						text: 'Complaint Status'
    						},
    						tooltip: {
       						pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    						},
    						plotOptions: 
    						{
        						pie: {
            					allowPointSelect: true,
           						cursor: 'pointer',
            					size: 100,
            					innerSize: 70,
            					dataLabels: {
                					enabled: true,
                					format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                					style: {
                    				color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                					}
            					}
        					}
    					},
    					series: [{
        				name: 'Brands',
        				data: [
            			{ name: 'M', y: 56.33 },
            			{ name: 'C', y: 24.03 },
            			{ name: 'F', y: 10.38 }
        				]
    					}		]
						});
</script>
<#-- Second End -->
<#-- Start Third Graph -->
<script>
					Highcharts.getOptions().plotOptions.pie.colors = (function () 
					{
    					var colors = [],
        				base = Highcharts.getOptions().colors[0],
        				i;

    					for (i = 0; i < 10; i += 1) 
    					{
				        	colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
    					}
    					return colors;
					}());

					Highcharts.chart('container2', 
					{
    					chart: {
        				plotBackgroundColor: null,
        				plotBorderWidth: null,
       					plotShadow: false,
        				type: 'pie'
    					},
    					title: 
    					{
        					text: 'RTI Status'
    					},
    					tooltip: {
       					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    				},
    				plotOptions: 
    				{
        				pie: {
            			allowPointSelect: true,
           				cursor: 'pointer',
            			size: 100,
            			innerSize: 70,
            			dataLabels: {
                		enabled: true,
                		format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                		style: {
                    	color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                	}
            		}
        			}
    				},
    				series: [{
        			name: 'Brands',
        			data: [
            		{ name: 'M', y: 56.33 },
            		{ name: 'C', y: 24.03 },
            		{ name: 'F', y: 10.38 }
        		]
    		}		]
			});
</script>
<#-- Third Graph -->
<#-- Start Forth Graph -->
<script>
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
        text: 'Last Five Year Revenue Collection'
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
            text: 'Amount (Lakh)'
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
        data: [149.9, 171.5, 106.4, 129.2, 144.0]

    }, {
        name: 'Total Collection',
        data: [83.6, 78.8, 98.5, 93.4, 106.0]

    }]
});
</script>
<#-- Fifth End -->
