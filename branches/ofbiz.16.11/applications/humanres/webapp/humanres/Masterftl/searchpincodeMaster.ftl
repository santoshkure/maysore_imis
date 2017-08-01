<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: castMaster.ftl----->
<#--- Author             	Date Created      --->
<#--- Siddhi Rajput      	01/08/2017	  --->
<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en_US">
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" class="basic-form" name="pincodemaster" action="">
<div class="row">	
 <div class="alert alert-info">
   <ul>
      <li class="h3">${uiLabelMap.pincodemaster}</li>
      <div class="basic-nav" style="margin-top: -80px;">
          <ul>
              <li>
                 <a title="Create PinCode Master" href="<@ofbizUrl>PincodeMaster</@ofbizUrl>">
                 <i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
                  </a>
               </li>
         </ul>
      </div>
    </ul>
    
  </div>
 	<div class="screenlet-body">
 	 <table class="basic-table" cellspacing="0">
 				
		
 		<tr>
		   <td class="label" >${uiLabelMap.pincode}</td>
		   <td><input type="text" name="pincode" style="width:140px" maxlength ="7"/></td>
	    </tr>
	   
		<tr>
			<td colspan="4"><center>
			<div id ="saveBtn">
				<input name="save" value="${uiLabelMap.search}" type="button" onClick="validateParameters('pincodemaster')">
				<input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
			</div>
			</td>
						
		</tr>
		 </table>
  </div>
</div>
</form>
<form method="post" name="Listpincodemaster" action="" class="basic-form">
	
      <div class="row">
      <div class="alert alert-info">
        <ul>
	       <div align="center" style="font-size:12px"><b>${uiLabelMap.pinmasterlist}</b></div>
        </ul>
      </div>
      <div class="screenlet-body">
      <table class="basic-table hover-bar" rowspacing="5">
      <thead>
        <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}</center></td>
	         <td><center>${uiLabelMap.pincode}</center></td>
	         <td><center>${uiLabelMap.createdate}<center></td>
             <td><center>${uiLabelMap.Status}</center></td> 
             <td><center>${uiLabelMap.edit}<center></td>     
             <td><center>${uiLabelMap.Remove}</center></td>
             <td><center>${uiLabelMap.activeDeactive}</center></td>   
        </tr>
	    </thead>   
		     <tr>
	            <td><center>1</center></td>
	            <td><center>452001</center></td>
	            <td><center>01/08/2017</center></td>
	            <td><center>Active</center></td>
	            <td align="center"><center><a class="buttontext">${uiLabelMap.edit}</a></center></td>
                <td align="center"><center><a class="buttontext">${uiLabelMap.Remove}</a></center></td>
                <td align="center"><center><a class="buttontext">${uiLabelMap.Deactive}</a></center></td>
            </tr>
        </table>    
       </div>
       </div>
	 </form>