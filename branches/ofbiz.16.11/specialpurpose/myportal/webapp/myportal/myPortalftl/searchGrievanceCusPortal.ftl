<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchGrievanceCusPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Modified by   --->
<#-- 1.0			Anubha Saini	  19/08/2017     	Siddhi
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search apply for job.-->


<form method="post" name="searchGrievanceDetails" class="basic-form">

	<div class="row">
  		<div class="alert alert-info">
    		<ul>
    			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    			<li class="h3">${uiLabelMap.searchGrievanceDetail}</li>
    			<div class="basic-nav" style="margin-top: -40px;"> 
		    		<ul>
    					<li>
							<a title="Create Apply For Job" href="<@ofbizUrl>createGrievanceCusPortal</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
							</a>
    				  	</li>
  					</ul>
  				</div>
 			</ul>
  		</div>
	
		<div class="screenlet-body">
			<table class="basic-table" cellspacing="0">
		 		<tr>
				  	<td class="label">${uiLabelMap.receiptNo} </td>
				  	<td><input type="text" name="receiptno"  value="" /></td>   
				  	<td class="label">${uiLabelMap.typeOfGrievance}</td>
	 			  	<td>
	               		<select name="typeOfGrievance">
	               			<option value="">Select</option>
	               			<option value="Internal">Internal</option>
	               			<option value="External">External</option>
	               		</select>
	             	</td> 
				</tr>
         		<tr>
					<td colspan="4">
						<center>
							<div id="submit" align="center">
								<input type="button" name="search" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchgrievancedetail(searchGrievanceDetails);"/>
							</div>
						</center>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
	
<#--------------------------Grievance Details List------------------------------>
<form method="post" name="listGrievanceDetails" class="basic-form">
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
  	       		<a target="_blank" href="grievancePDF?paramList=${paramList?if_exists}"><img src="/images/commonimg/pdf.gif" title="Export to PDF" height="25" width="25"></a>
        		<#--<a href="getExcelForGrievance"><img src="/images/commonimg/xls.gif" title="Export to Excel" height="25" width="25"></a>-->
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
								<a class="nav-next" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${indexNumbers}${paramList}</@ofbizUrl>">${uiLabelMap.CommonLast}</a>
							</li>
							<li>
								<a class="nav-next" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonNext}</a>
							</li>
						<#else>
							<li class="disabled">${uiLabelMap.CommonLast}</li>
							<li class="disabled">${uiLabelMap.CommonNext}</li>
						</#if>
						<li>
							<select name="index" onChange="location.href = '/myportal/control/searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX='+this.value+'${paramList}';">
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
								<a class="nav-previous" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonPrevious}</a>
							</li>
							<li>
								<a class="nav-previous" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=0${paramList}</@ofbizUrl>">${uiLabelMap.CommonFirst}</a>
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
    <#assign receiptNo ="receiptNo"/>
	<#assign grievanceNameEN="grievanceNameEN"/>
	<#assign grievanceNameKN="grievanceNameKN"/>
	<#assign grievanceDate="grievanceDate"/>
	<#assign grievancePetitionDate="grievancePetitionDate"/>
	<#assign typeOfGrievance="typeOfGrievance"/>
	<#assign status="status"/>
    <thead>
         
       <tr class="header-row-2">
        <td width="35px"><center>${uiLabelMap.sno}</center></td>
		<td><center><a id="receiptNo" class="sort-order" href="searchGrievanceCusPortal?orderField=${receiptNo}&sortType=${sortType}&id=receiptNo&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.receiptNo}</a></center></td>
	    <td><center><a id="grievanceNameEN" class="sort-order" href="searchGrievanceCusPortal?orderField=${grievanceNameEN}&sortType=${sortType}&id=grievanceNameEN&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.name}${uiLabelMap.InEnglish}</a></center></td>
	    <td><center><a id="grievanceNameKN" class="sort-order" href="searchGrievanceCusPortal?orderField=${grievanceNameKN}&sortType=${sortType}&id=grievanceNameKN&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.name}${uiLabelMap.Inkannada}</a></center></td>
		<td><center><a id="grievanceDate" class="sort-order" href="searchGrievanceCusPortal?orderField=${grievanceDate}&sortType=${sortType}&id=grievanceDate&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.grievanceDate}</a></center></td>
		<td><center><a id="grievancePetitionDate" class="sort-order" href="searchGrievanceCusPortal?orderField=${grievancePetitionDate}&sortType=${sortType}&id=grievancePetitionDate&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.grievancePetitionDate}</a></center></td>
	    <td><center><a id="typeOfGrievance" class="sort-order" href="searchGrievanceCusPortal?orderField=${typeOfGrievance}&sortType=${sortType}&id=typeOfGrievance&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex}${paramList}">${uiLabelMap.typeOfGrievance}</a></center></td>
			
		<td><center>${uiLabelMap.status}</center></td>
		<td><center>${uiLabelMap.CommonEdit}</center></td>
		</tr>
	</thead> 
	 <#if (requestList)?has_content>
	 <#assign count = 1>
	 <#list requestList as requestList>			
	     <tr>
		      	<td>${count?if_exists}</td>
	          	<td><center><a href="javascript:veiwGrievanceCusPortal('listGrievanceDetails','${requestList.sequenceId?if_exists}');" class="buttontext">${requestList.receiptNo?if_exists}</a></center></td>
			  	<td><center>${requestList.grievanceNameEN?if_exists}</center></td>
			  	<td><center>${requestList.grievanceNameKN?if_exists}</center></td>
			  	<td><center><#if requestList.grievanceDate?has_content>${requestList.grievanceDate?string('dd/MM/yyyy')?if_exists}</#if></center></td> 
			    <td><center><#if requestList.grievancePetitionDate?has_content>${requestList.grievancePetitionDate?string('dd/MM/yyyy')?if_exists}</#if></center></td> 
			    <td><center>${requestList.typeOfGrievance?if_exists}</center></td> 
			 	<td><center>${requestList.status?if_exists}</center></td> 
				<td><center><a href="javascript:editGrievanceCusPortal('listGrievanceDetails','${requestList.sequenceId?if_exists}');" class="buttontext">${uiLabelMap.CommonEdit}</a></center></td>
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
						<a class="nav-next" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${indexNumbers}${paramList}</@ofbizUrl>">${uiLabelMap.CommonLast}</a>
					</li>
					<li>
						<a class="nav-next" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonNext}</a>
					</li>
					<#else>
					<li class="disabled">${uiLabelMap.CommonLast}</li>
					<li class="disabled">${uiLabelMap.CommonNext}</li>
					</#if>
					<li>
						<select name="index"
							onChange="location.href = '/myportal/control/searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&ampVIEW_SIZE=${viewSize}&amp;VIEW_INDEX='+this.value+'${paramList}';">
							<option value=''>${uiLabelMap.CommonPage}</option>
							<#if indexNumbers?exists><#assign x=indexNumbers><#list 0..x as
							i>
							<#if i=viewIndex>
							<option value='${i}' selected="selected">${i+1}</option>
							<#else>
							<option value='${i}'>${i+1}</option>
							</#if>
							</#list> </#if>
						</select>
					</li>
					<li> ${uiLabelMap.CommonPage}</li>
					<#if (viewIndex > 0)>
					<li>
						<a class="nav-previous" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}${paramList}</@ofbizUrl>">${uiLabelMap.CommonPrevious}</a>
					</li>
					<li>
						<a class="nav-previous" href="<@ofbizUrl>searchGrievanceCusPortal?orderField=${orderField}&sortType=${parameters.sortType?if_exists}&id=${parameters.id?if_exists}&VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=0${paramList}</@ofbizUrl>">${uiLabelMap.CommonFirst}</a>
					</li>
					<#else>
					<li class="disabled">${uiLabelMap.CommonPrevious}</li>
					<li class="disabled">${uiLabelMap.CommonFirst}</li>
					</#if>
					</#if>
				</ul>
				<br class="clear"/>
			</div>
			<#else>
		 <div class="screenlet-body">
		 <table class="basic-table hover-bar" cellspacing="0">
					<tr class="header-row-2">
					    <td>${uiLabelMap.sno}</td>
						<td>${uiLabelMap.receiptNo}</td>
						<td>${uiLabelMap.name}${uiLabelMap.InEnglish}</td>
						<td>${uiLabelMap.name}${uiLabelMap.Inkannada}</td>
						<td>${uiLabelMap.grievanceDate}</td>
						<td>${uiLabelMap.grievancePetitionDate}</td>
						<td>${uiLabelMap.typeOfGrievance}</td>
						<td>${uiLabelMap.status}</td>
						<td>${uiLabelMap.CommonEdit}</td>
				  	</tr>
				
			 <tr><td colspan="8">
             <h3>${uiLabelMap.NoRecordsFound}</h3></td></tr>
             
		</table>
	   </div>
	</#if>
	</#if>
	 <input type="hidden" name="sequenceId" value=""/>
    </div>
 </form>
 <script type="text/javascript" language="javascript">
     
     function searchgrievancedetail(searchGrievanceDetails)
     {
		       var form=document['searchGrievanceDetails'];
               form.action = "<@ofbizUrl>searchGrievanceCusPortal</@ofbizUrl>";
			   form.submit();
		       disSubmit('submit');    
     }
	function editGrievanceCusPortal(formname,sequenceId)
	{
	    var form =document[formname];
	    form.sequenceId.value = sequenceId;	
        form.action="<@ofbizUrl>editGrievanceCusPortal</@ofbizUrl>";
	    form.submit();
	}
	function veiwGrievanceCusPortal(formname,sequenceId)
	{
	     var form =document[formname];	 
	     form.sequenceId.value = sequenceId;
   		 
        form.action="<@ofbizUrl>veiwGrievanceCusPortal</@ofbizUrl>";
	    form.submit();
	} 
 </script>