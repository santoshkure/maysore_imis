<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createZoneMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     Updated by -->
<#--- Anubha Saini    	01 August 2017    Saurabh Gupta on 09 Aug 2017 -->

<#-- #####################################################################################################-->

<form method="post" name="createZoneMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.createZone}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			<tr>
			
			 <td class="label">${uiLabelMap.zoneName} <font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="zoneName" autocomplete="off" id="zoneName" maxlength ="30" value="" /></td>    	
			 
			  <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;" >
				    <option value=''>Select</option>
 				 	<option value="Mysore">Mysore</option>
				</select>
			</td>  
		  
        	</tr>
	
        	<tr>
			 <td class="label">${uiLabelMap.officeName}<font color="red" >*</font></td>
			  <td width="25%"><select name="officeName" style="width:132px;margin:5px 0 5px 0;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if officeMaterListed?exists>
	    	      <#if officeMaterListed?has_content>
	    	       <#list officeMaterListed as officeMaterListed>
 	    	         <option value="${officeMaterListed.officeSiteName?if_exists}">${officeMaterListed.officeSiteName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>			
			  <td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="remark" onchange="javascript:trimFunction(this)" value="" maxlength="150" style="width:400px"></textarea></td>
        	</tr>
        	<tr>
           <td class="label" >${uiLabelMap.createdate}</td>
		   <td><input type="text" name="createdate" value="${nowTimestamp?string("dd/MM/yyyy")}" style="width:140px"  /></td>
                  <#-- <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                -->   </td>   
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateParameters('createZoneMaster');"/>
				        <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBack();"/>
				
 					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>

	</form>
		


<script>
		function ConfirmBack() {
       var sure = confirm("Are you sure you want to Cancel?, data will be lost!");
       if( sure == true )  {
      
             document.createZoneMaster.action="<@ofbizUrl>ZoneMaster</@ofbizUrl>";
             document.createZoneMaster.submit();
       }
      }	
	  function validateParameters(formName)
      {
		   var form=document[formName];
		   var zoneName = form.zoneName.value;
		   var cityName = form.cityName.value;
   		   var officeName = form.officeName.value;
   		      var createdate = form.createdate.value;
 		  // alert(""+createdate);
		    if(notEmptyField(zoneName,"Zone Name should not be empty.")) 
		     {
		     if(alphabhetValidation1(zoneName,"Zone Name ${uiLabelMap.alphabetical}"))
               {
		       if(notEmptyField(cityName,"Select City Name.")) 
		         {
	             if(notEmptyField(officeName,"Select Office Name")) 
		          {
		          var r=confirm("Are you sure, you want to Save the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>saveZonemasterdet</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		          }
		         }
		     }}}
        }
	
	
</script>