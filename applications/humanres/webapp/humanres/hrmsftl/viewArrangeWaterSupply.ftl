<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewArrangeWaterSupply.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   09/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to View Arrange Water Supply  -->

<#setting locale="en">
<form method="post" name="viewArrangeWaterSupply" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center">${uiLabelMap.viewArrWaterSupply}</div>
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
            
              O/o VANIVILAS WATER SUPPLY
              Mysore Nagarapalike Division, Mysore
            
            
             To,
               The Executive Engineer
               Vanivilas Water Supply Division
               Mysore Nagarapalike Mysore
              
               Respected Sir,
              
                      Sub:-  As per  Work Order No:- <b>12345</b> Date:-<b>09/08/2017</b> Street Name:-
                             <b>kulalampur</b> House No:-<b>B-146</b>  water supply work is complete.
                             Please arrangement water supply connection.
                                                                                  
                                                                                  
                                                                                  Yours faithfully
         </pre>
      </div> </div>
    </div>
 </form>
