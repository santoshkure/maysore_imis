<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchBillDetail.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   23/08/2017         
<#-- #####################################################################################################-->
<#-- This ftl is used to show Current Bill Detail and All Bill Detail after Search -->

<#setting locale="en">
<form method="post" name="searchBillDetail" action="" class="basic-form">
   <div class="row">
    <div class="alert alert-info">
  		<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  			<div class="h3" align="center"><b>${uiLabelMap.searchBillDetail}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.customerNo}</td>
             	<td><input type="text" name="customerNo" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.connectionNo}</td>
             	<td><input type="text" name="connectionNo" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 <tr>
			 	<td class="label">${uiLabelMap.billNo}</td>
             	<td><input type="text" name="billNo" value="" style="width:240px;" maxlength="50"></td>
             	
              	<td class="label">${uiLabelMap.CommonDate}</td>
             	<td>
				   			<select name="date" >
				                   <option value="">${uiLabelMap.CommonSelect}</option>
				                   <option value="Jun_Feb">Jun-Feb 2017</option>
				                   <option value="Feb_March">Feb-March 2017</option>
				                   <option value="March_April">March-April 2017</option>
				                   <option value="April_May">April-May 2017</option>
				        	</select>
				</td>
			</tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
   </div>
</form>