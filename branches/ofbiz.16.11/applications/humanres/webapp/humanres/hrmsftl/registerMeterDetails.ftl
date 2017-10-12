<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: registerNewMeterDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#---1.0			                               Anubha Saini  on  11/10/2017 --> 
<#-- #####################################################################################################-->
<#--This ftl is used to Search Meter Detail -->

<#setting locale="en">
<form method="post" name="searchMeterDetail" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
	<ul>
		<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <div class="h3" align="center"><b>${uiLabelMap.searchMeterDetail}</b></div> 
        <div class="basic-nav" style="margin-top: -36px;">
          <ul>
            <li>
                <a title="${uiLabelMap.registerNewMeterDetail}" href="<@ofbizUrl>createNewMeter</@ofbizUrl>">
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
              	<td class="label">${uiLabelMap.meterNo}</td>
             	<td><input type="text" name="meterNo" onchange="javascript:trimFunction(this)" value="" maxlength="140" style="width:302px;"/>
             	</td>
           </tr>	
        <tr>
			<td colspan="8"><center><div id="saveBtn" align="center"><input type="button" title="Search" name="search" value="${uiLabelMap.CommonSearch}" onclick="javascript:validateFields1('searchMeterDetail');"></center></td>
		</tr>
		</table>
     </div>
</div>
</form>

 <script language="JavaScript" type="text/javascript" />
 
function validateFields1(formname)
 {
 var form=document[formname];
 //var meterId = form.meterId.value;
 var meterNo = form.meterNo.value;
 
 form.action = "<@ofbizUrl>registerMeterDetails</@ofbizUrl>";
  form.submit();
}
</script>