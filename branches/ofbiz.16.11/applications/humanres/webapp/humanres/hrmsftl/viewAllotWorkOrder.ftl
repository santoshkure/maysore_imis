<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewAllotWorkOrder.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   08/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to View Allot WorkOrder  -->

<#setting locale="en">
<form method="post" name="viewAllotWorkOrder" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center">${uiLabelMap.viewWorkOrder}</div>
			</ul>
			<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>connectionApply</@ofbizUrl>">
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    				</li>
  				</ul>
 			 
  			</div> 
	</div>
	<div id="printId1">
       <pre>
        MYSORE MAHANAGARAPALIKE,
        MYSORE
        Measure Production No:-
        O/o VANIVILAS WATER SUPPLY
        Mysore Nagarapalike Division,
        Mysore
        
        WORK ORDER
        
        
      	 Work Order No:-<b>45666</b> 			 Date:-<b> 08/08/2017</b>
      	 
      	PRIVATE FACILITY
		To plumber for work done reporting of allotted household water facility as per plan.
		
		
	
		
		
		
		Mysore.                         				Executive Engineer
										Vanivilas Water Supply
										Mysore Nagarapalike
										Division, Mysore
		Date:-
		
       </pre>
    </div>
</div></div>
</form>
