<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <fo:layout-master-set>
   	<fo:simple-page-master master-name="table" page-height="210.00mm"
    	page-width="297.00mm" margin-top=".7in" margin-bottom="1.0in"
    	margin-left="1in" margin-right=".2in">
    	<fo:region-body/>
    	<fo:region-before extent=".5in"/>
    	<fo:region-after extent=".5in"/>
    </fo:simple-page-master>
  </fo:layout-master-set>

<fo:page-sequence master-reference="table">
	<fo:flow flow-name="xsl-region-body">
		<fo:table table-layout="fixed"  font-size="8px" font-family="verdana" width="25cm" height="17cm" border-width="0.4mm" border-style="solid">
			<fo:table-body>
 
  			<fo:table-row background-color = " #ffffff">
				<fo:table-cell padding="6pt" border="1pt solid black" number-columns-spanned="06" >
            	<fo:block font-weight="bold" text-align="center"><fo:external-graphic src="/rainbowstone/images/logo_mysore.png"  content-height="0.9in" vertical-align="middle"/></fo:block>
         		</fo:table-cell>
			</fo:table-row>

			<fo:table-row background-color = " #ffffff">
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02" >
	      		<fo:block font-size="10px">Bill No.:- BillNo1</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02" >
	      		<fo:block font-size="10px">Customer No.:- CustNo10001</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02" >
	      		<fo:block font-size="10px">Connection No.:-CN10001</fo:block>
	      		</fo:table-cell>
	        </fo:table-row>
	        
			<fo:table-row background-color = " #ffffff">
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Customer Name:- Ravi kumar Rai</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Father Name:- Raju Kuamr Rai</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Mobile No.:- 9685889585</fo:block>
	      		</fo:table-cell>
	        </fo:table-row>
	        
	       <fo:table-row background-color = " #ffffff">
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Email:- acve@gmail.com</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="04" >
	      		<fo:block font-size="10px">Address:- Sahu Colony Mysore</fo:block>
	      		</fo:table-cell>
	        </fo:table-row>

	        <fo:table-row background-color = " #ffffff">
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Billing Period:- jul-Aug 2017</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Bill Date:- 23/08/2017</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px" font-weight="bold">Due Date:- 23/08/2017</fo:block>
	      		</fo:table-cell>
	        </fo:table-row>
	        
	        <fo:table-row background-color = " #ffffff">
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Meter No.:- MN10001</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Connection Type:- Domestic</fo:block>
	      		</fo:table-cell>
	      	
	      		<fo:table-cell padding="2mm"  border="0.8pt solid black" number-columns-spanned="02">
	      		<fo:block font-size="10px">Tariff Plan:- Tariff 10001 plan</fo:block>
	      		</fo:table-cell>
	        </fo:table-row>
	        
	        <fo:table-row>
				<fo:table-cell padding="4pt" number-columns-spanned="02">
            	<fo:block font-weight="bold" font-size="10px" text-align="center">Current Reading
            	<fo:leader leader-length="100%" leader-pattern="rule"/></fo:block>
         		</fo:table-cell>

				<fo:table-cell padding="4pt" number-columns-spanned="02">
            	<fo:block font-weight="bold" font-size="10px" text-align="center">Previous Reding
            	<fo:leader leader-length="100%" leader-pattern="rule"/></fo:block>
         		</fo:table-cell>
         
         		<fo:table-cell padding="4pt" number-columns-spanned="02">
            	<fo:block font-weight="bold" font-size="10px" text-align="center">Total Used
            	<fo:leader leader-length="100%" leader-pattern="rule"/></fo:block>
         		</fo:table-cell>
         
			</fo:table-row>
        
        <fo:table-row>
			<fo:table-cell padding="4pt" number-columns-spanned="02">
            <fo:block font-weight="bold" font-size="10px" text-align="center">1200
            </fo:block>
         	</fo:table-cell>

			<fo:table-cell padding="4pt" number-columns-spanned="02">
            <fo:block font-weight="bold" font-size="10px" text-align="center">1000
            </fo:block>
         	</fo:table-cell>
         
         	<fo:table-cell padding="4pt" number-columns-spanned="02">
            <fo:block font-weight="bold" font-size="10px" text-align="center">200
            </fo:block>
         	</fo:table-cell>
		</fo:table-row>

		<fo:table-row>
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">Previous Bill</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">Previous Payments</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">Balance Amount</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">Current Charges</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">Total Amount Due</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">Payable After Due Date</fo:block>
	      	</fo:table-cell>
	   	</fo:table-row>

		<fo:table-row>
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">1000</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">500</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">500</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">1100</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px" font-weight="bold">1600</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="0.8pt solid black">
	      	<fo:block font-size="10px">1800</fo:block>
	      	</fo:table-cell>
	   </fo:table-row>
	   
	   <fo:table-row background-color = "#cfe6ff">
	      	<fo:table-cell padding="2mm" border="1.5pt solid black" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center" font-weight="bold">Previouse Month Detail</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="04">
	      	<fo:block font-size="10px" text-align="center" font-weight="bold">Summary of Current Charges</fo:block>
	      	</fo:table-cell>
	    </fo:table-row>
	             
	    <fo:table-row>
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">Month</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">Amount</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">Water Charges (200 HCF * 5)</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">1000</fo:block>
	      	</fo:table-cell>
	   </fo:table-row>
	        
	   <fo:table-row>
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">June</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">1000</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">GST</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">100</fo:block>
	      	</fo:table-cell>
	   </fo:table-row>
	   
	   <fo:table-row>
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">May</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm"  border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">1500</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">Other Charges</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="0.4mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">0
	      	<fo:leader leader-length="100%" leader-pattern="rule"/>
	      	</fo:block>
	      	</fo:table-cell>
	   </fo:table-row>
	        
	   <fo:table-row>
	      	<fo:table-cell padding="2mm" border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">april</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" border="1.5pt solid black" number-columns-spanned="01">
	      	<fo:block font-size="10px" text-align="center">1000</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center">Current Bill Amount</fo:block>
	      	</fo:table-cell>
	      	
	      	<fo:table-cell padding="2mm" number-columns-spanned="02">
	      	<fo:block font-size="10px" text-align="center" font-weight="bold">1100</fo:block>
	      	</fo:table-cell>
	   </fo:table-row>
	        
	   <fo:table-row>
	      	<fo:table-cell padding="1mm"  border="0.8pt solid black" number-columns-spanned="06">
	      	<fo:block font-size="10px" text-align="right">Note:- Bill generated as per tariff plan and unit cunsumption.</fo:block>
	      	</fo:table-cell>
	    </fo:table-row>
	        
		</fo:table-body>
	</fo:table>
 </fo:flow>
</fo:page-sequence>
</fo:root>