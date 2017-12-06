<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewComplainDetails.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   11/08/2017
<#---1.1			Pankaj Trivedi   					01/11/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the view Complain Registration.-->

<form method="post" name="viewComplainDetailsEmp" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
			<ul>
		    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.viewregisterComplaint}</b></div> 
			</ul>
			<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
						<a>
							<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
						</a>
    				</li>
  				</ul>
			</div> 
		</div>
		<#if complRegDetailsList?exists>     
    	   	<#if complRegDetailsList?has_content>
            	<#list complRegDetailsList as complRegDetailsList> 
					<div class="screenlet-body" id="printId1">
            			<table cellspacing="0" class="basic-table table-responsive">
                			<tbody>
                    			<tr>
                         			<td class="label">${uiLabelMap.customerNo}</td>
                         			<td>${complRegDetailsList.custNo?if_exists}</td>
                         			<td class="label">${uiLabelMap.connectionNo}</td>
                         			<td>${complRegDetailsList.conNo?if_exists}</td>
                     			</tr>
                     			<tr>
                         			<td class="label" >${uiLabelMap.complaintDate}</td>
                         			<td>${complRegDetailsList.complDate?if_exists?string('dd/MM/yyyy')}</td>
                         			<td class="label">${uiLabelMap.essentialDocument}</td>
                         			<td>${complRegDetailsList.fileLoc?if_exists}</td>
					  			</tr>
					  			<tr>
					     			<td class="label">${uiLabelMap.complaintDescription}</td>
                         			<td>${complRegDetailsList.complDescription?if_exists}</td>
                         			<td class="label">${uiLabelMap.complaintType}</td>
                         			<#if complRegDetailsList.complaintType?if_exists = 'meter'>
                         				<td>Meter</td>
                         			<#elseif complRegDetailsList.complaintType?if_exists = 'bill'>
                         				<td>Bill</td>
                         			<#elseif complRegDetailsList.complaintType?if_exists = 'pipedamage'>
                         				<td>Pipe Damage</td>
                         			<#else>
                         				<td>Other</td>
                         			</#if>
					  			</tr>
					  			<tr>
									<td class="label">${uiLabelMap.serviceAddress}</td>
    	                   	 		<td>${complRegDetailsList.serviceAdd?if_exists}</td>
                      			</tr>
               				</tbody>
          				</table>
          			</div>
               	</#list>
         	</#if>
      	</#if>
	</div>
</form>