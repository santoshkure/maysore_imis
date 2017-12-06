<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchKhataChangeRequest.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   07/08/2017
<#-- #####################################################################################################-->
<#--This ftl is used to show Khata Change Applied And Action Detail -->

<form method="post" name="khataChangeDetail" class="basic-form">
<div class="row">
  		<div class="alert alert-info">
    		<ul>		   			
    			<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    			<li class="h3">${uiLabelMap.searchKhataChangeRequest}</li>
    			<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>kattaChangeRequest</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 30px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
 			 
  			</div>  
 			</ul>
  		</div>
	
	<div class="screenlet-body">
		<table class="basic-table" cellspacing="0">
		
			<tr>
			 	<td class="label">${uiLabelMap.khataChangeApplicationNo}</font></td>
			 	<td><input type="text" name="khataChgangeApplicNo"  value="" /></td>   
			 	
			 	<td class="label">${uiLabelMap.applicationDate}</font></td>
			 	<td><input type="text" name="applicationDate"  value="" /></td>   
			</tr>
			
            <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchKhataChangeDetail(khataChangeDetail);"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
	
<form method="post" name="listKhataChangeRequest" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.listKhataChangeRequest}</li>
    </ul>
    
  </div>
   	<div class="screenlet-body min-scroll-div">
    	<table class="basic-table" cellspacing="0">
    	<thead>
         	<tr class="header-row-2">
             	<td>${uiLabelMap.sno}</td>
	        	<td>${uiLabelMap.khataChangeApplicationNo}</td>
             	<td>${uiLabelMap.applicationDate}</td>
             	<td>${uiLabelMap.essentialDocument}</td>
             	<td>${uiLabelMap.CommonStatus}</td>
             	<td>${uiLabelMap.CommonEdit}</td>
         	</tr>
      	</thead> 
       		<tr>
		      	<td align="center">1</td>
	          	<td><a href="viewKhataChangeDetail" align="center">CARF1000</a></td>
			  	<td>02/08/2017</td> 
			    <td>Disconnection</td> 
			    <td>Approved</td> 
			    <td><a href="<@ofbizUrl>editKhataDetails</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonEdit}</a></td>
		   	</tr>    
        </table>
	</div>
</div>
</form>
 
<script type="text/javascript" language="javascript">
     
     function searchKhataChangeDetail(formname)
     {
		   var form=document['khataChangeDetail'];
               form.action = "<@ofbizUrl>khataChangeDetail</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
    
</script>






