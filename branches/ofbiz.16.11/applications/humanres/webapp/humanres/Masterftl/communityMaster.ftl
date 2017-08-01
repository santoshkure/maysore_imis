<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: communityMaster.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   31/07/2016		
<#-- #####################################################################################################-->
<#--This ftl is used to show the community name -->

<#setting locale="en">
 <form method="post" name="communityMaster" action="">
	      <div class="row">	
	
	
		       <div class="alert alert-info">
		       
		      <ul>
			        <div align="center" style="font-size:12px"><b>${uiLabelMap.communitymaster}</b></div>
			  </ul>
		            </div>
 			   <div class="screenlet-body">
 			   
 				  <table class="basic-table" cellspacing="0">
					
 				    <tr>
						   <td class="label" >${uiLabelMap.communityname}</td>
					       <td><input type="textbox" MAXLENGTH="20" name="ctype" value="" style="width:140px">
					        <td class="label" >${uiLabelMap.dateofcreate}</td>
					       <td><input type="textbox" name="dtype" value="" style="width:140px" readonly>
					</tr>
					
						    <td class="label" >${uiLabelMap.remark}</td>
					        <td><input type="textarea" MAXLENGTH =150 name="rtype" value="" style="width:140px">
					</tr>
				<td colspan="4"><div id="disBttn" align="center">
					 <center><input type="button" value="Save" onClick="validateForm('communityMaster')";>
					<input type='button' name="cancelPage" value="Cancel" onclick="javascript:"/>		
					</center>	
                    </div>
                </td>	
            </table>
        </div>
     </div>
  </form>
<#-----------------------Java Script for Community Master------------->
<script language="JavaScript" type="text/javascript" />

function validateParameters(formName)
{
  var form=document[formName];
  var ctype = form.ctype.value;
    if(notEmptyField(ctype,"community name should not be empty.")) 
    {
  
     if(commonAlphabetValidation(ctype,"community name")) 
      {   
		  form.action = "<@ofbizUrl>savecommunitymaster</@ofbizUrl>";
		  form.submit();
      }
    
}

 </script>

<#------------------------------------Community Master List------------------------>
       <div class="row">
           <div class="alert alert-info">
             <ul>
                <li class="h3">${uiLabelMap.communityNameList}</li>
             </ul>
          <br class="clear"/>
       </div>
       
         <div class="screenlet-body min-scroll-div">
       <div class="table-responsive">
    <table class="basic-table table-responsive" cellspacing="0">
  <thead>
         <tr class="header-row-2">
             <td><center>S.No<center></td>
             <td><center>${uiLabelMap.communityname}<center></td>
             <td><center>${uiLabelMap.dateofcreate}</center></td>
             <td><center>${uiLabelMap.Remark}</center></td>
             <td><center>${uiLabelMap.Status}</center></td>
             <td><center>edit</center></td>
             <td><center>Remove</center></td>
             <td><center>Active/Deactive</center></td>
         </tr>
   </thead>
                   <tr>
                          <td align="center">1</td>
                          <td><center>mysore city</center></td>
                          <td><center>31/08/2017</center></td>
                          <td><center>remark</center></td>
                           <td><center>Act</center></td>
                          <td><center><a class="Buttontext">Edit</a></center></td>
                          <td><center><a class="buttontext">Remove</a></center></td>
                          <td><center><a class="buttontext">Active</a></center></td>
                  </tr>    
      </table>
    </div>
  </div>
</div>