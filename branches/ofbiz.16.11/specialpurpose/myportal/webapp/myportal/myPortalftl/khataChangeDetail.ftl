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
             	<td><center>${uiLabelMap.sno}<center></td>
	        	<td><center>${uiLabelMap.khataChangeApplicationNo}<center></td>
             	<td><center>${uiLabelMap.applicationDate}</center></td>
             	<td><center>${uiLabelMap.assentialDocument}<center></td>
             	<td><center>${uiLabelMap.CommonStatus}</center></td>
         	</tr>
      	</thead> 
       		<tr>
		      	<td align="center">1</td>
	          	<td><center>CARF1000</center></td>
			  	<td><center>02/08/2017</center></td> 
			    <td><center>Disconnection</center></td> 
			    <td><center>Approved</center></td> 
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






