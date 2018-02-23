<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			    Siddhi  04/08/2017		
<#-- #####################################################################################################-->

<#setting locale="en">
<form name="billCalculate" class="basic-form" method="post" action="">
   		    <div class="col-md-12"> 
               <div class="alert alert-info">
                 <ul>
                   <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
	                <div align="center" style="font-size:12px"><b>${uiLabelMap.billCalculator}</b></div>
                 </ul>
            </div>
   	 <div class="screenlet-body">
 	 <table class="basic-table" cellspacing="0">
 	 <td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
 		 <tr>
 		   <td class="label" >${uiLabelMap.tariffPlan} <font color="red">*</font></td>
		   <td><select name="tariffplan" style="width:150px;" OnChange="javascript:calculateBill();">
		   <option value="">${uiLabelMap.selectTariffPlan}</option>
		   <option value="com">Commercial</option>
		   <option value="noncom">Non Commercial</option>
		   <option value="dom">Domestic</option></select></td>
		  </tr>
		  <tr>
 		   <td class="label" >${uiLabelMap.previousBillReading} <font color="red">*</font></td>
		   <td><input name="prebillreading" onKeyUp="javascript:calculateBill();" type="text" maxlength="10" value="" style="width:150px;"></td>
		 </tr>
		  <tr>
 		   <td class="label" >${uiLabelMap.currentBillReading} <font color="red">*</font></td>
		   <td><input name="curbillreading" onKeyUp="javascript:calculateBill();" type="text" maxlength="10" value="" style="width:150px;"></td>
		 </tr>
		<tr>
 		   <td class="label" >Used Reading</td>
		   <td><input name="unitofreading"  type="text" maxlength="10" value="" readonly style="width:150px;"></td>
		 </tr>
		<tr>
 		   <td class="label" >Bill Amount (In Rs.)</td>
		   <td><input name="billAmount"  type="text" maxlength="10" value="" readonly style="width:150px;"></td>
		 </tr>
		 </table>
     </div>  
   	</div>	
</form>

<script>
function calculateBill()
{
var form = document['billCalculate'];
var tariffplan = form.tariffplan.value;
if(notEmptyField(tariffplan,"Select Tariff Plan"))
{
var rate;
if(tariffplan == "com")
{
rate =10;
}
else if(tariffplan == "noncom")
{
rate =7;
}
else
{
rate =5;
}

var prebillreading = form.prebillreading.value;
var currentBillReading = form.curbillreading.value;
var totalUsed = currentBillReading - prebillreading;
form.unitofreading.value= totalUsed;
form.billAmount.value= totalUsed*rate;
}
}
</script>