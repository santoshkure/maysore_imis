<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchissueWorkOrder.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Customer Detail -->

<#setting locale="en">
<form method="post" name="workOrderSearch" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  		<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  		<div class="h3" align="center"><b>${uiLabelMap.searchIssueWorkOrder}</b></div> 
  		<div class="basic-nav" style="margin-top: -36px;">
          <ul>
            <li>
                <a title="${uiLabelMap.issueNewWorkOrder}" href="<@ofbizUrl>createIssueWorkOrder</@ofbizUrl>">
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
              	<td class="label">${uiLabelMap.workOrderNo}</td>
             	<td><input type="text" name="workOrderNo" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.CommonDate}</td>
             	<td><@htmlTemplate.renderDateTimeField name="date" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
			 </tr>
			 <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:issueWorkOrderDetail();"/>
					</div>
					</center>
				</td>
			</tr>
        </table>
    </div>
</div>
</form>

<script type="text/javascript" language="javascript">
     
     function issueWorkOrderDetail()
     {
		   var form=document['workOrderSearch'];
               form.action = "<@ofbizUrl>issueWorkOrder</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
    </script>