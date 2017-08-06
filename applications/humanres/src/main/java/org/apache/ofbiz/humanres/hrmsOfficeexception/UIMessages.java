package org.apache.ofbiz.humanres.hrmsOfficeexception;

import java.util.List;
import java.util.Locale;
import java.util.Map;

//import javolution.util.FastList;

import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.UtilProperties;
import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.entity.util.EntityListIterator;
import org.apache.ofbiz.service.ServiceUtil;

public class UIMessages {
	
	/*
	 *  Get the error in MAP object
	 * 
	 */

	public static Map<String, Object> getErrorMessage(String resource, String messageType, String message, Locale locale)
	{
		String errorMessage = getErrorString(resource, messageType, message, locale);
		return ServiceUtil.returnError(errorMessage);
	}
	
	
	public static Map<String, Object> getErrorMessage(String message)
	{
		return ServiceUtil.returnError(message);
	}
	public static Map<String, Object> getErrorMessageFailure(String resource, String messageType, String message, Locale locale)
	{
		String errorMessage = getErrorString(resource, messageType, message, locale);
		return ServiceUtil.returnFailure(errorMessage);
	}
	 /*
	  *  Common method to create a error message
	  *  Parameter :
	  *  			String : messageType Get it from UI Label
	  *  			String : message, error message
	  *  		    Locale : locale, selected language  
	  *  return type : String : decorated error message
	  */


	 private static String getErrorString(String resource, String messageType, String message, Locale locale ){
		 return UtilProperties.getMessage(resource,
				 messageType, locale) 	+ getMessageString(message);
		 
	 }

	 
	 /*
	  *  Decorate the error message
	  *  Parameters : String : error message to be displayed
	  *  return type : Decorated message with braces
	  */
	 
	 public static String getMessageString(String message )
	 {
		 // message is empty, Do not display braces[]
		 if (message == null || "".equals(message))
		 {
			 return "";
		 }
		 return " [ " + message + " ] ";
	 }

	 public static String getSuccessMessage(String resource, String messageType, String message, Locale locale)
	{
		String successMessage = getErrorString(resource, messageType, message, locale);
		return successMessage;
	}

	 public static Map<String, Object> getPayRollSuccessMessage (String resource, String messageType, String message, Locale locale)
		{
			String successMessage = getSuccessString(resource, messageType, message, locale);
			return ServiceUtil.returnSuccess(successMessage);
		}
		 private static String getSuccessString(String resource, String messageType, String message, Locale locale ){
			 return UtilProperties.getMessage(resource, messageType, locale) 	+ getMessageString(message);
			 
		 }

	public static String getErrorMessageInResult(String resource, String messageType, String message, Locale locale)
			{
				String errorMessage = getErrorString(resource, messageType, message, locale);
				return errorMessage;
			}
	
}