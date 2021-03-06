<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createWardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created       Modified By   Date Modify  -->
<#--- Anubha Saini    	31 July 2017      Anubha Saini     15 September 2017-->

<#-- #####################################################################################################-->

<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<#-- Kannad language conversation -->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
 <form method="post" name="createWardMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">${uiLabelMap.createWardMaster}</li>
      
    </ul>
    
  </div>
	<br/>
	<div class="screenlet-body">
	
		<table class="basic-table" cellspacing="0">
		
		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			<tr>
			     	
			 
			  <td class="label">${uiLabelMap.zoneName}<font color="red" >*</font> </td>
			  <td width="25%"><select name="zoneName" style="width:132px;margin:5px 0 5px 0;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>             	    	       	    	        

	    	   <#if ZoneMasterList?exists>
	    	      <#if ZoneMasterList?has_content>
	    	       <#list ZoneMasterList as ZoneMasterList>
	    	       
	    	       ${ZoneMasterList.zoneId?if_exists}
	    	       
	    	       
	         		  <option value="${ZoneMasterList.zoneId?if_exists}">${ZoneMasterList.zoneName?if_exists}</option>
 	    	       </#list>
	    	      
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>
			 <td class="label">${uiLabelMap.wardname}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="wardName" autocomplete="off" id="wardName" maxlength ="30" value="" />${uiLabelMap.inEnglish}<br> 
               <#-- Kannad language conversation -->
               	<input type="text" style="width:150px" maxlength="50" name="wardNameKan" id="wardNameKan" value="" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br></td> 
         	</tr>
         	<tr>
			 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;" >
					    <option value=''>Select</option>
				 	<option value="Mysore">Mysore</option>
				</select>
			</td>  
			
			  <td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="remark" value="" onchange="javascript:trimFunction(this)" maxlength="150" style="width:400px"></textarea></td>
        	</tr>
        	<input type="hidden" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  />
        	<#-- 
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
                   <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  /></td>
              <#--       <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>     
                     </td>   
                  </tr>--> 
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateParameters('createWardMaster');"/>
 					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBack();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
	

<script type="text/javascript" language="javascript">
function ConfirmBack() {
    var sure = confirm("Are you sure you want to Cancel?, data will be lost!");
       if( sure == true )  {
      
             document.createWardMaster.action="<@ofbizUrl>Wardmaster</@ofbizUrl>";
             document.createWardMaster.submit();
       }
      }
	  function validateParameters(formName)
      {
		   var form=document[formName];
		   var wardName = form.wardName.value;
		   var zoneName = form.zoneName.value;
   		   var cityName = form.cityName.value;
   		   var createdate = form.createdate.value;
   		 //  alert(""+createdate);
   		   
 		   if(notEmptyField(zoneName,"Select Zone Name.")) 
	         {
	         if(notEmptyField(wardName,"Ward Name should not be empty.")) 
		        {
	          if(alphabhetValidation1(wardName,"Ward Name ${uiLabelMap.alphabetical}"))
               {
 	             if(notEmptyField(cityName,"Select City Name")) 
		          {
		          var r=confirm("Are you sure, you want to Save the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>saveWardMaster</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		          }
		         }
		     }}}
        }
     
	
	
</script>