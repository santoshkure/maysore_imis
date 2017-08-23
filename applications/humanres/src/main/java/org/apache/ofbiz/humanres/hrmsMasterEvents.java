package org.apache.ofbiz.humanres;


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
							Map officeZoneDetails = UtilMisc.toMap("zoneId",zoneId,"zoneName",zoneNameUPPER,"zoneTypeId",zoneName,
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
		public static Map<String, Object> updateZoneDet(DispatchContext dctx,
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
				
				
          /* if(status.equals("edit")){
        	   officeZoneDetails = UtilMisc.toMap("zoneId",zoneId,"zoneName",zoneName,"cityName",cityName,"officeName",officeName,"status","A","remark",remark,
        			   "createdate",dateofcreatevari,"zoneTypeId",zoneNameUPPER);*/
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
 						Map officeWardDetails = UtilMisc.toMap("wardId",wardId,"zoneId",zoneName,"wardName",wardNameUPPER,"cityId",cityUpper,
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
		public static Map<String, Object> updateWardDet(DispatchContext dctx,
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

        	  /* officeWardDetails = UtilMisc.toMap("wardId",wardId,"wardName",wardName,"cityName",cityName,"zoneId",zoneName,"status","A","wardRemark",wardRemark);*/
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
	            String wardName =(String) context.get("wardName");   
	            String cityName =(String) context.get("cityName");       
	            String remark =(String) context.get("remark");  
	  		  
	            long sysdate=System.currentTimeMillis(); 	            
	            java.sql.Date date=new java.sql.Date(sysdate); 	          

	          
	            try{
	            //if (UtilValidate.isNotEmpty(blockId)){
	            String blockId = (String) delegator.getNextSeqId("blockMaster");

	            Map blockMasterDetail = UtilMisc.toMap("blockName",blockName,
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
	               blockMasterDetail = UtilMisc.toMap("blockName",blockName,"wardId",
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
	            String blockName =(String) context.get("blockName");   
	            String cityName =(String) context.get("cityName");       
	            String remark =(String) context.get("remark");

	            long sysdate=System.currentTimeMillis(); 	            
	            java.sql.Date createdate1=new java.sql.Date(sysdate);
	          
	       
	            try{
	            //if (UtilValidate.isNotEmpty(blockId)){
	            String streetId = (String) delegator.getNextSeqId("streetMaster");

	            Map streetMasterDetail = UtilMisc.toMap("streetName",streetName,
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
	               streetMasterDetail = UtilMisc.toMap("streetName",streetName,"blockId",
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
	        	//String createdate =(String) context.get("createdate");	
	            //java.sql.Date createdate1 = getConvertedDate(createdate);
               
	        	String remark =(String) context.get("remark");	
	        	long sysdate=System.currentTimeMillis();                 
                java.sql.Date createdate1=new java.sql.Date(sysdate); 
	        	
	        	
	        	

	        	try{
	            String casteId = (String) delegator.getNextSeqId("casteMaster");
	        	
	        	Map casteTypDetails = UtilMisc.toMap("casteId",casteId,
	        			"castename",castename,"createdate",createdate1,"status","A","remark",remark);
	        	
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
	        			   castename,"createdate",createdate1,"status","A","remark",remark);
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
				//String createdate =(String) context.get("createdate");
				//java.sql.Date createdate1 = getConvertedDate(createdate);
				String remark =(String) context.get("remark");	
				String communityId =(String) context.get("communityId");
				
				long sysdate=System.currentTimeMillis();                 
                java.sql.Date date=new java.sql.Date(sysdate); 
  				

				try{
			    String CSC = (String) delegator.getNextSeqId("communityMaster");
				
				Map communityTypDetails = UtilMisc.toMap("communityId",CSC,
						"communityname",communityname,"createdate",date,"status","A","remark",remark);
				
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
	        			   communityname,"createdate",date,"status","A","remark",remark);
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
	                    "genderName",genderName,"dateOfCreateGender",dateOfCreateGender1,"status","A","genderRemark",genderRemark);
	           
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
	               genderMasterDetails = UtilMisc.toMap("genderId",genderId,"genderName",genderName,"dateOfCreateGender",dateOfCreateGender1,"genderRemark",genderRemark,"status","A");
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
						"maritalStatus",maritalStatus,"dateOfCreateMarital",dateOfCreateMarital1,"status","A","maritalRemark",maritalRemark);
				
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
	        	   maritalStatusMasterDetails = UtilMisc.toMap("maritalStatusId",maritalStatusId,"maritalStatus",maritalStatus,"dateOfCreateMarital",dateOfCreateMarital1,"maritalRemark",maritalRemark,"status","A");
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
			 
			

}