<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: faqSupport.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   30/07/2017        
<#-- #####################################################################################################-->
<#--This ftl is used to show FAQ Detail -->
<style>
a.query {
  font-size:12px;
  color:blue;
} 
a:hover.query {
  font-size:12px;
  color:Red;
} 

.eimsheading {

color:#3484BC;
font-size : 13px;
font-weight:bold;
font-family:Tahoma, Geneva, sans-serif;
}

.imisContent {
font-size : 12px;
font-family:Tahoma, Geneva, sans-serif;
line-height:28px;
}

.mainhead{
font-size:14px;
border:1px solid #000;
height:35px;
color:#21610B;
 -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -khtml-border-radius: 10px;
    border-radius: 10px;
    position:relative;
    line-height:20px;
    padding:5px;
   
    background-color:#ffffff;
  border:1px solid black;
  opacity:0.6;
  filter:alpha(opacity=60); /* For IE8 and earlier */
  width:99%;
}

</style>
<form method="post" name="registerConsumer" action="" class="basic-form">
 
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>Frequently Asked Questions</b></div>
	    		</ul>
  				</div>
  <div class="screenlet-body-dash">
    <table>
      <tr>
         <td><div class="mainhead">
         We are here to help you through different means of communication. You can call us, mail us or directly raise your queries at our "IMIS Support Center".</div></td>
      </tr>
      <tr>
         <td align="center">
            <table>
            	<tr>
                   <td colspan="2" class="eimsheading">1:- How can I check my Water Tax details?</td>
                </tr>
               <tr>
                  <td class="imisContent"><b>Answer:- For water tax details you can select Pay Water Tax on the home page of website. By searching your account by your connection number or name you can find out your water tax details.</b><br /> </td>
               </tr>
                <tr>
                   <td colspan="2" class="eimsheading">2:- Does the registered vendor transfer his License / business rights to person other than his heirs ?</td>
                </tr>
               <tr>
                  <td class="imisContent"><b>Answer:- Yes</b><br /> </td>
               </tr>
               <tr>
                   <td colspan="2" class="eimsheading">3:- What  are  the  contact  details  of  the  Department  of  Administrative 
				Reforms and Public Grievances?</td>
                </tr>
               <tr>
                  <td class="imisContent"><b>Answer:- Mysore City Corporation,New Sayyaji Rao Road, Mysore 570024.</b><br /> </td>
               </tr>
            </table>
         </td>
      </tr>
    </table>
</div>
</form>   