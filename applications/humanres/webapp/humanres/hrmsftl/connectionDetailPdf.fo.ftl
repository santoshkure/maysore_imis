<#escape x as x?html>
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <fo:layout-master-set>
   	<fo:simple-page-master master-name="table" page-height="210.00mm"
    	page-width="297.00mm" margin-top=".7in" margin-bottom="1.0in"
    	margin-left="1in" margin-right=".1in">
    	<fo:region-body/>
    	<fo:region-before extent=".5in"/>
    	<fo:region-after extent=".5in"/>
    </fo:simple-page-master>
  </fo:layout-master-set>

<fo:page-sequence master-reference="table">

<fo:static-content flow-name="xsl-region-after">
       <fo:block>
              <fo:leader leader-pattern="space" />
        </fo:block>
          <fo:block>
              <fo:leader leader-pattern="space" />
        </fo:block><fo:block font-size="10px"  font-family="Times New Roman" text-align="right" font-weight="bold">
           Page <fo:page-number/> of <fo:page-number-citation ref-id="last-page"/>
       </fo:block>
    </fo:static-content>

  <fo:flow flow-name="xsl-region-body">
 
   <fo:table table-layout="fixed"  font-size="8px" font-family="verdana" width="25cm" height="17cm" border-width="0.1mm" border-style="solid">
	 
    <fo:table-column column-width="10mm"/>
   <fo:table-column column-width="40mm"/>
   <fo:table-column column-width="50mm"/>
   <fo:table-column column-width="25mm"/>
   <fo:table-column column-width="70mm"/>
   <fo:table-column column-width="25mm"/>
   <fo:table-column column-width="25mm"/>
 <fo:table-body>
 
  <fo:table-row>
		<fo:table-cell padding="1pt" border="0.5pt solid black" number-columns-spanned="7">
            <fo:block text-align="center" font-weight="bold"><fo:external-graphic src="/rainbowstone/images/imis-logo.png" content-height="0.9in" vertical-align="middle"/></fo:block>
         </fo:table-cell>

</fo:table-row>
 
 <fo:table-row>
		<fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="7" >
            <fo:block font-weight="bold" font-size="10px" text-align="left">Connection Detail<fo:block/><fo:block/>
            <fo:leader leader-length="100%" leader-pattern="rule"/></fo:block>
         </fo:table-cell>

</fo:table-row>

 		<fo:table-row>
 
 				<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">S.No.</fo:block>
           		</fo:table-cell>
           		<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">Connection No.</fo:block>
           		</fo:table-cell>
           		<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">Customer Id</fo:block>
           		</fo:table-cell>
           		<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">Connection Category</fo:block>
           		</fo:table-cell>
           		<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">Application Type</fo:block>
           		</fo:table-cell>
           		<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">Action Date </fo:block>
           		</fo:table-cell>
           		<fo:table-cell  border="0.8pt solid black"  number-rows-spanned="1">
           	      <fo:block font-weight="bold">Status</fo:block>
           		</fo:table-cell>
        </fo:table-row>  
           
           <#if searchConnectionList?has_content>
	      	<#assign x = searchConnectionList?size/>
            <#assign i = 1>
	      	<#list searchConnectionList as searchConnectionList>
	    	
	    	<fo:table-row>
	    	
	      	<fo:table-cell  border="0.8pt solid black">
	      	<fo:block> ${i?if_exists}</fo:block>
	      	</fo:table-cell>
	      
	      <fo:table-cell  border="0.8pt solid black">
	      	<fo:block> ${searchConnectionList.connectionNo?if_exists}</fo:block>
	      	</fo:table-cell>
	      	<fo:table-cell  border="0.8pt solid black">
	      	<fo:block> ${searchConnectionList.customerId?if_exists}</fo:block>
	      	</fo:table-cell>
	      	<fo:table-cell  border="0.8pt solid black">
	      	<fo:block> ${searchConnectionList.connectionCategory?if_exists}</fo:block>
	      	</fo:table-cell>
	      	<fo:table-cell  border="0.8pt solid black">
	      	<fo:block> ${searchConnectionList.applicationType?if_exists}</fo:block>
	      	</fo:table-cell>
	      	<fo:table-cell  border="0.8pt solid black">
	      <fo:block> ${searchConnectionList.actionDate?if_exists}</fo:block>
	      	</fo:table-cell>
	      	<fo:table-cell  border="0.8pt solid black">
	      	<fo:block> ${searchConnectionList.actionStatus?if_exists}</fo:block>
	      	</fo:table-cell>
	        </fo:table-row>
	    	
	     <#assign i = i+1>
        
         </#list>
	     </#if>
</fo:table-body>
</fo:table>
<fo:block id="last-page"/>
 </fo:flow>
</fo:page-sequence>

</fo:root>

</#escape>