<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			    Siddhi  03/08/2017		
<#-- #####################################################################################################-->

<#setting locale="en">

<form name="billhistory" class="basic-form" method="post" action="">
   		    <div class="col-md-12"> 
               <div class="alert alert-info">
                 <ul>
                   <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
	                <div align="center" style="font-size:12px"><b>${uiLabelMap.billhistory}</b></div>
                 </ul>
            </div>
   	 <div class="screenlet-body">
 	 <table class="basic-table" cellspacing="0">
 		<tr>
 		   <td class="label" >${uiLabelMap.connectionNo}</td>
		   <td>88267</td>
		   <td class="label" >${uiLabelMap.customerName}</td>
		   <td>Harichandra Pavasha Mhatre</td>
		 </tr>
		 <tr>
		   <td class="label" >${uiLabelMap.meterNumber}</td>
		   <td>2030657</td>
		 </tr>
		
		 </table>
     </div>  
   	</div>	
   		   <div class="col-md-12"> 
               <div class="alert alert-info">
                 <ul>
	                <div align="center" style="font-size:12px"><b>Bill History</b></div>
                 </ul>
            </div>
      <div class="screenlet-body">
      <table class="basic-table hover-bar" rowspacing="5">
      <thead>
        <tr class="header-row-2">
	         <td><center>${uiLabelMap.billNo}</center></td>
	         <td><center>${uiLabelMap.billDate}<center></td>
             <td><center>Used Unit</center></td> 
             <td><center>${uiLabelMap.dueDate}</center></td> 
             <td><center>${uiLabelMap.totalAmountDue}</center></td>
             <td><center>${uiLabelMap.viewBill}</center></td>
             <td>${uiLabelMap.pdf}</td>
        </tr>
	    </thead>   
		     <tr>
	         <td><center>WT/0417/55860</center></td>
	         <td><center>17/06/2017<center></td>
             <td><center>150</center></td> 
             <td><center>5</center></td> 
             <td><center>750</center></td>
             <td><center><a href="viewBillDetail" class="buttontext">${uiLabelMap.viewBill}</a></center></td>
             <td><a href="viewBillDetailpdf"><img src="/rainbowstone/images/pdf.png" width="24px"></img></a></td>
            </tr>
        </table>
   		</div>
</form>

 

