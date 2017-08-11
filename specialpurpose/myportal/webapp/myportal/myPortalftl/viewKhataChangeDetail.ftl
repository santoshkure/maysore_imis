<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewKhataChangeDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   09/08/2017 

<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->
   
   
   <form method="post" name="veiwkhataChange" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		<#--  <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.changeKhata}</span></div>-->
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.veiwKhataChange}</b></div>
	    		</ul>
  				</div>
  					
				
        		<table cellspacing="0" class="basic-table table-responsive">
        		
        					<input type="hidden" name="khataChangeId" value="" <li><a title="This is your khataChange Id"/>
         					<input type="hidden" name="khataChgangeNo" value="" <li><a title="This is your khata Chgange No"/>
         					<input type="hidden" name="customerId" value="" <li><a title="This is your customer Id"/>
         					<input type="hidden" name="connectionId" value="" <li><a title="This is your connection Id"/>
        		
        			
        			<tr>
                      	<td class="label">${uiLabelMap.customerNo}</td>
                        <td>CAN1001</td>
                        
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td>CON2001</td>
                        
                    </tr>
                    
                     
                     <tr>
                      	<td class="label">${uiLabelMap.applicationDate}</td>
                        <td>09/08/2017</td>
                        <td class="label">${uiLabelMap.assentialDocument}</td>
                        <td>Disconnection</td>
                    </tr>
                   
                    <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.oldConnectionDetail}</font></td></tr>
                    <tr>
                    <td class="label">${uiLabelMap.connectionCategory}</td>
                         <td>Household</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                         <td>Permanent</td>
             		<tr>
                   <td class="label">${uiLabelMap.typeOfBuilding}</td>
 						<td>Residential</td>   
   						<td class="label">${uiLabelMap.applicationDate}</td>
   						<td>02/08/2017</td>
   						
   					</tr>
                    <tr>
	                         
	                         <td class="label">${uiLabelMap.assentialDocument}</td>
							<td>Disconnection</td>
                    </tr>
                    
                    	 <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.newchangeKhata}</font></td></tr>
	               	
                     <tr>
	                         
	                        <td class="label">${uiLabelMap.newKhataNo}</td>
	                        <td>CARF1000</td>
                    </tr>
                   
        		</table>
 
	</div>
   <#--	</div>-->

   
</form>

