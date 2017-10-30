<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: faqSupport.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   30/07/2017        
<#-- #####################################################################################################-->
<#--This ftl is used to show Help Center Detail -->
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
height:50px;
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
    				<div class="h3" align="center"><b>IMIS Support</b></div>
	    		</ul>
  				</div>
  <div class="screenlet-body-dash">
    <table>
      <tr>
         <td><div class="mainhead">
         We are here to help you through different means of communication. You can call us, mail us or directly raise your queries at our "IMIS Support Center". We will start processing your query as soon as possible.</div></td>
      </tr>
      <tr>
         <td align="center">
            <table>
                <tr>
                   <td colspan="2" class="eimsheading">Contact us:</td>
                </tr>
               <tr>
                  <td width="50px"></td>
                  <td class="imisContent">0821-2418800 <br /> </td>
               </tr>
               <tr>
                   <td colspan="2" class="eimsheading">Support Timing:</td>
                </tr>
               <tr>
                  <td></td>
                  <td class="imisContent">10:00 am to 7:00 pm  </td>
               </tr>
               <tr>
                   <td colspan="2" class="eimsheading">E-mail us:</td>
                </tr>
               <tr>
                  <td></td>
                  <td class="imisContent">imismysore@gmail.com </td>
               </tr>
                <tr>
                   <td colspan="2"  class="eimsheading">Office Address :</td>
                </tr>
               <tr>
                  <td></td>
                  <td class="imisContent">
                        Mysore City Corporation,New Sayyaji Rao Road, Mysore 570024.
                       </td>
               </tr>
            </table>
         </td>
      </tr>
    </table>
</div>
</form>   