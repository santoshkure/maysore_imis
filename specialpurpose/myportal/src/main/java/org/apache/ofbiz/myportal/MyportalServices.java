package org.apache.ofbiz.myportal;

import java.sql.Timestamp;
import java.util.Locale;
import java.util.Map;

import org.apache.ofbiz.base.util.GeneralException;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.GenericDelegator;
import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.ServiceUtil;

public class MyportalServices {
	public static final String module = MyportalServices.class.getName();
	public static final String resource = "MyPortalUiLabels";
	
	private static java.sql.Date getConvertedDate(String inputDate) {

		java.sql.Date outputDate = null;
		if(UtilValidate.isNotEmpty(inputDate))
		{
		String subStringDates[] = inputDate.split("/");

		String dateAfterSpliting = (String) subStringDates[0];

		String monthAfterSpliting = (String) subStringDates[1];

		String dayAfterSpliting = (String) subStringDates[2];

		String convertedDate = dayAfterSpliting + "-" + monthAfterSpliting
				+ "-" + dateAfterSpliting;

		outputDate = java.sql.Date.valueOf(convertedDate);
		}
		return outputDate;

	}
	public static Map<String, Object> createGrievanceDetails(DispatchContext dctx,Map<String, ? extends Object> context) {
		Map<String, Object> result = ServiceUtil.returnSuccess();
		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		LocalDispatcher dispatcher = dctx.getDispatcher();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		Locale locale = (Locale) context.get("locale");
        Timestamp currentTimeStamp = new Timestamp(System.currentTimeMillis());
    	String partyId = (String) userLogin.get("partyId");
        String receiptNo = (String) context.get("receiptNo");
		/*String grievanceDate = (String) context.get("grievanceDate");
		String grievancePetitionDate = (String) context.get("grievancePetitionDate");*/
		String typeOfGrievance = (String) context.get("typeOfGrievance");
		String grevNameEn = (String) context.get("grevNameEn");
		String grevNameKn = (String) context.get("grevNameKn");
		String grevAddEn = (String) context.get("grevAddEn");
		String grevAddKn = (String) context.get("grevAddKn");
		String mobileNo = (String) context.get("mobileNo");
		String eMail = (String) context.get("eMail");
		String grievanceDetailEn = (String) context.get("grievanceDetailEn");
		String grievanceDetailKn = (String) context.get("grievanceDetailKn");
		String status="Submitted";
		String sequenceId = null ;
		/*java.sql.Date grievanceDateNew = getConvertedDate(grievanceDate);
		java.sql.Date grievancePetitionDateNew = getConvertedDate(grievancePetitionDate);*/

		
		try{
			/*String fileLocDocumentId = null;
			ByteBuffer fileLoc = (ByteBuffer) context.get("fileLoc");
			String fileLocFileName=(String) context.get("fileLocFileName");
			String fileLocFileType=(String) context.get("fileLocFileType");
			if(UtilValidate.isNotEmpty(fileLocFileName)) 
			{
				Map serviceFolderInMap  = new HashMap();
				serviceFolderInMap.put("fileId", fileLoc);                
				serviceFolderInMap.put("fileName", fileLocFileName);                      
				serviceFolderInMap.put("rootFolderName", "myportal");    
				serviceFolderInMap.put("folderName", "myportal");   
				serviceFolderInMap.put("moduleName", "myportal");         
				serviceFolderInMap.put("fileType", fileLocFileType);     
				serviceFolderInMap.put("description", "NA");                    
				serviceFolderInMap.put("userLogin", userLogin); 
				serviceFolderInMap.put("facilityName", null); 

				try 
				{  
 					Map serviceFolderResultMap = dispatcher.runSync("commonFileUpload", serviceFolderInMap);
         		    fileLocDocumentId = (String) serviceFolderResultMap.get("referenceId");

					//System.out.println("=========ceqDocumentId============="+ceqDocumentId);

				} catch (GenericServiceException e) {

				}
			}*/
			GenericValue gv = null;
			sequenceId = delegator.getNextSeqId("GrievanceDetails");
			
			Map<String, ? extends Object> grievanceDetails = UtilMisc.toMap("sequenceId",sequenceId,"receiptNo",receiptNo,"typeOfGrievance",typeOfGrievance,"grievanceNameEN",grevNameEn,"grievanceNameKN",grevNameKn,
					"grievanceAddEn", grevAddEn,"grievanceAddKn",grevAddKn,"mobileNo",mobileNo,"eMail",eMail,
					"grievanceDetailEn",grievanceDetailEn,"grievanceDetailKn",grievanceDetailKn,"status",status,"createdBy",partyId);
			gv = delegator.makeValue("GrievanceDetails", grievanceDetails);
			gv.create();
			
		}
		catch(GenericEntityException e){
			//Debug.log("Entity Exception occured : " + e);
			//return UIMessages.getErrorMessage(resource,myportalConstants.CANT_CREATE,receiptNo, locale);
		}
		
	
		 return result;	
	}
	

}
