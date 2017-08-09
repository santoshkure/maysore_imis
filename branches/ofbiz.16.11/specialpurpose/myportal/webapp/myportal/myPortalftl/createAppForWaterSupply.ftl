<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createAppForWaterSupply.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#-- 1.0			Pankaj Trivedi						08/08/2017    
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for create Application for water supply.-->

<#setting locale="en">
   
    <form method="post" name="createAppForWaterSupply" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.createAppWaterSupply}</b></div>
		    	
			</ul>
	     
		</div>
		<div class="screenlet-body">
		
<pre>
	To,
	The Executive Engineer,
	Water Supply Division,
	Bangalore
	
		1] I Shree/Shreemati <b>Name of Customer</b> I appointment a authorised departmental contractor for water supply works.
		   Therefore give me a <b>5</b> dia measuring unit for water supply.
			
		2] Nagarapalike is fix Rs. <b>5000</b> yearly tax valuation fixed.The same may enclose here with.
			
		3] I know rules and conditions and obey its conditions.
		
		4] I enclose herewith estimate plan with format as per 7-A submitted.
		
</pre>

            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                    <tr>
                    	<td colspan="4"><center>
                    		<div id ="saveBtn">
                    		<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:createWaterSupply();"/>
                    		<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     		</center>
                     	</td>
                    </tr>
               </tbody>
          </table>
     </div>
 </form>

  <script type="text/javascript" language="javascript">

  function createWaterSupply()
   {
		   var form=document['createAppForWaterSupply'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                        {
                        form.action = "<@ofbizUrl>appliedConnectionDetail</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    </script>
