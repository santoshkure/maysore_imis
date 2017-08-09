<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: listAllotWorkOrder.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   08/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  List Allot Work Order.-->

<form method="post" name="listAllotWorkOrder" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.allotWorkOrderList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
	         <td>${uiLabelMap.customerNo}</td>
             <td>${uiLabelMap.connectionNo}</td>
             <td>${uiLabelMap.workOrderNo}</td>
             <td>${uiLabelMap.CommonStatus}</td>
             <td>${uiLabelMap.CommonUpdate}</td>
         </tr>
      </thead> 
       <tr>
		      	<td align="center">1</td>
	          	<td><a href="viewAllotWorkOrder">10001</a></td>
			  	<td>0987</td>
			  	<td>111</td>
			 	<td>approve</td> 
				<td><a href="javascript:editAllotWorkOrder('listAllotWorkOrder');" class="buttontext" align="center">${uiLabelMap.CommonUpdate}</a></center></td>
		   </tr>    
        </table>
      </div>
    </div>
 </form>
<script type="text/javascript" language="javascript">
     
	function editAllotWorkOrder(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editAllotWorkOrder</@ofbizUrl>";
	    form.submit();
	}
    </script>
