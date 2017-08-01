<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerDetailList.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Customer Detail -->

<#setting locale="en">
    
<form method="post" name="listcustomerDetail" action="" class="basic-form">
	<div class="row">
		<div class="alert alert-info">
		    <ul>
		 	 <div class="h3" align="center"><b>List Customer</b></div> 
		   </ul>
	   </div>
	   <div class="screenlet-body">
		<table class="basic-table hover-bar" cellspacing="0">
        <tr class="header-row-2">
              <td>${uiLabelMap.customerId}</td>
	          <td>${uiLabelMap.customerName}</td>
	          <td>${uiLabelMap.customerAddress}</td>
             <td>${uiLabelMap.Contact}</td>
             <td>${uiLabelMap.RegistrationDate}</td>
            <td>${uiLabelMap.ApproveDate}</td>
            <td>${uiLabelMap.Edit}</td>
           </tr><tr><td colspan="11"><b>${uiLabelMap.NoRecordsFound}</b></td></tr>
        </table>
	  </div>
	</div>   
	
  </form>