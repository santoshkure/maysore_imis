<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: GrievanceDetailEmpPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#-- 1.0			Anubha Saini	  21/08/2017     	
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search apply for job.-->


<form method="post" name="GrievanceSearchEmpPortal" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.grievanceDetail}</li>
    		
 		</ul>
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		 <tr>
			  <td class="label">${uiLabelMap.receiptNo} </td>
			  <td><input type="text" name="jobNo"  value="" /></td>   
		</tr>
  
         <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchapplyforjob(GrievanceSearchEmpPortal);"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	</form>
	
<#-------------------------- Greivance  List------------------------------>
<form method="post" name="listgrievance" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.grievanceList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
	         <td>${uiLabelMap.receiptNo}</td>
             <td>${uiLabelMap.name}</td>
             <td>${uiLabelMap.grievanceDate}<center></td>
             <td>${uiLabelMap.grievancePetitionDate}</td>
             <td>${uiLabelMap.typeOfGrievance}</td>
         	<td>${uiLabelMap.action}</td>
            
         </tr>
      </thead> 
       <tr>
		      	<td>1</td>
	          	<td><a href="veiwGrievanceEmpPortal">RECP1001</a></td>
			  	<td>Anshul</td>
			  	<td>08/08/2017</td> 
			    <td>08/08/2017</td> 
			    <td>Internal</td> 
			 	<td><a href="GrievanceActionEmpPortal" class="buttontext">${uiLabelMap.action}</a></td>
			 	 </tr>    
        </table>
      </div>
    </div>
 </form>
