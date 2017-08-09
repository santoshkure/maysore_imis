<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchArrangeWaterSupply.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   09/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search Arrange Water Supply.-->

<form method="post" name="searchArrangeWaterSupply" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>		   			
    	
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.searchArrWaterSupply}</li>
    		<div class="basic-nav" style="margin-top: -40px;"> 
		    	     <ul>
    				     <li>
							<a title="Create Arrange Water Supply" href="<@ofbizUrl>createArrangeWaterSupply</@ofbizUrl>">
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
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchArrangeWater(searchArrangeWaterSupply);"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
	  </div>
	</div>
</form>

<script type="text/javascript" language="javascript">
     
     function searchArrangeWater(formname)
     {
		   var form=document['searchArrangeWaterSupply'];
               form.action = "<@ofbizUrl>arrangeWaterSupply</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
  </script>
