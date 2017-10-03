package org.apache.ofbiz.myportal;

import java.nio.ByteBuffer;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javolution.util.FastList;

import org.apache.ofbiz.base.util.GeneralException;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilProperties;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.GenericDelegator;
import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.entity.condition.EntityCondition;
import org.apache.ofbiz.entity.condition.EntityOperator;
import org.apache.ofbiz.entity.util.EntityFindOptions;
import org.apache.ofbiz.entity.util.EntityListIterator;
import org.apache.ofbiz.myportal.myportalConstants;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.GenericServiceException;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.ServiceUtil;
 /*Added by Siddhi*/
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
		String grievanceDate = (String) context.get("grievanceDate");
		String grievancePetitionDate = (String) context.get("grievancePetitionDate");
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
		java.sql.Date grievanceDateNew = getConvertedDate(grievanceDate);
		java.sql.Date grievancePetitionDateNew = getConvertedDate(grievancePetitionDate);

		
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
			String ErrorMessage = sequenceId;
			Map<String, ? extends Object> grievanceDetails = UtilMisc.toMap("sequenceId",sequenceId,"receiptNo",receiptNo,"grievanceDate",grievanceDateNew,"grievancePetitionDate",grievancePetitionDateNew,"typeOfGrievance",typeOfGrievance,"grievanceNameEN",grevNameEn,"grievanceNameKN",grevNameKn,
					"grievanceAddEn", grevAddEn,"grievanceAddKn",grevAddKn,"mobileNo",mobileNo,"eMail",eMail,"grievanceDetailEn",grievanceDetailEn,"grievanceDetailKn",grievanceDetailKn,"status",status,"createdBy",partyId);
			gv = delegator.makeValue("GrievanceDetails", grievanceDetails);
			gv.create();
			result.put("ErrorMessage", ErrorMessage);
			
		}
		catch(GenericEntityException e){
			//Debug.log("Entity Exception occured : " + e);
			return UIMessage.getErrorMessage(resource, myportalConstants.CANT_CREATE,receiptNo, locale);
	
		}
		
	
		 return result;	
	}
	
	public static Map<String, Object> searchgrievanceDetail(
			DispatchContext dctx, Map<String, ? extends Object> context) {
		Map<String, Object> result = ServiceUtil.returnSuccess();
		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		Locale locale = (Locale) context.get("locale");
		String createdBy = null;
		if(UtilValidate.isNotEmpty(userLogin)){
			createdBy = (String) userLogin.get("partyId");
		}
	
		List<String> orderBy = FastList.newInstance();
		int viewIndex = 0;
		try {
			viewIndex = Integer.parseInt((String) context.get("VIEW_INDEX"));
		} catch (NumberFormatException e) {
			try {
				// Taking default value from property file
				viewIndex = Integer.parseInt(UtilProperties.getPropertyValue(
						"pagination.properties", "paginate.default.page"));
			} catch (NumberFormatException ex) {
				viewIndex = myportalConstants.DEFAULT_PAGE; // redirects
				// to first
				// page.
			}
		}
		result.put("viewIndex", Integer.valueOf(viewIndex));
		int viewSize = myportalConstants.DEFAULT_LIST_SIZE;
		try {
			viewSize = Integer.parseInt((String) context.get("VIEW_SIZE"));
		} catch (NumberFormatException e) {
			try {
				// Taking default value from property file
				viewSize = Integer.parseInt(UtilProperties.getPropertyValue(
						"pagination.properties", "paginate.default.size"));
			} catch (NumberFormatException ex) {
				viewSize = myportalConstants.DEFAULT_LIST_SIZE;
			}
		}
		result.put("viewSize", Integer.valueOf(viewSize));
		String lookupFlag = "Y";
		// blank param list
		String paramList = "";
		String orderField = null;
		String sortType = null;
		List<GenericValue> requestList = null;
		int requestListSize = 0;
		List<EntityCondition> andExprs = FastList.newInstance();
		EntityCondition mainCond = null;
		
		String officeId=null;
		List subOffice = null;
	
		int lowIndex = 0;
		int highIndex = 0;
		int indexNumbers = 0;
		List<GenericValue> pdfList = null;
			
		if ("Y".equals(lookupFlag)) {
			
			List<GenericValue> employeeOfficeId = null;
			paramList = paramList + "&lookupFlag=" + lookupFlag.trim();
			// define the main condition & expression list
			// get the params
			
			
			String receiptno = (String) context.get("receiptno");
			if (receiptno != null && receiptno.length() > 0) {
				paramList = paramList + "&receiptno=" + receiptno;
				andExprs.add(EntityCondition.makeCondition("receiptNo",
						EntityOperator.EQUALS,receiptno));
			}
			String typeOfGrievance = (String) context.get("typeOfGrievance"); 
			if (UtilValidate.isNotEmpty(typeOfGrievance)) {
				paramList = paramList + "&petitionType=" + typeOfGrievance;
				andExprs.add(EntityCondition.makeCondition("typeOfGrievance",
						EntityOperator.LIKE, "%" + typeOfGrievance + "%"));
			}
			andExprs.add(EntityCondition.makeCondition("status",
					EntityOperator.EQUALS,"Submitted"));
			
			if (andExprs.size() > 0)
				mainCond = EntityCondition.makeCondition(andExprs, EntityOperator.AND);

			orderField = (String) context.get("orderField");
			sortType = (String) context.get("sortType");
			// sorting UI fields
			if (orderField != null && orderField.length() > 0) {
				if (sortType.equals("ASC")) {
					orderBy.add(orderField);
				} else {
					orderBy.add("-" + orderField);
				}
			}
			try
			{
			pdfList = delegator.findList("GrievanceDetails", mainCond, null,
						null, null, false);
			}
			catch (GenericEntityException e) {
				e.printStackTrace();
			}
			
			try {
				EntityFindOptions findOpts = new EntityFindOptions(true, EntityFindOptions.TYPE_SCROLL_INSENSITIVE, EntityFindOptions.CONCUR_READ_ONLY, true);
				// using list iterator
				EntityListIterator consumerListIterator = delegator.find("GrievanceDetails", mainCond, null, null,orderBy, findOpts);
				Map<String, Object> paginateResult = UIPagination.paginate(consumerListIterator, viewIndex, viewSize,resource,module);
				consumerListIterator.close();
				Integer low = (Integer) paginateResult.get("lowIndex");
				lowIndex = low.intValue();
				Integer high = (Integer) paginateResult.get("highIndex");
				highIndex = high.intValue();
				requestList = (List) paginateResult.get("recordList");
				Integer size = (Integer) paginateResult.get("listSize");
				requestListSize = size.intValue();
				Integer index = (Integer) paginateResult.get("indexNumbers");
				indexNumbers = index.intValue();
			} 
			catch (GenericEntityException e) {
				e.printStackTrace();
			}
		}
		else {
			requestListSize = 0;
		}
		if (requestList == null) {
			requestList = FastList.newInstance();
		}
		result.put("requestList", requestList);
		result.put("pdfList", pdfList);
		result.put("requestListSize", Integer.valueOf(requestListSize));
		result.put("paramList", paramList);
		result.put("highIndex", Integer.valueOf(highIndex));
		result.put("lowIndex", Integer.valueOf(lowIndex));
		result.put("orderField", orderField);
		result.put("indexNumbers", Integer.valueOf(indexNumbers));
		result.put("sortType", sortType);
		return result;

	}
	
	public static Map<String, Object> updateGrievanceDetails(DispatchContext dctx,Map<String, ? extends Object> context) {
		Map<String, Object> result = ServiceUtil.returnSuccess();
		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		LocalDispatcher dispatcher = dctx.getDispatcher();
		Locale locale = (Locale) context.get("locale");
        Timestamp currentTimeStamp = new Timestamp(System.currentTimeMillis());
    	String partyId = (String) userLogin.get("partyId");
        String sequenceId = (String) context.get("sequenceId");
        String receiptNo = (String) context.get("receiptNo");
		String grievanceDate = (String) context.get("grievanceDate");
		String grievancePetitionDate = (String) context.get("grievancePetitionDate");
		String typeOfGrievance = (String) context.get("typeOfGrievance");
		String grevNameEn = (String) context.get("grevNameEn");
		String grevNameKn = (String) context.get("grevNameKn");
		String grevAddEn = (String) context.get("grevAddEn");
		String grevAddKn = (String) context.get("grevAddKn");
		String mobileNo = (String) context.get("mobileNo");
		String eMail = (String) context.get("eMail");
		String grievanceDetailEn = (String) context.get("grievanceDetailEn");
		String grievanceDetailKn = (String) context.get("grievanceDetailKn");
		java.sql.Date grievanceDateNew = getConvertedDate(grievanceDate);
		java.sql.Date grievancePetitionDateNew = getConvertedDate(grievancePetitionDate);
		String ErrorMessage1 = sequenceId;
		
		
		try{
			
			Map<String, ? extends Object> grievanceDetails = UtilMisc.toMap("sequenceId",sequenceId,"receiptNo",receiptNo,"grievanceDate",grievanceDateNew,"grievancePetitionDate",grievancePetitionDateNew,"typeOfGrievance",typeOfGrievance,"grievanceNameEN",grevNameEn,"grievanceNameKN",grevNameKn,
					"grievanceAddEn", grevAddEn,"grievanceAddKn",grevAddKn,"mobileNo",mobileNo,"eMail",eMail,"grievanceDetailEn",grievanceDetailEn,"grievanceDetailKn",grievanceDetailKn);
			
			int asd = delegator.storeByCondition("GrievanceDetails",grievanceDetails,EntityCondition.makeCondition("sequenceId",EntityOperator.EQUALS,sequenceId));
			
			result.put("ErrorMessage1", ErrorMessage1);
		}
		catch(GenericEntityException e){
			//Debug.log("Entity Exception occured : " + e);
			return UIMessage.getErrorMessage(resource, myportalConstants.CANT_CREATE,receiptNo, locale);
	
		}
		
	
		 return result;	
	}

}