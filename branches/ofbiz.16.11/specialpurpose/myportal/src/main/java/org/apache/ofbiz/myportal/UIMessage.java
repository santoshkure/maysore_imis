package org.apache.ofbiz.myportal;

import java.util.Locale;
import java.util.Map;

import org.apache.ofbiz.base.util.UtilProperties;
import org.apache.ofbiz.service.ServiceUtil;

public class UIMessage {
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

}
