<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerPortalHome.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   02/08/2017		
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
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for New Connection </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Disconnection </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Khata Change Request </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Bill Correction </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register Complaint </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Complaint Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Register Meter Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill History </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Payment </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Bill Calculator </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Apply for Job </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application</a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> RTI Application Details </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Update Personal Detail </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> FAQ </a>
					</li>
					<li>
						<a href="main"><i class="fa fa-arrow-right" aria-hidden="true"></i> Application Status </a>
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
			<div class="row" style="background:#f5f5f5; padding-top: 15px;">
				<div class="col-md-4" id="container" style="height: 200px;  margin: 0 auto"></div>
				<div class="col-md-4"id="container1" style="height: 200px; margin: 0 auto"></div>
				<div class="col-md-4" id="container2" style=" height: 200px;  margin: 0 auto"></div>
			</div>
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

 

