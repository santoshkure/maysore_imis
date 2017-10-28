<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerPortalHome.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   	02/08/2017		
<#-- 1.1           Shubham malviya 	07/08/2017								--->
<#-- #####################################################################################################-->
<#--This ftl is used to show the Employee Dash Board of MCC which contain essential information .-->
<style>
	DIV.row{
		background:transparent;
	}
	.panel-heading{
		border-radius: 30px 0 0 0;
	}
	.panel-primary{
		border-radius: 0 0 30px 0;
	}
	.panel{
		border-radius: 30px 0 30px 0;
	}
	.panel-footer{
		background-color: transparent !important;
	}
	.text-right div{ 
		font-size:15px
	}
</style>
<#setting locale="en">

<form name="employeeDashBoard" method="post" action="">

<#--External java script File-->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<#-- End -->

	<div class="row" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
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
   			<div class="row" style="background:#f1f1f1;">
				<div style="text-align:center">
					<i class="fa fa-user-circle" aria-hidden="true" style="padding: 20px; font-size: 1700%; color: rgb(49, 112, 143);"></i>
   					<a href="createIllegalToLegal"><i aria-hidden="true"></i> Upload Photo</a>
					
   				</div>
   				<hr></hr>
				<ul class="arrow-link">
					<#--  <li>
						<a href="connectionApply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for New Connection </a>
					</li>-->
					<li>
						<a href="createIllegalToLegal"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Illigal to Legal Connection</a>
					</li>
					<#-- <li>
						<a href="searchConnectionApply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Connection Detail</a>
					</li>-->
					<#-- <li>
						<a href="disconnectionApply"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Disconnection </a>
					</li>
					<#-- <li>
						<a href="disconnectionApplyDetail"><i class="fa fa-arrow-right" aria-hidden="true"></i> Disconnection Detail</a>
					</li>-->
					<li>
						<a href="kattaChangeRequest"><i class="fa fa-arrow-right" aria-hidden="true"></i> Khata Change Request </a>
					</li>
					<li>
						<a href="khataChangeDetail"><i class="fa fa-arrow-right" aria-hidden="true"></i> Khata Change Detail</a>
					</li>
					<#-- <li>
						<a href="createcustomerbillcorrection"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Bill Correction </a>
					</li>
					<#-- <li>
						<a href="searchbillcorrection"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Correction Details </a>
					</li>-->
					<#-- <li>
						<a href="createregisterComplain"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register Complaint </a>
					</li>-->
					<#-- <li>
						<a href="searchcomplainregister"><i class="fa fa-arrow-right" aria-hidden="true"></i> Complaint Details </a>
					</li>-->
					<#-- <li>
						<a href="billhistory"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill History </a>
					</li>
					<li>
						<a href="billpayment"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Payment </a>
					</li>-->
					<li>
						<a href="billpaymentHistory"><i class="fa fa-arrow-right" aria-hidden="true"></i> Payment History </a>
					</li>
					<li>
						<a href="billcalculator"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Calculator </a>
					</li>
					<#-- <li>
						<a href="searchapplyforjob"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Job </a>
					</li>-->
					<#-- <li>
						<a href="createRTIapplication"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application</a>
					</li>
					<#-- <li>
						<a href="RTIappdetails"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application Details </a>
					</li>-->
					<li>
						<a href="updatecustomerdetails"><i class="fa fa-arrow-right" aria-hidden="true"></i> Update Personal Detail </a>
					</li>
					<#-- <li>
						<a href="createGrievanceCusPortal"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply Grievance </a>
					</li>
					<#-- <li>
						<a href="searchGrievanceCusPortal"><i class="fa fa-arrow-right" aria-hidden="true"></i> Grievance Detail </a>
					</li>-->
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
			<#--<div class="row" style="background:#f5f5f5;">
				<div class="col-md-12" id="container3" style="height: 300px;  margin: 0 auto"></div>
			</div>
			<div class="row" style="background:#f5f5f5;">
				<div class="col-md-12" id="container4" style="height: 300px;  margin: 0 auto"></div>
			</div>-->
			<div id="page-wrapper">
			<div class="row" style="background:#f1f1f1; padding-top: 15px;">
        		<div class="col-lg-3 col-md-3">
                   	<div class="row">
                   		<div class="panel panel-primary">
                       		<div class="panel-heading">
                           		<div class="row">
                               		<div class="col-xs-3">
                                   		<i class="fa fa-plus-circle fa-3x"></i>
                               		</div>
                               		<div class="col-xs-9 text-right">
                                   		<div>New Connection</div>
                               		</div>
                           		</div>
                       		</div>
                       		<a href="#">
                           		<div class="panel-footer">
                               		<span class="pull-left"><a href="connectionApply">Click for apply</a></span>
                               		<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                	<div class="clearfix"></div>
                           		</div>
                        	</a>
                    	</div>
	                </div>
    	            <div class="row">
        	            <div class="panel panel-green">
            	            <div class="panel-heading">
                            	<div class="row">
                                	<div class="col-xs-3">
                                    	<i class="fa fa-random fa-3x"></i>
                                	</div>
                                	<div class="col-xs-9 text-right">
                                    	<div>Connection Details</div>
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
                	<div class="row">
	                    <div class="panel panel-yellow">
    	                    <div class="panel-heading">
        	                    <div class="row">
            	                    <div class="col-xs-3">
                	                    <i class="fa fa-exchange fa-3x"></i>
                    	            </div>
                        	        <div class="col-xs-9 text-right">
                                	    <div>Transaction Details</div>
                                	</div>
                            	</div>
                        	</div>
                        	<a href="#">
                            	<div class="panel-footer">
                            	    <span class="pull-left"><a href="billpaymentHistory">View Details</a></span>
                            	    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            	    <div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
                	<div class="row">
	                    <div class="panel panel-red">
    	                    <div class="panel-heading">
        	                    <div class="row">
            	                    <div class="col-xs-3">
                	                    <i class="fa fa-pencil-square-o fa-3x"></i>
                    	            </div>
                        	        <div class="col-xs-9 text-right">
                                	    <div>Bill Correction</div>
                                	</div>
                            	</div>
   							</div>
                        	<a href="#">
                            	<div class="panel-footer">
                            	    <span class="pull-left"><a href="searchbillcorrection">View Details</a></span>
                            	    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            	    <div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
            	</div>
		       	<div class="col-lg-6 col-md-6">
                    <div class="row">
                    	<div class="col-lg-6 col-md-6">
                    		<div class="panel panel-green">
                        		<div class="panel-heading">
                        	    	<div class="row">
                            		    <div class="col-xs-3">
                                		    <i class="fa fa-file-text fa-3x"></i>
                                		</div>
                                		<div class="col-xs-9 text-right">
                                		    <div>Bill Details</div>
                                		</div>
                            		</div>
                        		</div>
                        		<a href="#">
                            		<div class="panel-footer">
                            		    <span class="pull-left"><a href="billhistory">View Details</a></span>
                            		    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            		    <div class="clearfix"></div>
                            		</div>
                        		</a>
                    		</div>
                		</div>
                		<div class="col-lg-6 col-md-6">
	                    	<div class="panel panel-yellow">
    	                	    <div class="panel-heading">
        	                 	   	<div class="row">
            	                    	<div class="col-xs-3">
                	                    	<i class="fa fa-credit-card-alt fa-3x"></i>
                    	           		</div>
                        	        	<div class="col-xs-9 text-right">
                            	        	<div>Make Payment</div>
                            	    	</div>
                            		</div>
                        		</div>
                        		<a href="#">
                            		<div class="panel-footer">
                            		    <span class="pull-left"><a href="billhistory">View Details</a></span>
                                		<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                		<div class="clearfix"></div>
                            		</div>
                        		</a>
                    		</div>
                		</div>
                	</div>
                	
                	<div class="row">
                		
							<div id="container4" style="height: 235px;  margin-bottom: 20px; border-radius: 90px;"></div>
                		
                	</div>
				
        			<div class="row">
            			<div class="col-lg-6 col-md-6">
                    		<div class="panel panel-yellow">
                        		<div class="panel-heading">
                            		<div class="row">
                                		<div class="col-xs-3">
                                    		<i class="fa fa-info-circle fa-3x"></i>
                                		</div>
                                		<div class="col-xs-9 text-right">
                                    		<div>RTI Details</div>
                                		</div>
                            		</div>
                        		</div>
                        		<a href="#">
                            		<div class="panel-footer">
                                		<span class="pull-left"><a href="RTIappdetails">View Details</a></span>
                                		<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                		<div class="clearfix"></div>
                            		</div>
                        		</a>
                    		</div>
                		</div>
                		<div class="col-lg-6 col-md-6">
		                   	<div class="panel panel-green">
                        		<div class="panel-heading">
                            		<div class="row">
                                	<div class="col-xs-3">
                                	    <i class="fa fa-hand-paper-o fa-3x"></i>
                                	</div>
                                	<div class="col-xs-9 text-right">
                                    	<div>Grievance Details</div>
                                	</div>
                            	</div>
                        	</div>
                        	<a href="#">
                            	<div class="panel-footer">
                                	<span class="pull-left"><a href="searchGrievanceCusPortal">View Details</a></span>
                                	<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                	<div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
 	           	</div>
 	           	</div>
		    	
            	<div class="col-lg-3 col-md-3">
                    <div class="row">
                    	<div class="panel panel-red">
                        	<div class="panel-heading">
                        	    <div class="row">
                            	    <div class="col-xs-3">
                            	        <i class="fa fa-suitcase fa-3x"></i>
                            	    </div>
                            	    <div class="col-xs-9 text-right">
                            	        <div>Job Details</div>
                            	    </div>
                            	</div>
                        	</div>
                        	<a href="#">
                            	<div class="panel-footer">
                            	    <span class="pull-left"><a href="searchapplyforjob">View Details</a></span>
                            	    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            	    <div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
					<div class="row">
						<div class="panel panel-green">
                        	<div class="panel-heading">
                            	<div class="row">
                                	<div class="col-xs-3">
                                    	<i class="fa fa-pencil fa-3x"></i>
                                	</div>
                                	<div class="col-xs-9 text-right">
                                    	<div>Register Complaint</div>
                                	</div>
                            	</div>
                        	</div>
                        	<a href="#">
                            	<div class="panel-footer">
                                	<span class="pull-left"><a href="createregisterComplain">View Details</a></span>
                                	<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                	<div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
                	<div class="row">
                    	<div class="panel panel-yellow">
                        	<div class="panel-heading">
                            	<div class="row">
                                	<div class="col-xs-3">
                                	    <i class="fa fa-exclamation-triangle fa-3x"></i>
                                	</div>
                                	<div class="col-xs-9 text-right">
                                	    <div>Complaint Details</div>
                                	</div>
                            	</div>
                        	</div>
                        	<a href="#">
                            	<div class="panel-footer">
                               		<span class="pull-left"><a href="searchcomplainregister">View Details</a></span>
                               		<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                               		<div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
                	<div class="row">
                    	<div class="panel panel-primary">
                        	<div class="panel-heading">
                        	    <div class="row">
                        	        <div class="col-xs-3">
                        	            <i class="fa fa-list-alt fa-3x"></i>
                        	        </div>
                            	    <div class="col-xs-9 text-right">
                                	    <div>Disconnection</div>
                                	</div>
                            	</div>
   							</div>
                        	<a href="#">
                            	<div class="panel-footer">
                            	    <span class="pull-left"><a href="disconnectionApplyDetail">View Details</a></span>
                            	    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            	    <div class="clearfix"></div>
                            	</div>
                        	</a>
                    	</div>
                	</div>
            	</div>
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
            					size: 140,
            					innerSize: 120,
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
        text: 'Last 6 Month Bill Amount'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
        	'March',
            'April',
            'May',
            'June',
            'July',
            'August'            
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
            '<td style="padding:0"><b>{point.y:.1f} &#8377</b></td></tr>',
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
        name: 'Bill Amount',
        data: [1490.9, 1710.5, 1060.4, 1290.2, 1440.0, 1230.0]

    }]
});
</script>

 

