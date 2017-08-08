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


public class hrmsMasterEvents {
	
	
	 public static final String module = hrmsMasterEvents.class.getName();
	// public static final String resourceError = "HumanResErrorUiLabels";
	 public static final String resource = "OfficeSetupUiLabels";
	    
	    
	
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
					"ofcTypeName",officeTypeName,"parentTypeId",parentTypeId,"status","A","remarks",remark);
			
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
					officeTypeName,"parentTypeId",parentTypeId,"status","A","remarks",remark);
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
	    
	    
}