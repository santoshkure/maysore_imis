<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchRegistercomplain.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   03/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search register complain.-->

<form method="post" name="createcustomerbillcorrection" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    		<li class="h3">${uiLabelMap.complainRegister}</li>
    		<div class="basic-nav" style="margin-top: -40px;"> 
		    	<ul>
    				<li>
							<a title="Create Bill Correction" href="<@ofbizUrl>createregisterComplain</@ofbizUrl>">
								<i class="fa fa-plus-circle" aria-hidden="true" style="font-size: 35px;color: #2f87c6;"></i>
							</a>
    				</li>
  				</ul>
  			</div>
 		</ul>
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			<tr>
			
			 <td class="label">${uiLabelMap.complaintNo} <font color="red">*</font></td>
			 <td><input type="text" name="complaintNo"  value="" /></td>   



              <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Search" onclick="javascript:searchbilldetail(createcustomerbillcorrection);"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBackMaster();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
<#--------------------------Master List------------------------------>
<form method="post" name="complainregisterlist" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.registerComplainList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
	         <td><center>${uiLabelMap.complaintNo}<center></td>
             <td><center>${uiLabelMap.consumerNo}</center></td>
             <td><center>${uiLabelMap.connectionNo}<center></td>
             <td><center>${uiLabelMap.complaintDate}</center></td>
             <td><center>${uiLabelMap.status}</center></td>
             <td><center>${uiLabelMap.Edit}</center></td>
         </tr>
      </thead> 
       <tr>
		      	<td align="center">1</td>
	          	<td><center>1000</center></td>
			  	<td><center>0987 </center></td>
			  	<td><center>53536</center></td> 
			    <td><center>31/07/2017</center></td> 
			 	<td><center>approve</center></td> 
				<td><center><a href="javascript:editbillcorrection('complainregisterlist');" class="buttontext" align="center">Edit</a></center></td>
		   </tr>    
        </table>
      </div>
    </div>
 </form>
 
 <script type="text/javascript" language="javascript">
     
     function search(formname)
     {
		   var form=document['createcustomerbillcorrection'];
               form.action = "<@ofbizUrl>search</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
	function editbillcorrection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editregistercomplain</@ofbizUrl>";
	    form.submit();
	}
    </script>



