<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listRequestCompliant.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Request Compliant -->

<form method="post" name="listCompDetails" class="basic-form">
	<#if requestList?exists>
		<#if requestList?has_content>
			<#if parameters.sortType?exists>
				<#if parameters.sortType == "ASC">
					<#assign sortType= "DSC"/>
				<#else>
					<#assign sortType= "ASC"/>
				</#if>
			<#else>
				<#assign sortType= ""/>
			</#if>
			<#if parameters.orderField?exists>
				<#assign orderField= parameters.orderField/>
				<#if sortType == "">
					<#assign sortType= "ASC"/>
				</#if>
			<#else>
				<#assign orderField= ""/>
  			</#if>
     		<div align="right" class="screenlet-body min-scroll-div">
  	       		<a target="_blank" href="complaintPDF?paramList=${paramList?if_exists}"><img src="/images/commonimg/pdf.gif" title="Export to PDF" height="25" width="25"></a>
     		</div>
			<div class="row">
  				<div class="alert alert-info">
    				<ul>
    					<#if (requestListSize > 0)>
							<li class="h3-bottom">
								${uiLabelMap.CommonDisplaying} ${lowIndex} - ${highIndex} ${uiLabelMap.CommonOf} ${requestListSize}
							</li>
							<#if (requestListSize > highIndex)>
								<li>
									<a class="nav-next" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${indexNumbers}${paramList}</@ofbizUrl>">${uiLabelMap.CommonLast}</a>
								</li>
								<li>
									<a class="nav-next" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonNext}</a>
								</li>
							<#else>
								<li class="disabled">${uiLabelMap.CommonLast}</li>
								<li class="disabled">${uiLabelMap.CommonNext}</li>
							</#if>
							<li>
								<select name="index" onChange="location.href = '/humanres/control/complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX='+this.value+'${paramList}';">
									<option value=''>${uiLabelMap.CommonPage}</option>
    								<#if indexNumbers?exists>
    									<#assign x=indexNumbers>
    									<#list 0..x as i>
											<#if i=viewIndex>
												<option value='${i}' selected="selected">${i+1}</option>
											<#else>
												<option value='${i}'>${i+1}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</li>
							<li> ${uiLabelMap.CommonPage}</li>
							<#if (viewIndex > 0)>
								<li>
									<a class="nav-previous" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonPrevious}</a>
								</li>
								<li>
									<a class="nav-previous" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=0${paramList}</@ofbizUrl>">${uiLabelMap.CommonFirst}</a>
								</li>
							<#else>
								<li class="disabled">${uiLabelMap.CommonPrevious}</li>
								<li class="disabled">${uiLabelMap.CommonFirst}</li>
							</#if>
						</#if>
					</ul>
					<br class="clear"/>
  				</div>
   				<div class="screenlet-body min-scroll-div">
    				<table class="basic-table" cellspacing="0">
					    <#assign complaintId ="complaintId"/>
						<#assign custNo="custNo"/>
						<#assign conNo="conNo"/>
						<#assign complDate="complDate"/>
						<#assign compStatus="compStatus"/>
    					<thead>
       						<tr class="header-row-2">
						        <td width="35px"><center>${uiLabelMap.sno}</center></td>
								<td><center><a id="complaintId" class="sort-order" href="complaintRequest?orderField=${complaintId}&sortType=${sortType}&id=complaintId&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.complaintNo}</a></center></td>
							    <td><center><a id="custNo" class="sort-order" href="complaintRequest?orderField=${custNo}&sortType=${sortType}&id=custNo&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.customerNo}</a></center></td>
							    <td><center><a id="conNo" class="sort-order" href="complaintRequest?orderField=${conNo}&sortType=${sortType}&id=conNo&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.connectionNo}</a></center></td>
								<td><center><a id="complDate" class="sort-order" href="complaintRequest?orderField=${complDate}&sortType=${sortType}&id=complDate&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.complaintDate}</a></center></td>
								<td><center><a id="compStatus" class="sort-order" href="complaintRequest?orderField=${compStatus}&sortType=${sortType}&id=compStatus&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.CommonStatus}</a></center></td>
								<td><center>${uiLabelMap.CommonEdit}</center></td>
							</tr>
						</thead> 
	 					<#if (requestList)?has_content>
	 						<#assign count = 1>
	 						<#list requestList as requestList>			
	     						<tr>
		      						<td>${count?if_exists}</td>
	          						<td><center><a href="viewComplaintDetail?sequenceId=${requestList.sequenceId?if_exists}" class="buttontext">${requestList.complaintId?if_exists}</a></center></td>
			  						<td><center>${requestList.custNo?if_exists}</center></td>
			  						<td><center>${requestList.conNo?if_exists}</center></td>
			  						<td><center><#if requestList.complDate?has_content>${requestList.complDate?string('dd/MM/yyyy')?if_exists}</#if></center></td> 
			    					<td><center><#if requestList.compStatus?has_content>${requestList.compStatus?if_exists}</#if></center></td> 

			 						<#if requestList.compStatus?if_exists = 'Submitted'> 
										<td><center><a href="actionComplaintRequest?sequenceId=${requestList.sequenceId?if_exists}" class="buttontext">${uiLabelMap.action}</a></center></td>
									<#else>
										<td><center><a class="buttontextdisabled">${uiLabelMap.action}</a><center></td>
									</#if>	
		   						</tr>  
	 							<#assign count = count + 1>
	 						</#list>
	 					</#if>  
        			</table>
      			</div>
      			<div class="alert alert-info">
					<ul>
						<#if (requestListSize > 0)>
							<li class="h3-bottom">${uiLabelMap.CommonDisplaying} ${lowIndex} - ${highIndex}
							${uiLabelMap.CommonOf} ${requestListSize}</li>
							<#if (requestListSize > highIndex)>
								<li>
									<a class="nav-next" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${indexNumbers}${paramList}</@ofbizUrl>">${uiLabelMap.CommonLast}</a>
								</li>
								<li>
									<a class="nav-next" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonNext}</a>
								</li>
							<#else>
								<li class="disabled">${uiLabelMap.CommonLast}</li>
								<li class="disabled">${uiLabelMap.CommonNext}</li>
							</#if>
							<li>
								<select name="index" onChange="location.href = '/humanres/control/complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX='+this.value+'${paramList}';">
									<option value=''>${uiLabelMap.CommonPage}</option>
									<#if indexNumbers?exists>
										<#assign x=indexNumbers>
										<#list 0..x as i>
											<#if i=viewIndex>
												<option value='${i}' selected="selected">${i+1}</option>
											<#else>
												<option value='${i}'>${i+1}</option>
											</#if>
										</#list> 
									</#if>
								</select>
							</li>
							<li> ${uiLabelMap.CommonPage}</li>
							<#if (viewIndex > 0)>
								<li>
									<a class="nav-previous" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonPrevious}</a>
								</li>
								<li>
									<a class="nav-previous" href="<@ofbizUrl>complaintRequest?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=0${paramList}</@ofbizUrl>">${uiLabelMap.CommonFirst}</a>
								</li>
							<#else>
								<li class="disabled">${uiLabelMap.CommonPrevious}</li>
								<li class="disabled">${uiLabelMap.CommonFirst}</li>
							</#if>
						</#if>
					</ul>
					<br class="clear"/>
				</div>
			</div>
		<#else>
	 		<div class="screenlet-body">
	 			<table class="basic-table hover-bar" cellspacing="0">
					<tr class="header-row-2">
				    	<td>${uiLabelMap.sno}</td>
	         			<td>${uiLabelMap.complaintNo}</td>
             			<td>${uiLabelMap.customerNo}</td>
             			<td>${uiLabelMap.connectionNo}</td>
             			<td>${uiLabelMap.complaintDate}</td>
             			<td>${uiLabelMap.CommonStatus}</td>
             			<td>${uiLabelMap.CommonEdit}</td>
			  		</tr>
		 			<tr>
			 			<td colspan="8"><h3>${uiLabelMap.NoRecordsFound}</h3></td>
			 		</tr>
				</table>
	   		</div>
		</#if>
	</#if>

</form>