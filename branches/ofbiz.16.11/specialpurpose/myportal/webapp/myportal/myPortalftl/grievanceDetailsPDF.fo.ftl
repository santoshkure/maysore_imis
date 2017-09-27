
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

 <fo:layout-master-set>
    <fo:simple-page-master master-name="table" page-height="285.00mm"
     page-width="425.00mm" margin-top=".5in" margin-bottom="1.0in"
     margin-left=".5in" margin-right=".5in">
     <fo:region-body/>
     <fo:region-before extent=".5in"/>
     <fo:region-after extent=".5in"/>
    </fo:simple-page-master>

 </fo:layout-master-set>

<fo:page-sequence master-reference="table">
<#assign defaultUrl1 = "IMIS">
 <fo:static-content flow-name="xsl-region-after">
 
  <#-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TO INSERT PAGE NUMBER ~~~~~~~~~~~~~~~~~~~~ rest part in at last --->
       <fo:block>
              <fo:leader leader-pattern="space"/>
        </fo:block>
        <fo:block>
              <fo:leader leader-pattern="space"/>
        </fo:block>
        <fo:block>
              <fo:leader leader-pattern="space"/>
        </fo:block>

       <fo:block>
          <fo:inline font-size="10pt"  font-family="Times New Roman" text-align="left" font-weight="bold">
          ${defaultUrl1?if_exists}
       
          </fo:inline>
         </fo:block>
            <fo:block font-size="12pt"  font-family="Times New Roman" text-align="right" font-weight="bold">
           Page <fo:page-number/> of <fo:page-number-citation ref-id="last-page"/>
       </fo:block>
    </fo:static-content>
    
  <fo:flow flow-name="xsl-region-body">
     <#-- <fo:block font-weight="bold" text-align="center">
            <fo:external-graphic src="/images/vmwarePeel.png"  content-height="1in" vertical-align="middle"/>       
      </fo:block> -->
    <fo:block>
    <fo:leader leader-pattern="space"/>
    </fo:block>
	<fo:block space-after="1mm" font-size="14pt" font-family="Times New Roman" text-align="center" font-weight="bold">Water Resources Department 
   
    <fo:block space-after="1mm" font-size="14pt" font-family="Times New Roman" text-align="center" font-weight="bold">Grievance Details</fo:block>
    <fo:block space-after="1mm" font-size="10pt" font-family="Times New Roman" text-align="right" font-weight="bold" font-style="">Date : ${nowTimestamp?if_exists?string('dd/MM/yyyy')}</fo:block>   
  </fo:block>
            
	 <fo:table table-layout="fixed" font-size="12px" font-family="verdana" width="28cm" height="18cm" >
	
	      <fo:table-column column-width="1.5in"/>
		  <fo:table-column column-width="2.0in"/>
	      <fo:table-column column-width="2.5in"/>
		  <fo:table-column column-width="2.0in"/>
		  <fo:table-column column-width="2.0in"/>
		  <fo:table-column column-width="2.0in"/>
		  <fo:table-column column-width="2.0in"/>
		 
		    <fo:table-body>
			      <fo:table-row >
			      
			      <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.sno}</fo:inline>
			       	</fo:block>
			     </fo:table-cell>
			    
			    
			    
			       <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.receiptNo}</fo:inline>
			       	</fo:block>
			    </fo:table-cell>
			    
			       <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.name}</fo:inline>
			       	</fo:block>
			    </fo:table-cell>
			    
			       
			   	  	<fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.grievanceDate}</fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			    
			    
			       <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.grievancePetitionDate}</fo:inline>
			       	</fo:block>
			    </fo:table-cell>
			   
			     <fo:table-cell padding="0.5mm" border="solid">
			      <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.typeOfGrievance}</fo:inline>
			       <fo:inline font-size="10px"></fo:inline></fo:block>
			    </fo:table-cell> 
			   			    
			    
			     <fo:table-cell padding="0.5mm"  border="solid">
			      <fo:block ><fo:inline font-weight="bold" font-size="10px">${uiLabelMap.status}</fo:inline>
			       </fo:block>
			    </fo:table-cell> 		    
			   
			    
		  </fo:table-row> 
		  
		      <#if pdfList?exists>
		      	 <#if pdfList?has_content>
		      	 <#assign count = 1>
			 	  <#list pdfList as pdfList>
			   <fo:table-row>
			       <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block ><fo:inline font-size="8px">${count?if_exists}</fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			      
			      <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block text-align="left" ><fo:inline font-size="8px">${pdfList.receiptNo?if_exists}</fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			    
			   	  	<fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block  text-align="left" ><fo:inline font-size="10px">${pdfList.grievanceNameEN?if_exists}</fo:inline>
			       </fo:block>
			    </fo:table-cell>
			    
			    	<fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block text-align="left" ><fo:inline font-size="10px"><#if pdfList.grievanceDate?has_content>${pdfList.grievanceDate?string('dd/MM/yyyy')?if_exists}</#if></fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			    
			    	<fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block  text-align="left"><fo:inline font-size="10px"><#if pdfList.grievancePetitionDate?has_content>${pdfList.grievancePetitionDate?string('dd/MM/yyyy')?if_exists}</#if></fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			    
			    <fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block  text-align="left"><fo:inline font-size="10px">${pdfList.typeOfGrievance?if_exists}</fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			    
			    	<fo:table-cell padding="0.5mm" border="solid">
			    	 <fo:block text-align="left"><fo:inline font-size="10px">${pdfList.status?if_exists}</fo:inline>
			       	 </fo:block>
			    </fo:table-cell>
			    
			   
	  </fo:table-row>
			   
			  <#assign count= count + 1 />   
			  </#list>
			    <#else>
             	    <fo:table-row >
			      			<fo:table-cell padding="0.8mm" border="solid" number-columns-spanned="15">
			    	 		<fo:block text-align="left"><fo:inline font-size="12px">${uiLabelMap.NoRecordsFound}</fo:inline>
			       	 		</fo:block>
			    		</fo:table-cell>
		  			</fo:table-row> 
		 
			  </#if>
			  </#if> 
          
           </fo:table-body>
		
</fo:table>	 
	
	
	 <fo:block id="last-page" space-before="10mm" space-after="10mm"/>    
</fo:flow>
</fo:page-sequence>

</fo:root>