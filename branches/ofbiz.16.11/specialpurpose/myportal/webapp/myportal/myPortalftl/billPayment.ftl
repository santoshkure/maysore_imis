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
	                <div align="center" style="font-size:12px"><b>${uiLabelMap.billPayment}</b></div>
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
		   <td class="label" >${uiLabelMap.customerId}</td>
		   <td><input name="customerId"  type="text" maxlength="10" value="1001" readonly></td>
		   <td class="label" >${uiLabelMap.connectionNo}</td>
		   <td><input name="connectionno"  type="text" maxlength="10" value="88267" readonly></td>
		 </tr>
		<tr>
 		   <td class="label" >${uiLabelMap.paymentAmount}</td>
		   <td><input name="payableamt"  type="text" maxlength="15" value="750" readonly></td>
		   <td class="label" >${uiLabelMap.paidAmount}<font color="red">*</font></td>
		   <td><input name="paidamt"  type="text" maxlength="15" value="" ></td>
		 </tr>
		 <tr>
 		   <td class="label" >${uiLabelMap.paymentRefNo}</td>
		   <td><input name="paymentref"  type="text" maxlength="15" value="" ></td>
		   <td class="label" >${uiLabelMap.paymentStatus}</td>
		   <td><input name="paymentstatus"  type="text" maxlength="15" value="" ></td>
		 </tr>
		 <tr>
 		   <td class="label" >${uiLabelMap.paymentMode}<font color="red">*</font></td>
		   <td><input name="paymentref"  type="text" maxlength="15" value="" ></td>
		   <td class="label" >${uiLabelMap.accountCardNo}<font color="red">*</font></td>
		   <td><input name="paymentstatus"  type="text" maxlength="15" value="" ></td>
		 </tr>
		 <tr>
 		   <td class="label" >${uiLabelMap.bankWalletName} <font color="red">*</font></td>
		   <td><input name="paymentref"  type="text" maxlength="15" value="" ></td>
		   <td class="label" >${uiLabelMap.dateofPayment} <font color="red">*</font></td>
		   <td>
           <@htmlTemplate.renderDateTimeField name="dateOfPayment" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
          </td>
		 </tr>
		 <tr>
 		   <td class="label" >${uiLabelMap.mobileNo}</td>
		   <td><input name="paymentref"  type="text" maxlength="10" value="" ></td>
		   <td class="label" >${uiLabelMap.emailId}</td>
		   <td><input name="emailid"  type="text" maxlength="15" value="" ></td>
		 </tr>
		<tr>
			<td colspan="4"><center>
			<div id ="saveBtn">
				<input name="save" value="${uiLabelMap.makePayment}" type="button" onClick="validateParameters('')">
				
			</div></center>
			</td>
						
		</tr>
		 </table>
     </div>  
   	</div>	
</form>

 

