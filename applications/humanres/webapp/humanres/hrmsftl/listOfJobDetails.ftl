<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
	
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput   22/08/2017	
<#-- #####################################################################################################-->



<form method="post" name="listapplyforjob" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.applyForJobList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
             <td>${uiLabelMap.jobNo}</td>
	         <td>${uiLabelMap.applicationDate}</td>
             <td>${uiLabelMap.customerNo}</td>
             <td>${uiLabelMap.connectionNo}<center></td>
             <td>${uiLabelMap.feeAmount}</td>
             <td>${uiLabelMap.typeOfJob}</td>
             <td>${uiLabelMap.action}</td>
          
         </tr>
      </thead> 
           <tr>
		      	<td>1</td>
		      	<td><a href="viewJobDetails">JOB1000</a></td>
	          	<td>22/08/2017</td>
			  	<td>1000</td>
			  	<td>0987</td> 
			    <td>7000</td>  
			    <td>Tanker Request</td> 
			    <td><a href="actionJobDetails" class="buttontext">${uiLabelMap.action}</a></td> 
				
		   </tr>    
        </table>
      </div>
    </div>
 </form>
 <script type="text/javascript" language="javascript">
     
     
 </script>