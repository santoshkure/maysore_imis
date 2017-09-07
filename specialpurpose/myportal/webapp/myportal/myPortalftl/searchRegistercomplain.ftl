<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchRegistercomplain.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   03/08/2017
<#-- 1.1			Pankaj Trivedi						05/08/2017    		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search register complain.-->

<form method="post" name="createcustomerbillcorrection" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
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
		
			<tr>
			
			 <td class="label">${uiLabelMap.complaintNo}</td>
			 <td><input type="text" name="complaintNo"  value="" /></td>   
			</tr>


              <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchbilldetail(createcustomerbillcorrection);"/>
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
      <li class="h3">${uiLabelMap.ComplainList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td>${uiLabelMap.sno}</td>
	         <td>${uiLabelMap.complaintNo}</td>
             <td>${uiLabelMap.customerNo}</td>
             <td>${uiLabelMap.connectionNo}</td>
             <td>${uiLabelMap.complaintDate}</td>
             <td>${uiLabelMap.CommonStatus}</td>
             <td>${uiLabelMap.CommonEdit}</td>
         </tr>
      </thead> 
       <tr>
		      	<td>1</td>
	          	<td><a href="viewComplaintDetails">10001</a></td>
			  	<td>0987</td>
			  	<td>53536</td> 
			    <td>31/07/2017</td> 
			 	<td>approve</td> 
				<td><center><a href="javascript:editbillcorrection('complainregisterlist');" class="buttontext" align="center">${uiLabelMap.CommonEdit}</a></center></td>
		   </tr>    
        </table>
      </div>
    </div>
 </form>
 
 <script type="text/javascript" language="javascript">
     
     function searchbilldetail(createcustomerbillcorrection)
     {
		   		var form=document['createcustomerbillcorrection'];
               form.action = "<@ofbizUrl>searchcomplainregister</@ofbizUrl>";
			   form.submit(); 
     }
	function editbillcorrection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editregistercomplain</@ofbizUrl>";
	    form.submit();
	}
    </script>


