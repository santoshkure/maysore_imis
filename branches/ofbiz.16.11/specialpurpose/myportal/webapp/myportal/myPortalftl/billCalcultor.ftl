<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			    Siddhi  04/08/2017		
<#-- #####################################################################################################-->

<#setting locale="en">
<script language="javascript" src="/images/jquery/plugins/validate/additional-methods.js"  type="text/javascript"></script>
<form name="billpayment" class="basic-form" method="post" action="">
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
 		   <td class="label" >${uiLabelMap.billNo}</td>
		   <td><input name="billno"  type="text" maxlength="10" value="WT/0417/55860" readonly></td>
		 </tr>
		  <tr>
 		   <td class="label" >${uiLabelMap.previousBillReading} <font color="red">*</font></td>
		   <td><input name="prebillreading"  type="text" maxlength="10" value=""></td>
		 </tr>
		  <tr>
 		   <td class="label" >${uiLabelMap.currentBillReading} <font color="red">*</font></td>
		   <td><input name="curbillreading"  type="text" maxlength="10" value=""></td>
		 </tr>
		<tr>
 		   <td class="label" >${uiLabelMap.unitReading}<font color="red">*</font></td>
		   <td><input name="unitofreading"  type="text" maxlength="10" value=""></td>
		 </tr>
		<tr>
			<td colspan="4"><center>
			<div id ="saveBtn">
				<input name="save" value="Submit" type="button" onClick="validateParameters('')">
				
			</div></center>
			</td>
						
		</tr>
		 </table>
     </div>  
   	</div>	
</form>

 

