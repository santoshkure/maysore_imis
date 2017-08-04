<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchKattaChange.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	04 August 2017    -->

<#-- #####################################################################################################-->

<form method="post" name="searchKhata" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
    		<li class="h3">${uiLabelMap.searchKhata}</li>
    	</ul>
  	</div>
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		<tr>
            <td class="label">${uiLabelMap.connectionNo}</td>
             <td><input name="consumerNo"  type="text" maxlength="10" value="" placeholder="${uiLabelMap.connectionNo}"></td>
                       
       	<tr>
			<td colspan="8"><center><div id="search" align="center"><input type="button"  name="search" value="Search" onclick="javascript:validateDetails('searchConnection');"></center></td>
		</tr>
	</tr>
	</table>
	</div>
	</div>
	
</form>


 
 

<script type="text/javascript" language="javascript">

<#-- 	function validateTypeMaster()
	{
					document.zoneMaster.action= "<@ofbizUrl>connectionApply</@ofbizUrl>";
					document.zoneMaster.submit();
					disSubmit('saveBtn'); 
					//return true;
					//alert("submit");
					
	}
			
	-->
     
	
	
</script>