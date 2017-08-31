<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: .ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   26/08/2017         
<#-- #####################################################################################################-->
<#-- This ftl is used to show -->
<style>
	.basic-form table tr td {
		border:none;
    	border-bottom: 2px solid #f0f0f0;
}

</style>
<#setting locale="en">
<form method="post" name="searchBillDetail" action="" class="basic-form">
   <div class="row">
    <div class="alert alert-info">
  		<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  			<div class="h3" align="center"><b>${uiLabelMap.paymentHistory}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table hover-bar" cellspacing="0">
          <tbody>
          
          <tr>
           		<td>
   					<div class="alert alert-warning" style="border-radius: 25px; width: 100px; ">
   			 			<b>In Progress</b>
  					</div>
           		</td>
                <td>
           			${uiLabelMap.transactionId} :- <b>10010101212014
                </td>
                <td>
                	${uiLabelMap.paymentDate} :- 28/08/2017 10:35 pm
                </td>
                <td>
                	${uiLabelMap.paidAmount}:- <b> 1000 </b>
                </td>
                <td>
                	<a class="buttontext"> More... </a>
                </td>
			</tr>
			
           	<tr>
           		<td>
   					<div class="alert alert-success" style="border-radius: 25px; width: 100px; ">
   			 			<b>Successful</b>
  					</div>
           		</td>
                <td>
           			${uiLabelMap.transactionId} :- <b>10010101212101
                </td>
                <td>
                	${uiLabelMap.paymentDate} :- 28/08/2017 10:30 pm
                </td>
                <td>
                	${uiLabelMap.paidAmount}:- <b> 1000 </b>
                </td>
                <td>
                	<a class="buttontext"> More... </a>
                </td>
			</tr>
		
		<tr>
           		<td>
   					<div class="alert alert-danger" style="border-radius: 25px; width: 100px; ">
   			 			<b>Failed</b>
  					</div>
           		</td>
                <td>
           			${uiLabelMap.transactionId} :- <b>10010101212010
                </td>
                <td>
                	${uiLabelMap.paymentDate} :- 28/08/2017 9:30 pm
                </td>
                <td>
                	${uiLabelMap.paidAmount}:- <b> 1000 </b>
                </td>
                <td>
                	<a class="buttontext"> More... </a>
                </td>
			</tr>
			
		 </tbody>
		</table>
	</div>
   </div>
</form>