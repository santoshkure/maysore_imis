<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
	
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput   23/08/2017	
<#-- #####################################################################################################-->



<form method="post" name="listmeterreading" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.listofMeterReading}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
             <td>${uiLabelMap.readingDate}</td>
	         <td>${uiLabelMap.connectionNo}</td>
             <td>${uiLabelMap.customerNo}</td>
             <td>${uiLabelMap.meterNo}<center></td>
             <td>${uiLabelMap.previousReading}</td>
             <td>${uiLabelMap.currentReading}</td>
             <td>${uiLabelMap.totalPayableAmount}</td>
             <td>${uiLabelMap.edit}</td>
             <td>${uiLabelMap.action}</td>
          
         </tr>
      </thead> 
           <tr>
		      	<td>1</td>
		      	<td><a href="viewreadingdetails">23/08/2017</a></td>
	          	<td>CNMCC10001</td>
			  	<td>10001</td>
			  	<td>MT777</td> 
			    <td>1100</td>  
			    <td>1500</td>
			    <td>13000</td>
			     <td><a href="editmeterreading" class="buttontext">${uiLabelMap.edit}</a></td> 
			    <td><a href="actionmeterreading" class="buttontext">${uiLabelMap.action}</a></td> 
				
		   </tr>    
        </table>
      </div>
    </div>
 </form>
 <script type="text/javascript" language="javascript">
     
     
 </script>