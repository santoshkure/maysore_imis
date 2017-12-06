package org.apache.ofbiz.humanres;

import java.util.Date;
import javolution.util.FastMap;
import java.sql.Timestamp;
import java.util.Calendar;
import java.text.SimpleDateFormat; 
import java.text.DateFormat;
import java.util.Random;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Locale;
import java.util.LinkedList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

import javolution.util.FastMap;

import javolution.util.FastList;
import javolution.util.FastSet;

import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.GeneralException;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.base.util.UtilProperties;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.GenericDelegator;

import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.entity.condition.EntityExpr;
import org.apache.ofbiz.entity.condition.EntityCondition;
import org.apache.ofbiz.entity.condition.EntityOperator;
import org.apache.ofbiz.entity.util.EntityQuery;
import org.apache.ofbiz.entity.util.EntityFindOptions;
import org.apache.ofbiz.entity.util.EntityListIterator;
import org.apache.ofbiz.entity.util.EntityQuery;
import org.apache.ofbiz.entity.util.EntityUtil;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.GenericServiceException;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.ServiceUtil;

import org.apache.ofbiz.humanres.hrmsOfficeexception.*;

import org.apache.ofbiz.humanres.OfficeSetupConstants;
import org.apache.ofbiz.humanres.EmployeeConstants;
import org.apache.ofbiz.minilang.method.envops.StringAppend;
// added by shubham malviya for password encryption
import org.apache.ofbiz.base.crypto.HashCrypt;
import org.apache.ofbiz.entity.util.EntityUtilProperties;
//added for XLS
import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import javolution.util.FastList;
//end

import java.io.*;

public class hrmsMasterEvents {
	
	
	 public static final String module = hrmsMasterEvents.class.getName();
	// public static final String resourceError = "HumanResErrorUiLabels";
	 public static final String resource = "OfficeSetupUiLabels";
	 
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
 
	    
	    
	
		/**
		 * Method Name :  saveofcTypemaster
		 * @Version 1.0
		 * @Description creates Office Type Master 
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning the office Id created
		 *  Transaction is handled by service engine
		 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
		 *  
		 */		
		public static Map<String, Object> saveofcTypemaster(DispatchContext dctx,
				Map<String, ? extends Object> context) {
			Map<String, Object> result = ServiceUtil.returnSuccess();
			GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			LocalDispatcher dispatcher = dctx.getDispatcher();
			GenericValue userLogin = (GenericValue) context.get("userLogin");
			final Locale locale = (Locale) context.get("locale");
			String officeTypeId =(String) context.get("officeTypeId");
			String officeTypeName =(String) context.get("officeTypeName");	
			String parentTypeId =(String) context.get("parentTypeId");			
			String remark =(String) context.get("remark");
			
			//System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+officeTypeId+officeTypeName+parentTypeId+remark);

			try{
			if (UtilValidate.isNotEmpty(officeTypeId)){
            //String zoneId = (String) delegator.getNextSeqId("ZoneMaster");
			
			Map officeTypDetails = UtilMisc.toMap("ofcTypeId",officeTypeId,
					"ofcTypeName",officeTypeName,"parentTypeId",OfficeSetupConstants.OFFICE_TYPE,"status","A","remarks",remark);
			
			GenericValue valueToStore = delegator.makeValue("OfficeTypeMaster", officeTypDetails);
			valueToStore.create();
			}

			}catch(GeneralException e) {
				// It is the mother of all the ofbiz exceptions
				// All the specific exceptions are handled above
				// It would be executed in the worst case scenario
				Debug.log("Exception occured : " + e );
				//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
			}
			
			
			
			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, officeTypeName, locale));
			
			return result;		
		}
	    
		
		/**
		 * Method Name :  editofcTypeMaster
		 * @Version 1.0
		 * @Description Edit Office Type Master 
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning Success Message
		 *  Transaction is handled by service engine
		 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
		 *  
		 */		
		public static Map<String, Object> editofcTypeMaster(DispatchContext dctx,
				Map<String, ? extends Object> context) {
			Map<String, Object> result = ServiceUtil.returnSuccess();
			GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			LocalDispatcher dispatcher = dctx.getDispatcher();
			GenericValue userLogin = (GenericValue) context.get("userLogin");
			final Locale locale = (Locale) context.get("locale");
			String officeTypeId =(String) context.get("officeTypeId");
			String officeTypeName =(String) context.get("officeTypeName");	
			String parentTypeId =(String) context.get("parentTypeId");			
			String remark =(String) context.get("remark");
			String status =(String) context.get("status");
			String activestatus =(String) context.get("activestatus");
			
			
			Map officeTypDetails = null;
			try{
			if (UtilValidate.isNotEmpty(officeTypeId))
			{
           if(status.equals("edit")){
			officeTypDetails = UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",
					officeTypeName,"parentTypeId",OfficeSetupConstants.OFFICE_TYPE,"status","A","remarks",remark);
           }else if(status.equals("status")){
			officeTypDetails = UtilMisc.toMap("status",activestatus);	
			}
           if(status.equals("delete")){
               GenericValue officeType = EntityQuery.use(delegator).from("OfficeTypeMaster").where("ofcTypeId", officeTypeId).queryOne();

        	   //GenericValue officeType= delegator.findByPrimaryKey(
        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
        	   officeType.remove();
      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, officeTypeName, locale));   

           }else{
        	   Integer valueToStore = delegator.storeByCondition("OfficeTypeMaster", officeTypDetails
   					,EntityCondition.makeCondition("ofcTypeId",EntityOperator.EQUALS,officeTypeId));
   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, officeTypeName, locale));   
                 }
			
             }	
			

			}catch(GeneralException e) {
				// It is the mother of all the ofbiz exceptions
				// All the specific exceptions are handled above
				// It would be executed in the worst case scenario
				Debug.log("Exception occured : " + e );
				//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
			}			
			
			
			return result;		
		}

		/**
		 * Method Name :  saveZonemaster
		 * @Version 1.0
		 * @Description creates Office Type Master 
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning the office Id created
		 *  Transaction is handled by service engine
		 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
		 *  Code added by saurabh on 14 aug 2017
		 */		
  		    
 		   public static Map<String, Object> saveZonemasterdet(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				// Defining result map to return to the service.
				Map<String, Object> result = ServiceUtil.returnSuccess();
				// Getting the delegator,userLogin and locale object using the context.
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				Locale locale = (Locale) context.get("locale");
			/*	List<GenericValue> caseList = FastList.newInstance();*/
			    List<GenericValue> caseList = new LinkedList<GenericValue>();
				String zoneName =(String) context.get("zoneName");
				   //Add by by Anubha Saini
				String zoneNameKan =(String) context.get("zoneNameKan");
				String cityName =(String) context.get("cityName");	
				String officeName =(String) context.get("officeName");			
				String remark =(String) context.get("remark");
				String status =(String) context.get("status");
				String activestatus =(String) context.get("activestatus");
				String createDated =(String) context.get("createdate");
	  		    String zoneId = (String) delegator.getNextSeqId("ZoneMaster");
	  		    
	  		    
	  		    java.sql.Date dateofcreatevar = getConvertedDate(createDated);
	  		    
				if (UtilValidate.isEmpty(zoneId)) {
					zoneId = "0";
				}
	  		    
	 		    String zoneNameUPPER = zoneName.toUpperCase();
		  	
		    	if (UtilValidate.isNotEmpty(zoneName)) {

				try {
				    List<EntityExpr> expList = new LinkedList<EntityExpr>();
 				/*	List<EntityExpr> expList = FastList.newInstance();*/
					EntityCondition mainCondition = null;

					if (UtilValidate.isNotEmpty(zoneNameUPPER)) {
						expList.add(EntityCondition.makeCondition("zoneName",EntityOperator.EQUALS, zoneNameUPPER));
						mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
						  List<GenericValue> resultList = new LinkedList<GenericValue>();
						//List<GenericValue> resultList = FastList.newInstance();
						try {
							resultList = delegator.findList("ZoneMaster",
									mainCondition, UtilMisc.toSet("zoneName"), null,
									null, false);
							if (UtilValidate.isNotEmpty(resultList)) {
								return ServiceUtil
										.returnSuccess("Zone Name already exists.");
							}
						} catch (GenericEntityException e1) {
							e1.printStackTrace();
						}

						if (UtilValidate.isEmpty(resultList)) {
							Map officeZoneDetails = UtilMisc.toMap("zoneId",zoneId,"zoneName",zoneNameUPPER,"zoneTypeId",zoneName,"zoneNameKan",zoneNameKan,
									"cityName",cityName,"officeName",officeName,"remark",remark,"createdate",dateofcreatevar,"status","A","activestatus","Active");
							
							GenericValue valueToStore = delegator.makeValue("ZoneMaster", officeZoneDetails);
							valueToStore.create();

						result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, zoneName, locale));

						}
					}
				} catch (GenericEntityException e) {
					e.printStackTrace();
				}
			}

			return result;
		}
		
 		/**
		 * Method Name :  UpdateZonemaster
		 * @Version 1.0
		 * @Description creates Office Type Master 
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning the office Id created
		 *  Transaction is handled by service engine
		 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
		 *  Code added by saurabh on 14 aug 2017
		 */		
	/*	public static Map<String, Object> updateZoneDet(DispatchContext dctx,
				Map<String, ? extends Object> context) {
			Map<String, Object> result = ServiceUtil.returnSuccess();
			GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			LocalDispatcher dispatcher = dctx.getDispatcher();
			GenericValue userLogin = (GenericValue) context.get("userLogin");
			final Locale locale = (Locale) context.get("locale");
			String zoneName =(String) context.get("zoneName");
			String cityName =(String) context.get("cityName");	
			String officeName =(String) context.get("officeName");			
			String remark =(String) context.get("remark");
			String status =(String) context.get("status");
			String activestatus =(String) context.get("activestatus");
			String zoneId =(String) context.get("zoneId");
			String createDated =(String) context.get("createdate");
			java.sql.Date dateofcreatevari = getConvertedDate(createDated);
			String zoneNameUPPER = null;
 		    if (UtilValidate.isNotEmpty(zoneName))
			{
		      zoneNameUPPER = zoneName.toUpperCase();
			}
 		    Map officeZoneDetails = null;
			try{
			if (UtilValidate.isNotEmpty(zoneId))
			{
				   if(status.equals("edit")){

					try {
					    List<EntityExpr> expList = new LinkedList<EntityExpr>();
	 					List<EntityExpr> expList = FastList.newInstance();
						EntityCondition mainCondition = null;

						if (UtilValidate.isNotEmpty(zoneNameUPPER)) {
							expList.add(EntityCondition.makeCondition("zoneName",EntityOperator.EQUALS, zoneNameUPPER));
							mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
							  List<GenericValue> resultList = new LinkedList<GenericValue>();
							//List<GenericValue> resultList = FastList.newInstance();
							try {
								resultList = delegator.findList("ZoneMaster",
										mainCondition, UtilMisc.toSet("zoneName"), null,
										null, false);
								if (UtilValidate.isNotEmpty(resultList)) {
									return ServiceUtil
											.returnSuccess("Zone Name already exists.");
								}
							} catch (GenericEntityException e1) {
								e1.printStackTrace();
							}

							if (UtilValidate.isEmpty(resultList)) {
								 officeZoneDetails = UtilMisc.toMap("zoneId",zoneId,"zoneName",zoneName,"cityName",cityName,"officeName",officeName,"status","A","remark",remark,
					        			   "createdate",dateofcreatevari,"zoneTypeId",zoneNameUPPER);
								
								GenericValue valueToStore = delegator.makeValue("ZoneMaster", officeZoneDetails);
								valueToStore.create();

							result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, zoneName, locale));

							}
						}
					} catch (GenericEntityException e) {
						e.printStackTrace();
					}
				}	
				
				
           if(status.equals("edit")){
        	   officeZoneDetails = UtilMisc.toMap("zoneId",zoneId,"zoneName",zoneName,"cityName",cityName,"officeName",officeName,"status","A","remark",remark,
        			   "createdate",dateofcreatevari,"zoneTypeId",zoneNameUPPER);
           }else if(status.equals("status")){
        	   officeZoneDetails = UtilMisc.toMap("status",activestatus);	
			}
           if(status.equals("delete")){
               GenericValue officeType = EntityQuery.use(delegator).from("ZoneMaster").where("zoneId", zoneId).queryOne();

        	   //GenericValue officeType= delegator.findByPrimaryKey(
        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
        	   officeType.remove();
      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, zoneName, locale));   

           }else{
        	   Integer valueToStore = delegator.storeByCondition("ZoneMaster", officeZoneDetails
   					,EntityCondition.makeCondition("zoneId",EntityOperator.EQUALS,zoneId));
   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, zoneName, locale));   
                 }
			
             	
			
 			}catch(GeneralException e) {
				// It is the mother of all the ofbiz exceptions
				// All the specific exceptions are handled above
				// It would be executed in the worst case scenario
				Debug.log("Exception occured : " + e );
				//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
			}			
			
			
			return result;		
		} */
 		  public static Map<String, Object> updateZoneDet(DispatchContext dctx,
 					Map<String, ? extends Object> context) {
 				Map<String, Object> result = ServiceUtil.returnSuccess();
 				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
 				LocalDispatcher dispatcher = dctx.getDispatcher();
 				GenericValue userLogin = (GenericValue) context.get("userLogin");
 				final Locale locale = (Locale) context.get("locale");
 				String zoneName =(String) context.get("zoneName");
 				 //Add by by Anubha Saini
 				String zoneNameKan =(String) context.get("zoneNameKan");
 				String cityName =(String) context.get("cityName");	
 				String officeName =(String) context.get("officeName");			
 				String remark =(String) context.get("remark");
 				String status =(String) context.get("status");
 				String activestatus =(String) context.get("activestatus");
 				String zoneId =(String) context.get("zoneId");
 				
 			    
 			    Map officeWardDetails = null;
 				try
 				{
 					
 						if (UtilValidate.isNotEmpty(zoneId))
 						{
 							if(status.equals("edit"))
 							{
 								String createDated =(String) context.get("createdate");
 				 				java.sql.Date dateofcreatevari = getConvertedDate(createDated);
 				 			    String zoneTypeIdUpper = zoneName.toUpperCase();
 				 			    
 									officeWardDetails = UtilMisc.toMap("zoneId",zoneId,"zoneName",zoneName,"zoneNameKan",zoneNameKan,"cityName",cityName,"officeName",officeName,"status","A","remark",remark,
 												"createDated",dateofcreatevari,"zoneTypeId",zoneId);
 							}
 							else if(status.equals("status"))
 							{
 								officeWardDetails = UtilMisc.toMap("status",activestatus);	
 							}
 							if(status.equals("delete"))
 							{
 								GenericValue officeType = EntityQuery.use(delegator).from("ZoneMaster").where("zoneId", zoneId).queryOne();
 								officeType.remove();

 							}
 							else
 							{
 								Integer valueToStore = delegator.storeByCondition("ZoneMaster", officeWardDetails
 										,EntityCondition.makeCondition("zoneId",EntityOperator.EQUALS,zoneId));
 							}
 							/*
 							 * Code Added by Nikhil on 04 Dec 2017
 							 * 
 							 */
 							
 								if(status.equals("status"))
 								{
 									if(activestatus.equals("A"))
 									{
 	 									result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_Enable_SUCCESSFULLY, zoneName, locale));
 									}
 									else if(activestatus.equals("D"))
 									{
 	 									result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_Disable_SUCCESSFULLY, zoneName, locale));

 									}
 								}
 								else if(status.equals("delete"))
 								{
 	 								result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, zoneName, locale));   

 								}
 								else if(status.equals("edit")){
 									
 									result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, zoneName, locale));

 								}
 							}
 				
 					}
 					catch(GeneralException e) {
 					// It is the mother of all the ofbiz exceptions
 					// All the specific exceptions are handled above
 					// It would be executed in the worst case scenario
 					Debug.log("Exception occured : " + e );
 					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
 				}			
 				
 				
 				return result;		
 			} 
		/**
		 * Method Name :  saveWardmaster
		 * @Version 1.0
		 * @Description creates Office Type Master 
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning the office Id created
		 *  Transaction is handled by service engine
		 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
		 *  Code added by saurabh on 14 aug 2017
		 */		
		public static Map<String, Object> saveWardMaster(DispatchContext dctx,
				Map<String, ? extends Object> context) {
			Map<String, Object> result = ServiceUtil.returnSuccess();
			GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			LocalDispatcher dispatcher = dctx.getDispatcher();
			List<GenericValue> caseList = new LinkedList<GenericValue>();
			GenericValue userLogin = (GenericValue) context.get("userLogin");
			final Locale locale = (Locale) context.get("locale");
			String wardName =(String) context.get("wardName");
			 //Add by by Anubha Saini
			String wardNameKan =(String) context.get("wardNameKan");
			String zoneName =(String) context.get("zoneName");	
			String cityName =(String) context.get("cityName");			
			String remark =(String) context.get("remark");
			String status =(String) context.get("status");
			String activestatus =(String) context.get("activestatus");
			String createDated =(String) context.get("createdate");
  		    String wardId = (String) delegator.getNextSeqId("WardMaster");
 		    
 		   java.sql.Date dateofcreatevar = getConvertedDate(createDated);
 		   
  			if (UtilValidate.isEmpty(wardId)) {
 				wardId = "0";
 			}
 			    
 			    String wardNameUPPER = wardName.toUpperCase();
 			    String cityUpper = cityName.toUpperCase();
 	  	
 	    	if (UtilValidate.isNotEmpty(wardName)) {

 			try {
 			    List<EntityExpr> expList = new LinkedList<EntityExpr>();
 			/*	List<EntityExpr> expList = FastList.newInstance();*/
 				EntityCondition mainCondition = null;

 				if (UtilValidate.isNotEmpty(wardNameUPPER)) {
 					expList.add(EntityCondition.makeCondition("wardName",EntityOperator.EQUALS, wardNameUPPER));
 					mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
 					  List<GenericValue> resultList = new LinkedList<GenericValue>();
 					//List<GenericValue> resultList = FastList.newInstance();
 					try {
 						resultList = delegator.findList("WardMaster",
 								mainCondition, UtilMisc.toSet("wardName"), null,
 								null, false);
 						if (UtilValidate.isNotEmpty(resultList)) {
 							return ServiceUtil
 									.returnSuccess("Ward Name already exists.");
 						}
 					} catch (GenericEntityException e1) {
 						e1.printStackTrace();
 					}

 					if (UtilValidate.isEmpty(resultList)) {
 						Map officeWardDetails = UtilMisc.toMap("wardId",wardId,"zoneId",zoneName,"wardName",wardNameUPPER,"wardNameKan",wardNameKan,"cityId",cityUpper,
 						"cityName",cityName,"wardRemark",remark,"createdate",dateofcreatevar,"status","A","activestatus","Active");
 				
 				          GenericValue valueToStore = delegator.makeValue("WardMaster", officeWardDetails);
 				         valueToStore.create();
 	 					}

 					result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, wardName, locale));
 	 
 	 
 					}
 				}
 			 catch (GenericEntityException e) {
 				e.printStackTrace();
 			}
 		}

 		return result;
 	}

 		/**
		 * Method Name :  UpdateZonemaster
		 * @Version 1.0
		 * @Description creates Office Type Master 
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning the office Id created
		 *  Transaction is handled by service engine
		 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
		 *  Code added by saurabh on 14 aug 2017
		 */		
		/*public static Map<String, Object> updateWardDet(DispatchContext dctx,
				Map<String, ? extends Object> context) {
			Map<String, Object> result = ServiceUtil.returnSuccess();
			GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			LocalDispatcher dispatcher = dctx.getDispatcher();
			List<GenericValue> caseList = new LinkedList<GenericValue>();
			GenericValue userLogin = (GenericValue) context.get("userLogin");
			final Locale locale = (Locale) context.get("locale");
			String wardName =(String) context.get("wardName");
			String zoneName =(String) context.get("zoneName");	
			String cityName =(String) context.get("cityName");			
			String wardRemark =(String) context.get("wardRemark");
			String status =(String) context.get("status");
			String activestatus =(String) context.get("activestatus");
			String wardId =(String) context.get("wardId");
		    System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+status);	
		    String wardNameUPPER = null;
 		    if (UtilValidate.isNotEmpty(wardName))
			{
 		    	wardNameUPPER = wardName.toUpperCase();
			}
			Map officeWardDetails = null;
			try{
			if (UtilValidate.isNotEmpty(wardId))
			{
				 if(status.equals("edit")){

						try {
						    List<EntityExpr> expList = new LinkedList<EntityExpr>();
		 					List<EntityExpr> expList = FastList.newInstance();
							EntityCondition mainCondition = null;

							if (UtilValidate.isNotEmpty(wardNameUPPER)) {
								expList.add(EntityCondition.makeCondition("wardName",EntityOperator.EQUALS, wardNameUPPER));
								mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
								  List<GenericValue> resultList = new LinkedList<GenericValue>();
								//List<GenericValue> resultList = FastList.newInstance();
								try {
									resultList = delegator.findList("WardMaster",
											mainCondition, UtilMisc.toSet("wardName"), null,
											null, false);
									if (UtilValidate.isNotEmpty(resultList)) {
										return ServiceUtil
												.returnSuccess("Ward Name already exists.");
									}
								} catch (GenericEntityException e1) {
									e1.printStackTrace();
								}

								if (UtilValidate.isEmpty(resultList)) {
						     officeWardDetails = UtilMisc.toMap("wardId",wardId,"wardName",wardName,"cityName",cityName,"zoneId",zoneName,"status","A","wardRemark",wardRemark);
									
									GenericValue valueToStore = delegator.makeValue("WardMaster", officeWardDetails);
									valueToStore.create();

								result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, zoneName, locale));

								}
							}
						} catch (GenericEntityException e) {
							e.printStackTrace();
						}
					}	

        	   officeWardDetails = UtilMisc.toMap("wardId",wardId,"wardName",wardName,"cityName",cityName,"zoneId",zoneName,"status","A","wardRemark",wardRemark);
           }else if(status.equals("status")){
        	   officeWardDetails = UtilMisc.toMap("status",activestatus);	
			}
           if(status.equals("delete")){
               GenericValue officeType = EntityQuery.use(delegator).from("WardMaster").where("wardId", wardId).queryOne();

        	   //GenericValue officeType= delegator.findByPrimaryKey(
        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
        	   officeType.remove();
      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, wardName, locale));   

           }else{
        	   Integer valueToStore = delegator.storeByCondition("WardMaster", officeWardDetails
   					,EntityCondition.makeCondition("wardId",EntityOperator.EQUALS,wardId));
   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, wardName, locale));   
                 }
			
             }	
 			catch(GeneralException e) {
				// It is the mother of all the ofbiz exceptions
				// All the specific exceptions are handled above
				// It would be executed in the worst case scenario
				Debug.log("Exception occured : " + e );
				//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
			}			
			
			
			return result;		
		} */
		public static Map<String, Object> updateWardDet(DispatchContext dctx,
				Map<String, ? extends Object> context) {
			Map<String, Object> result = ServiceUtil.returnSuccess();
			GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			LocalDispatcher dispatcher = dctx.getDispatcher();
			GenericValue userLogin = (GenericValue) context.get("userLogin");
			final Locale locale = (Locale) context.get("locale");
			String wardName =(String) context.get("wardName");
			 //Add by by Anubha Saini
			String wardNameKan =(String) context.get("wardNameKan");
			String zoneName =(String) context.get("zoneName");	
			String cityName =(String) context.get("cityName");			
			String wardRemark =(String) context.get("wardRemark");
			String status =(String) context.get("status");
			String activestatus =(String) context.get("activestatus");
			String wardId =(String) context.get("wardId");
		    System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+status);	
			Map officeWardDetails = null;
			try{
			if (UtilValidate.isNotEmpty(wardId))
			{
           if(status.equals("edit")){
        	   officeWardDetails = UtilMisc.toMap("wardId",wardId,"wardName",wardName,"wardNameKan",wardNameKan,"cityName",cityName,"zoneId",zoneName,"status","A","wardRemark",wardRemark);
           }else if(status.equals("status")){
        	   officeWardDetails = UtilMisc.toMap("status",activestatus);	
			}
           if(status.equals("delete")){
               GenericValue officeType = EntityQuery.use(delegator).from("WardMaster").where("wardId", wardId).queryOne();

        	   //GenericValue officeType= delegator.findByPrimaryKey(
        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
        	   officeType.remove();
      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, wardName, locale));   

           }else{
        	   Integer valueToStore = delegator.storeByCondition("WardMaster", officeWardDetails
   					,EntityCondition.makeCondition("wardId",EntityOperator.EQUALS,wardId));
   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, wardName, locale));   
                 }
			
             }	
			

			}catch(GeneralException e) {
				// It is the mother of all the ofbiz exceptions
				// All the specific exceptions are handled above
				// It would be executed in the worst case scenario
				Debug.log("Exception occured : " + e );
				//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
			}			
			
			
			return result;		
		} 
  		/**
		 * Method Name :  saveBlockMaster
		 * @Version 1.0
		 * @Description Create Block Master
		 * @param DispatchContext dctx
		 * @param Map<String, ? extends Object> context
		 * @return Map - Map returning the block Id created
		 *  Transaction is handled by service engine  
		 *  
		 */		
		  public static Map<String, Object> saveBlockMaster(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");       
	            String blockName =(String) context.get("blockName");
	            //Add by by Anubha Saini
	            String blockNameKan =(String) context.get("blockNameKan");
	            String wardName =(String) context.get("wardName");   
	            String cityName =(String) context.get("cityName");       
	            String remark =(String) context.get("remark");  
	  		  
	            long sysdate=System.currentTimeMillis(); 	            
	            java.sql.Date date=new java.sql.Date(sysdate); 	          

	          
	            try{
	            //if (UtilValidate.isNotEmpty(blockId)){
	            String blockId = (String) delegator.getNextSeqId("blockMaster");

	            Map blockMasterDetail = UtilMisc.toMap("blockName",blockName,"blockNameKan",blockNameKan,
	                    "wardId",wardName,"cityId",cityName,"remark",remark,"createdate",date,"status","A","blockId",blockId);
	           
	            GenericValue valueToStore = delegator.makeValue("blockMaster", blockMasterDetail);
	            valueToStore.create();
	            //}

	            }catch(GeneralException e) {
	                // It is the mother of all the ofbiz exceptions
	                // All the specific exceptions are handled above
	                // It would be executed in the worst case scenario
	                Debug.log("Exception occured : " + e );
	                //return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_zoneMasterCREATE_OFFICE, officeName, locale);
	            }
	           
	           
	           
	            result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, blockName, locale));
	           
	            return result;       
	        }
	       
	        /**
	         * Method Name :  editBlockTypeMaster
	         * @Version 1.0
	         * @Description  Edit Block Type Master
	         * @param DispatchContext dctx
	         * @param Map<String, ? extends Object> context
	         * @return Map - Map returning Success Message
	         *  Transaction is handled by service engine	         * 
	         */       
	        public static Map<String, Object> editBlockTypeMasters(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");
	            String blockName =(String) context.get("blockName");
	            String blockNameKan =(String) context.get("blockNameKan");
	            String wardName =(String) context.get("wardName");   
	            String cityName =(String) context.get("cityName");           
	            String remark =(String) context.get("remark");
	            String status =(String) context.get("status");
	            String activestatus =(String) context.get("activestatus");
	            String blockId =(String) context.get("blockId");
	            //java.sql.Date createdate1 = (java.sql.Date) context.get("createdate");
	            long sysdate=System.currentTimeMillis(); 	            
	            java.sql.Date date=new java.sql.Date(sysdate); 
	            
	            Map blockMasterDetail = null;
	            try{
	            if (UtilValidate.isNotEmpty(blockId))
	            {
	           if(status.equals("edit")){
	               blockMasterDetail = UtilMisc.toMap("blockName",blockName,"blockNameKan",blockNameKan,"wardId",
	                    wardName,"cityId",cityName,"status","A","remark",remark,"createdate",date);
	           }else if(status.equals("status")){
	               blockMasterDetail = UtilMisc.toMap("status",activestatus);   
	            }
	           if(status.equals("delete")){
	               GenericValue blockType = EntityQuery.use(delegator).from("blockMaster").where("blockId", blockId).queryOne();

	               //GenericValue officeType= delegator.findByPrimaryKey(
	                //       "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	               blockType.remove();
	                  result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, blockName, locale));  

	           }else{
	               Integer valueToStore = delegator.storeByCondition("blockMaster", blockMasterDetail
	                       ,EntityCondition.makeCondition("blockId",EntityOperator.EQUALS,blockId));
	               result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, blockName, locale));  
	                 }
	           
	             }   
	           

	            }catch(GeneralException e) {
	                // It is the mother of all the ofbiz exceptions
	                // All the specific exceptions are handled above
	                // It would be executed in the worst case scenario
	                Debug.log("Exception occured : " + e );
	                //return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
	            }           
	           
	           
	            return result;       
	        }
	   
	       
	        /**
	         * Method Name :  saveStreetsMaster
	         * @Version 1.0
	         * @Description create Streets Master
	         * @param DispatchContext dctx
	         * @param Map<String, ? extends Object> context
	         * @return Map - Map returning the street Id created
	         *  Transaction is handled by service engine	         * 
	         */       
	        public static Map<String, Object> saveStreetsMaster(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");       
	            String streetName =(String) context.get("streetName");
	            String streetNameKan =(String) context.get("streetNameKan");
	            String blockName =(String) context.get("blockName");   
	            String cityName =(String) context.get("cityName");       
	            String remark =(String) context.get("remark");

	            long sysdate=System.currentTimeMillis(); 	            
	            java.sql.Date createdate1=new java.sql.Date(sysdate);
	          
	       
	            try{
	            //if (UtilValidate.isNotEmpty(blockId)){
	            String streetId = (String) delegator.getNextSeqId("streetMaster");

	            Map streetMasterDetail = UtilMisc.toMap("streetName",streetName,"streetNameKan",streetNameKan,
	                    "blockId",blockName,"cityName",cityName,"remark",remark,"createdate",createdate1,"status","A","streetId",streetId);
	           
	            GenericValue valueToStore = delegator.makeValue("streetMaster", streetMasterDetail);
	            valueToStore.create();
	            //}

	            }catch(GeneralException e) {
	                // It is the mother of all the ofbiz exceptions
	                // All the specific exceptions are handled above
	                // It would be executed in the worst case scenario
	                Debug.log("Exception occured : " + e );
	                //return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_zoneMasterCREATE_OFFICE, officeName, locale);
	            }
	           
	           
	           
	            result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, streetName, locale));
	           
	            return result;       
	        }
	       

	        /**
	         * Method Name :  editStreetTypeMasters
	         * @Version 1.0
	         * @Description Edit Street Type Masters
	         * @param DispatchContext dctx
	         * @param Map<String, ? extends Object> context
	         * @return Map - Map returning Success Message
	         *  Transaction is handled by service engine	         * 
	         */       
	        public static Map<String, Object> editStreetTypeMasters(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");
	            String streetName =(String) context.get("streetName");
	            //Add by by Anubha Saini
	            String streetNameKan =(String) context.get("streetNameKan");
	            String blockName =(String) context.get("blockName");   
	            String cityName =(String) context.get("cityName");           
	            String remark =(String) context.get("remark");
	            String status =(String) context.get("status");
	            String activestatus =(String) context.get("activestatus");
	            String streetId =(String) context.get("streetId");
	            long sysdate=System.currentTimeMillis(); 	            
	            java.sql.Date createdate1=new java.sql.Date(sysdate);
	          
	            Map  streetMasterDetail = null;
	            try{
	            if (UtilValidate.isNotEmpty(streetId))
	            {
	           if(status.equals("edit")){
	               streetMasterDetail = UtilMisc.toMap("streetName",streetName,"streetNameKan",streetNameKan,"blockId",
	                       blockName,"cityName",cityName,"status","A","remark",remark,"createdate",createdate1);
	           }else if(status.equals("status")){
	               streetMasterDetail = UtilMisc.toMap("status",activestatus);   
	            }
	           if(status.equals("delete")){
	               GenericValue streetType = EntityQuery.use(delegator).from("streetMaster").where("streetId", streetId).queryOne();

	               //GenericValue officeType= delegator.findByPrimaryKey(
	                //       "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	               streetType.remove();
	                  result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, streetName, locale));  

	           }else{
	               Integer valueToStore = delegator.storeByCondition("streetMaster",  streetMasterDetail
	                       ,EntityCondition.makeCondition("streetId",EntityOperator.EQUALS,streetId));
	               result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, streetName, locale));  
	                 }
	           
	             }   
	           

	            }catch(GeneralException e) {
	                // It is the mother of all the ofbiz exceptions
	                // All the specific exceptions are handled above
	                // It would be executed in the worst case scenario
	                Debug.log("Exception occured : " + e );
	                //return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
	            }           
	           
	           
	            return result;       
	        }
	        

	        /**
	         * Method Name :  saveCasteMasterDetails
	         * @Version 1.0
	         * @Description Create Caste Master
	         * @param DispatchContext dctx
	         * @param Map<String, ? extends Object> context
	         * @return Map - Map returning the Caste Id created
	         *  Transaction is handled by service engine
	         *   
	         * 
	         */       
	        
	         public static Map<String, Object> saveCasteMasterDetails(DispatchContext dctx,
	        		Map<String, ? extends Object> context) {
	        	Map<String, Object> result = ServiceUtil.returnSuccess();
	        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	        	LocalDispatcher dispatcher = dctx.getDispatcher();
	        	GenericValue userLogin = (GenericValue) context.get("userLogin");
	        	final Locale locale = (Locale) context.get("locale");
	        	String castename =(String) context.get("castename");
	        	String castenameK =(String) context.get("castenameKan");
	        	//String createdate =(String) context.get("createdate");	
	            //java.sql.Date createdate1 = getConvertedDate(createdate);
               
	        	String remark =(String) context.get("remark");	
	        	long sysdate=System.currentTimeMillis();                 
                java.sql.Date createdate1=new java.sql.Date(sysdate); 
	        	
	        	
	        	

	        	try{
	            String casteId = (String) delegator.getNextSeqId("casteMaster");
	        	
	        	Map casteTypDetails = UtilMisc.toMap("casteId",casteId,
	        			"castename",castename,"createdate",createdate1,"castenameKan",castenameK,"status","A","remark",remark);
	        	
	        	GenericValue valueToStore = delegator.makeValue("casteMaster", casteTypDetails);
	        	valueToStore.create();
	        	

	        	}catch(GeneralException e) {
	        		// It is the mother of all the ofbiz exceptions
	        		// All the specific exceptions are handled above
	        		// It would be executed in the worst case scenario
	        		//Debug.log("Exception occured : " + e );
	        		//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
	        	}
	        	
	        	
	        	
	        	result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, castename, locale));
	        	
	        	return result;		
	        }
	        
	        
	         /**
		         * Method Name :  editCasteTypeMaster
		         * @Version 1.0
		         * @Description edit Caste Type Master
		         * @param DispatchContext dctx
		         * @param Map<String, ? extends Object> context
		         * @return Map - Map returning Success Message
		         *  Transaction is handled by service engine
		         *  
		         * 
		         */     
	        public static Map<String, Object> editCasteTypeMaster(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				Map<String, Object> result = ServiceUtil.returnSuccess();
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				LocalDispatcher dispatcher = dctx.getDispatcher();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				final Locale locale = (Locale) context.get("locale");
				String castename =(String) context.get("castename");
				String castenameK =(String) context.get("castenameKan");
				//String createdate =(String) context.get("createdate");	
	            //java.sql.Date createdate1 = getConvertedDate(createdate);
				String remark =(String) context.get("remark");			
				String casteId =(String) context.get("casteId");			
				String status =(String) context.get("status");
				String activestatus =(String) context.get("activestatus");
				
				long sysdate=System.currentTimeMillis();                 
                java.sql.Date createdate1=new java.sql.Date(sysdate); 
				
				
				Map casteTypDetails = null;
				try{
				if (UtilValidate.isNotEmpty(casteId))
				{
	           if(status.equals("edit")){
	        	   casteTypDetails = UtilMisc.toMap("casteId",casteId,"castename",
	        			   castename,"createdate",createdate1,"status","A","remark",remark,"castenameKan",castenameK);
	           }else if(status.equals("status")){
	        	   casteTypDetails = UtilMisc.toMap("status",activestatus);	
				}
	           if(status.equals("delete")){
	               GenericValue officeType = EntityQuery.use(delegator).from("casteMaster").where("casteId", casteId).queryOne();

	        	   //GenericValue officeType= delegator.findByPrimaryKey(
	        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	        	   officeType.remove();
	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, castename, locale));   

	           }else{
	        	   Integer valueToStore = delegator.storeByCondition("casteMaster", casteTypDetails
	   					,EntityCondition.makeCondition("casteId",EntityOperator.EQUALS,casteId));
	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, castename, locale));   
	                 }
				
	             }	
				

				}catch(GeneralException e) {
					// It is the mother of all the ofbiz exceptions
					// All the specific exceptions are handled above
					// It would be executed in the worst case scenario
					Debug.log("Exception occured : " + e );
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
				}			
				
				
				return result;		
			}
	        
	        
	        /**
	         * Method Name :  saveCommunityMaster
	         * @Version 1.0
	         * @Description Create Community Master
	         * @param DispatchContext dctx
	         * @param Map<String, ? extends Object> context
	         * @return Map - Map returning the Community Id created
	         *  Transaction is handled by service engine
	         *  
	         * 
	         */     
	        public static Map<String, Object> saveCommunityMaster(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				Map<String, Object> result = ServiceUtil.returnSuccess();
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				LocalDispatcher dispatcher = dctx.getDispatcher();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				final Locale locale = (Locale) context.get("locale");
				String communityname =(String) context.get("communityname");
				String communitynameK =(String) context.get("communityNameKan");
				//String createdate =(String) context.get("createdate");
				//java.sql.Date createdate1 = getConvertedDate(createdate);
				String remark =(String) context.get("remark");	
				String communityId =(String) context.get("communityId");
				
				long sysdate=System.currentTimeMillis();                 
                java.sql.Date date=new java.sql.Date(sysdate); 
  				

				try{
			    String CSC = (String) delegator.getNextSeqId("communityMaster");
				
				Map communityTypDetails = UtilMisc.toMap("communityId",CSC,
						"communityname",communityname,"communityNameKan",communitynameK,"createdate",date,"status","A","remark",remark);
				
				GenericValue valueToStore = delegator.makeValue("communityMaster", communityTypDetails);
				valueToStore.create();
				

				}catch(GeneralException e) {
					// It is the mother of all the ofbiz exceptions
					// All the specific exceptions are handled above
					// It would be executed in the worst case scenario
					//Debug.log("Exception occured : " + e );
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
				}
				
				
				
				result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, communityname, locale));
				
				return result;		
			}
	        
	        
	        
	        
	        /**
	         * Method Name :  editCommunityTypeMaster
	         * @Version 1.0
	         * @Description edit Community Type Master
	         * @param DispatchContext dctx
	         * @param Map<String, ? extends Object> context
	         * @return Map - Map returning Success Message
	         *  Transaction is handled by service engine
	         * 
	         * 
	         */        
	        public static Map<String, Object> editCommunityTypeMaster(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				Map<String, Object> result = ServiceUtil.returnSuccess();
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				LocalDispatcher dispatcher = dctx.getDispatcher();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				final Locale locale = (Locale) context.get("locale");
				String communityname =(String) context.get("communityname");
				String communitynameK =(String) context.get("communityNameKan");
				//String createdate =(String) context.get("createdate");
				//java.sql.Date createdate1 = getConvertedDate(createdate);
				String remark =(String) context.get("remark");			
				String communityId =(String) context.get("communityId");			
				String status =(String) context.get("status");
				String activestatus =(String) context.get("activestatus");	
				
				long sysdate=System.currentTimeMillis();                 
                java.sql.Date date=new java.sql.Date(sysdate); 
  				
				
				Map communityTypDetails = null;
				try{
				if (UtilValidate.isNotEmpty(communityId))
				{
	           if(status.equals("edit")){
	        	   communityTypDetails = UtilMisc.toMap("communityId",communityId,"communityname",
	        			   communityname,"createdate",date,"communityNameKan",communitynameK,"status","A","remark",remark);
	           }else if(status.equals("status")){
	        	   communityTypDetails = UtilMisc.toMap("status",activestatus);	
				}
	           if(status.equals("delete")){
	               GenericValue officeType = EntityQuery.use(delegator).from("communityMaster").where("communityId", communityId).queryOne();

	        	   //GenericValue officeType= delegator.findByPrimaryKey(
	        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	               officeType.remove();
	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, communityname, locale));   

	           }else{
	        	   Integer valueToStore = delegator.storeByCondition("communityMaster", communityTypDetails
	   					,EntityCondition.makeCondition("communityId",EntityOperator.EQUALS,communityId));
	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, communityname, locale));   
	                 }
				
	             }	
				

				}catch(GeneralException e) {
					// It is the mother of all the ofbiz exceptions
					// All the specific exceptions are handled above
					// It would be executed in the worst case scenario
					Debug.log("Exception occured : " + e );
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
				}			
				
				
				return result;		
			}
	    
	
	        
	        

			/**
			 * Method Name :  saveGenderMaster
			 * @Version 1.0
			 * @Description creates Gender Master 
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning the gender Id created
			 *  Transaction is handled by service engine
			 *  
			 *  
			 */	
	        public static Map<String, Object> saveGenderMaster(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");
	            String genderName =(String) context.get("genderName");
	            String genderNameK =(String) context.get("genderNameKan");
               /* String dateOfCreateGender =(String) context.get("dateOfCreateGender");  
	            java.sql.Date dateOfCreateGender1 = getConvertedDate(dateOfCreateGender);*/
                String genderRemark =(String) context.get("genderRemark");
                long sysdate=System.currentTimeMillis();                 
                java.sql.Date dateOfCreateGender1=new java.sql.Date(sysdate);
	               
	            //System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+officeTypeId+officeTypeName+parentTypeId+remark);

	            try{
	            //if (UtilValidate.isNotEmpty(genderId)){
	            String genderId = (String) delegator.getNextSeqId("genderMaster");
	           
	            Map genderMasterDetails = UtilMisc.toMap("genderId",genderId,
	                    "genderName",genderName,"dateOfCreateGender",dateOfCreateGender1,"genderNameKan",genderNameK,"status","A","genderRemark",genderRemark);
	           
	            GenericValue valueToStore = delegator.makeValue("genderMaster", genderMasterDetails);
	            valueToStore.create();
	            //}

	            }catch(GeneralException e) {
	                // It is the mother of all the ofbiz exceptions
	                // All the specific exceptions are handled above
	                // It would be executed in the worst case scenario
	                Debug.log("Exception occured : " + e );
	                //return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
	            }
	           
	           
	           
	            result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, genderName, locale));
	           
	            return result;       
	        } 
	        
	        
	        
	        /**
			 * Method Name :  editofGenderMaster
			 * @Version 1.0
			 * @Description Edit Gender Master
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *    
			 *  
			 */	  
	        public static Map<String, Object> editofGenderMaster(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");
	            String genderId =(String) context.get("genderId");
	            String genderName =(String) context.get("genderName");
	            String genderNameK =(String) context.get("genderNameKan");
	            /*String dateOfCreateGender =(String) context.get("dateOfCreateGender");
	            java.sql.Date dateOfCreateGender1 = getConvertedDate(dateOfCreateGender);*/
	            String genderRemark =(String) context.get("genderRemark");           
/*	            String genderStatus =(String) context.get("genderStatus");
*/	            String status =(String) context.get("status");
	            String activestatus =(String) context.get("activestatus");
	            long sysdate=System.currentTimeMillis();                 
                java.sql.Date dateOfCreateGender1=new java.sql.Date(sysdate);
	           
	            System.out.println("genderId="+genderId);
	            System.out.println("status="+status);
	            System.out.println("activestatus="+activestatus);
	
	            Map genderMasterDetails = null;
	            try{
	            if (UtilValidate.isNotEmpty(genderId))
	            {
	           if(status.equals("edit")){
	               genderMasterDetails = UtilMisc.toMap("genderId",genderId,"genderName",genderName,"genderNameKan",genderNameK,"dateOfCreateGender",dateOfCreateGender1,"genderRemark",genderRemark,"status","A");
	           }else if(status.equals("status")){
	               genderMasterDetails = UtilMisc.toMap("status",activestatus);   
	            }
	           if(status.equals("delete")){
	               GenericValue genderMaster = EntityQuery.use(delegator).from("genderMaster").where("genderId", genderId).queryOne();

	               //GenericValue officeType= delegator.findByPrimaryKey(
	                //       "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	               genderMaster.remove();
	                  result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, genderName, locale));  

	           }else{
	               Integer valueToStore = delegator.storeByCondition("genderMaster", genderMasterDetails
	                       ,EntityCondition.makeCondition("genderId",EntityOperator.EQUALS,genderId));
	               result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, genderName, locale));  
	                 }
	           
	             }
	           

	            }catch(GeneralException e) {
	                // It is the mother of all the ofbiz exceptions
	                // All the specific exceptions are handled above
	                // It would be executed in the worst case scenario
	                Debug.log("Exception occured : " + e );
	                //return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
	            }           
	           
	           
	            return result;       
	        }
	    
	      
	        
	        /**
			 * Method Name :  savemaritalstatusmaster
			 * @Version 1.0
			 * @Description creates Marital Status Master
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning the maritalStatus Id created
			 *  Transaction is handled by service engine
			 *    
			 *  
			 */	   
	       public static Map<String, Object> savemaritalstatusmaster(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				Map<String, Object> result = ServiceUtil.returnSuccess();
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				LocalDispatcher dispatcher = dctx.getDispatcher();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				final Locale locale = (Locale) context.get("locale");
				String maritalStatus =(String) context.get("maritalStatus");
				String maritalStatusK =(String) context.get("maritalStatusKan");
				/*String dateOfCreateMarital =(String) context.get("dateOfCreateMarital");
	            java.sql.Date dateOfCreateMarital1 = getConvertedDate(dateOfCreateMarital);	*/		
	            String maritalRemark =(String) context.get("maritalRemark");		
	            long sysdate=System.currentTimeMillis();                 
                java.sql.Date dateOfCreateMarital1=new java.sql.Date(sysdate);
	               
		
				//System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+officeTypeId+officeTypeName+parentTypeId+remark);

				try{
				//if (UtilValidate.isNotEmpty(genderId)){
	            String maritalStatusId = (String) delegator.getNextSeqId("maritalStatusMaster");
				
				Map maritalStatusMasterDetails = UtilMisc.toMap("maritalStatusId",maritalStatusId,
						"maritalStatus",maritalStatus,"dateOfCreateMarital",dateOfCreateMarital1,"maritalStatusKan",maritalStatusK,"status","A","maritalRemark",maritalRemark);
				
				GenericValue valueToStore = delegator.makeValue("maritalStatusMaster", maritalStatusMasterDetails);
				valueToStore.create();
				//}

				}catch(GeneralException e) {
					// It is the mother of all the ofbiz exceptions
					// All the specific exceptions are handled above
					// It would be executed in the worst case scenario
					Debug.log("Exception occured : " + e );
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
				}
				
				
				
				result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, maritalStatus, locale));
				
				return result;		
			}
	       
	       
	       /**
			 * Method Name :  editofMaritalMaster
			 * @Version 1.0
			 * @Description Edit Marital Status Master
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *   
			 *  
			 */	  
	        public static Map<String, Object> editofMaritalMaster(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				Map<String, Object> result = ServiceUtil.returnSuccess();
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				LocalDispatcher dispatcher = dctx.getDispatcher();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				final Locale locale = (Locale) context.get("locale");
				String maritalStatusId =(String) context.get("maritalStatusId");
	            String maritalStatus =(String) context.get("maritalStatus");
	            String maritalStatusK =(String) context.get("maritalStatusKan");
				/*String dateOfCreateMarital =(String) context.get("dateOfCreateMarital");
				java.sql.Date dateOfCreateMarital1 = getConvertedDate(dateOfCreateMarital);*/
				String maritalRemark =(String) context.get("maritalRemark");			
/*				String maritalStatusEn =(String) context.get("maritalStatusEn");
*/			    String status =(String) context.get("status");
	            String activestatus =(String) context.get("activestatus");
	            long sysdate=System.currentTimeMillis();                 
                java.sql.Date dateOfCreateMarital1=new java.sql.Date(sysdate);

				
				Map maritalStatusMasterDetails = null;
				try{
				if (UtilValidate.isNotEmpty(maritalStatusId))
				{
	           if(status.equals("edit")){
	        	   maritalStatusMasterDetails = UtilMisc.toMap("maritalStatusId",maritalStatusId,"maritalStatus",maritalStatus,"maritalStatusKan",maritalStatusK,"dateOfCreateMarital",dateOfCreateMarital1,"maritalRemark",maritalRemark,"status","A");
	           }else if(status.equals("status")){
	        	   maritalStatusMasterDetails = UtilMisc.toMap("status",activestatus);	
				}
	           if(status.equals("delete")){
	               GenericValue maritalStatusMaster = EntityQuery.use(delegator).from("maritalStatusMaster").where("maritalStatusId", maritalStatusId).queryOne();

	        	   //GenericValue officeType= delegator.findByPrimaryKey(
	        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	               maritalStatusMaster.remove();
	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, maritalStatus, locale));   

	           }else{
	        	   Integer valueToStore = delegator.storeByCondition("maritalStatusMaster", maritalStatusMasterDetails
	   					,EntityCondition.makeCondition("maritalStatusId",EntityOperator.EQUALS,maritalStatusId));
	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, maritalStatus, locale));   
	                 }
				
	             }
				

				}catch(GeneralException e) {
					// It is the mother of all the ofbiz exceptions
					// All the specific exceptions are handled above
					// It would be executed in the worst case scenario
					Debug.log("Exception occured : " + e );
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
				}			
				
				
				return result;		
			}
	        

		     
	        
	        /**
			 * Method Name :  savePincodeMaster
			 * @Version 1.0
			 * @Description creates Pin-codeMaster
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning the pinCode Id created
			 *  Transaction is handled by service engine
			 *   
			 *  
			 */	
	        public static Map<String, Object> savePincodeMaster(DispatchContext dctx, 
					Map<String, ? extends Object> context) { 
				Map<String, Object> result = ServiceUtil.returnSuccess(); 
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator(); 
				LocalDispatcher dispatcher = dctx.getDispatcher(); 
				GenericValue userLogin = (GenericValue) context.get("userLogin"); 
				final Locale locale = (Locale) context.get("locale"); 
				String pinCode =(String) context.get("pinCode"); 
				/*String dateOfCreatePin =(String) context.get("dateOfCreatePin"); 
	            java.sql.Date dateOfCreatePin1 = getConvertedDate(dateOfCreatePin);		*/	 
	            String cityRemark =(String) context.get("cityRemark");		
	            long sysdate=System.currentTimeMillis();                 
                java.sql.Date dateOfCreatePin1=new java.sql.Date(sysdate);
	               
		 
				//System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+pinCode+dateOfCreatePin+cityRemark); 

				try{ 
				//if (UtilValidate.isNotEmpty(genderId)){ 
	            String pinCodeId = (String) delegator.getNextSeqId("pinCodeMaster"); 
				 
				Map pinCodeMasterDetails = UtilMisc.toMap("pinCodeId",pinCodeId, 
						"pinCode",pinCode,"dateOfCreatePin",dateOfCreatePin1,"status","A","cityRemark",cityRemark); 
				 
				GenericValue valueToStore = delegator.makeValue("pinCodeMaster", pinCodeMasterDetails); 
				valueToStore.create(); 
				//} 

				}catch(GeneralException e) { 
					// It is the mother of all the ofbiz exceptions 
					// All the specific exceptions are handled above 
					// It would be executed in the worst case scenario 
					Debug.log("Exception occured : " + e ); 
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale); 
				} 
				 
				 
				 
				result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, pinCode, locale)); 
				 
				return result;		 
			} 
	        
	        
	        /**
			 * Method Name :  editofPincodemaster
			 * @Version 1.0
			 * @Description Edit Pincode Master
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *    
			 *  
			 */	  
	        public static Map<String, Object> editofPincodemaster(DispatchContext dctx, 
					Map<String, ? extends Object> context) { 
				Map<String, Object> result = ServiceUtil.returnSuccess(); 
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator(); 
				LocalDispatcher dispatcher = dctx.getDispatcher(); 
				GenericValue userLogin = (GenericValue) context.get("userLogin"); 
				final Locale locale = (Locale) context.get("locale"); 
				String pinCodeId =(String) context.get("pinCodeId"); 
	            String pinCode =(String) context.get("pinCode"); 
				/*String dateOfCreatePin =(String) context.get("dateOfCreatePin");	 
	            java.sql.Date dateOfCreatePin1 = getConvertedDate(dateOfCreatePin);			*/ 
	            String cityRemark =(String) context.get("cityRemark");			 
/*				String maritalStatusEn =(String) context.get("maritalStatusEn"); 
*/			    String status =(String) context.get("status"); 
	            String activestatus =(String) context.get("activestatus"); 
	            long sysdate=System.currentTimeMillis();                 
                java.sql.Date dateOfCreatePin1=new java.sql.Date(sysdate);

				 
				Map pinCodeMasterDetails = null; 
				try{ 
				if (UtilValidate.isNotEmpty(pinCodeId)) 
				{ 
	           if(status.equals("edit")){ 
	        	   pinCodeMasterDetails = UtilMisc.toMap("pinCodeId",pinCodeId,"pinCode",pinCode,"dateOfCreatePin",dateOfCreatePin1,"cityRemark",cityRemark,"status","A"); 
	           }else if(status.equals("status")){ 
	        	   pinCodeMasterDetails = UtilMisc.toMap("status",activestatus);	 
				} 
	           if(status.equals("delete")){ 
	               GenericValue pinCodeMaster = EntityQuery.use(delegator).from("pinCodeMaster").where("pinCodeId", pinCodeId).queryOne(); 

	        	   //GenericValue officeType= delegator.findByPrimaryKey( 
	        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName)); 
	               pinCodeMaster.remove(); 
	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, pinCode, locale));    

	           }else{ 
	        	   Integer valueToStore = delegator.storeByCondition("pinCodeMaster", pinCodeMasterDetails 
	   					,EntityCondition.makeCondition("pinCodeId",EntityOperator.EQUALS,pinCodeId)); 
	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, pinCode, locale));    
	                 } 
				 
	             } 
				 

				}catch(GeneralException e) { 
					// It is the mother of all the ofbiz exceptions 
					// All the specific exceptions are handled above 
					// It would be executed in the worst case scenario 
					Debug.log("Exception occured : " + e ); 
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale); 
				}			 
				 
				 
				return result;		 
			}	 
			 
		
	        
	        /**
			 * Method Name :  saveDesignationMaster
			 * @Version 1.0
			 * @Description creates Designation Master
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning the designation Id created
			 *  Transaction is handled by service engine
			 *   
			 *  
			 */	 


   public static Map<String, Object> saveDesignationMaster(DispatchContext dctx,
	                Map<String, ? extends Object> context) {
	            Map<String, Object> result = ServiceUtil.returnSuccess();
	            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	            LocalDispatcher dispatcher = dctx.getDispatcher();
	            List<GenericValue> caseList = new LinkedList<GenericValue>();
	            GenericValue userLogin = (GenericValue) context.get("userLogin");
	            final Locale locale = (Locale) context.get("locale");
	            String designationName =(String) context.get("designationName");
                String designationRemark =(String) context.get("designationRemark");
                String status =(String) context.get("status");
    			String activestatus =(String) context.get("activestatus");
    			String designationTypeId =(String) context.get("designationTypeId");

	            long sysdate=System.currentTimeMillis();                 
                java.sql.Date createdDate=new java.sql.Date(sysdate);
	            String designationId = (String) delegator.getNextSeqId("designationMaster");
	            List<GenericValue> resultLists = new LinkedList<GenericValue>();
	            List<GenericValue> resultList = new LinkedList<GenericValue>();
	              
	                
	                 String designationNameUPPER = designationName.toUpperCase();
	                 String designationTypeIdUPPER = designationTypeId.toUpperCase();

	          
	            // if (UtilValidate.isNotEmpty(designationNameUPPER )) {

	             try {
	                 List<EntityExpr> expList = new LinkedList<EntityExpr>();
	                 List<EntityExpr> expLists = new LinkedList<EntityExpr>();

/*	                 List<EntityExpr> expList = FastList.newInstance();
*/	                 EntityCondition mainCondition = null;
					EntityCondition mainConditions = null;

	                 if (UtilValidate.isNotEmpty(designationNameUPPER)) {
	                     expList.add(EntityCondition.makeCondition("designationName",EntityOperator.EQUALS, designationNameUPPER));
	                     mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
	                       
	                     //List<GenericValue> resultList = FastList.newInstance();
	                     try {
	                         resultList = delegator.findList("designationMaster",
	                                 mainCondition, UtilMisc.toSet("designationName"), null,
	                                 null, false);
	                         if (UtilValidate.isNotEmpty(resultList)) {
	                             return ServiceUtil
	                                     .returnSuccess("Designation Name already exists.");
	                         }
	                     }  catch (GenericEntityException e1) {
	    	                 e1.printStackTrace();
	    	             }

	                 } 
	                     if (UtilValidate.isNotEmpty(designationTypeIdUPPER)) {
	                    	 expLists.add(EntityCondition.makeCondition("designationTypeId",EntityOperator.EQUALS, designationTypeIdUPPER));
    	                     mainConditions = EntityCondition.makeCondition(expLists,EntityOperator.AND);
    	                       
    	                     //List<GenericValue> resultList = FastList.newInstance();
    	                       
    	                      // System.out.println("~~~~~designationTypeIdUPPER~~~~"+designationTypeIdUPPER);
    	                       //System.out.println("~~~~~mainConditions~~~~"+mainConditions);

    	                     try {
    	                    	 resultLists = delegator.findList("designationMaster",
    	                                 mainConditions, UtilMisc.toSet("designationTypeId"), null,
    	                                 null, false);
      	                       //System.out.println("~~~~~resultLists~~~~"+resultLists);

    	                         if (UtilValidate.isNotEmpty(resultLists)) {
    	                             return ServiceUtil
    	                                     .returnSuccess("Designation Type Id already exists.");
    	                         }
    	                     } catch (GenericEntityException e1) {
    	                         e1.printStackTrace();
    	                     }
	                     }
	                     
	                     

	                     if (UtilValidate.isEmpty(resultList) && UtilValidate.isEmpty(resultLists)) {
	                         Map designationMasterDetails = UtilMisc.toMap("designationId",designationId,"designationTypeId",designationTypeIdUPPER,
	         						"designationName",designationName,"createdDate",createdDate,"status","A","description",designationRemark,"activestatus","Active"
	                         );
	                
	                           GenericValue valueToStore = delegator.makeValue("designationMaster", designationMasterDetails);
	                          valueToStore.create();
	                          
	                          Map emplPositionTypeMap = UtilMisc.toMap("emplPositionTypeId",designationTypeId,"description",designationName);
		                
		                           GenericValue saveEmplPositionType = delegator.makeValue("EmplPositionType", emplPositionTypeMap);
		                           saveEmplPositionType.create();
	                          }

	                     result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, designationName, locale));
	                    
	                 }
	    	             
	                 
	              catch (GenericEntityException e) {
	                 e.printStackTrace();
	             }
	         
	       	             
	            // }
	         return result;
	     }



	        
	        
	        /**
			 * Method Name :  editofDesignationMaster
			 * @Version 1.0
			 * @Description Edit DesignationMaster
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *   
			 *  
			 */	  
	        public static Map<String, Object> editofDesignationMaster(DispatchContext dctx,
					Map<String, ? extends Object> context) {
				Map<String, Object> result = ServiceUtil.returnSuccess();
				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
				LocalDispatcher dispatcher = dctx.getDispatcher();
				GenericValue userLogin = (GenericValue) context.get("userLogin");
				final Locale locale = (Locale) context.get("locale");
				 String designationId =(String) context.get("designationId");
                 String designationName =(String) context.get("designationName");
	             String designationRemark =(String) context.get("designationRemark");
	             String status =(String) context.get("status");
	    	     String activestatus =(String) context.get("activestatus");
	    	     String designationTypeId =(String) context.get("designationTypeId");
                 long sysdate=System.currentTimeMillis();                 
	             java.sql.Date createdDate=new java.sql.Date(sysdate);
				
				Map designationMasterDetails = null;
				Map emplPositionTypeMap = null;
				try{
				if (UtilValidate.isNotEmpty(designationId))
				{
	           if(status.equals("edit")){
	        	   designationMasterDetails = UtilMisc.toMap("designationId",designationId,"designationTypeId",designationTypeId,
    						"designationName",designationName,"createdDate",createdDate,"status","A","description",designationRemark
    						);
	        	    emplPositionTypeMap = UtilMisc.toMap("emplPositionTypeId",designationTypeId,"description",designationName);
	                
                  
	           }else if(status.equals("status")){
	        	   designationMasterDetails = UtilMisc.toMap("status",activestatus);	
				}
	           if(status.equals("delete")){
	               GenericValue  designationMaster= EntityQuery.use(delegator).from("designationMaster").where("designationId", designationId).queryOne();

	        	   //GenericValue officeType= delegator.findByPrimaryKey(
	        		//	   "OfficeTypeMaster",UtilMisc.toMap("ofcTypeId",officeTypeId,"ofcTypeName",officeTypeName));
	               designationMaster.remove();
	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, designationName, locale));   

	           }else{
	        	   Integer valueToStore = delegator.storeByCondition("designationMaster", designationMasterDetails
	   					,EntityCondition.makeCondition("designationId",EntityOperator.EQUALS,designationId));
	        	   
	        	   Integer saveEmplPositionType = delegator.storeByCondition("EmplPositionType", emplPositionTypeMap
	        			   ,EntityCondition.makeCondition("emplPositionTypeId",EntityOperator.EQUALS,designationTypeId));
                  
	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, designationName, locale));   
	                 }
				
	             }
				

				}catch(GeneralException e) {
					// It is the mother of all the ofbiz exceptions
					// All the specific exceptions are handled above
					// It would be executed in the worst case scenario
					Debug.log("Exception occured : " + e );
					//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
				}			
				
				
				return result;		
			}

	        /**
	         * Create By : shubham malviya
			 * Method Name :  actionConsumerRegistration
			 * entity Name : consumerRegistrationDetails
			 * @Version 1.0
			 * @Description Action Consumer Registration
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *    
			 *  
			 */	 
	        public static Map<String, Object> actionConsumerRegistration(DispatchContext dctx,Map<String, ? extends Object> context) {
	        	Map<String, Object> result = ServiceUtil.returnSuccess();
	        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	        	LocalDispatcher dispatcher = dctx.getDispatcher();
	        	GenericValue userLogin = (GenericValue) context.get("userLogin");
	        	Locale locale = (Locale) context.get("locale");
	        	
	        	String sequenceId = (String) context.get("sequenceId"); 
	        	String mobileNumber = (String) context.get("mobileNumber"); 
	        	String eMail = (String) context.get("eMail"); 
	        	String actionStatus = (String) context.get("actionStatus"); 
	        	String approveRemark = (String) context.get("approveRemark"); 
	        	String resoneForReject = (String) context.get("resoneForReject");
	        	String actionByOfficerName = (String) context.get("actionByOfficerName");
	        	String createdByLoginId = (String) context.get("createdByLoginId");
	        	String firstName = (String) context.get("firstName");
	        	String lastName = (String) context.get("lastName");
	        	String appRejRemark;
	        	String customerId =null;
	        	String encryPass =null;
	        	
	        	boolean useEncryption = "true".equals(EntityUtilProperties.getPropertyValue("security", "password.encrypt", delegator));
	        	
	        	if(actionStatus.equals("Approve"))
	        	{
	        		appRejRemark = approveRemark;
	        	}
	        	else
	        	{
	        		appRejRemark = resoneForReject;
	        	}
	        	
	        	Calendar cal = Calendar.getInstance();
	        	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	        	String currentDate = sdf.format(cal.getTime());
	        	
	        	java.util.Date utilDate = new java.util.Date();
	        	cal.setTime(utilDate);
	        	cal.set(Calendar.MILLISECOND, 0);
	        	//System.out.println("new java.sql.Timestamp(utilDate.getTime())==============="+new java.sql.Timestamp(utilDate.getTime()));
	        	
	     try{
	        		
	        			Map actionRegistrationDetails = null; 
					
	        		// Code for Create Unique Id
	        	if(UtilValidate.isNotEmpty(sequenceId))
	        	 {
	        		String PS = new String(); 
	        		if(actionStatus.equals("Approve"))
	        		{
	        				    	String s = "";
	        				    	double d;
	        				    	for (int i = 1; i <= 4; i++)
	        				    	{
	        				    		d = Math.random() * 10;
	        				    		s = s + ((int)d);
	        				    		customerId = sequenceId +"MCC"+s;
	        				    	}
	        				    	
	        				    	// code for Password Ganerate
	       							int length= 8;
	       							String alphabet = new String("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"); //9
	       							int n = alphabet.length(); // n=62 length of alphabet
	       							Random r = new Random();
	       							for (int i=0; i<length; i++)
	       							{
	       								PS = PS + alphabet.charAt(r.nextInt(n));// call nextInt() Method
	       							}
	       							encryPass = useEncryption ? HashCrypt.cryptUTF8(getHashType(), null, PS) : PS;
	       						// End
	        		}
	        		else
	        		{
	        			customerId = null;
	        			encryPass = null;
	        		}
	        			//end
	        				
	        		//Code for save Costomer Party Id in Party Table
	        		String partyId=null;
	        		if(actionStatus.equals("Approve"))
						{
	   				GenericValue PartyDetailSave = null;
	   	  			partyId = delegator.getNextSeqId("Party",1);
	   	  			Map<String, ? extends Object> PartyDetail = UtilMisc.toMap("partyId",partyId,"partyTypeId","PERSON","statusId","PARTY_ENABLED","createdByUserLogin",createdByLoginId);
	   	  			PartyDetailSave = delegator.makeValue("Party", PartyDetail);
	   	  			PartyDetailSave.create();
						}
	   	  			//End
	   	  			
			        	   actionRegistrationDetails = UtilMisc.toMap("actionStatus",actionStatus,"appRejRemark",appRejRemark,"actionDate",currentDate,"customerId",customerId,"partyId",partyId,"actionByOfficerName",actionByOfficerName); 
			        	   
			        	   Integer valueToStore = delegator.storeByCondition("consumerRegistrationDetails", actionRegistrationDetails 
				   					,EntityCondition.makeCondition("sequenceId",EntityOperator.EQUALS,sequenceId));
			        	   result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_APPROVE_SUCCESSFULLY, "", locale));    
   						
   							String massage=null;
   							
   							if(actionStatus.equals("Approve")){
   								massage ="Dear Customer, \n          	Welcome. We thank you for your registration at IMIS. \n \n Your user id is "+customerId+" \n Your Password is "+PS+" \n \n Thankyou";
   							}
   							else
   							{
   								massage = "Sorry, your registration Detail have been Rejected";
   							}
   							
   							if(actionStatus.equals("Approve"))
   							{
			   	  			
			   	  		// Code for save login and password in UserLogin Table
   							Map<String, ? extends Object> UserLoginDetails = UtilMisc.toMap("userLoginId",customerId,"currentPassword",encryPass,"enabled","Y","partyId",partyId);
			   				GenericValue UserLoginSave = delegator.makeValue("UserLogin", UserLoginDetails);
			   				UserLoginSave.create();
   						//End
			   				
			   	  		//Code for save Costomer Party Id in Person Table
			   				GenericValue personDetailSave = null;
			   	  			Map<String, ? extends Object> personDetail = UtilMisc.toMap("partyId",partyId,"firstName",firstName,"lastName",lastName);
			   	  			personDetailSave = delegator.makeValue("Person", personDetail);
			   	  			personDetailSave.create();
			   	  		//End
   							}
			   	  		/*//Code for save Costomer Party Id in Party ProductStoreRole Table
			   				GenericValue PartyRole = null;
			   	  			Map<String, ? extends Object> PartyRoleSave = UtilMisc.toMap("partyId",partyId,"roleTypeId","CUSTOMER");
			   	  			PartyRole = delegator.makeValue("PartyRole", PartyRoleSave);
			   	  			PartyRole.create();
			   	  		//End
			   	  			
			   	  		//Code for save Costomer Party Id in Party ProductStoreRole Table
			   				GenericValue ProductStore = null;
			   	  			Map<String, ? extends Object> ProductStoreRoleSave = UtilMisc.toMap("partyId",partyId,"roleTypeId","CUSTOMER","productStoreId","9000","fromDate",new java.sql.Timestamp(utilDate.getTime()));
			   	  			ProductStore = delegator.makeValue("ProductStoreRole", ProductStoreRoleSave);
			   	  			ProductStore.create();
			   	  		//End
*/			   	  			
			        	// code to call Service for SMS
			   			try {
			   					Map smsLogMap = FastMap.newInstance();
			   					Map LogMap = FastMap.newInstance();
			   					smsLogMap.putAll(UtilMisc.toMap("mobNumber", mobileNumber, "textMessage", "Dear Customer,Welcome. We thank you for your registration at IMIS. Your user id is "+customerId+" \n Your Password is "+PS+"", "customerId", customerId, "tabName", "Registration Action", "discription", "Action Confirmation"));
			   					smsLogMap = dispatcher.runSync("smsServiceCall",smsLogMap);
			   				}
			   			catch(GenericServiceException e)
			   				{
			   					e.printStackTrace();
			   				}
			   			//End
			   			
			   			// code to call Service for Mail
			   			try {
			   					Map emailLogMap = FastMap.newInstance();
			   					Map LogMap = FastMap.newInstance();
			   					emailLogMap.putAll(UtilMisc.toMap("emailId", eMail, "textMessage",massage, "customerId", customerId, "tabName", "Action Registration", "discription", "Action Confirmation","subject", "Email From IMIS"));
			   					emailLogMap = dispatcher.runSync("emailServiceCall",emailLogMap);
			   				}
			   			catch(GenericServiceException e)
			   				{
			   				e.printStackTrace();
			   				}
			   			//End
			   			
	        	}
	        }
	        	
	      catch(GenericEntityException e)
	        {
	        	System.out.println("Exception occured : " + e ); 
	        }

	        	 return result;	
	  }

	        public static String getHashType() {
	            String hashType = UtilProperties.getPropertyValue("security", "password.encrypt.hash.type");

	            if (UtilValidate.isEmpty(hashType)) {
	                Debug.logWarning("Password encrypt hash type is not specified in security.properties, use SHA", module);
	                hashType = "SHA";
	            }

	            return hashType;
	        }
	        
	        /**
	         * Create By : Shubham Malviya
	    	 * Method Name :  editCostomerDetail
	    	 * entity Name : consumerRegistrationDetails
	    	 * Service : editCostomerDetail
	    	 * @Version 1.0
	    	 */	 
	    	public static Map<String, Object> editCostomerDetail(DispatchContext dctx,Map<String, ? extends Object> context) {
	      		Map<String, Object> result = ServiceUtil.returnSuccess();
	      		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	      		LocalDispatcher dispatcher = dctx.getDispatcher();
	      		GenericValue userLogin = (GenericValue) context.get("userLogin");
	      		Locale locale = (Locale) context.get("locale");
	           Timestamp currentTimeStamp = new Timestamp(System.currentTimeMillis());
	           DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	           Date date = new Date();
	           
	           String seqId = (String) context.get("seqId");
	          	String title = (String) context.get("title");
	             String firstName = (String) context.get("firstName");
	      		String middleName = (String) context.get("middleName");
	      		String lastName = (String) context.get("lastName");
	      		String dateOfBirth = (String) context.get("dateOfBirth");
	      		String gender = (String) context.get("gender");
	      		String maritalStatus = (String) context.get("maritalStatus");
	      		String fatherName = (String) context.get("fatherName");
	      		String motherName = (String) context.get("motherName");
	      		String aadharCardNo = (String) context.get("aadharCardNo");
	      		String nationality = (String) context.get("nationality");
	      		String cummunityName = (String) context.get("cummunityName");
	      		String consumerCast = (String) context.get("consumerCast");
	      		String contactNo = (String) context.get("contactNo");
	      		String resContactNo = (String) context.get("resContactNo");
	      		String eMail = (String) context.get("eMail");
	      		String address = (String) context.get("address");
	      		String houseNo = (String) context.get("houseNo");
	      		String wardNo = (String) context.get("wardNo");
	      		String mohalla = (String) context.get("mohalla");
	      		String landMark = (String) context.get("landMark");
	      		String village = (String) context.get("village");
	      		
	      		try{
	      			if (UtilValidate.isNotEmpty(seqId))
	      			{
	      				Map editCostomerDetail = UtilMisc.toMap("title",title,"firstName",firstName,"middleName",middleName,"lastName",lastName
	      	  					,"dateOfBirth",dateOfBirth,"genderId",gender,"maritalStatusId",maritalStatus,"fatherName",fatherName,"motherName",motherName,"aadharCardNo",aadharCardNo,"cummunityNameId",cummunityName
	      	  					,"nationality",nationality,"consumerCastId",consumerCast,"mobileNumber",contactNo,"resContactNo",resContactNo,"eMail",eMail,"address",address,"houseNo",houseNo,"wardNo",wardNo,"mohalla",mohalla
	      	  					,"landMark",landMark,"village",village); 
			        	   
			        	   Integer valueToStore = delegator.storeByCondition("consumerRegistrationDetails", editCostomerDetail
				   					,EntityCondition.makeCondition("sequenceId",EntityOperator.EQUALS,seqId));
			        	   result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, "", locale));    
	        			
	      			}
	      		}
	      		catch(GenericEntityException e)
	      		{
	      			System.out.println("Exception occured : " + e ); 
	      		}
	      		
	      	
	      		 return result;	
	      	}
	    	
	    	/**
	         * Create By : shubham malviya
			 * Method Name :  actionConnectionDetail
			 * entity Name : saveConnectionDetail
			 * @Version 1.0
			 * @Description Action Connection Detail
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *    
			 *  
			 */	 
	    	
	    	public static Map<String, Object> actionConnectionDetail(DispatchContext dctx,Map<String, ? extends Object> context) {
	        	Map<String, Object> result = ServiceUtil.returnSuccess();
	        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	        	LocalDispatcher dispatcher = dctx.getDispatcher();
	        	GenericValue userLogin = (GenericValue) context.get("userLogin");
	        	Locale locale = (Locale) context.get("locale");
	        	
	        	String sequenceId = (String) context.get("sequenceId");
	        	String connectionStatus = (String) context.get("connectionStatus");
	        	String dmaNo = (String) context.get("dmaNo");
	        	String connectionDate = (String) context.get("connectionDate");
	        	String meterNo = (String) context.get("meterNo");
	        	String refFileNo = (String) context.get("refFileNo");
	        	String bookNo = (String) context.get("bookNo");
	        	String pipeSize = (String) context.get("pipeSize");
	        	String constituency = (String) context.get("constituency");
	        	String zone = (String) context.get("zone");
	        	String surveyNumber = (String) context.get("surveyNumber");
	        	String eeName = (String) context.get("eeName");
	        	String oldWard = (String) context.get("oldWard");
	        	String mrName = (String) context.get("mrName");
	        	String areaCoordinator = (String) context.get("areaCoordinator");
	        	String logitude = (String) context.get("logitude");
	        	String lattitude = (String) context.get("lattitude");
	        	String conneStatus = (String) context.get("conneStatus");
	        	String refConsumerNo = (String) context.get("refConsumerNo");
	        	String resoneForReject = (String) context.get("resoneForReject");
	        	String actionByOfficerName = (String) context.get("actionByOfficerName");
	        	String remark = (String) context.get("remark");
	        	String leafNo = (String) context.get("leafNo");
	        	String drinkingWater = (String) context.get("drinkingWater");
	        	String mccZone = (String) context.get("mccZone");
	        	String division = (String) context.get("division");
	        	String customerNo = (String) context.get("customerNo");
	        	
	        	Calendar cal = Calendar.getInstance();
	        	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	        	String currentDate = sdf.format(cal.getTime());
	        	
	        	java.util.Date utilDate = new java.util.Date();
	        	cal.setTime(utilDate);
	        	cal.set(Calendar.MILLISECOND, 0);
	        	
	     try{
	        		
	    	 if (UtilValidate.isNotEmpty(sequenceId))
   				{
	    		 String connectionNo = null;
	    		 if(connectionStatus.equals("approve"))
	    		 {
	    		  connectionNo = "CON"+sequenceId+"M";
	    		 }
	    		 System.out.println("connectionNo======================================="+connectionNo);
	    		 
	        				Map actionConnectionDetails = null;
	        				actionConnectionDetails = UtilMisc.toMap("actionStatus",connectionStatus,"connectionNo",connectionNo,"dmaNo",dmaNo,"meterNo",meterNo,"refFileNo",refFileNo,"bookNo",bookNo
	        						,"pipeSize",pipeSize,"constituency",constituency,"zone",zone,"surveyNumber",surveyNumber,"eeName",eeName,"oldWard",oldWard,"mrName",mrName,"areaCoordinator",areaCoordinator
	        						,"logitude",logitude,"lattitude",lattitude,"connectionStatus",conneStatus,"refConsumerNo",refConsumerNo,"resoneForReject",resoneForReject,"actionOfficerName",actionByOfficerName
	        						,"actionDate",currentDate,"mccZone",mccZone,"division",division,"remark",remark,"connectionDate",connectionDate,"leafNo",leafNo,"drinkingWater",drinkingWater); 
			        	   
			        	   Integer valueToStore = delegator.storeByCondition("saveConnectionDetail", actionConnectionDetails 
				   					,EntityCondition.makeCondition("sequenceId",EntityOperator.EQUALS,sequenceId));
			        	   result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_APPROVE_SUCCESSFULLY, "", locale));    
			   	  		
			        	// get mob no and email
			     			EntityCondition condition2 = EntityCondition.makeCondition("customerId", EntityOperator.EQUALS,customerNo);
			     			List<GenericValue> consumerRegistrationList = delegator.findList("consumerRegistrationDetails", condition2, null, null, null, false);
			     				//List<GenericValue> consumerRegistrationList = delegator.findList("consumerRegistrationDetails",EntityCondition.makeCondition("customerId",EntityOperator.EQUALS,costomerNo));
			   				String mobileNo = consumerRegistrationList.get(0).getString("mobileNumber");
			   				String eMail = consumerRegistrationList.get(0).getString("eMail");
			     			//End

			   				String massage=null;
   							if(connectionStatus.equals("approve")){
   								massage = "your Connection Detail have been Approved.";
   							}
   							else
   							{
   								massage = "Sorry, your Connection Detail have been Rejected";
   							}
   							
			   			// code to call Service for SMS
				   			try {
				   					Map smsLogMap = FastMap.newInstance();
				   					Map LogMap = FastMap.newInstance();
				   					smsLogMap.putAll(UtilMisc.toMap("mobNumber", mobileNo, "textMessage", massage, "customerId", customerNo, "tabName", "Action Connection", "discription", "Action Confirmation"));
				   					smsLogMap = dispatcher.runSync("smsServiceCall",smsLogMap);
				   				}
				   			catch(GenericServiceException e)
				   				{
				   					e.printStackTrace();
				   				}
				   			//End
				   			
				   			// code to call Service for Mail
				   			try {
				   					Map emailLogMap = FastMap.newInstance();
				   					Map LogMap = FastMap.newInstance();
				   					emailLogMap.putAll(UtilMisc.toMap("emailId", eMail, "textMessage",massage, "customerId", customerNo, "tabName", "Action Connection", "discription", "Action Confirmation","subject", "Email From IMIS"));
				   					emailLogMap = dispatcher.runSync("emailServiceCall",emailLogMap);
				   				}
				   			catch(GenericServiceException e)
				   				{
				   				e.printStackTrace();
				   				}
				   			//End
				   			
   				}	   
	     	}
	     catch(GenericEntityException e)
   			{
   			System.out.println("Exception occured : " + e ); 
   			}
   		
   	
   		 return result;	
   	}
	    	/**
	         * Create By : shubham malviya
			 * Method Name :  updateConnectionDetails
			 * entity Name : saveConnectionDetail
			 * @Version 1.0
			 * @Description is use for update Connection Detail
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning Success Message
			 *  Transaction is handled by service engine
			 *    
			 *  
			 */	 
	    	
	    	public static Map<String, Object> updateConnectionDetails(DispatchContext dctx,Map<String, ? extends Object> context) {
	        	Map<String, Object> result = ServiceUtil.returnSuccess();
	        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	        	LocalDispatcher dispatcher = dctx.getDispatcher();
	        	GenericValue userLogin = (GenericValue) context.get("userLogin");
	        	Locale locale = (Locale) context.get("locale");
	        	
	        	String sequenceId = (String) context.get("sequenceId");
	        	String dmaNo = (String) context.get("dmaNo");
	        	String connectionDate = (String) context.get("connectionDate");
	        	String meterNo = (String) context.get("meterNo");
	        	String refFileNo = (String) context.get("refFileNo");
	        	String bookNo = (String) context.get("bookNo");
	        	String pipeSize = (String) context.get("pipeSize");
	        	String constituency = (String) context.get("constituency");
	        	String zone = (String) context.get("zone");
	        	String surveyNumber = (String) context.get("surveyNumber");
	        	String eeName = (String) context.get("eeName");
	        	String oldWard = (String) context.get("oldWard");
	        	String mrName = (String) context.get("mrName");
	        	String areaCoordinator = (String) context.get("areaCoordinator");
	        	String logitude = (String) context.get("logitude");
	        	String lattitude = (String) context.get("lattitude");
	        	String conneStatus = (String) context.get("conneStatus");
	        	String refConsumerNo = (String) context.get("refConsumerNo");
	        	String leafNo = (String) context.get("leafNo");
	        	String drinkingWater = (String) context.get("drinkingWater");
	        	String mccZone = (String) context.get("mccZone");
	        	String division = (String) context.get("division");
	        	
	        	Calendar cal = Calendar.getInstance();
	        	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	        	String currentDate = sdf.format(cal.getTime());
	        	
	        	java.util.Date utilDate = new java.util.Date();
	        	cal.setTime(utilDate);
	        	cal.set(Calendar.MILLISECOND, 0);
	        	
	        	try{
	      			if (UtilValidate.isNotEmpty(sequenceId))
	      			{
	      				Map editConnectionDetail = UtilMisc.toMap("dmaNo",dmaNo,"meterNo",meterNo,"refFileNo",refFileNo,"bookNo",bookNo
        						,"pipeSize",pipeSize,"constituency",constituency,"zone",zone,"surveyNumber",surveyNumber,"eeName",eeName,"oldWard",oldWard,"mrName",mrName,"areaCoordinator",areaCoordinator
        						,"logitude",logitude,"lattitude",lattitude,"connectionStatus",conneStatus,"refConsumerNo",refConsumerNo
        						,"mccZone",mccZone,"division",division,"connectionDate",connectionDate,"leafNo",leafNo,"drinkingWater",drinkingWater); 
			        	   
			        	   Integer valueToStore = delegator.storeByCondition("saveConnectionDetail", editConnectionDetail
				   					,EntityCondition.makeCondition("sequenceId",EntityOperator.EQUALS,sequenceId));
			        	   result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, "", locale));    
	        			
	      			}
	      		}
	        	
	     catch(GenericEntityException e)
   			{
   			System.out.println("Exception occured : " + e ); 
   			}
   		
   	
   		 return result;	
   	}
	// End
	   
  /**
			 * Method Name :  saveConnectionType
			 * @Version 1.0
			 * @Description creates Connection Type Master 
			 * @param DispatchContext dctx
			 * @param Map<String, ? extends Object> context
			 * @return Map - Map returning the office Id created
			 *  Transaction is handled by service engine
			 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
			 *  Code added by Anubha Saini on 18 Sep 2017
			 */		
	  		    
	 		   public static Map<String, Object> saveConnectionType(DispatchContext dctx,
						Map<String, ? extends Object> context) {
					// Defining result map to return to the service.
					Map<String, Object> result = ServiceUtil.returnSuccess();
					// Getting the delegator,userLogin and locale object using the context.
					GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
					GenericValue userLogin = (GenericValue) context.get("userLogin");
					Locale locale = (Locale) context.get("locale");
				/*	List<GenericValue> caseList = FastList.newInstance();*/
				    List<GenericValue> caseList = new LinkedList<GenericValue>();
				    
					String connectionType =(String) context.get("connectionType");
					String connectionTypeKan =(String) context.get("connectionTypeKan");
					String description =(String) context.get("description");	
					String remark =(String) context.get("remark");
					String createDated =(String) context.get("createdate");
		  		    String ConnectionTypeId = (String) delegator.getNextSeqId("connectionTypeMaster");
		  		    String status =(String) context.get("status");
					String activestatus =(String) context.get("activestatus");
		  		    
		  		    
		  		    java.sql.Date dateofcreatevar = getConvertedDate(createDated);
		  		    
					if (UtilValidate.isEmpty(ConnectionTypeId)) {
						ConnectionTypeId = "0";
					}
		  		    
		 		    //String connectionTypeUPPER = connectionType.toUpperCase();
			  	
			    	if (UtilValidate.isNotEmpty(connectionType)) {

					try {
					    List<EntityExpr> expList = new LinkedList<EntityExpr>();
	 				/*	List<EntityExpr> expList = FastList.newInstance();*/
						EntityCondition mainCondition = null;

						if (UtilValidate.isNotEmpty(connectionType)) {
							expList.add(EntityCondition.makeCondition("connectionType",EntityOperator.EQUALS, connectionType));
							mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
							  List<GenericValue> resultList = new LinkedList<GenericValue>();
							//List<GenericValue> resultList = FastList.newInstance();
							try {
								resultList = delegator.findList("connectionTypeMaster",
										mainCondition, UtilMisc.toSet("connectionType"), null,
										null, false);
								if (UtilValidate.isNotEmpty(resultList)) {
									return ServiceUtil
											.returnSuccess("Connection Type already exists.");
								}
							} catch (GenericEntityException e1) {
								e1.printStackTrace();
							}

							if (UtilValidate.isEmpty(resultList)) {
								Map ConnectionMasterDetails = UtilMisc.toMap("ConnectionTypeId",ConnectionTypeId,"connectionType",connectionType,
										"description",description,"connectionTypeKan",connectionTypeKan,"remark",remark,"createdate",dateofcreatevar,"status","A");
								
								GenericValue valueToStore = delegator.makeValue("connectionTypeMaster", ConnectionMasterDetails);
								valueToStore.create();

							result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, connectionType, locale));
							
							}
						}
					} catch (GenericEntityException e) {
						e.printStackTrace();
					}
				}
					result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, connectionType, locale));

				return result;
			}
	 		   
	 		   
	 	      
		        /**
				 * Method Name :  updateConnectionType
				 * @Version 1.0
				 * @Description Edit Connection Type  Master
				 * @param DispatchContext dctx
				 * @param Map<String, ? extends Object> context
				 * @return Map - Map returning Success Message
				 *  Transaction is handled by service engine
				 *  Code added by Anubha Saini on 18 Sep 2017
				 *  
				 */	  
	 		   
	 		  public static Map<String, Object> updateConnectionType(DispatchContext dctx,
	 					Map<String, ? extends Object> context) {
	 				Map<String, Object> result = ServiceUtil.returnSuccess();
	 				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
	 				LocalDispatcher dispatcher = dctx.getDispatcher();
	 				GenericValue userLogin = (GenericValue) context.get("userLogin");
	 				final Locale locale = (Locale) context.get("locale");
	 				String connectionType =(String) context.get("connectionType");
	 				String connectionTypeKan =(String) context.get("connectionTypeKan");
	 				String description =(String) context.get("description");	
					String remark =(String) context.get("remark");		
	 				
					String status =(String) context.get("status"); 
		            String activestatus =(String) context.get("activestatus"); 
	 				String ConnectionTypeId =(String) context.get("ConnectionTypeId");
	 				
	 				String createDated =(String) context.get("createdate");
	 				java.sql.Date dateofcreatevar = getConvertedDate(createDated);
	 				
	 			    System.out.println("~~~~~~~~~~~status~~~~~~-----------------------------------~~~~~~"+status);	
	 			    System.out.println("~~~~~~~~~~~ConnectionTypeId~~~~~~-----------------------------------~~~~~~"+ConnectionTypeId);	

	 			    System.out.println("~~~~~~~~~~~activestatus~~~~~~-----------------------------------~~~~~~"+activestatus);	
	 			    System.out.println("~~~~~~~~~~~connectionType~~~~~~-----------------------------------~~~~~~"+connectionType);	
	 			    
	 			   // String connectionTypeUPPER = connectionType.toUpperCase();
	 			   System.out.println("~~~~~~~~~~~connectionTypeUPPER~~~~~~-----------------------------------~~~~~~"+connectionType);	

	 			    Map connectionDetails = null;
	 				try{
	 				if (UtilValidate.isNotEmpty(ConnectionTypeId))
	 				{
	 	           if(status.equals("edit")){
	 	        	  connectionDetails = UtilMisc.toMap("ConnectionTypeId",ConnectionTypeId,"connectionType",connectionType,
								"description",description,"connectionTypeKan",connectionTypeKan,"remark",remark,"createdate",dateofcreatevar,"status","A");
						
	 	           }
	 	        
	 	           else if(status.equals("status")){
	 	        	  connectionDetails = UtilMisc.toMap("status",activestatus);	
	 				}
	 	           if(status.equals("delete")){
	 	               GenericValue connectionTypeMaster = EntityQuery.use(delegator).from("connectionTypeMaster").where("ConnectionTypeId", ConnectionTypeId).queryOne();

	 	        	  
	 	                connectionTypeMaster.remove();
	 	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, connectionType, locale));   

	 	           }else{
	 	        	   Integer valueToStore = delegator.storeByCondition("connectionTypeMaster", connectionDetails
	 	   					,EntityCondition.makeCondition("ConnectionTypeId",EntityOperator.EQUALS,ConnectionTypeId));
	 	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, connectionType, locale));   
	 	                 }
	 				
	 	             }	
	 				}catch(GeneralException e) {
	 				Debug.log("Exception occured : " + e );
	 				}			
	 				return result;		
	 			} 
	 		   
	 		   /**
				 * Method Name :  saveApplicationMaster
				 * @Version 1.0
				 * @Description creates Connection Type Master 
				 * @param DispatchContext dctx
				 * @param Map<String, ? extends Object> context
				 * @return Map - Map returning the office Id created
				 *  Transaction is handled by service engine
				 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
				 *  Code added by Anubha Saini on 18 Sep 2017
				 */		
		  		    
		 		   public static Map<String, Object> saveApplicationMaster(DispatchContext dctx,
							Map<String, ? extends Object> context) {
						// Defining result map to return to the service.
						Map<String, Object> result = ServiceUtil.returnSuccess();
						// Getting the delegator,userLogin and locale object using the context.
						GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
						GenericValue userLogin = (GenericValue) context.get("userLogin");
						Locale locale = (Locale) context.get("locale");
					/*	List<GenericValue> caseList = FastList.newInstance();*/
					    List<GenericValue> caseList = new LinkedList<GenericValue>();
					    
						String applicationType =(String) context.get("applicationType");
						String ApplicationTypeKan =(String) context.get("ApplicationTypeKan");
						String description =(String) context.get("description");	
						String remark =(String) context.get("remark");
						String createDated =(String) context.get("createdate");
			  		    String applicationTypeeId = (String) delegator.getNextSeqId("applicationMasterDetails");
			  		    String status =(String) context.get("status"); 
			            String activestatus =(String) context.get("activestatus"); 
			  		    
			  		    
			  		    java.sql.Date dateofcreatevar = getConvertedDate(createDated);
			  		    
						if (UtilValidate.isEmpty(applicationTypeeId)) {
							applicationTypeeId = "0";
						}
			  		    
				  	
				    	if (UtilValidate.isNotEmpty(applicationType)) {

						try {
						    List<EntityExpr> expList = new LinkedList<EntityExpr>();
		 				/*	List<EntityExpr> expList = FastList.newInstance();*/
							EntityCondition mainCondition = null;

							if (UtilValidate.isNotEmpty(applicationType)) {
								expList.add(EntityCondition.makeCondition("applicationType",EntityOperator.EQUALS, applicationType));
								mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
								  List<GenericValue> resultList = new LinkedList<GenericValue>();
								//List<GenericValue> resultList = FastList.newInstance();
								try {
									resultList = delegator.findList("applicationTypeMaster",
											mainCondition, UtilMisc.toSet("applicationType"), null,
											null, false);
									if (UtilValidate.isNotEmpty(resultList)) {
										return ServiceUtil
												.returnSuccess("Application Type already exists.");
									}
								} catch (GenericEntityException e1) {
									e1.printStackTrace();
								}

								if (UtilValidate.isEmpty(resultList)) {
									Map applicationMasterDetails = UtilMisc.toMap("applicationTypeeId",applicationTypeeId,"applicationType",applicationType,
											"description",description,"ApplicationTypeKan",ApplicationTypeKan,"remark",remark,"createdate",dateofcreatevar,"status","A");
									
									GenericValue valueToStore = delegator.makeValue("applicationTypeMaster", applicationMasterDetails);
									valueToStore.create();

								result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, applicationType, locale));

								}
							}
						} catch (GenericEntityException e) {
							e.printStackTrace();
						}
					}

					return result;
				}

		 		  /**
					 * Method Name :  updateApplicationMaster
					 * @Version 1.0
					 * @Description Edit Connection Type  Master
					 * @param DispatchContext dctx
					 * @param Map<String, ? extends Object> context
					 * @return Map - Map returning Success Message
					 *  Transaction is handled by service engine
					 *  Code added by Anubha Saini on 20 Sep 2017
					 *  
					 */	  

		 		  public static Map<String, Object> updateApplicationMaster(DispatchContext dctx,
		 					Map<String, ? extends Object> context) {
		 				Map<String, Object> result = ServiceUtil.returnSuccess();
		 				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		 				LocalDispatcher dispatcher = dctx.getDispatcher();
		 				GenericValue userLogin = (GenericValue) context.get("userLogin");
		 				final Locale locale = (Locale) context.get("locale");
		 		
		 				String applicationTypeeId =(String) context.get("applicationTypeeId");
		 				String applicationType =(String) context.get("applicationType");
		 				String ApplicationTypeKan =(String) context.get("ApplicationTypeKan");	
		 				String description =(String) context.get("description");	
						String remark =(String) context.get("remark");		
		 				
						String status =(String) context.get("status"); 
			            String activestatus =(String) context.get("activestatus"); 
		 		
		 				
		 				String createdate =(String) context.get("createdate");
		 				java.sql.Date dateofcreatevar = getConvertedDate(createdate);
		 				
		 			    System.out.println("~~~~~~~~~~~status~~~~~~-----------------------------------~~~~~~"+status);	
		 			    System.out.println("~~~~~~~~~~~applicationTypeeId~~~~~~-----------------------------------~~~~~~"+applicationTypeeId);	

		 			    System.out.println("~~~~~~~~~~~activestatus~~~~~~-----------------------------------~~~~~~"+activestatus);	
		 			    System.out.println("~~~~~~~~~~~applicationType~~~~~~-----------------------------------~~~~~~"+applicationType);	
		 			    
		 			
		 			    Map applicationDetail = null;
		 				try{
		 				if (UtilValidate.isNotEmpty(applicationTypeeId))
		 				{
		 	           if(status.equals("edit")){
		 	        	  applicationDetail = UtilMisc.toMap("applicationTypeeId",applicationTypeeId,"applicationType",applicationType,
									"description",description,"ApplicationTypeKan",ApplicationTypeKan,"remark",remark,"createdate",dateofcreatevar,"status","A");
							
		 	           }
		 	        
		 	           else if(status.equals("status")){
		 	        	  applicationDetail = UtilMisc.toMap("status",activestatus);	
		 				}
		 	           if(status.equals("delete")){
		 	               GenericValue applicationTypeMaster = EntityQuery.use(delegator).from("applicationTypeMaster").where("applicationTypeeId", applicationTypeeId).queryOne();

		 	        	  
		 	              applicationTypeMaster.remove();
		 	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, applicationType, locale));   

		 	           }else{
		 	        	   Integer valueToStore = delegator.storeByCondition("applicationTypeMaster", applicationDetail
		 	   					,EntityCondition.makeCondition("applicationTypeeId",EntityOperator.EQUALS,applicationTypeeId));
		 	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, applicationType, locale));   
		 	                 }
		 				
		 	             }	
		 				}catch(GeneralException e) {
		 				Debug.log("Exception occured : " + e );
		 				}			
		 				return result;		
		 			} 
		 		  
		 		 public static Map<String, Object> saveBuildingMaster(DispatchContext dctx,
							Map<String, ? extends Object> context) {
						// Defining result map to return to the service.
						Map<String, Object> result = ServiceUtil.returnSuccess();
						// Getting the delegator,userLogin and locale object using the context.
						GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
						GenericValue userLogin = (GenericValue) context.get("userLogin");
						Locale locale = (Locale) context.get("locale");
					/*	List<GenericValue> caseList = FastList.newInstance();*/
					    List<GenericValue> caseList = new LinkedList<GenericValue>();
					    
						String buildingType =(String) context.get("buildingType");
						String buildingTypeKan =(String) context.get("buildingTypeKan");
						String description =(String) context.get("description");	
						String remark =(String) context.get("remark");
						String createdate =(String) context.get("createdate");
			  		    String buildingId = (String) delegator.getNextSeqId("buildingTypeMaster");
			  		    String status =(String) context.get("status");
						String activestatus =(String) context.get("activestatus");
			  		    
					    System.out.println("~~~~~~~~~~~buildingId~~~~~~-----------------------------------~~~~~~"+buildingId);	
					    System.out.println("~~~~~~~~~~~buildingType~~~~~~-----------------------------------~~~~~~"+buildingType);	
					    System.out.println("~~~~~~~~~~~status~~~~~~-----------------------------------~~~~~~"+status);	
			  		    
			  		    java.sql.Date dateofcreatevar = getConvertedDate(createdate);
			  		    
						if (UtilValidate.isEmpty(buildingId)) {
							buildingId = "0";
						}
			  		    
			 		    //String connectionTypeUPPER = connectionType.toUpperCase();
				  	
				    	if (UtilValidate.isNotEmpty(buildingType)) {

						try {
						    List<EntityExpr> expList = new LinkedList<EntityExpr>();
		 				/*	List<EntityExpr> expList = FastList.newInstance();*/
							EntityCondition mainCondition = null;

							if (UtilValidate.isNotEmpty(buildingType)) {
								expList.add(EntityCondition.makeCondition("buildingType",EntityOperator.EQUALS, buildingType));
								mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
								  List<GenericValue> resultList = new LinkedList<GenericValue>();
								//List<GenericValue> resultList = FastList.newInstance();
								try {
									resultList = delegator.findList("buildingTypeMaster",
											mainCondition, UtilMisc.toSet("buildingType"), null,
											null, false);
									if (UtilValidate.isNotEmpty(resultList)) {
										return ServiceUtil
												.returnSuccess("Connection Type already exists.");
									}
								} catch (GenericEntityException e1) {
									e1.printStackTrace();
								}

								if (UtilValidate.isEmpty(resultList)) {
									Map buildingTypeMaster = UtilMisc.toMap("buildingId",buildingId,"buildingType",buildingType,
											"description",description,"buildingTypeKan",buildingTypeKan,"remark",remark,"createdate",dateofcreatevar,"status","A");
									
									GenericValue valueToStore = delegator.makeValue("buildingTypeMaster", buildingTypeMaster);
									valueToStore.create();

								result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, buildingType, locale));
								
								}
							}
						} catch (GenericEntityException e) {
							e.printStackTrace();
						}
					}

					return result;
				}
		 		   
		 		  
		 		  public static Map<String, Object> updateBuildingMaster(DispatchContext dctx,
		 					Map<String, ? extends Object> context) {
		 				Map<String, Object> result = ServiceUtil.returnSuccess();
		 				GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		 				LocalDispatcher dispatcher = dctx.getDispatcher();
		 				GenericValue userLogin = (GenericValue) context.get("userLogin");
		 				final Locale locale = (Locale) context.get("locale");
		 				String buildingType =(String) context.get("buildingType");
		 				String buildingTypeKan =(String) context.get("buildingTypeKan");
		 				String description =(String) context.get("description");	
						String remark =(String) context.get("remark");		
		 				
						String status =(String) context.get("status"); 
			            String activestatus =(String) context.get("activestatus"); 
		 				String buildingId =(String) context.get("buildingId");
		 				
		 				String createDated =(String) context.get("createdate");
		 				java.sql.Date dateofcreatevar = getConvertedDate(createDated);
		 				System.out.println("~~~~~~~~~~~status~~~~~~-----------------------------------~~~~~~"+status);	
		 			 
		 			    System.out.println("~~~~~~~~~~~buildingId~~~~~~-----------------------------------~~~~~~"+buildingId);	

		 			    System.out.println("~~~~~~~~~~~activestatus~~~~~~-----------------------------------~~~~~~"+activestatus);	
		 			    System.out.println("~~~~~~~~~~~buildingType~~~~~~-----------------------------------~~~~~~"+buildingType);	
		 			    

		 			    Map BuildingDetails = null;
		 				try{
		 				if (UtilValidate.isNotEmpty(buildingId))
		 				{
		 	           if(status.equals("edit")){
		 	        	  BuildingDetails = UtilMisc.toMap("buildingId",buildingId,"buildingType",buildingType,
									"description",description,"buildingTypeKan",buildingTypeKan,"remark",remark,"createdate",dateofcreatevar,"status","A");
							
		 	           }
		 	        
		 	           else if(status.equals("status")){
		 	        	  BuildingDetails = UtilMisc.toMap("status",activestatus);	
		 				}
		 	           if(status.equals("delete")){
		 	               GenericValue buildingTypeMaster = EntityQuery.use(delegator).from("buildingTypeMaster").where("buildingId", buildingId).queryOne();

		 	        	  
		 	              buildingTypeMaster.remove();
		 	      			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_REMOVED_SUCCESSFULLY, buildingType, locale));   

		 	           }else{
		 	        	   Integer valueToStore = delegator.storeByCondition("buildingTypeMaster", BuildingDetails
		 	   					,EntityCondition.makeCondition("buildingId",EntityOperator.EQUALS,buildingId));
		 	   			result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, buildingType, locale));   
		 	                 }
		 				
		 	             }	
		 				}catch(GeneralException e) {
		 				Debug.log("Exception occured : " + e );
		 				}			
		 				return result;		
		 			}  	
		 		  
		 		  
		 		 /**
					 * Method Name :  saveVendorDetail
					 * @Version 1.0
					 * @Description Save Vendor Bill Reader
					 * @param DispatchContext dctx
					 * @param Map<String, ? extends Object> context
					 * @return Map - Map returning Success Message
					 *  Transaction is handled by service engine
					 *  
					 *  
					 */	 
		 		  
		 		  public static Map<String, Object> saveVendorDetail(DispatchContext dctx,
			                Map<String, ? extends Object> context) {
			            Map<String, Object> result = ServiceUtil.returnSuccess();
			            GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			            LocalDispatcher dispatcher = dctx.getDispatcher();
			            List<GenericValue> caseList = new LinkedList<GenericValue>();
			            GenericValue userLogin = (GenericValue) context.get("userLogin");
			            final Locale locale = (Locale) context.get("locale");
			            String registrationType =(String) context.get("registrationType");
		 	            String registarionId =(String) context.get("registarionId");
			            String tenderName =(String) context.get("tenderName");
			            String dateofTender =(String) context.get("dateofTender");
			            //java.sql.Date dateofcreatevar = getConvertedDate(dateofTender);
			            String name =(String) context.get("name");
						String officeName =(String) context.get("officeName");			

			            String presentAddress =(String) context.get("presentAddress");
			            String phoneNumber =(String) context.get("phoneNumber");
			            String email =(String) context.get("email");
			            String state =(String) context.get("state");
			            String pinCode =(String) context.get("pinCode");
			            String dateRegistration =(String) context.get("dateRegistration");
			            
			            //java.sql.Date dateofcreate = getConvertedDate(dateRegistration);
			            java.sql.Date projectDate = null; 
			           if (UtilValidate.isNotEmpty(dateofTender)){
			            projectDate = java.sql.Date.valueOf(dateofTender);
			           }
			            java.sql.Date registationDate = null; 
			           if (UtilValidate.isNotEmpty(dateRegistration)){
			            registationDate = java.sql.Date.valueOf(dateRegistration);
			           }
			            
			            String regId =(String) delegator.getNextSeqId("vendorMaster");
			              
			        
			                
			          
			             if (UtilValidate.isNotEmpty(tenderName)) {

			             try {
			                 List<EntityExpr> expList = new LinkedList<EntityExpr>();
			                 //List<EntityExpr> expList = FastList.newInstance();
			                 EntityCondition mainCondition = null;

			                 if (UtilValidate.isNotEmpty(tenderName)){
			                     expList.add(EntityCondition.makeCondition("tenderName",EntityOperator.EQUALS, tenderName));
			                     mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
			                       List<GenericValue> resultList = new LinkedList<GenericValue>();
			                     //List<GenericValue> resultList = FastList.newInstance();
			                     try {
			                         resultList = delegator.findList("vendorMaster",
			                                 mainCondition, UtilMisc.toSet("tenderName"), null,
			                                 null, false);
			                         if (UtilValidate.isNotEmpty(resultList)) {
			                             return ServiceUtil
			                                     .returnSuccess("Tender Name already exists.");
			                         }
			                     } catch (GenericEntityException e1) {
			                         e1.printStackTrace();
			                     }

			                     if (UtilValidate.isEmpty(resultList)) {
			                    	 
			                    	 
			                         Map vendorTypDetails = UtilMisc.toMap("regId",regId,"registrationType",registrationType,
			         						"registarionId",registarionId,"tenderName",tenderName,"dateofTender",projectDate,"name",name,"officeName",officeName,
			         						"presentAddress",presentAddress,"phoneNumber",phoneNumber,"email",email,
			         						"state",state,"pinCode",pinCode,"dateRegistration",registationDate);
			                
			                           GenericValue valueToStore = delegator.makeValue("vendorMaster", vendorTypDetails);
			                          valueToStore.create();
			                          }

			                     result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, tenderName, locale));
			                     //return ServiceUtil.returnSuccess(OfficeSetupConstants.SAVE_SUCCESSFULLY);
			      
			                     }
			                 }
			              catch (GenericEntityException e) {
			                 e.printStackTrace();
			             }
			         }

			         return result;
			     }
			        
			      

		 		 /**
					 * Method Name :  editVendors
					 * @Version 1.0
					 * @Description Edit Vendor Bill Reader
					 * @param DispatchContext dctx
					 * @param Map<String, ? extends Object> context
					 * @return Map - Map returning Success Message
					 *  Transaction is handled by service engine
					 *  
					 *  
					 */
		        public static Map<String, Object> editVendors(DispatchContext dctx,
							Map<String, ? extends Object> context) {
						Map<String, Object> result = ServiceUtil.returnSuccess();
						GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
						LocalDispatcher dispatcher = dctx.getDispatcher();
						GenericValue userLogin = (GenericValue) context.get("userLogin");
						final Locale locale = (Locale) context.get("locale");
		 	            String registarionId =(String) context.get("registarionId");
						   String registrationType =(String) context.get("registrationType");
						//String createdate =(String) context.get("createdate");	
			            //java.sql.Date createdate1 = getConvertedDate(createdate);
						    String tenderName =(String) context.get("tenderName");
				            String dateofTender =(String) context.get("dateofTender");
				            //java.sql.Date dateofcreatevar = getConvertedDate(dateofTender);
				            String name =(String) context.get("name");
				            String permanentAddress =(String) context.get("permanentAddress");
				            String presentAddress =(String) context.get("presentAddress");
				            String phoneNumber =(String) context.get("phoneNumber");
				            String email =(String) context.get("email");
				            String state =(String) context.get("state");
				            String pinCode =(String) context.get("pinCode");
				            String areaWork =(String) context.get("areaWork");
				            String dateRegistration =(String) context.get("dateRegistration");
				            //java.sql.Date dateofcreate = getConvertedDate(dateRegistration);
				            String officeName =(String) context.get("officeName");
				            String regId =(String) context.get("regId");
				    
				                			 			           
	 			          java.sql.Date projectDate = null; 
	 			           if (UtilValidate.isNotEmpty(dateofTender)){
	 			            projectDate = java.sql.Date.valueOf(dateofTender);
	 			           }
	 			            java.sql.Date registationDate = null; 
	 			           if (UtilValidate.isNotEmpty(dateRegistration)){
	 			            registationDate = java.sql.Date.valueOf(dateRegistration);
	 			           }
						   String status =(String) context.get("status");
						   String activestatus =(String) context.get("activestatus");
						Map vendorTypDetails = null;
						try{
						if (UtilValidate.isNotEmpty(registarionId))
						{
			        	   vendorTypDetails = UtilMisc.toMap("registrationType",registrationType,
		    						"registarionId",registarionId,"tenderName",tenderName,"dateofTender",projectDate,"name",name,
		    						"permanentAddress",permanentAddress,"presentAddress",presentAddress,"phoneNumber",phoneNumber,"email",email,
		    						"state",state,"pinCode",pinCode,"areaWork",areaWork,"dateRegistration",registationDate,"officeName",officeName);
			           
			        	   Integer valueToStore = delegator.storeByCondition("vendorMaster", vendorTypDetails
			   					,EntityCondition.makeCondition("regId",EntityOperator.EQUALS,regId));
				           Integer UpdateMessage = valueToStore;
				           result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_UPDATE_SUCCESSFULLY, tenderName, locale));   
			               
			           }
			             	
						}catch(GeneralException e) {
							// It is the mother of all the ofbiz exceptions
							// All the specific exceptions are handled above
							// It would be executed in the worst case scenario
							Debug.log("Exception occured : " + e );
							
						}			
						
						
						return result;		
					}
			        

		        /**
				 * Method Name :  approveVendorDetails
				 * @Version 1.0
				 * @Description : Approve Vendor Bill Reader
				 * @param DispatchContext dctx
				 * @param Map<String, ? extends Object> context
				 * @return Map - Map returning Success Message
				 *  Transaction is handled by service engine
				 *  
				 *  
				 */
			     
			        public static Map<String, Object> approveVendorDetails(DispatchContext dctx,
							Map<String, ? extends Object> context) {
						Map<String, Object> result = ServiceUtil.returnSuccess();
						GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
						LocalDispatcher dispatcher = dctx.getDispatcher();
						GenericValue userLogin = (GenericValue) context.get("userLogin");
						final Locale locale = (Locale) context.get("locale");
						String registrationType =(String) context.get("registrationType");
						//String createdate =(String) context.get("createdate");	
			            //java.sql.Date createdate1 = getConvertedDate(createdate);
					    String regId =(String) context.get("regId");
				        String remark =(String) context.get("remark");
				       String mobileNumber =(String) context.get("mobileNumber");
				        String eMail =(String) context.get("eMail");
						Map vendorTypDetails = null;
						try{
						if (UtilValidate.isNotEmpty(regId))
						{
							 vendorTypDetails = UtilMisc.toMap("activeStatus","ACTIVE","status","A","remark",remark);
			        	   Integer valueToStore = delegator.storeByCondition("vendorMaster", vendorTypDetails
			   					,EntityCondition.makeCondition("regId",EntityOperator.EQUALS,regId));
				           Integer UpdateMessage = valueToStore;
			        	  result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_APPROVE_SUCCESSFULLY,"", locale));  
			             }	
						
						
						String customerId =null;
			        	String encryPass =null;
			        	String name =null;
			        	String status =null;
			        	String type =null;
			        	String logType =null;

			        	boolean useEncryption = "true".equals(EntityUtilProperties.getPropertyValue("security", "password.encrypt", delegator));
			        	
						
						List<EntityCondition> andCondition = new LinkedList<EntityCondition>();
						EntityCondition vendCondition = null;
						   List<GenericValue> resultList = FastList.newInstance();

						andCondition.add(EntityCondition.makeCondition("regId",
								EntityOperator.EQUALS, regId));
						
						vendCondition = EntityCondition.makeCondition(andCondition,
								EntityOperator.AND);
						 resultList = delegator.findList("vendorMaster", vendCondition, null, null, null,false);	
						//System.out.println("~~~~~~~~~~resultList.size()~~~~~~~~~~~~~~~"+resultList.size());
						// Getting the previous details of office
						for(int i=0; i<resultList.size(); i++)
						{
							 name = resultList.get(i).getString("tenderName");
							 type = resultList.get(i).getString("registrationType");
							status = resultList.get(i).getString("status");
						
						}
						//name = "VENDOR";
						
						String splitName = name.substring(0, Math.min(name.length(), 3));
						String nameLogin = splitName.toUpperCase();
			 	           if(type.equals("VENDOR")){
			 	        	  logType="VAN";
			 	           }else if(type.equals("BILLREADER")){
			 	        		  logType="BIL";
			 	        	  }
			 	        	  else if(type.equals("PLUMBER")){
			 	        		  logType="PLU";
			 	           }
		        		String PS = new String(); 
		        				    	customerId =  nameLogin+logType+regId;
		    							//System.out.println("~~~~~~~~~~customerId~~~~~~~"+customerId);
		    							//System.out.println("~~~~~~~~~~userLogin~~~~~~~~~~~~~~"+userLogin);

		        				    	// code for Password Ganerate
		       							int length= 8;
		       							String alphabet = new String("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"); //9
		       							int n = alphabet.length(); // n=62 length of alphabet
		       							Random r = new Random();
		       							for (int i=0; i<length; i++)
		       							{
		       								PS = PS + alphabet.charAt(r.nextInt(n));// call nextInt() Method
		       							}
		    							//System.out.println("~~~~~~~~~~PS~~~~~~~"+PS);

		       							encryPass = useEncryption ? HashCrypt.cryptUTF8(getHashType(), null, PS) : PS;      							
		    							//System.out.println("~~~~~~~~~~encryPass~~~~~~~"+encryPass);
						
		    							String massage=null;
		       							
		       							if(status.equals("A")){
		       								massage ="Welcome. We thank you for your registration at IMIS. \n \n Your user id is "+customerId+" \n Your Password is "+PS+" \n \n Thankyou";
		       							}
		       							else
		       							{
		       								massage = "Sorry, your registration Detail have been Rejected";
		       							}
		       							try {		
		       							if(status.equals("A"))
		       							{
		    			   			//Code for save Costomer Party Id in Party Table
		    			   				GenericValue PartyDetailSave = null;
		    			   	  			String partyId = delegator.getNextSeqId("Party",1);
		    			   	  			Map<String, ? extends Object> PartyDetail = UtilMisc.toMap("partyId",partyId,"partyTypeId","PERSON","statusId","PARTY_ENABLED");
		    			   	  			PartyDetailSave = delegator.makeValue("Party", PartyDetail);
		    			   	  			PartyDetailSave.create();
		    			   	  		//End
		    			   	  			
		    			   	  		// Code for save login and password in UserLogin Table
		       							Map<String, ? extends Object> UserLoginDetails = UtilMisc.toMap("userLoginId",customerId,"currentPassword",encryPass,"enabled","Y","partyId",partyId);
		    			   				GenericValue UserLoginSave = delegator.makeValue("UserLogin", UserLoginDetails);
		    			   				UserLoginSave.create();
		       						//End
		    			   				
		    			   	  		//Code for save Costomer Party Id in Person Table
		    			   				GenericValue personDetailSave = null;
		    			   	  			Map<String, ? extends Object> personDetail = UtilMisc.toMap("partyId",partyId,"firstName",name,"lastName","");
		    			   	  			personDetailSave = delegator.makeValue("Person", personDetail);
		    			   	  			personDetailSave.create();
		    			   	  		//End
		       							}
		       							
		       							}catch(GeneralException e)
		       			   				{
		       			   					e.printStackTrace();
		       			   				}
						// code to call Service for SMS
   			   			try {
   			   					Map smsLogMap = FastMap.newInstance();
   			   					Map LogMap = FastMap.newInstance();
   			   					smsLogMap.putAll(UtilMisc.toMap("mobNumber", mobileNumber, "textMessage", massage, "customerId", regId, "tabName", "VendorRegistration", "discription", "Approved Confirmation"));
   			   					smsLogMap = dispatcher.runSync("smsServiceCall",smsLogMap);
   			   				}
   			   			catch(GenericServiceException e)
   			   				{
   			   					e.printStackTrace();
   			   				}
   			   			//End
   			   			
   			   			// code to call Service for Mail
   			   			try {
   			   					Map emailLogMap = FastMap.newInstance();
   			   					Map LogMap = FastMap.newInstance();
   			   					emailLogMap.putAll(UtilMisc.toMap("emailId", eMail, "textMessage",massage, "customerId", regId, "tabName", "Vendor Registration", "discription", "Approved Confirmation","subject", "Email From IMIS"));
   			   					emailLogMap = dispatcher.runSync("emailServiceCall",emailLogMap);
   			   				}
   			   			catch(GenericServiceException e)
   			   				{
   			   				e.printStackTrace();
   			   				}
   			   			//End
						}catch(GeneralException e) {
							// It is the mother of all the ofbiz exceptions
							// All the specific exceptions are handled above
							// It would be executed in the worst case scenario
							Debug.log("Exception occured : " + e );
							//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
						}
						return result;		
                 }




			        /**
					 * Method Name :  activeVendorDetails
					 * @Version 1.0
					 * @Description : Active/Deactive Vendor Bill Reader
					 * @param DispatchContext dctx
					 * @param Map<String, ? extends Object> context
					 * @return Map - Map returning Success Message
					 *  Transaction is handled by service engine
					 *  
					 *  
					 */
			        
			        
			       public static Map<String, Object> activeVendorDetails(DispatchContext dctx,
							Map<String, ? extends Object> context) {
						Map<String, Object> result = ServiceUtil.returnSuccess();
						GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
						LocalDispatcher dispatcher = dctx.getDispatcher();
						GenericValue userLogin = (GenericValue) context.get("userLogin");
						final Locale locale = (Locale) context.get("locale");
						String registrationType =(String) context.get("registrationType");
						//String createdate =(String) context.get("createdate");	
			            //java.sql.Date createdate1 = getConvertedDate(createdate);
						

					    String regId =(String) context.get("registarionId");
				        String activestatus =(String) context.get("activestatus");
				     
						Map vendorTypDetails = null;
						try{
						if (UtilValidate.isNotEmpty(regId))
						{
							 vendorTypDetails = UtilMisc.toMap("activeStatus",activestatus);
			        	   Integer valueToStore = delegator.storeByCondition("vendorMaster", vendorTypDetails
			   					,EntityCondition.makeCondition("regId",EntityOperator.EQUALS,regId));
				           Integer UpdateMessage = valueToStore;
							result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.RECORD_APPROVE_SUCCESSFULLY,"", locale));   
			               
		   							
			             }	
						}catch(GeneralException e) {
							// It is the mother of all the ofbiz exceptions
							// All the specific exceptions are handled above
							// It would be executed in the worst case scenario
							Debug.log("Exception occured : " + e );
							//return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
						}			
						
						return result;		
                }     
			        
		 		 /**
			         * Create By : shubham malviya
					 * Method Name :  disEnbCustomer
					 * entity Name : saveConnectionDetail
					 * entity Name : consumerRegistrationDetails
					 * entity Name : saveConnectionDetail
					 * @Version 1.0
					 * @Description is use for Disable Customer
					 * @param DispatchContext dctx
					 * @param Map<String, ? extends Object> context
					 * @return Map - Map returning Success Message
					 *  Transaction is handled by service engine
					 *    
					 *  
					 */	 
			    	
			    	public static Map<String, Object> disEnbCustomer(DispatchContext dctx,Map<String, ? extends Object> context) {
			        	Map<String, Object> result = ServiceUtil.returnSuccess();
			        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			        	LocalDispatcher dispatcher = dctx.getDispatcher();
			        	GenericValue userLogin = (GenericValue) context.get("userLogin");
			        	Locale locale = (Locale) context.get("locale");
			        	
			        	String customerId = (String) context.get("customerId");
			        	String activestatus = (String) context.get("activestatus");
			        	String status = (String) context.get("status");
			        	String tempStatus= null;
			        	String disabledBy=null;
			        			
			        	if(activestatus.equals("N"))
			        	{
			        		tempStatus = "Disable";
			        		disabledBy= "admin";
			        	}
			        	else
			        	{
			        		tempStatus = "Approve";
			        	}
			        	try{
			      			if (UtilValidate.isNotEmpty(customerId))
			      			{
			      				// Added for to change enabled column if Disable then 'Y' and Active then 'N'
			      				Map disEnbCustomer = UtilMisc.toMap("enabled",activestatus,"disabledDateTime",null,"disabledBy",disabledBy); 
					        	   Integer valueToStore1 = delegator.storeByCondition("UserLogin", disEnbCustomer
						   					,EntityCondition.makeCondition("userLoginId",EntityOperator.EQUALS,customerId));
					        	   
					        	   // added for to change actionstatus Approve to Disable or Disable to Approve
					        	   Map disEnbSaveCustomer = UtilMisc.toMap("actionStatus",tempStatus); 
					        	   Integer valueToStore2 = delegator.storeByCondition("consumerRegistrationDetails", disEnbSaveCustomer
						   					,EntityCondition.makeCondition("customerId",EntityOperator.EQUALS,customerId));
					        	   
					        	   // added for remove permission of myportal login
					        	   /*GenericValue buildingTypeMaster = EntityQuery.use(delegator).from("buildingTypeMaster").where("buildingId", buildingId).queryOne();
					 	              buildingTypeMaster.remove();*/
					 	              
					        	   result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.SAVE_SUCCESSFULLY, status, locale));    
			        			
			      			}
			      		}
			        	
			     catch(GenericEntityException e)
		   			{
		   			System.out.println("Exception occured : " + e ); 
		   			}
		   		
		   	
		   		 return result;	
		   	}
			// End 
		 		  
			    	// code added by shubham malviya For XLS Sheet Styling
			    	//Setting Up Header
				   	 public static void headerWithBorder(XSSFCellStyle stylee)
				   		{
				   		 //Set Border for Cell 
				   		 // Set Thikness of Border by Changing BORDER_THIN, BORDER_THICK, BORDER_MEDIUM, BORDER_HAIR ETC
				   		 
				   		 stylee.setBorderRight(XSSFCellStyle.BORDER_THIN);
				   		 stylee.setBorderLeft(XSSFCellStyle.BORDER_THIN);
				   		 stylee.setBorderTop(XSSFCellStyle.BORDER_THIN);
				   		 stylee.setBorderBottom(XSSFCellStyle.BORDER_THIN);
				   		 // Set color to cell Background
				   		 XSSFColor myColor = new XSSFColor(Color.yellow);
				   		 stylee.setFillBackgroundColor(myColor);
				   		 stylee.setFillPattern(CellStyle.BORDER_HAIR);
				   		}
				   	 
				   	 // Setting up cell
				   	 public static void cellBorder(XSSFCellStyle stylee)
				   		{
				   		 stylee.setBorderRight(XSSFCellStyle.BORDER_HAIR);
				   		 stylee.setBorderLeft(XSSFCellStyle.BORDER_HAIR);
				   		 stylee.setBorderTop(XSSFCellStyle.BORDER_HAIR);
				   		 stylee.setBorderBottom(XSSFCellStyle.BORDER_HAIR);
				   		
				   		}
				   	 // code Added by shubham malviya For Genarate Xls File
				 	public static Map<String, Object> customerDetailXLS(DispatchContext dctx,Map<String, ? extends Object> context) {
			        	Map<String, Object> result = ServiceUtil.returnSuccess();
			        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			        	LocalDispatcher dispatcher = dctx.getDispatcher();
				 	      try{
				 	      XSSFWorkbook abc = new XSSFWorkbook();
				 	      XSSFWorkbook workbook = new XSSFWorkbook(); 
				 	      XSSFSheet spreadsheet = workbook.createSheet("Customer Detail");
				 	      XSSFRow rowA=spreadsheet.createRow(0);
				 	      XSSFRow row=spreadsheet.createRow(1);
				 	      XSSFCell cell;
				 	      XSSFCellStyle style1 = workbook.createCellStyle();
				 	      headerWithBorder(style1);
				 	     
				 	      //Set alignment of cell Horizontal
				 	      style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				 	      //Set alignment of cell Vertical
				 	      style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_TOP);
				 	      //spreadsheet.addMergedRegion(new CellRangeAddress(0,0,5,1));

				 	      // style1.setFillBackgroundColor(HSSFColor.LEMON_CHIFFON.index );;
				 	      // Column Heading Name
				 	      cell=rowA.createCell(3);
				 	      cell.setCellValue("Customer Detail");
				 	      cell=row.createCell(0);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("S No.");
				 	      cell=row.createCell(1);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Customer Id");
				 	      cell=row.createCell(2);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("First Name");
				 	      cell=row.createCell(3);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Contact");
				 	      cell=row.createCell(4);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Address");
				 	      cell=row.createCell(5);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Email");
				 	      cell=row.createCell(6);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Action Date");
				 	    
				 	      // code for Show Data Searching wise
				 	      List<EntityCondition> andExprs = FastList.newInstance();
				 	      EntityCondition mainCond = null;
				 	      String paramList = "";
				 	      List<GenericValue> xlsList = null;
				 	    
				 	      String customerId = (String) context.get("xlsCustomerId");
							if (customerId != null && customerId.length() > 0) {
								paramList = paramList + "&customerId=" + customerId;
								andExprs.add(EntityCondition.makeCondition("customerId",
										EntityOperator.EQUALS,customerId));
							}
							String nameOfCustomer = (String) context.get("xlsNameOfCustomer"); 
							if (UtilValidate.isNotEmpty(nameOfCustomer)) {
								paramList = paramList + "&nameOfCustomer=" + nameOfCustomer;
								andExprs.add(EntityCondition.makeCondition("firstName",
										EntityOperator.LIKE, "%" + nameOfCustomer + "%"));
							}
							andExprs.add(EntityCondition.makeCondition("actionStatus",
									EntityOperator.EQUALS,"Approve"));
							
							if (andExprs.size() > 0)
								mainCond = EntityCondition.makeCondition(andExprs, EntityOperator.AND);
							xlsList = delegator.findList("consumerRegistrationDetails", mainCond, null,
										null, null, false);
							//end
							
					 	      for(int i=0; i<xlsList.size(); i++)
					 	      {
					 	         row=spreadsheet.createRow(i+2);
					 	         cell=row.createCell(0);
					 	         cell.setCellValue(i+1);
					 	         cell=row.createCell(1);
					 	         cell.setCellValue(xlsList.get(i).getString("customerId"));
					 	         cell=row.createCell(2);
					 	         cell.setCellValue(xlsList.get(i).getString("firstName"));
					 	         cell=row.createCell(3);
					 	         cell.setCellValue(xlsList.get(i).getString("mobileNumber"));
					 	         cell=row.createCell(4);
					 	        cell.setCellValue(xlsList.get(i).getString("address"));
					 	         cell=row.createCell(5);
					 	         cell.setCellValue(xlsList.get(i).getString("eMail"));
					 	         cell=row.createCell(6);
					 	         cell.setCellValue(xlsList.get(i).getString("actionDate"));
					 	         
					 	      }

					 	      FileOutputStream out = new FileOutputStream(new File("framework/images/webapp/images/Export/Excel/CustomerPortal/customerDetail.xls"));
					 	      workbook.write(out);
					 	      out.close();
					 	      System.out.println("exceldatabase.xlsx written successfully");
				 	      
				 	      
				 	      	}
				 	      	catch (Exception e) {
				 			// TODO: handle exception
				 	    	  e.printStackTrace();
				 	      	}
				 	     return result;		
				 	      }
				 	
				 	public static Map<String, Object> customerRegistrationXls(DispatchContext dctx,Map<String, ? extends Object> context) {
			        	Map<String, Object> result = ServiceUtil.returnSuccess();
			        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			        	LocalDispatcher dispatcher = dctx.getDispatcher();
				 	      try{
				 	      XSSFWorkbook abc = new XSSFWorkbook();
				 	      XSSFWorkbook workbook = new XSSFWorkbook(); 
				 	      XSSFSheet spreadsheet = workbook.createSheet("Registration Detail");
				 	      XSSFRow rowA=spreadsheet.createRow(0);
				 	      XSSFRow row=spreadsheet.createRow(1);
				 	      XSSFCell cell;
				 	      XSSFCellStyle style1 = workbook.createCellStyle();
				 	      headerWithBorder(style1);
				 	     
				 	      //Set alignment of cell Horizontal
				 	      style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				 	      //Set alignment of cell Vertical
				 	      style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_TOP);
				 	      //spreadsheet.addMergedRegion(new CellRangeAddress(0,0,5,1));

				 	      // style1.setFillBackgroundColor(HSSFColor.LEMON_CHIFFON.index );;
				 	  // Column Heading Name
				 	      cell=rowA.createCell(3);
				 	      cell.setCellValue("Registration Detail");
				 	      cell=row.createCell(0);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("S No.");
				 	      cell=row.createCell(1);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Registration No.");
				 	      cell=row.createCell(2);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("First Name");
				 	      cell=row.createCell(3);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Last Name");
				 	      cell=row.createCell(4);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Gender");
				 	      cell=row.createCell(5);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Customer Address");
				 	      cell=row.createCell(6);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Mobile No.");
				 	      cell=row.createCell(7);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Registration Date");
				 	      
				 	      // code for Show Data Searching wise
				 	      List<EntityCondition> andExprs = FastList.newInstance();
				 	      EntityCondition mainCond = null;
				 	      String paramList = "";
				 	      List<GenericValue> xlsList = null;
				 	    
				 	      String registrationNo = (String) context.get("xlsRegistrationNo");
							if (registrationNo != null && registrationNo.length() > 0) {
								paramList = paramList + "&registrationNo=" + registrationNo;
								andExprs.add(EntityCondition.makeCondition("registrationId",
										EntityOperator.EQUALS,registrationNo));
							}
							String nameOfCustomer = (String) context.get("xlsNameOfCustomer"); 
							if (UtilValidate.isNotEmpty(nameOfCustomer)) {
								paramList = paramList + "&nameOfCustomer=" + nameOfCustomer;
								andExprs.add(EntityCondition.makeCondition("firstName",
										EntityOperator.LIKE, "%" + nameOfCustomer + "%"));
							}
							andExprs.add(EntityCondition.makeCondition("actionStatus",
									EntityOperator.EQUALS,null));
							
							if (andExprs.size() > 0)
								mainCond = EntityCondition.makeCondition(andExprs, EntityOperator.AND);
							xlsList = delegator.findList("consumerRegistrationDetails", mainCond, null,
										null, null, false);
							//end
							
					 	      for(int i=0; i<xlsList.size(); i++)
					 	      {
					 	         row=spreadsheet.createRow(i+2);
					 	         cell=row.createCell(0);
					 	         cell.setCellValue(i+1);
					 	         cell=row.createCell(1);
					 	         cell.setCellValue(xlsList.get(i).getString("registrationId"));
					 	         cell=row.createCell(2);
					 	         cell.setCellValue(xlsList.get(i).getString("firstName"));
					 	         cell=row.createCell(3);
					 	         cell.setCellValue(xlsList.get(i).getString("lastName"));
					 	         cell=row.createCell(4);
					 	         cell.setCellValue(xlsList.get(i).getString("genderId"));
					 	         cell=row.createCell(5);
					 	         cell.setCellValue(xlsList.get(i).getString("address"));
					 	         cell=row.createCell(6);
					 	         cell.setCellValue(xlsList.get(i).getString("mobileNumber"));
					 	         cell=row.createCell(7);
					 	         cell.setCellValue(xlsList.get(i).getString("submittedDate"));
					 	      }

					 	      FileOutputStream out = new FileOutputStream(new File("framework/images/webapp/images/Export/Excel/CustomerPortal/customerRegistration.xls"));
					 	      workbook.write(out);
					 	      out.close();
					 	      System.out.println("exceldatabase.xlsx written successfully");
				 	      
				 	      
				 	      	}
				 	      	catch (Exception e) {
				 			// TODO: handle exception
				 	    	  e.printStackTrace();
				 	      	}
				 	     return result;		
				 	      }
				 	
				 	public static Map<String, Object> connectionRegistrationXls(DispatchContext dctx,Map<String, ? extends Object> context) {
			        	Map<String, Object> result = ServiceUtil.returnSuccess();
			        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			        	LocalDispatcher dispatcher = dctx.getDispatcher();
				 	      try{
				 	      XSSFWorkbook abc = new XSSFWorkbook();
				 	      XSSFWorkbook workbook = new XSSFWorkbook(); 
				 	      XSSFSheet spreadsheet = workbook.createSheet("Connection Detail");
				 	      XSSFRow rowA=spreadsheet.createRow(0);
				 	      XSSFRow row=spreadsheet.createRow(1);
				 	      XSSFCell cell;
				 	      XSSFCellStyle style1 = workbook.createCellStyle();
				 	      headerWithBorder(style1);
				 	     
				 	      //Set alignment of cell Horizontal
				 	      style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				 	      //Set alignment of cell Vertical
				 	      style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_TOP);
				 	      //spreadsheet.addMergedRegion(new CellRangeAddress(0,0,5,1));
				 	  // Column Heading Name
				 	      cell=rowA.createCell(3);
				 	      cell.setCellValue("Connection Detail");
				 	      cell=row.createCell(0);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("S No.");
				 	      cell=row.createCell(1);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Customer Id");
				 	      cell=row.createCell(2);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Connection Category");
				 	      cell=row.createCell(3);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Application Type");
				 	      cell=row.createCell(4);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Type Of Building");
				 	      cell=row.createCell(5);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Application Date");
				 	      
				 	      // code for Show Data Searching wise
				 	      List<EntityCondition> andExprs = FastList.newInstance();
				 	      EntityCondition mainCond = null;
				 	      String paramList = "";
				 	      List<GenericValue> xlsList = null;
				 	    
				 	      String xlsApplicationType = (String) context.get("xlsApplicationType");
							if (xlsApplicationType != null && xlsApplicationType.length() > 0) {
								paramList = paramList + "&xlsApplicationType=" + xlsApplicationType;
								andExprs.add(EntityCondition.makeCondition("applicationType",
										EntityOperator.EQUALS,xlsApplicationType));
							}
							String xlsCustomerId = (String) context.get("xlsCustomerId"); 
							if (xlsCustomerId != null && xlsCustomerId.length() > 0) {
								paramList = paramList + "&xlsCustomerId=" + xlsCustomerId;
								andExprs.add(EntityCondition.makeCondition("customerId",
										EntityOperator.EQUALS,xlsCustomerId));
							}
							andExprs.add(EntityCondition.makeCondition("actionStatus",
									EntityOperator.EQUALS,null));
							
							if (andExprs.size() > 0)
								mainCond = EntityCondition.makeCondition(andExprs, EntityOperator.AND);
							xlsList = delegator.findList("saveConnectionDetail", mainCond, null,
										null, null, false);
							//end
							
					 	      for(int i=0; i<xlsList.size(); i++)
					 	      {
					 	         row=spreadsheet.createRow(i+2);
					 	         cell=row.createCell(0);
					 	         cell.setCellValue(i+1);
					 	         cell=row.createCell(1);
					 	         cell.setCellValue(xlsList.get(i).getString("customerId"));
					 	         cell=row.createCell(2);
					 	         cell.setCellValue(xlsList.get(i).getString("connectionCategory"));
					 	         cell=row.createCell(3);
					 	         cell.setCellValue(xlsList.get(i).getString("applicationType"));
					 	         cell=row.createCell(4);
					 	         cell.setCellValue(xlsList.get(i).getString("typeOfBuilding"));
					 	         cell=row.createCell(5);
					 	         cell.setCellValue(xlsList.get(i).getString("applicationDate"));
					 	      }

					 	      FileOutputStream out = new FileOutputStream(new File("framework/images/webapp/images/Export/Excel/CustomerPortal/connectionRegistration.xls"));
					 	      workbook.write(out);
					 	      out.close();
					 	      System.out.println("exceldatabase.xlsx written successfully");
				 	      
				 	      
				 	      	}
				 	      	catch (Exception e) {
				 			// TODO: handle exception
				 	    	  e.printStackTrace();
				 	      	}
				 	     return result;		
				 	      }
				 	
				 	public static Map<String, Object> connectionDetailXls(DispatchContext dctx,Map<String, ? extends Object> context) {
			        	Map<String, Object> result = ServiceUtil.returnSuccess();
			        	GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
			        	LocalDispatcher dispatcher = dctx.getDispatcher();
				 	      try{
				 	      XSSFWorkbook abc = new XSSFWorkbook();
				 	      XSSFWorkbook workbook = new XSSFWorkbook(); 
				 	      XSSFSheet spreadsheet = workbook.createSheet("Connection Detail");
				 	      XSSFRow rowA=spreadsheet.createRow(0);
				 	      XSSFRow row=spreadsheet.createRow(1);
				 	      XSSFCell cell;
				 	      XSSFCellStyle style1 = workbook.createCellStyle();
				 	      headerWithBorder(style1);
				 	     
				 	      //Set alignment of cell Horizontal
				 	      style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				 	      //Set alignment of cell Vertical
				 	      style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_TOP);
				 	      //spreadsheet.addMergedRegion(new CellRangeAddress(0,0,5,1));
				 	      			// Column Heading Name
				 	      cell=rowA.createCell(3);
				 	      cell.setCellValue("Connection Detail");
				 	      cell=row.createCell(0);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("S No.");
				 	      cell=row.createCell(1);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Connection No");
				 	      cell=row.createCell(2);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Customer Id");
				 	      cell=row.createCell(3);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Connection Category");
				 	      cell=row.createCell(4);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Application Type");
				 	      cell=row.createCell(5);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Type Of Building");
				 	      cell=row.createCell(6);
				 	      cell.setCellStyle(style1);
				 	      cell.setCellValue("Application Date");
				 	      
				 	      // code for Show Data Searching wise
				 	      List<EntityCondition> andExprs = FastList.newInstance();
				 	      EntityCondition mainCond = null;
				 	      String paramList = "";
				 	      List<GenericValue> xlsList = null;
				 	    
				 	      String xlsConnectionNo = (String) context.get("xlsConnectionNo");
							if (xlsConnectionNo != null && xlsConnectionNo.length() > 0) {
								paramList = paramList + "&xlsConnectionNo=" + xlsConnectionNo;
								andExprs.add(EntityCondition.makeCondition("connectionNo",
										EntityOperator.EQUALS,xlsConnectionNo));
							}
							String xlsCustomerId = (String) context.get("xlsCustomerId"); 
							if (xlsCustomerId != null && xlsCustomerId.length() > 0) {
								paramList = paramList + "&xlsCustomerId=" + xlsCustomerId;
								andExprs.add(EntityCondition.makeCondition("customerId",
										EntityOperator.EQUALS,xlsCustomerId));
							}
							String xlsApplicationType = (String) context.get("xlsApplicationType");
							if (xlsApplicationType != null && xlsApplicationType.length() > 0) {
								paramList = paramList + "&xlsApplicationType=" + xlsApplicationType;
								andExprs.add(EntityCondition.makeCondition("applicationType",
										EntityOperator.EQUALS,xlsApplicationType));
							}
							
							andExprs.add(EntityCondition.makeCondition("actionStatus",
									EntityOperator.EQUALS,"approve"));
							
							if (andExprs.size() > 0)
								mainCond = EntityCondition.makeCondition(andExprs, EntityOperator.AND);
							xlsList = delegator.findList("saveConnectionDetail", mainCond, null,
										null, null, false);
							//end
							
					 	      for(int i=0; i<xlsList.size(); i++)
					 	      {
					 	         row=spreadsheet.createRow(i+2);
					 	         cell=row.createCell(0);
					 	         cell.setCellValue(i+1);
					 	         cell=row.createCell(1);
					 	         cell.setCellValue(xlsList.get(i).getString("connectionNo"));
					 	         cell=row.createCell(2);
					 	         cell.setCellValue(xlsList.get(i).getString("customerId"));
					 	         cell=row.createCell(3);
					 	         cell.setCellValue(xlsList.get(i).getString("connectionCategory"));
					 	         cell=row.createCell(4);
					 	         cell.setCellValue(xlsList.get(i).getString("applicationType"));
					 	        cell=row.createCell(5);
					 	         cell.setCellValue(xlsList.get(i).getString("typeOfBuilding"));
					 	         cell=row.createCell(6);
					 	         cell.setCellValue(xlsList.get(i).getString("applicationDate"));
					 	      }

					 	      FileOutputStream out = new FileOutputStream(new File("framework/images/webapp/images/Export/Excel/CustomerPortal/connectionDetail.xls"));
					 	      workbook.write(out);
					 	      out.close();
					 	      System.out.println("exceldatabase.xlsx written successfully");
				 	      
				 	      
				 	      	}
				 	      	catch (Exception e) {
				 			// TODO: handle exception
				 	    	  e.printStackTrace();
				 	      	}
				 	     return result;		
				 	      }
				 	// End
}