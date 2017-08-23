<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchConnectionApplyPage.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	03 August 2017    -->

<#-- #####################################################################################################-->

<form method="post" name="searchConnection" class="basic-form">

  <div class="row">
  	<div class="alert alert-info">
   		<ul>
   		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.searchConnection}</li>
    		<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>connectionApply</@ofbizUrl>">
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

function validateDetails(searchConnection)
   {
		      var form=document['searchConnection'];
		      
		     
                        form.action = "<@ofbizUrl>searchConnectionApply</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    

    }
    
</script>