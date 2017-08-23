<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewIssueWorkOrder.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   08/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Issue Work Order -->

<#setting locale="en">
    <form method="post" name="viewIssueWorkOrder" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.viewIssueWorkOrder}</b></div>
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
		<div class="screenlet-body" id="printId1">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                <pre>
                		MYSORE MAHANAGARAPALIKE,
       				MYSORE
				Measure Production No:-
				O/o VANIVILAS WATER SUPPLY
				Mysore Nagarapalike Division,
				Mysore
				WORK ORDER
				${uiLabelMap.workOrderNo} :- <b>WO4005</b>	${uiLabelMap.CommonDate}:- <b>08/08/2017</b>    		${uiLabelMap.plumberName} :- <b>Ramesh</b>
				${uiLabelMap.houseNo} :- <b>10001</b> 		${uiLabelMap.houseOwnerName} :- <b>Ravi</b> 	${uiLabelMap.depositReceiptNo} :- <b>100012</b> 
				${uiLabelMap.ofRs} <b> 10000 </b> 			${uiLabelMap.CommonDate}:- <b>08/08/2017</b>  		${uiLabelMap.houseNo}:- <b>10001</b> ${uiLabelMap.streetName}:- <b>GandiNagar</b>
				${uiLabelMap.roadDiggingChargesOfRs}:- <b> 10000 </b> ${uiLabelMap.paidtoMysoreNagarapalike}.
                		${uiLabelMap.stNo} :- <b>100001</b> ${uiLabelMap.CommonDate} :- <b>08/08/2017</b> ${uiLabelMap.subject} :- subject      		${uiLabelMap.nonHousehold} :- 1    
                		${uiLabelMap.receiptNo} :- <b>1</b> ${uiLabelMap.CommonDate} :- <b>08/08/2017</b>  	${uiLabelMap.measureEquipmentRate} :-      
                		${uiLabelMap.receiptNo} :-  100111 	${uiLabelMap.CommonDate} :- <b>08/08/2017</b>
                </pre>
               </tbody>
          </table>
     </div>
       </div>
  
 </form>