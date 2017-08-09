<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchAllotWorkOrder.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   08/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search Allot Work Order.-->

<form method="post" name="searchAllotWorkOrder" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>		   			
    	
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.searchPlumberWork}</li>
    		<div class="basic-nav" style="margin-top: -40px;"> 
		    	<ul>
    				<li>
    				
							<a title="Create Work Order" href="<@ofbizUrl>createAllotWorkOrder</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
  			</div>
 		</ul>
  </div>
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
			      <tr>
			            <td class="label">${uiLabelMap.connectionNo}</td>
			            <td><input type="text" name="ConnectionNo"  value="" /></td>   
                        <td class="label">${uiLabelMap.customerNo}</td>
			            <td><input type="text" name="CustomerNo"  value="" /></td>   
                  <tr>
                  <tr>    
                        <td class="label">${uiLabelMap.workOrderNo}</td>
			            <td><input type="text" name="WorkOrder"  value="" /></td> 
                 </tr>
				    <td colspan="4">
					    <center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchWorkOrder(searchAllotWorkOrder);"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
	  </div>
	</div>
</form>

<script type="text/javascript" language="javascript">
     
     function searchWorkOrder(formname)
     {
		   var form=document['searchAllotWorkOrder'];
               form.action = "<@ofbizUrl>allotWorkOrder</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
  </script>
