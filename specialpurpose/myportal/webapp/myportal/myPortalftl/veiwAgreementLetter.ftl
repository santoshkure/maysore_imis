<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: veiwAgreementLetter.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#-- 1.0			Anubha Saini						10/08/2017    
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for create Application for water supply.-->


<#setting locale="en">
   
    <form method="post" name="createAgreementLetter" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.createAppForAgreementLetter}</b></div>
		    	
			</ul>
	     
		</div>
		<div class="screenlet-body">
		
<pre>
	 							
	 					<b>${uiLabelMap.agreementLetter}</b>
					    
				 ${uiLabelMap.shreeSheemati} <b>Name of Customer</b> ${uiLabelMap.paraOneAgreement}
		
		  
</pre>
</form>