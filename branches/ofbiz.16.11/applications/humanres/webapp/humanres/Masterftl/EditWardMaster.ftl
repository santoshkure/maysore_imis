<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created      Modify by-->
<#--- Siddhi    	    03 Aug 2017       Anubha Saini on 16sep2017-->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<#-- Add by Anubha -->
<script language="javascript" src="/images/commonjs/kannadaTyping.js" type="text/javascript"></script>
<form method="post" name="editWardMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editWard}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
    <td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
 	<table class="basic-table" cellspacing="0">
		<#if WardMasterLists?has_content>
 				 <#list WardMasterLists as WardMasterLists>
		 		<input type="hidden" name="wardId" value="${WardMasterLists.wardId?if_exists}" style="width:140px"  />
 			 
			<tr>
  			<#--  <td class="label">${uiLabelMap.zoneName}<font color="red" >*</font> </td>
			 <td width="25%"><select name="zoneName" style="width:132px;margin:5px 0 5px 0;" onchange="javascript:getParentOffice(this);">
             <option value=''>${uiLabelMap.CommonSelect}</option>             	    	       	    	        

	    	   <#if ZoneMasterList?exists>
	    	      <#if ZoneMasterList?has_content>
	    	       <#list ZoneMasterList as ZoneMasterList>
	         		  <option value="${ZoneMasterList.zoneName?if_exists}">${ZoneMasterList.zoneName?if_exists}</option>
 	    	       </#list>
	    	      
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td> -->
                
            <td class="label">${uiLabelMap.zoneName}<font color="red" >*</font></td>
             <td><select name="zoneName" autocomplete="off" style="width:152px;margin:5px 0 5px 0;">
              <option value="">${uiLabelMap.CommonSelect}</option>
                <#assign zoneNamevar  = "${WardMasterLists.zoneId?if_exists}">
                         <#if ZoneMasterList?has_content>
                            <#list ZoneMasterList as ZoneMasterList>
                             <#if "${ZoneMasterList.zoneId?if_exists}" == "${zoneNamevar?if_exists}">
                               <option value="${ZoneMasterList.zoneId?if_exists}" selected>${ZoneMasterList.zoneName?if_exists}</option>
                            <#else>
                                <option value="${ZoneMasterList.zoneId?if_exists}">${ZoneMasterList.zoneName?if_exists}</option>
                              </#if>
                            </#list>
                        </#if>   
                 </select></td>    
            
                    
			  <td class="label">${uiLabelMap.wardname}<font color="red" >*</font></td>
             <td><input type="text" name="wardName" onchange="javascript:trimFunction(this)" value="${WardMasterLists.wardName?if_exists}" style="width:140px"  />${uiLabelMap.inEnglish}<br> 
               	<#-- Add by Anubha -->
               	<input type="text" style="width:150px" maxlength="50" name="wardNameKan" id="wardNameKan" value="${WardMasterLists.wardNameKan?if_exists}" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);" />${uiLabelMap.inKannada}<br></td>
        	</tr>
        	 
        	<tr>
			 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;" >
				  <option value=''>Select</option>
				 	<option value="Mysore" selected="true">Mysore</option>
				</select>
			</td>  
			
			  <td class="label">${uiLabelMap.remark}</td>
            <td><input type="text" textarea name="wardRemark" onchange="javascript:trimFunction(this)" value="${WardMasterLists.wardRemark?if_exists}" style="width:140px" maxlength="150" /></td>
			 	
         	</tr>
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
		             <td><input type="text" name="createdate" value="<#if WardMasterLists.createdate?has_content>${WardMasterLists.createdate?if_exists?string("dd/MM/yyyy")}</#if>" style="width:140px" readonly /></td>
             
                  </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
                       <input name="update" value="${uiLabelMap.CommonUpdate}" type="button" onClick="updateWardDetails('editWardMaster','edit')">
				       <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBack();"/>
					  
					</div>
					</center>
				</td><input type="hidden" name="activestatus" value="${WardMasterLists.status?if_exists}" style="width:140px"  />
				<input type="hidden" name="status" value="" style="width:140px"  />
			</tr>
			</#list>
				</#if>
		</table>
		</div>
	</div>
	
	</form>
		 <script language="JavaScript" type="text/javascript" />
   function ConfirmBack() {
    var sure = confirm("Are you sure you want to Cancel? data will be lost!");
       if( sure == true )  {
      
             document.editWardMaster.action="<@ofbizUrl>Wardmaster</@ofbizUrl>";
             document.editWardMaster.submit();
       }
      }
	
	
	 function updateWardDetails(formName,stat)
      {
		   var form=document[formName];
		   var wardName = form.wardName.value;
		   var cityName = form.cityName.value;
   		   var zoneName = form.zoneName.value;
 		   if(notEmptyField(zoneName,"Select Zone Name")) 
     		{
		      if(notEmptyField(wardName,"Ward Name should not be empty.")) 
		        {
 		          if(alphabhetValidation1(wardName,"Ward Name ${uiLabelMap.alphabetical}"))
                  {
	             if(notEmptyField(cityName,"Select cityName")) 
		          {
		          // alert(""+stat);
		            form.status.value = stat;
	               var r=confirm("Are you sure, you want to Update the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>updateWardDet</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		          }
		         }
		     }}}
        }
	
 </script>	
	

