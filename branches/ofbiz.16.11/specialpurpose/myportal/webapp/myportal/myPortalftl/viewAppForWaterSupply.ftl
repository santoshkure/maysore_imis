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
		    	<div class="h3" align="center"><b>${uiLabelMap.veiwAppWaterSupply}</b></div>
		    	
			</ul>
	     
		</div>
		<div class="screenlet-body">
		
<pre>
	${uiLabelMap.statement}
	
		1] ${uiLabelMap.shreeSheemati} <b>Name of Customer</b> ${uiLabelMap.line1}
		   ${uiLabelMap.line} <b>5</b> ${uiLabelMap.line2}    <b>5000</b> ${uiLabelMap.lineTwo}
		3] ${uiLabelMap.line3}
		4] ${uiLabelMap.line4}
		
</pre>

		</div>
     </div>
 </form>



