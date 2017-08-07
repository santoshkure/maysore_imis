<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createbillcorrection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   03/08/2017
<#-- 1.1			Pankaj Trivedi						05/08/2017    		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for the  search bill correction.-->

<form method="post" name="searchBillCorrection" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>		   			
    	
    		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.searchBillDetail}</li>
    		<div class="basic-nav" style="margin-top: -40px;"> 
		    	<ul>
    				<li>
    				
							<a title="Create Bill Correction" href="<@ofbizUrl>createcustomerbillcorrection</@ofbizUrl>">
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
			
			 <td class="label">${uiLabelMap.billCorrectionNo} </font></td>
			 <td><input type="text" name="billCorrectionNo"  value="" /></td>   



              <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSearch}" onclick="javascript:searchbilldetail();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
	
	<#--------------------------Bill correction List------------------------------>
<form method="post" name="listbillcorrection" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.billCorrectionList}</li>
    </ul>
    
  </div>
   <div class="screenlet-body min-scroll-div">
    <table class="basic-table" cellspacing="0">
    <thead>
         <tr class="header-row-2">
             <td><center>${uiLabelMap.sno}<center></td>
	         <td><center>${uiLabelMap.customerNo}<center></td>
             <td><center>${uiLabelMap.connectionNo}</center></td>
             <td><center>${uiLabelMap.billNo}<center></td>
             <td><center>${uiLabelMap.billCorrectionApplyDate}</center></td>
             <td><center>${uiLabelMap.CommonStatus}</center></td>
             <td><center>${uiLabelMap.CommonEdit}</center></td>
         </tr>
      </thead> 
       <tr>
		      	<td align="center">1</td>
	          	<td><center><a href="viewBillCorrectionDetails">10001</a></center></td>
			  	<td><center>0987 </center></td>
			  	<td><center>53536</center></td> 
			    <td><center>31/07/2017</center></td> 
			 	<td><center>approve</center></td> 
				<td><center><a href="javascript:editbillcorrection('listbillcorrection');" class="buttontext" align="center">${uiLabelMap.CommonEdit}</a></center></td>
		   </tr>    
        </table>
      </div>
    </div>
 </form>
 <script type="text/javascript" language="javascript">
     
     function searchbilldetail()
     {
		   var form=document['searchBillCorrection'];
               form.action = "<@ofbizUrl>searchbillcorrection</@ofbizUrl>";
			   form.submit();
		       disSubmit('disBttn');    
     }
	function editbillcorrection(formname)
	{
	     var form =document[formname];	
        form.action="<@ofbizUrl>editbillcorrectiondetail</@ofbizUrl>";
	    form.submit();
	}
    </script>






