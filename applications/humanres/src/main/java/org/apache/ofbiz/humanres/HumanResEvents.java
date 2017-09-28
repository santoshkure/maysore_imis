/*******************************************************************************
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *******************************************************************************/
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
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.GeneralException;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilDateTime;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.base.util.UtilProperties;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.GenericDelegator;

import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.entity.condition.EntityExpr;
import org.apache.ofbiz.entity.condition.EntityFunction;
import org.apache.ofbiz.entity.condition.EntityCondition;
import org.apache.ofbiz.entity.condition.EntityOperator;
import org.apache.ofbiz.entity.util.EntityQuery;
import org.apache.ofbiz.entity.util.EntityFindOptions;
import org.apache.ofbiz.entity.util.EntityListIterator;
import org.apache.ofbiz.entity.util.EntityUtil;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.GenericServiceException;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.ServiceUtil;

import org.apache.ofbiz.humanres.hrmsOfficeexception.CheckEmployeeRoleException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.CheckUserIsEmployeeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.CoordinateFormatException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.DeleteOfficeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.DuplicateEstablishmentScheduleException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.DuplicateOfficeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.EmptyParentOfficeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.FacilityException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.UpdateParentOfficeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.LongitudeDegreeOutOfRangeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.SecondsOutOfRangeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.MinutesOutOfRangeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.ParentOfficeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.LatitudeDegreeOutOfRangeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.OfficeSetUpException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.CheckEmployeeRoleException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.UpdateOfficeTypeException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.UpdateOfficeNameException;
import org.apache.ofbiz.humanres.hrmsOfficeexception.UIMessages;
import org.apache.ofbiz.humanres.OfficeSetupConstants;
import org.apache.ofbiz.humanres.EmployeeConstants;




public class HumanResEvents {
    public static final String module = HumanResEvents.class.getName();
    public static final String resourceError = "HumanResErrorUiLabels";
    public static final String resource = "OfficeSetupUiLabels";

    // Please note : the structure of map in this function is according to the JSON data map of the jsTree
    public static String getChildHRCategoryTree(HttpServletRequest request, HttpServletResponse response){
        Delegator delegator = (Delegator) request.getAttribute("delegator");
        String partyId = request.getParameter("partyId");
        String onclickFunction = request.getParameter("onclickFunction");
        String additionParam = request.getParameter("additionParam");
        String hrefString = request.getParameter("hrefString");
        String hrefString2 = request.getParameter("hrefString2");

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("delegator", delegator);
        paramMap.put("partyId", partyId);
        paramMap.put("onclickFunction", onclickFunction);
        paramMap.put("additionParam", additionParam);
        paramMap.put("hrefString", hrefString);
        paramMap.put("hrefString2", hrefString2);

        List<Map<String,Object>> categoryList = new ArrayList<Map<String,Object>>();

        //check employee position
        try {
            categoryList.addAll(getCurrentEmployeeDetails(paramMap));
        } catch (GenericEntityException e) {
            e.printStackTrace();
            return "error";
        }

        try {
            GenericValue partyGroup = EntityQuery.use(delegator).from("PartyGroup").where("partyId", partyId).queryOne();
            if (partyGroup != null) {	
                paramMap.put("partyGroup", partyGroup);
                /* get the child departments of company or party */
                categoryList.addAll(getChildComps(paramMap));

                /* get employee which are working in company or party */
                categoryList.addAll(getEmployeeInComp(paramMap));
            }
        } catch (GenericEntityException e) {
            e.printStackTrace();
            return "error";
        }
        request.setAttribute("hrTree", categoryList);
        return "success";
    }

    private static List<Map<String, Object>> getCurrentEmployeeDetails(Map<String, Object> params) throws GenericEntityException{

        Delegator delegator = (Delegator) params.get("delegator");
        String partyId = (String) params.get("partyId");
        String onclickFunction = (String) params.get("onclickFunction");
        String additionParam = (String) params.get("additionParam");
        String hrefString = (String) params.get("hrefString");
        String hrefString2 = (String) params.get("hrefString2");

        List<Map<String, Object>> responseList = new ArrayList<>();

        long emplPosCount;
        try {
            emplPosCount = EntityQuery.use(delegator).from("EmplPosition")
                    .where("emplPositionId", partyId).queryCount();
            if (emplPosCount > 0) {
                String emplId = partyId;
                List<GenericValue> emlpfillCtxs = EntityQuery.use(delegator).from("EmplPositionFulfillment")
                        .where("emplPositionId", emplId)
                        .filterByDate().queryList();
                if (UtilValidate.isNotEmpty(emlpfillCtxs)) {
                    for (GenericValue emlpfillCtx : emlpfillCtxs ) {
                        String memberId = emlpfillCtx.getString("partyId");
                        GenericValue memCtx = EntityQuery.use(delegator).from("Person").where("partyId", partyId).queryOne();
                        String title = null;
                        if (UtilValidate.isNotEmpty(memCtx)) {
                            String firstname = memCtx.getString("firstName");
                            String lastname = memCtx.getString("lastName");
                            if (UtilValidate.isEmpty(lastname)) {
                                lastname = "";
                            }
                            if (UtilValidate.isEmpty(firstname)) {
                                firstname = "";
                            }
                            title = firstname +" "+ lastname;
                        }
                        GenericValue memGroupCtx = EntityQuery.use(delegator).from("PartyGroup").where("partyId", partyId).queryOne();
                        if (UtilValidate.isNotEmpty(memGroupCtx)) {
                            title = memGroupCtx.getString("groupName");
                        }

                        Map<String,Object> josonMap = new HashMap<String, Object>();
                        Map<String,Object> dataMap = new HashMap<String, Object>();
                        Map<String,Object> dataAttrMap = new HashMap<String, Object>();
                        Map<String,Object> attrMap = new HashMap<String, Object>();

                        dataAttrMap.put("onClick", onclickFunction + "('" + memberId + additionParam + "')");

                        String hrefStr = hrefString + memberId;
                        if (UtilValidate.isNotEmpty(hrefString2)) {
                            hrefStr = hrefStr + hrefString2;
                        }
                        dataAttrMap.put("href", hrefStr);

                        attrMap.put("rel", "P");
                        attrMap.put("id", memberId);

                        dataMap.put("title", title);
                        dataMap.put("attr", dataAttrMap);

                        josonMap.put("attr",attrMap);
                        josonMap.put("data", dataMap);

                        responseList.add(josonMap) ;
                    }
                }
            }
        } catch (GenericEntityException e) {
            e.printStackTrace();
            throw new GenericEntityException(e);
        }

        return responseList;
    }

    private static List<Map<String, Object>> getChildComps(Map<String, Object> params) throws GenericEntityException{

        Delegator delegator = (Delegator) params.get("delegator");
        String onclickFunction = (String) params.get("onclickFunction");
        String additionParam = (String) params.get("additionParam");
        String hrefString = (String) params.get("hrefString");
        String hrefString2 = (String) params.get("hrefString2");

        Map<String , Object> partyGroup = (Map<String, Object>) params.get("partyGroup");
        List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
        List<GenericValue> childOfComs = null;

        try {
            childOfComs = EntityQuery.use(delegator).from("PartyRelationship")
                    .where("partyIdFrom", partyGroup.get("partyId"), 
                            "partyRelationshipTypeId", "GROUP_ROLLUP")
                            .filterByDate().queryList();
            if (UtilValidate.isNotEmpty(childOfComs)) {

                for (GenericValue childOfCom : childOfComs ) {
                    Object catId = null;
                    String catNameField = null;
                    String title = null;

                    Map<String, Object> josonMap = new HashMap<String, Object>();
                    Map<String, Object> dataMap = new HashMap<String, Object>();
                    Map<String, Object> dataAttrMap = new HashMap<String, Object>();
                    Map<String, Object> attrMap = new HashMap<String, Object>();

                    catId = childOfCom.get("partyIdTo");

                    //Department or Sub department
                    GenericValue childContext = EntityQuery.use(delegator).from("PartyGroup").where("partyId", catId).queryOne();
                    if (UtilValidate.isNotEmpty(childContext)) {
                        catNameField = (String) childContext.get("groupName");
                        title = catNameField;
                        josonMap.put("title",title);

                    }
                    //Check child existing
                    List<GenericValue> childOfSubComs = EntityQuery.use(delegator).from("PartyRelationship")
                            .where("partyIdFrom", catId, 
                                    "partyRelationshipTypeId", "GROUP_ROLLUP")
                                    .filterByDate().queryList();
                    //check employee position
                    List<GenericValue> isPosition = EntityQuery.use(delegator).from("EmplPosition").where("partyId", catId).queryList();
                    if (UtilValidate.isNotEmpty(childOfSubComs) || UtilValidate.isNotEmpty(isPosition)) {
                        josonMap.put("state", "closed");
                    }

                    //Employee
                    GenericValue emContext = EntityQuery.use(delegator).from("Person").where("partyId", catId).queryOne();
                    if (UtilValidate.isNotEmpty(emContext)) {
                        String firstname = (String) emContext.get("firstName");
                        String lastname = (String) emContext.get("lastName");
                        if (UtilValidate.isEmpty(lastname)) {
                            lastname = "";
                        }
                        if (UtilValidate.isEmpty(firstname)) {
                            firstname = "";
                        }
                        title = firstname +" "+ lastname;
                    }

                    dataAttrMap.put("onClick", onclickFunction + "('" + catId + additionParam + "')");

                    String hrefStr = hrefString + catId;
                    if (UtilValidate.isNotEmpty(hrefString2)) {
                        hrefStr = hrefStr + hrefString2;
                    }
                    dataAttrMap.put("href", hrefStr);

                    dataMap.put("attr", dataAttrMap);
                    dataMap.put("title", title);

                    attrMap.put("rel", "Y");
                    attrMap.put("id", catId);


                    josonMap.put("attr",attrMap);
                    josonMap.put("data", dataMap);

                    resultList.add(josonMap);
                }  
            }
        } catch (GenericEntityException e) {
            e.printStackTrace();
            throw new GenericEntityException(e);
        }

        return resultList;

    }

    private static List<Map<String, Object>> getEmployeeInComp(Map<String, Object> params) throws GenericEntityException{
        List<GenericValue> isEmpls = null;
        Delegator delegator = (Delegator) params.get("delegator");
        String partyId = (String) params.get("partyId");

        List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();

        try {
            isEmpls = EntityQuery.use(delegator).from("EmplPosition")
                    .where(EntityCondition.makeCondition("partyId", EntityOperator.EQUALS, partyId),
                            EntityCondition.makeCondition("statusId", EntityOperator.NOT_EQUAL, "EMPL_POS_INACTIVE"))
                            .filterByDate("actualFromDate", "actualThruDate")
                            .queryList();

            if (UtilValidate.isNotEmpty(isEmpls)) {
                for (GenericValue childOfEmpl : isEmpls ) {
                    Map<String, Object> emplMap = new HashMap<String, Object>();
                    Map<String, Object> emplAttrMap = new HashMap<String, Object>();
                    Map<String, Object> empldataMap = new HashMap<String, Object>();
                    Map<String, Object> emplDataAttrMap = new HashMap<String, Object>();

                    String emplId = (String) childOfEmpl.get("emplPositionId");
                    String typeId = (String) childOfEmpl.get("emplPositionTypeId");

                    //check child
                    List<GenericValue> emlpfCtxs = EntityQuery.use(delegator).from("EmplPositionFulfillment")
                            .where("emplPositionId", emplId)
                            .filterByDate().queryList();
                    if (UtilValidate.isNotEmpty(emlpfCtxs)) {
                        emplMap.put("state", "closed");
                    }

                    GenericValue emplContext = EntityQuery.use(delegator).from("EmplPositionType").where("emplPositionTypeId", typeId).queryOne();
                    String title = null;
                    if (UtilValidate.isNotEmpty(emplContext)) {
                        title = (String) emplContext.get("description") + " " +"["+ emplId +"]";
                    }

                    String hrefStr = "emplPositionView?emplPositionId=" + emplId;
                    emplAttrMap.put("href", hrefStr);
                    emplAttrMap.put("onClick", "callEmplDocument" + "('" + emplId + "')");

                    empldataMap.put("title", title);
                    empldataMap.put("attr", emplAttrMap);

                    emplDataAttrMap.put("id", emplId);
                    emplDataAttrMap.put("rel", "N");

                    emplMap.put("data", empldataMap);
                    emplMap.put("attr",emplDataAttrMap);
                    emplMap.put("title",title);

                    resultList.add(emplMap);
                }
            }
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            throw new GenericEntityException(e);
        }

        return resultList;
    }
    
    
    /**
	 * Method Name :  createOffice
	 * @Version 1.0
	 * @Description creates office 
	 * @param DispatchContext dctx
	 * @param Map<String, ? extends Object> context
	 * @return Map - Map returning the office Id created
	 *  Transaction is handled by service engine
	 *  In this function 3 tables are inserted with new rows
	 *  If there is a failure in one table, nothing will be committed, taken care by service engine.  
	 * @Dependency : Making use of PartyMgr component Services. Any change in that will affect this component. 	
	 * @BusinessExceptions :
	 * 	DuplicateOfficeException - Checks for duplicate office name before creating
	 *  EmptyParentOfficeException - When No parent office is there 
	 *  ParentOfficeException - When user tries to create parent of IMIS office
	 *  
	 */		
	public static Map<String, Object> createOffice(DispatchContext dctx,
			Map<String, ? extends Object> context) {
		Map<String, Object> result = ServiceUtil.returnSuccess();
		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		LocalDispatcher dispatcher = dctx.getDispatcher();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		final Locale locale = (Locale) context.get("locale");
		String officeName =(String) context.get("officeName");
		String officeType =(String) context.get("officeType");
		String officeCode =(String) context.get("officeCode");
		String parentOffice =(String) context.get("parentOffice");
		String address =(String) context.get("address");
		String pinCode =(String) context.get("pinCode");
		String city =(String) context.get("city");
		String district =(String) context.get("district");
		String tribal =(String) context.get("tribal");
		String hoo =(String) context.get("hoo");
		String partyId=null;
		GenericValue partyRole = null;
		
		String longitudeValue = (String) context.get("longitude");
		String latitudeValue = (String) context.get("latitude");
		//String geoPointId = (String) context.get("geoPointId");

		String faxNo =(String) context.get("faxNo");
		String contactNumber =(String) context.get("contactNumber");

		
		
		/*
		 *  Check whether all mandatory fields are been passed by client
		 *  else throw an error;
		 */

		/*String [] mandatoryKeys = ParameterValidation.createMandateFields("officeName","officeType","address","pinCode","city");
		String anyMissingParamValues = ParameterValidation.validateIncomingParams(context, mandatoryKeys);
		if( anyMissingParamValues != null )
		{
			String errMsg =  anyMissingParamValues;
			return UIMessages.getErrorMessage(errMsg);
		}*/

		try
		{
			// Checking for duplicates : office name
			checkDuplicates(delegator, officeName);
			if(UtilValidate.isNotEmpty(hoo))
				checkHooRole(delegator, hoo);

			//Checking the value of tribal
			if ( tribal == null ) {
				tribal = "N";
			}
			else {
				tribal = "Y";
			}

			//Creating Office
			Map partyGroup = createGroup(dispatcher, officeType,  userLogin, officeName, officeCode);

			//Getting Office id of office
			partyId = (String)partyGroup.get("partyId");
			//System.out.println("======partyId===="+partyId);		

			// if party is not created return null
			// This should (partyId == null) never occur, Party ID cannot be null
			if (partyId == null) {
				return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);			
				}

			
			// Creating office role
			createRole(delegator, partyId);


			double longitude = 0.0f;
			double latitude = 0.0f;
			//Map geoPointID = null;
			//String geoPointId = "";
			

			if (UtilValidate.isNotEmpty(latitudeValue)) {
				checkCoordinateFormat(latitudeValue);
				try {
					latitude = convertDegreesToDecimal(latitudeValue, "latitude");
				} catch (LongitudeDegreeOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (LatitudeDegreeOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MinutesOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecondsOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (UtilValidate.isNotEmpty(longitudeValue)) {
				checkCoordinateFormat(longitudeValue);
				try {
					longitude = convertDegreesToDecimal(longitudeValue, "longitude");
				} catch (LongitudeDegreeOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (LatitudeDegreeOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MinutesOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecondsOutOfRangeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/*geoPointID = dispatcher.runSync("createGeoPoint", UtilMisc
					.<String, Object> toMap("longitude", longitude, "latitude",
							latitude,"dataSourceId", dataSourceId,"userLogin", userLogin));
			geoPointId = (String) geoPointID.get("geoPointId");*/


			//System.out.println("======================geoPointID===================================="+geoPointID);
			//System.out.println("======================longitude===================================="+longitude);
			//System.out.println("======================latitude===================================="+latitude);
			
			String geoPointId = (String) delegator.getNextSeqId("GeoPoint");
			
			Map officeDetails = UtilMisc.toMap("geoPointId",geoPointId,"information","OFFICE","longitude",longitude,"latitude",latitude);
			
			GenericValue valueToStore = delegator.makeValue("GeoPoint", officeDetails);
			valueToStore.create();
			
			// Creating office address
			createAddress(dispatcher, partyId, address, city, pinCode, district, userLogin,faxNo,contactNumber,geoPointId);
			//Creating office relation
			createRelationship(dispatcher, partyId, parentOffice, userLogin, officeType);

			
			
			//Creating HOO relation
			if(UtilValidate.isNotEmpty(hoo))
				createHeadOfOffice(dispatcher, parentOffice, hoo, userLogin, officeType, partyId);

		}
		//catch (DuplicateOfficeException e) {
		//	return UIMessages.getErrorMessage(resource,OfficeSetupConstants.DUPLICATE_OFFICE, officeName, locale);
		//}

		catch (CheckEmployeeRoleException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CHECK_EMPLOYEE_ROLE, hoo, locale);
		}catch (EmptyParentOfficeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE_WITHOUT_PARENT, officeType, locale);
		}catch (ParentOfficeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_PARENT_OF_WRDMP, officeType, locale);				
		}catch(GenericEntityException e) {
			// All the programatical exceptions related to entity are handled here
			Debug.log("Entity Exception occured : " + e );
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
		}catch(GenericServiceException e) {
			// All the programatical exceptions related to service are handled here
			Debug.log("Service Exception occured : " + e );
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
		}catch(GeneralException e) {
			// It is the mother of all the ofbiz exceptions
			// All the specific exceptions are handled above
			// It would be executed in the worst case scenario
			Debug.log("Exception occured : " + e );
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE, officeName, locale);
		}

		//result.put("officeId", partyId);
		result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.OFFICE_CREATED, officeName, locale));
		return result;
	}
	
	
	

	/**
	 * Checks for duplicate office name before office creation
	 * @param GenericDelegator delegator
	 * @param String officeName
	 * @return None
	 * @throws GenericEntityException
	 * @throws DuplicateOfficeException
	 */
	private static void checkDuplicates(GenericDelegator delegator, String officeName)
			throws DuplicateOfficeException, GenericEntityException
			{	
		EntityExpr condition = EntityCondition.makeCondition("officeSiteName", EntityOperator.EQUALS, officeName.trim());
		//List orderBy = FastList.newInstance();
		List orderBy = new LinkedList();
		List findExistingGroup = delegator.findList("PartyGroup", condition, null, orderBy, null, false);
		if ( findExistingGroup.size() > 0 ) {
			throw new DuplicateOfficeException("Duplicate entires found for office");
		}	    
			}
	
	/**
     * Checks for role of Employee
     * @param GenericDelegator delegator
     * @param String officeName
     * @return None
     * @throws GenericEntityException
     * @throws DuplicateOfficeException
     */

    private static void checkHooRole(GenericDelegator delegator, String employeeId)
            throws CheckEmployeeRoleException, GenericEntityException
            {   
        // Before creating the partyRelationShip, create the partyRoles if they don't exist
        //System.out.println("~~~~~~~~partyRole~~~~~~~~~~~~~~~~~"+employeeId);

        GenericValue partyRole = null;      
        EntityExpr condition = EntityCondition.makeCondition("partyId", EntityOperator.EQUALS, employeeId);
        partyRole = delegator.findOne("PartyRole", UtilMisc.toMap("partyId", employeeId, "roleTypeId", OfficeSetupConstants.EMPLOYEE_ROLE_TYPE), false);                   
        if ( UtilValidate.isEmpty(partyRole) ) {
            throw new CheckEmployeeRoleException("HOO is not a Employee");
        }

            }






/**
     * creates office by calling createPartyGroup service of partymgr component
     * @param LocalDispatcher dispatcher - for calling service
     * @param String officeType - type of office
     * @param String tribal - tribal nature
     * @param GenericValue userLogin - username and password for service authentication
     * @param String officeName - office name
     * @return Map of created office containing office id
     * @throws GenericServiceException
     */
    private static Map createGroup(LocalDispatcher dispatcher, String officeType,  GenericValue userLogin, String officeName, String officeCode)
            throws GenericServiceException
            {
        Map partyGroup = null;
        partyGroup = dispatcher.runSync("createPartyGroup", UtilMisc.toMap(
                "groupName", officeType,  "userLogin", userLogin, "officeSiteName", officeName, "partyCode",officeCode,"statusId" , "PARTY_ENABLED"));
        return partyGroup;
            }

    /**
     * creates office role as OFFICE
     * @param GenericDelegator delegator - for connecting to database
     * @param String partyId - office id
     * @return None
     * @throws GenericEntityException
     */
    private static void createRole(GenericDelegator delegator, String partyId)
            throws GenericEntityException
            {
        Map partyRoleValues = null;
        partyRoleValues = UtilMisc.toMap("partyId", partyId, "roleTypeId", OfficeSetupConstants.PARTY_ROLE_TYPE);
        GenericValue partyRole = delegator.makeValue("PartyRole", partyRoleValues);
        partyRole.create();
            }

    /**
     * creates office address by calling createPartyPostalAddress service of partymgr component
     * @param LocalDispatcher dispatcher - for calling service
     * @param String partyId - office id
     * @param String address - office address
     * @param String city
     * @param String pinCode
     * @param String district
     * @param GenericValue userLogin - username and password for service authentication
     * @return None
     * @throws GenericServiceException
     */
    private static void createAddress(LocalDispatcher dispatcher, String partyId, String address, String city, String pinCode, String district, GenericValue userLogin, String faxNo, String contactNumber,String geoPointId)
            throws GenericServiceException
            {
        Map partyPostalAddress = null;
        partyPostalAddress = dispatcher.runSync("createPartyPostalAddress", UtilMisc.toMap(
                "partyId", partyId, "contactMechPurposeTypeId", "GENERAL_LOCATION", "roleTypeId",
                OfficeSetupConstants.PARTY_ROLE_TYPE, "address1", address, "city", city,
                "postalCode", pinCode, "district", district, "userLogin", userLogin, "faxNo", faxNo, "contactNumber", contactNumber,"geoPointId",geoPointId));
            }


    /**
     * creates office parent by calling createPartyRelationship service of partymgr component
     * @param LocalDispatcher dispatcher - for calling service
     * @param String partyId - office id
     * @param String parentOffice - parent office id
     * @param String officeType - type of office
     * @param GenericValue userLogin - username and password for service authentication
     * @return None
     * @throws GenericServiceException
     * @throws EmptyParentOfficeException
     * @throws ParentOfficeException
     */
    private static void createRelationship(LocalDispatcher dispatcher, String partyId, String parentOffice, GenericValue userLogin, String officeType)
            throws GenericServiceException, EmptyParentOfficeException, ParentOfficeException
            {
        Map officeParent = null;
        if (parentOffice != null && !OfficeSetupConstants.OFFICE_TYPE.equals(officeType)) {
            officeParent = dispatcher.runSync("createPartyRelationship", UtilMisc.toMap("partyIdFrom",
                    parentOffice, "partyIdTo", partyId, "roleTypeIdFrom",
                    OfficeSetupConstants.PARTY_ROLE_TYPE, "roleTypeIdTo",
                    OfficeSetupConstants.PARTY_ROLE_TYPE, "partyRelationshipTypeId", "CHILD", "userLogin", userLogin));
        }
        else {
            if (parentOffice != null && OfficeSetupConstants.OFFICE_TYPE.equals(officeType)) {
                throw new ParentOfficeException("Can not create parent of IMIS office");
            }
            if (!OfficeSetupConstants.OFFICE_TYPE.equals(officeType))
                throw new EmptyParentOfficeException("Parent office can not be empty if office type is not IMIS");
        }
            }



/**
     * Creation of Head of office
     * @param GenericDelegator delegator
     * @param String officeName
     * @return None
     * @throws GenericEntityException
     */

    private static void createHeadOfOffice(LocalDispatcher dispatcher, String parentOffice, String headOfOffice, GenericValue userLogin, String officeType, String partyId)
            throws GenericServiceException, EmptyParentOfficeException, ParentOfficeException
            {
        // Creating HEAD OF THE DEPARTMENT for new office (using services)
        Map hodOfOffice = null;

        if (!(headOfOffice.isEmpty())) {

            Map officeParent = null;
            if (parentOffice != null && !OfficeSetupConstants.OFFICE_TYPE.equals(officeType)) {
                officeParent = dispatcher.runSync("createPartyRelationship", UtilMisc.toMap("partyIdFrom", partyId, "partyIdTo",
                        headOfOffice, "roleTypeIdFrom",    OfficeSetupConstants.PARTY_ROLE_TYPE, "roleTypeIdTo",
                        OfficeSetupConstants.EMPLOYEE_ROLE_TYPE,"partyRelationshipTypeId", "HOO", "userLogin", userLogin, "statusId", "PARTY_REL_ACTIVE"));
            }
            else {
                if (parentOffice != null && OfficeSetupConstants.OFFICE_TYPE.equals(officeType)) {
                    throw new ParentOfficeException("Can not create parent of IMIS office");
                }
                if (!OfficeSetupConstants.OFFICE_TYPE.equals(officeType))
                    throw new EmptyParentOfficeException("Parent office can not be empty if office type is not IMIS");
            }
        }
            }

    /**
	 * Method Name :  updateOfficeDetail
	 * @Version 1.0
	 * @Description Updates office details
	 * @param DispatchContext dctx
	 * @param Map<String, ? extends Object> context
	 * @return Map - Map returning the officeId of updated office
	 * @BusinessExceptions :
	 * 	DuplicateOfficeException - Checks for duplicate office name before creating
	 *  EmptyParentOfficeException - When No parent office is there 
	 *  UpdateParentOfficeException - When user tries to change parent office and employees are attached to it
	 *  UpdateOfficeNameException - When user tries to change office name and employees are attached to it
	 *  UpdateOfficeTypeException - When user tries to change office type and employees are attached to it
	 *  ParentOfficeException - When user tries to create parent of WRDMP office
	 *  
	 */	
	public static Map<String, Object> updateOfficeDetail(DispatchContext dctx,
			Map<String, ? extends Object> context) {

		Map<String, Object> result = ServiceUtil.returnSuccess();
		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		final Locale locale = (Locale) context.get("locale");
		LocalDispatcher dispatcher = dctx.getDispatcher();

		//List<String> orderBy = FastList.newInstance();
		List<String> orderBy = new LinkedList<String>();
		//Set<String> fields = FastSet.newInstance();
		Set<String> fields = new HashSet<String>();
		EntityCondition officeCondition = null;
		//List<EntityCondition> andCondition = FastList.newInstance();
		List<EntityCondition> andCondition = new LinkedList<EntityCondition>();
		List<GenericValue> employees=null;
		EntityFindOptions findOptions = new EntityFindOptions();
		Map previousDetail = null;

		String officeId = (String) context.get("officeId");
		String contactMechId = (String) context.get("contactMechId");
		String officeName =(String) context.get("officeName");
		String officeType =(String) context.get("officeType");
		String parentOffice =(String) context.get("parentOffice");
		String address =(String) context.get("address");
		String pinCode =(String) context.get("pinCode");
		String city =(String) context.get("city");
		String statusId =(String) context.get("statusId");
		String district =(String) context.get("district");
		String tribal =(String) context.get("tribal");
		String hoo =(String) context.get("hoo");
		String faxNo =(String) context.get("faxNo");
		String contactNumber =(String) context.get("contactNumber");
		String officeCode =(String) context.get("officeCode");
		result.put("officeId", officeId);
		
	
		String longitudeValue = (String) context.get("longitude");
		String latitudeValue = (String) context.get("latitude");
		String geoPointId = (String) context.get("geoPointId");
		
		// checking for mandatory fields
		//remove mandatory HOA for some time
		/*String [] mandatoryKeys = ParameterValidation.createMandateFields("officeId","officeName","officeType","address","pinCode","city", "statusId");
		String anyMissingParamValues = ParameterValidation.validateIncomingParams(context, mandatoryKeys);
		if( anyMissingParamValues != null )
		{
			String errMsg =  anyMissingParamValues;
			return UIMessages.getErrorMessage(errMsg);
		}*/

		try
		{
			// Checking if the office has any employees attached to it
			// In case if it is having employees, it can change only the office address otherwise it can
			// change all the details
			andCondition.add(EntityCondition.makeCondition("statusId",
					EntityOperator.EQUALS, OfficeSetupConstants.DESIGNATION_STATUS));
			andCondition.add(EntityCondition.makeCondition("officeId",
					EntityOperator.EQUALS, officeId));
			officeCondition = EntityCondition.makeCondition(andCondition,
					EntityOperator.AND);
			employees = delegator.findList("EmplPosition", officeCondition, fields, orderBy, findOptions,false);	
			//System.out.println("~~~~~~~~~~employees.size()~~~~~~~~~~~~~~~"+employees.size());
			// Getting the previous details of office
			previousDetail = dispatcher.runSync("getOfficeDetail", UtilMisc.toMap("officeId", officeId));

			String parentOfficeId = (String)previousDetail.get("parentOfficeId");
			String officePreviousName = (String)previousDetail.get("officeName");
			String officePreviousType = (String)previousDetail.get("officeType");
			String officeStatus = (String)previousDetail.get("statusId");

			if (employees.size() == 0)
			{
				//Checking for duplicate office name
				if (!officeName.trim().equals(((String)previousDetail.get("officeName")).trim()))
				{
					checkDuplicates(delegator, officeName);
				} 
				//Checking for tribal value
				if (tribal == null) {
					tribal = "N";
				}
				else {
					tribal = "Y";
				}
				//Updating the details of the office (using services)
				officeupdateGroup(dispatcher, officeId, officeType, tribal, userLogin, officeName, statusId, officeCode);
				//Updating office relationship
				if (parentOfficeId == null || !parentOfficeId.equals(parentOffice)) {
					createRelationship(dispatcher, officeId, parentOffice, userLogin, officeType);
				}
				//deleting previous relationship
				if ( parentOfficeId != null && !parentOfficeId.equals(parentOffice) 
						|| parentOfficeId != null && officeType.equals(OfficeSetupConstants.OFFICE_TYPE )) {
					deleteRelationship(dispatcher, parentOfficeId, (String)previousDetail.get("officeId"), 
							(java.sql.Timestamp)previousDetail.get("createdOn"), userLogin);
				}
			}
			// if office has employees
			else {
				// if user is trying to change parent office
				if (parentOfficeId == null && parentOffice != null || !parentOfficeId.trim().equals(parentOffice.trim())) {
					throw new UpdateParentOfficeException();
				}
				// if user is trying to change office name
				if (!officePreviousName.trim().equals(officeName.trim())) {
					throw new UpdateOfficeNameException();
				}
				// if user is trying to change office type
				if (!officePreviousType.trim().equals(officeType.trim())) {
					throw new UpdateOfficeTypeException();
				}
				// if user is trying to change Status
				if (!officeStatus.trim().equals(statusId.trim())) {
					return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CAN_NOT_DISABLE_OFFICE, officeName, locale);
				}
			}
			
			if(UtilValidate.isNotEmpty(geoPointId) )
			 {
				 Double longitude = 0.0;
					Double latitude = 0.0;
					
					
					if (longitude != null && latitude != null) {

						if (UtilValidate.isNotEmpty(longitudeValue)
								|| UtilValidate.isNotEmpty(latitudeValue)) {
							checkCoordinateFormat(longitudeValue);
							checkCoordinateFormat(latitudeValue);
							// convert the string value in to double (cordinate values
							// in decimal format)
							longitude = convertDegreesToDecimal(longitudeValue,
									"longitude");
							latitude = convertDegreesToDecimal(latitudeValue,
									"latitude");
						}
						// String geoPointID =
						// updateGeoPoint(delegator,geoPointId,longitude,latitude);
						// Calling createGeoPoint service in framework/services.xml for
						// updating longitude & lattitude
						/*Map geoPointIDN = null;
						if (UtilValidate.isNotEmpty(geoPointId)) {
							geoPointIDN = dispatcher.runSync("updateGeoPoint", UtilMisc
									.toMap("geoPointId", geoPointId, "longitude",
											longitude, "latitude", latitude,
											"dataSourceId", dataSourceId, "userLogin",
											userLogin));
						} */
					}
					
					
					
					
					Map officeDetails = UtilMisc.toMap("information","OFFICE","longitude",longitude,"latitude",latitude);
					
				
					
					Integer valueToStore = delegator.storeByCondition("GeoPoint", officeDetails
							,EntityCondition.makeCondition("geoPointId",EntityOperator.EQUALS,geoPointId));

			 }
			 else
			 {
				 double longitude = 0.0f;
					double latitude = 0.0f;
					//Map geoPointID = null;

					if (UtilValidate.isNotEmpty(latitudeValue)) {
						checkCoordinateFormat(latitudeValue);
						try {
							latitude = convertDegreesToDecimal(latitudeValue, "latitude");
						} catch (LongitudeDegreeOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (LatitudeDegreeOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (MinutesOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SecondsOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

					if (UtilValidate.isNotEmpty(longitudeValue)) {
						checkCoordinateFormat(longitudeValue);
						try {
							longitude = convertDegreesToDecimal(longitudeValue, "longitude");
						} catch (LongitudeDegreeOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (LatitudeDegreeOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (MinutesOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SecondsOutOfRangeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					/*geoPointID = dispatcher.runSync("createGeoPoint", UtilMisc
							.<String, Object> toMap("longitude", longitude, "latitude",
									latitude,"dataSourceId", dataSourceId,"userLogin", userLogin));
					geoPointId = (String) geoPointID.get("geoPointId");

*/
					 geoPointId = (String) delegator.getNextSeqId("GeoPoint");
					
					Map officeDetails = UtilMisc.toMap("geoPointId",geoPointId,"information","OFFICE","longitude",longitude,"latitude",latitude, 
							"information",userLogin);
					
					GenericValue valueToStore = delegator.makeValue("GeoPoint", officeDetails);
					valueToStore.create();
					
			 }
			if (contactMechId.isEmpty()) {
				// if no address exists creating one
				createAddress(dispatcher, officeId, address, city, pinCode, district, userLogin,faxNo,contactNumber,geoPointId);
			}
			else {
				// if address exists update 
				updateAddress(dispatcher, contactMechId, officeId, address, city, pinCode, district, userLogin,faxNo,contactNumber,geoPointId);
			}

			//if(!(parentOffice.isEmpty()) && UtilValidate.isNotEmpty(parentOffice) && UtilValidate.isNotEmpty(hoo)){
			if(UtilValidate.isNotEmpty(parentOffice) && UtilValidate.isNotEmpty(hoo)){
				// Added by Ankit Solanki on 06 Aug for UPDATE HOO relation
				//List<EntityCondition> andExprs = FastList.newInstance();
				List<EntityCondition> andExprs = new LinkedList<EntityCondition>();
				EntityCondition mainCond = null;
				EntityCondition mainConds = null;
				EntityCondition mainCondd = null;
				if (UtilValidate.isNotEmpty(officeId))
				{

					andExprs.add(EntityCondition.makeCondition("partyIdFrom", EntityOperator.EQUALS, officeId));
					andExprs.add(EntityCondition.makeCondition("roleTypeIdFrom", EntityOperator.EQUALS, OfficeSetupConstants.PARTY_ROLE_TYPE));
					andExprs.add(EntityCondition.makeCondition("roleTypeIdTo", EntityOperator.EQUALS, OfficeSetupConstants.EMPLOYEE_ROLE_TYPE));
					andExprs.add(EntityCondition.makeCondition("partyRelationshipTypeId", EntityOperator.EQUALS, "HOO"));
					if (andExprs.size() > 0)
						mainCond = EntityCondition.makeCondition(andExprs, EntityOperator.AND);

					List<GenericValue> hooDetail = delegator.findList("PartyRelationship", mainCond, null, null, null, false);

					if (UtilValidate.isNotEmpty(hooDetail))
					{
						String hooId = hooDetail.get(0).getString("partyIdTo");
						if(!(hooId.equals(hoo)))
						{
							//int test = delegator.storeByCondition("PartyRelationship", UtilMisc.toMap("statusId", EmployeeConstants.EMPL_PARTY_REL_ACTIVE, "partyRelationshipTypeId", EmployeeConstants.EMPL_PRL_REL_TYPE, "comments", "OLD_HOO"), mainCond);
							int test = delegator.storeByCondition("PartyRelationship", UtilMisc.toMap("partyRelationshipTypeId", EmployeeConstants.EMPL_PRL_REL_TYPE, "comments", "OLD_HOO"), mainCond);

							if (UtilValidate.isNotEmpty(andExprs))
								andExprs.clear();
							/*if (UtilValidate.isNotEmpty(mainCond))
								mainCond.reset();
*/
							andExprs.add(EntityCondition.makeCondition("partyIdFrom", EntityOperator.EQUALS, officeId));
							andExprs.add(EntityCondition.makeCondition("partyIdTo", EntityOperator.EQUALS, hoo));
							andExprs.add(EntityCondition.makeCondition("roleTypeIdFrom", EntityOperator.EQUALS, OfficeSetupConstants.PARTY_ROLE_TYPE));
							andExprs.add(EntityCondition.makeCondition("roleTypeIdTo", EntityOperator.EQUALS, OfficeSetupConstants.EMPLOYEE_ROLE_TYPE));
							if (andExprs.size() > 0)
								mainConds = EntityCondition.makeCondition(andExprs, EntityOperator.AND);

							List<GenericValue> employeeDetail = delegator.findList("PartyRelationship", mainCond, null, null, null, false);

							if (UtilValidate.isNotEmpty(employeeDetail))
							{
								int dataStore = delegator.storeByCondition("PartyRelationship", UtilMisc.toMap("statusId", EmployeeConstants.EMPL_PARTY_REL_ACTIVE, "partyRelationshipTypeId", "HOO"), mainConds);
							}
							else
							{
								updateHeadOfOffice(dispatcher, parentOffice, hoo, userLogin, officeType, officeId);
							}
						}
						else
						{
							int dataStore = delegator.storeByCondition("PartyRelationship", UtilMisc.toMap("statusId", EmployeeConstants.EMPL_PARTY_REL_ACTIVE, "partyRelationshipTypeId", "HOO"), mainConds);
						}
					}
					else if (UtilValidate.isEmpty(hooDetail))
					{
						if (UtilValidate.isNotEmpty(andExprs))
							andExprs.clear();
//						if (UtilValidate.isNotEmpty(mainCond))
//							mainCond.reset();

						andExprs.add(EntityCondition.makeCondition("partyIdFrom", EntityOperator.EQUALS, officeId));
						andExprs.add(EntityCondition.makeCondition("partyIdTo", EntityOperator.EQUALS, hoo));
						andExprs.add(EntityCondition.makeCondition("roleTypeIdFrom", EntityOperator.EQUALS, OfficeSetupConstants.PARTY_ROLE_TYPE));
						andExprs.add(EntityCondition.makeCondition("roleTypeIdTo", EntityOperator.EQUALS, OfficeSetupConstants.EMPLOYEE_ROLE_TYPE));
						if (andExprs.size() > 0)
							mainCondd = EntityCondition.makeCondition(andExprs, EntityOperator.AND);

						List<GenericValue> employeeDetail = delegator.findList("PartyRelationship", mainCondd, null, null, null, false);

						if (UtilValidate.isNotEmpty(employeeDetail))
						{
							int dataStore = delegator.storeByCondition("PartyRelationship", UtilMisc.toMap("statusId", EmployeeConstants.EMPL_PARTY_REL_ACTIVE, "partyRelationshipTypeId", "HOO"), mainCondd);
						}
						else
						{
							updateHeadOfOffice(dispatcher, parentOffice, hoo, userLogin, officeType, officeId);
						}
					}
				}
			}            

			 

		}catch (DuplicateOfficeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.DUPLICATE_OFFICE, officeName, locale);
		}catch (EmptyParentOfficeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_OFFICE_WITHOUT_PARENT, officeType, locale);
		}catch (ParentOfficeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_CREATE_PARENT_OF_WRDMP, officeType, locale);				
		}catch (UpdateParentOfficeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_UPDATE_PARENTOFFICE, officeName, locale);
		}catch(UpdateOfficeNameException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_UPDATE_OFFICENAME, officeName, locale);
		}catch(UpdateOfficeTypeException e) {
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_UPDATE_OFFICETYPE, officeName, locale);
		}catch(GenericEntityException e) {
			// All the programatical exceptions related to entity are handled here
			Debug.log("Entity Exception occured : " + e );
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_UPDATE_OFFICE, officeName, locale);
		}catch(GenericServiceException e) {
			// All the programatical exceptions related to service are handled here
			Debug.log("Service Exception occured : " + e );
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_UPDATE_OFFICE, officeName, locale);
		}catch(GeneralException e) {
			// It is the mother of all the ofbiz exceptions
			// All the specific exceptions are handled above
			// It would be executed in the worst case scenario
			Debug.log("Exception occured : " + e );
			return UIMessages.getErrorMessage(resource,OfficeSetupConstants.CANNOT_UPDATE_OFFICE, officeName, locale);
		}

		result.put(OfficeSetupConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,OfficeSetupConstants.OFFICE_UPDATED, officeName, locale));			
		return result;		
	}	



	/**
     * Method Name :  getOfficeDetail
     * @Version 1.0
     * @Description Gets office details
     * @param DispatchContext dctx
     * @param Map<String, ? extends Object> context
     * @return Map - Map returning the details of the office
     * @BusinessExceptions : None
     * 
     */   
    public static Map<String, Object> getOfficeDetail(DispatchContext ctx,
            Map<String, ? extends Object> context) {

        Map<String, Object> result = ServiceUtil.returnSuccess();
        GenericDelegator delegator = (GenericDelegator) ctx.getDelegator();
        GenericValue userLogin = (GenericValue) context.get("userLogin");
        final Locale locale = (Locale) context.get("locale");
        String officeId = (String) context.get("officeId");
        //List<String> orderBy = FastList.newInstance();
        List<String> orderBy = new LinkedList<String>();
        //Set<String> fields = FastSet.newInstance();
        Set<String> fields = new HashSet<String>();
        //List<EntityCondition> andCondition = FastList.newInstance();
        List<EntityCondition> andCondition = new LinkedList<EntityCondition>();
        EntityCondition officeCondition = null;
        List<GenericValue> officeDetail=null;
        List<GenericValue> hooDetail=null;
        EntityFindOptions findOptions = new EntityFindOptions();

        if( officeId == null || "".equals(officeId) )
        {
            return UIMessages.getErrorMessage(resource,OfficeSetupConstants.OFFICE_ID_EMPTY, "", locale);
        }
        else
        {
            /*
             * Modified By Yashaswini : 12/07/2010.
             * Reason : For Office Login, we have created one record in PartyRelationship Table as follows.
             * partyIdFrom = 'OfficeId' , partyIdTo = 'OfficeId', roleTypeIdFrom = 'OFFICE' , roleTypeIdTo = 'LOCAL_ADMIN' , statusId = 'PARTY_REL_ACTIVE', partyRelationshipTypeId = 'OFFICE_TO_EMPLOYEE'.
             * Because of this we are not getting correct parent office Id.
             * Included another condition to get parent office id.
             */
            andCondition.add(EntityCondition.makeCondition("partyId",
                    EntityOperator.EQUALS, officeId));
            andCondition.add(EntityUtil.getFilterByDateExpr());
            andCondition.add(EntityCondition.makeCondition("partyRelationshipTypeId",
                    EntityOperator.EQUALS, OfficeSetupConstants.PARTY_RELATIONSHIP_TYPE_ID));
            officeCondition = EntityCondition.makeCondition(andCondition,
                    EntityOperator.AND);

            //*************************************************************************************************************************
            //Retrieving Office Details
            //*************************************************************************************************************************

            try
            {               
                officeDetail = delegator.findList("OfficeDetail", officeCondition, fields, orderBy, findOptions,false);       
            }
            catch(GenericEntityException e)
            {
                return UIMessages.getErrorMessage(resource,OfficeSetupConstants.ERROR_GETTING_OFFICE_DETAIL,"", locale);
            }

            //*************************************************************************************************************************
            //Retrieving Head Of Office for a particular office
            //*************************************************************************************************************************

           /* List<EntityCondition> hooCondition = FastList.newInstance();

            hooCondition.add(EntityCondition.makeCondition("officeId", EntityOperator.EQUALS, officeId));
            hooCondition.add(EntityCondition.makeCondition("hodRole", EntityOperator.EQUALS, "EMPLOYEE"));
            hooCondition.add(EntityCondition.makeCondition("relationType", EntityOperator.EQUALS, "HOO"));
            hooCondition.add(EntityCondition.makeCondition("relationStatus", EntityOperator.EQUALS, EmployeeConstants.EMPL_PARTY_REL_ACTIVE));

            EntityCondition hooCond = EntityCondition.makeCondition(hooCondition, EntityOperator.AND);

            try
            {               
                hooDetail = delegator.findList("HodView", hooCond, fields, orderBy, findOptions,false);       
            }
            catch(GenericEntityException e)
            {
                return UIMessages.getErrorMessage(resource,OfficeSetupConstants.ERROR_GETTING_OFFICE_DETAIL,"", locale);
            }*/

            //Debug.logInfo("In getOfficeDetail officeDetail=" + officeDetail, module);
            //Debug.logInfo("In getOfficeDetail officeDetail=" + hooDetail, module);
            //Debug.logInfo("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ officeDetail=" + officeDetail, module);
            if(officeDetail.size()!=0)
            {
                result.put("officeName", officeDetail.get(0).getString("officeSiteName"));
                result.put("officeType", officeDetail.get(0).getString("groupName"));
                result.put("partyCode", officeDetail.get(0).getString("partyCode"));
                if(officeDetail.size() > 1) {
                    if(UtilValidate.isNotEmpty(officeDetail.get(1).getString("parentOfficeName")) && UtilValidate.isNotEmpty(officeDetail.get(1).getString("parentOfficeId"))) {
                        String officeName = officeDetail.get(1).getString("parentOfficeName")+", "+officeDetail.get(0).getString("parentOfficeName");
                        String officeIds = officeDetail.get(1).getString("parentOfficeId")+", "+officeDetail.get(0).getString("parentOfficeId");
                        String officeType = officeDetail.get(1).getString("parentOfficeType");
                        result.put("parentOfficeName", officeName);
                        result.put("parentOfficeId", officeIds);
                        result.put("parentOfficeType", officeType);
                    }
                }
                else {
                    result.put("parentOfficeName", officeDetail.get(0).getString("parentOfficeName"));
                    result.put("parentOfficeId", officeDetail.get(0).getString("parentOfficeId"));
                    result.put("parentOfficeType", officeDetail.get(0).getString("parentOfficeType"));
                }
                result.put("contactMechId", officeDetail.get(0).getString("contactMechId"));
                result.put("address", officeDetail.get(0).getString("address1"));
                result.put("city", officeDetail.get(0).getString("city"));
                result.put("pinCode", officeDetail.get(0).getString("postalCode"));
                result.put("district", officeDetail.get(0).getString("district"));
                //result.put("tribal", officeDetail.get(0).getString("tribal"));
                result.put("createdOn", officeDetail.get(0).getTimestamp("createdOn"));

                result.put("faxNo", officeDetail.get(0).getString("faxNo"));
               // result.put("contactNumber", officeDetail.get(0).getString("contactNumber"));
                result.put("statusId", officeDetail.get(0).getString("statusId"));

                //Debug.logInfo("In getOfficeDetail result=" + result, module);
            }
            /*if(hooDetail.size()!=0){
                result.put("hodId", hooDetail.get(0).getString("hodId"));
                result.put("emplPositionTypeId", hooDetail.get(0).getString("emplPositionTypeId"));
                result.put("designation", hooDetail.get(0).getString("designation"));
                result.put("firstName", hooDetail.get(0).getString("firstName"));
                result.put("lastName", hooDetail.get(0).getString("lastName"));
            }*/
        }
        result.put("officeId", officeId);

        return result;

    }





/**
	 * updates office detail by calling updatePartyGroup service of partymgr component
	 * @param LocalDispatcher dispatcher - for calling service
	 * @param String officeId - office id to be updated
	 * @param String tribal - tribal nature
	 * @param String officeType - type of office
	 * @param String officeName - name of office
	 * @param GenericValue userLogin - username and password for service authentication 
	 * @return None
	 * @throws GenericServiceException
	 */
	private static void officeupdateGroup(LocalDispatcher dispatcher, String officeId, String officeType, String tribal, 
			GenericValue userLogin, String officeName,String statusId, String officeCode)
					throws GenericServiceException
					{
		Map partyGroup = null;
		partyGroup = dispatcher.runSync("updatePartyGroup", UtilMisc.toMap(
				"partyId", officeId, "groupName", officeType, "tribal", tribal,
				"userLogin", userLogin, "officeSiteName", officeName,"statusId",statusId, "partyCode", officeCode));
					}





/**
	 * deletes office relation by calling deletePartyRelationship service of partymgr component
	 * @param LocalDispatcher dispatcher - for calling service
	 * @param String parentOfficeId - parent office id
	 * @param String officeId 
	 * @param java.sql.Timestamp createdOn - date on which parent relation is created
	 * @param GenericValue userLogin - username and password for service authentication 
	 * @return None
	 * @throws GenericServiceException
	 */
	private static void deleteRelationship(LocalDispatcher dispatcher, String parentOfficeId, String officeId, java.sql.Timestamp createdOn, GenericValue userLogin)
			throws GenericServiceException
			{
		Map officeParent = dispatcher.runSync("deletePartyRelationship", UtilMisc.toMap(
				"userLogin", userLogin, "partyIdFrom", parentOfficeId, "partyIdTo", officeId, "roleTypeIdFrom",
				OfficeSetupConstants.PARTY_ROLE_TYPE, "roleTypeIdTo", OfficeSetupConstants.PARTY_ROLE_TYPE, 
				"fromDate", createdOn));
			}

	
	
	
	/**
	 * updates office address by calling updatePartyPostalAddress service of partymgr component
	 * @param LocalDispatcher dispatcher - for calling service
	 * @param String partyId - office party id
	 * @param String contactMechId - office address contact mech id
	 * @param String address - office address
	 * @param String city
	 * @param String pinCode
	 * @param String district 
	 * @param GenericValue userLogin - username and password for service authentication
	 * @return None
	 * @throws GenericServiceException
	 */
	private static void updateAddress(LocalDispatcher dispatcher, String contactMechId, String partyId, String address, String city, String pinCode, String district, GenericValue userLogin,String faxNo, String contactNumber,String geoPointId)
			throws GenericServiceException
			{
		dispatcher.runSync("updatePartyPostalAddress", UtilMisc.toMap(
				"contactMechId", contactMechId, "partyId", partyId, "address1", address, 
				"city", city, "postalCode", pinCode, 
				"district", district, "userLogin", userLogin,"faxNo",faxNo,"contactNumber",contactNumber,"geoPointId" ,geoPointId));
			}


/**
	 * Updation of Head of office
	 * @param GenericDelegator delegator
	 * @param String officeName
	 * @return None
	 * @throws GenericEntityException
	 */

	private static Map<String, Object> updateHeadOfOffice(LocalDispatcher dispatcher, String parentOffice, String headOfOffice, GenericValue userLogin, String officeType, String partyId)
			throws GenericServiceException, EmptyParentOfficeException, ParentOfficeException
			{
		// Creating HEAD OF THE DEPARTMENT for new office (using services)
		Map hodOfOffice = null;
		//Map<String, Object> result = FastMap.newInstance();
		Map<String, Object> result = new HashMap<String, Object>();
		if (!(headOfOffice.isEmpty())) {

			Map officeParent = null;			
			if (parentOffice != null && !OfficeSetupConstants.OFFICE_TYPE.equals(officeType)) {
				officeParent = dispatcher.runSync("createPartyRelationship", UtilMisc.toMap("partyIdFrom", partyId, "partyIdTo",
						headOfOffice, "roleTypeIdFrom",	OfficeSetupConstants.PARTY_ROLE_TYPE, "roleTypeIdTo",
						OfficeSetupConstants.EMPLOYEE_ROLE_TYPE, "partyRelationshipTypeId", "HOO", "userLogin", userLogin,
						"statusId", EmployeeConstants.EMPL_PARTY_REL_ACTIVE));
			} 
			else {
				if (parentOffice != null && OfficeSetupConstants.OFFICE_TYPE.equals(officeType)) {
					throw new ParentOfficeException("Can not create parent of WRDMP office");
				}
				if (!OfficeSetupConstants.OFFICE_TYPE.equals(officeType))
					throw new EmptyParentOfficeException("Parent office can not be empty if office type is not WRDMP");
			}
		}
		return result;

			}



	private static Map<String, Object> checkCoordinateFormat(
			String latitudeValue) throws CoordinateFormatException {
			Map<String, Object> result = ServiceUtil.returnSuccess();

			// pattern check for the coordinates of the form Degree:minutes:seconds
			Pattern p = Pattern.compile("[0-9]{1,3}?:[0-9]{1,2}?:[0-9]{1,2}?");
			Matcher matcher = p.matcher(latitudeValue);
			if (matcher.matches()) {
			return result;
			} else {
			throw new CoordinateFormatException(
			"Coordinates not in proper format");
			}
			}
	
	private static double convertDegreesToDecimal(String coordinates,
			String type) throws LongitudeDegreeOutOfRangeException,
			LatitudeDegreeOutOfRangeException, MinutesOutOfRangeException,
			SecondsOutOfRangeException {
			// split the coordinates using the : as delimeter to get degree,minutes
			// and seconds
			String coordinateValues[] = coordinates.split(":");
			Double degree = null;
			Double minutes = null;
			Double seconds = null;
			if (coordinateValues[0] != null) {
			// get the double value of degree
			degree = Double.parseDouble(coordinateValues[0]);
			checkDegreeValue(degree, type);

			}
			if (coordinateValues[1] != null) {
			// get the double value of minutes
			minutes = Double.parseDouble(coordinateValues[1]);

			if (minutes > 60) {
			throw new MinutesOutOfRangeException(
			"Minutes out of range exception");
			}
			}
			if (coordinateValues[2] != null) {
			// get the double value of seconds
			seconds = Double.parseDouble(coordinateValues[2]);
			if (seconds > 60) {
			throw new SecondsOutOfRangeException(
			"Minutes out of range exception");
			}
			}
			if (degree != null && minutes != null && seconds != null) {
			// convert the cordinates into decimal fraction
			double decimalFracOfCoordinates = degree + (minutes / 60D)
			+ (seconds / 3600D);
			return decimalFracOfCoordinates;
			} else {
			return 0;
			}
			}
	
	private  static Map<String, Object> checkDegreeValue(double degree, String type)
			throws LongitudeDegreeOutOfRangeException,LatitudeDegreeOutOfRangeException {
				Map<String, Object> result = ServiceUtil.returnSuccess();  
				if(type.equals("longitude") && degree > 180)
				{
					throw new LongitudeDegreeOutOfRangeException("Longitude degree out of range");
				}else if(type.equals("latitude") && degree >90)
				{
					throw new LatitudeDegreeOutOfRangeException("Latitude degree out of range");
				}else{
					return result;
				}

			}


	   /** Name of the Method: registerEmployee
     * Version:@1.0
     * Date:12/08/2017     
     * Author:PRABHU.S
     * Modified By:         Date:
     * Purpose of this Program: Employee registration.
     */

    public static Map<String, Object> registerEmployee(DispatchContext dctx,
            Map<String, ? extends Object> context) throws IOException {
        Map<String, Object> result = ServiceUtil.returnSuccess();

        GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
        GenericValue userLogin = (GenericValue) context.get("userLogin");
        Locale locale = (Locale) context.get("locale");
        LocalDispatcher dispatcher = dctx.getDispatcher();
        String partyId = userLogin.getString("partyId");
        
        
        String title = (String) context.get("title");
		String firstName = (String) context.get("firstName");
		String middleName = (String) context.get("middleName");
		String lastName = (String) context.get("lastName");
		String gender = (String) context.get("gender");
		String dateOfBirth = (String) context.get("dateOfBirth");
		String meritalStatus = (String) context.get("meritalStatus");
		String fatherName = (String) context.get("fatherName");
		String motherName = (String) context.get("motherName");
		String nationality = (String) context.get("nationality");
		String village = (String) context.get("village");
		String contactNumber = (String) context.get("contactNumber");
		String emailAddress = (String) context.get("emailAddress");
		String permanentAddress = (String) context.get("permanentAddress");
		String city = (String) context.get("city");
		String state = (String) context.get("state");
		String currentAddress = (String) context.get("currentAddress");
		String pincode = (String) context.get("pincode");
		String mobileNo = (String) context.get("mobileNo");
		String community = (String) context.get("community");		
		String employeeCode = (String) context.get("employeeCode");
		String officeId = (String) context.get("officeId");
		String designation = (String) context.get("designation");
		String appointmentType = (String) context.get("appointmentType");		
		String dateOfJoining = (String) context.get("dateOfJoining");
		String payScaleId = (String) context.get("payScaleId");
		String basicPay = (String) context.get("basicPay");	
		String remarks = (String) context.get("remarks");
		String aadharCardNumber = (String) context.get("aadharCardNumber");
	
        String workOption = "IMIS";
       
        
        System.out.println("~~~~~~~~~~~~~~~~~"
        		+ "~~employeeCode~~~~~~~~~~~~~~~~~~~"+employeeCode+dateOfBirth
        		+meritalStatus+fatherName+motherName+nationality+village+contactNumber+emailAddress+permanentAddress+city+state
        		+currentAddress+pincode+mobileNo+community+
        		employeeCode+officeId+designation+appointmentType+dateOfJoining+payScaleId+basicPay+remarks+aadharCardNumber);
       
        String status = "REGISTERED";
        String message = null;

        java.sql.Date birthDate = null;        
        birthDate = java.sql.Date.valueOf(dateOfBirth);
        System.out.println("--------"+birthDate);
        
        java.sql.Date dateOfJoin = null;        
        dateOfJoin = java.sql.Date.valueOf(dateOfJoining);
        System.out.println("--------"+dateOfJoin);
        
        java.math.BigDecimal bandPay = null;
        if(UtilValidate.isNotEmpty(basicPay)) {
            bandPay = new BigDecimal(basicPay);
        }

        java.sql.Timestamp now = new java.sql.Timestamp( (new java.util.Date()).getTime());
        List<EntityCondition> andCond = new LinkedList<EntityCondition>();
        //List<EntityCondition> andCond = FastList.newInstance();
        //List<EntityCondition> orCond = FastList.newInstance();
        List<EntityCondition> orCond = new LinkedList<EntityCondition>();

        EntityCondition cond =null;
        EntityCondition mainOR =null;
        String printName = null;

        try
        {
            if(UtilValidate.isNotEmpty(employeeCode)) {

                orCond.add(EntityCondition.makeCondition("status", EntityOperator.EQUALS,"REGISTERED"));
                //orCond.add(EntityCondition.makeCondition("status", EntityOperator.EQUALS,"REVERTED"));
                orCond.add(EntityCondition.makeCondition("status", EntityOperator.EQUALS,"APPROVE"));
                mainOR = EntityCondition.makeCondition(orCond, EntityOperator.OR);
                andCond.add(EntityCondition.makeCondition(EntityFunction.UPPER_FIELD("employeeCode"), EntityOperator.EQUALS, EntityFunction.UPPER(employeeCode)));
                andCond.add(mainOR);

                cond = EntityCondition.makeCondition(andCond, EntityOperator.AND);

                List<GenericValue> checkInfo=delegator.findList("EmplRegistration", cond, null, null, null, false);   

                if(UtilValidate.isNotEmpty(checkInfo)) {
                    return UIMessages.getErrorMessage(resource,"Employee with this Employee Code already registered - "+employeeCode, null,    locale);
                }
            }

            if(UtilValidate.isNotEmpty(firstName)) {
                String registrationId = delegator.getNextSeqId("EmplRegistration", 1);
                Map empDetails = UtilMisc.toMap("registrationId", registrationId,"title", title,"firstName", firstName,"middleName", middleName,"lastName", lastName,
                        "gender", gender,"dateOfBirth", birthDate,"fatherName", fatherName,"motherName", motherName,
                        "contactNumber",contactNumber,"emailAddress", emailAddress,"permanentAddress", permanentAddress,"city", city,"state",
                        state,"village",village,"nationality", nationality,"community", community,
                        "employeeCode",employeeCode, "officeId", officeId, "designation", designation, "status", status, "createdDate",now,"createdBy", partyId,
                        "appointmentType", appointmentType,"dateOfJoining", dateOfJoin,
                        "pincode", pincode, "mobileNo", mobileNo, "remarks", remarks, "payScaleId", payScaleId, "basicPay", bandPay, 
                        "aadharCardNumber",aadharCardNumber,"currentAddress",currentAddress,
                        "optionToWork",workOption);
                GenericValue register = delegator.makeValue("EmplRegistration", empDetails);
                register.create();

                if((middleName== null) &&(lastName== null))
                    printName = firstName;
                if(((middleName== null)||(middleName== "")) && (lastName!= null))
                    printName = firstName + " " + lastName;
                if(((lastName== null)||(lastName== "") ) && (middleName!= null))
                    printName = firstName + " " + middleName;
                if((middleName!= null) &&(lastName!= null) && (firstName!= null))
                    printName = firstName + " " + middleName+ " " + lastName;
                if(title != null)
                    printName = title+" "+printName;

                message = printName+" has been "+EmployeeConstants.Registered_Successfully+".";
            }
        }       
        catch (GenericEntityException e) {
            return UIMessages.getErrorMessage(resource,"Unable to register.", null,    locale);
        }
        result.put(EmployeeConstants.SUCCESS_MESSAGE,UIMessages.getSuccessMessage(resource,message, employeeCode, locale));
        return result;
    }
    
    
    
    
	/**
	 * 
	 * @Method :updateRegistration
	 * @Description:To Update Employee Information details.
	 * @param dctx
	 *            The DispatchContext that this service is operating in.
	 * @param context
	 *            Map containing the input parameters.
	 * @return Map with the result of the service, the output parameters.
	 * @Dependency :--
	 * @BusinessExceptions :--.
	 * 
	 */


	public static Map<String, Object> updateRegistration(DispatchContext dctx,
			Map<String, ? extends Object> context) {
		Map<String, Object> result = ServiceUtil.returnSuccess();
		LocalDispatcher dispatcher = dctx.getDispatcher();
		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		Locale locale = (Locale) context.get("locale");

		//String listOfselectedIds = (String) context.get("selectedItem");
		//List<GenericValue> listofpaybills = null;
		//EntityCondition getEmployeePayBill = null;
		//ArrayList payBillIDList = new ArrayList();
		//List<EntityExpr> ConditionList = FastList.newInstance();
		List<GenericValue> ConditionList = new LinkedList<GenericValue>();

		EntityCondition cond = null;
		String partyId = userLogin.getString("partyId");

		   String registrationId = (String) context.get("registrationId");
		    String title = (String) context.get("title");
			String firstName = (String) context.get("firstName");
			String middleName = (String) context.get("middleName");
			String lastName = (String) context.get("lastName");
			String gender = (String) context.get("gender");
			String dateOfBirth = (String) context.get("dateOfBirth");
			String meritalStatus = (String) context.get("meritalStatus");
			String fatherName = (String) context.get("fatherName");
			String motherName = (String) context.get("motherName");
			String nationality = (String) context.get("nationality");
			String village = (String) context.get("village");
			String contactNumber = (String) context.get("contactNumber");
			String emailAddress = (String) context.get("emailAddress");
			String permanentAddress = (String) context.get("permanentAddress");
			String city = (String) context.get("city");
			String state = (String) context.get("state");
			String currentAddress = (String) context.get("currentAddress");
			String pincode = (String) context.get("pincode");
			String mobileNo = (String) context.get("mobileNo");
			String community = (String) context.get("community");		
			String employeeCode = (String) context.get("employeeCode");
			String officeId = (String) context.get("officeId");
			String designation = (String) context.get("designation");
			String appointmentType = (String) context.get("appointmentType");		
			String dateOfJoining = (String) context.get("dateOfJoining");
			String payScaleId = (String) context.get("payScaleId");
			String basicPay = (String) context.get("basicPay");	
			String remarks = (String) context.get("remarks");
			String aadharCardNumber = (String) context.get("aadharCardNumber");   

		String Status = null;
		
		Status = (String) context.get("status");		
		String workOption = (String) context.get("workOption");
		
		
		  java.sql.Date birthDate = null;        
	        birthDate = java.sql.Date.valueOf(dateOfBirth);
	        System.out.println("--------"+birthDate);
	        
	        java.sql.Date dateOfJoin = null;        
	        dateOfJoin = java.sql.Date.valueOf(dateOfJoining);
	        System.out.println("--------"+dateOfJoin);

		

		java.math.BigDecimal bandPay = null;
		if(UtilValidate.isNotEmpty(basicPay)) {
			bandPay = new BigDecimal(basicPay);
		}
		if(UtilValidate.isNotEmpty(registrationId))
		{
			try
			{
				if(UtilValidate.isNotEmpty(registrationId))
				{
					//Map<String, Object> update = FastMap.newInstance();
			        Map<String,Object> update = new HashMap<String, Object>();

					update.put("title",title);
					update.put("firstName",firstName);
					update.put("middleName",middleName);
					update.put("lastName",lastName);
					update.put("gender",gender);
					update.put("dateOfBirth",birthDate);					
					update.put("fatherName",fatherName);
					update.put("motherName",motherName);				
					//update.put("placeofBirth",birthDate);
					update.put("contactNumber",contactNumber);
					update.put("emailAddress",emailAddress);
					update.put("permanentAddress",permanentAddress);
					update.put("city",city);
					update.put("state",state);
					update.put("employeeCode",employeeCode);
					update.put("designation",designation);
					update.put("appointmentType",appointmentType);
					update.put("meritalStatus",meritalStatus);
					update.put("nationality",nationality);
					update.put("village",village);
					update.put("currentAddress",currentAddress);
					update.put("pincode",pincode);
					update.put("mobileNo",mobileNo);
					update.put("community",community);
					update.put("currentAddress",currentAddress);
					update.put("dateOfJoining", dateOfJoin);
					update.put("remarks", remarks);
					update.put("officeId", officeId);
					update.put("payScaleId", payScaleId);
					update.put("basicPay", bandPay);			
					update.put("aadharCardNumber",aadharCardNumber);					
					update.put("optionToWork",workOption);
		           
					
					//List<EntityCondition> andExprs = FastList.newInstance();
					List<EntityCondition> andExprs = new LinkedList<EntityCondition>();

					andExprs.add(EntityCondition.makeCondition("registrationId", EntityOperator.EQUALS,registrationId));
					andExprs.add(EntityCondition.makeCondition("status", EntityOperator.EQUALS, "REGISTERED"));

					EntityCondition conds = EntityCondition.makeCondition(andExprs, EntityOperator.AND);
					int updateCircular = delegator.storeByCondition("EmplRegistration", update, conds);

					if(updateCircular > 0)
					{
						result.put(EmployeeConstants.SUCCESS_MESSAGE, UIMessages.getSuccessMessage(resource,	EmployeeConstants.UPDATED_SUCCESS,"", locale));
					}
				}
			}
			catch (GenericEntityException e) {
				e.printStackTrace();
				// TODO: handle exception
				return UIMessages.getErrorMessage(resource,EmployeeConstants.UNABLE_TO_UPDATE,"", locale);
			}catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
				return UIMessages.getErrorMessage(resource,EmployeeConstants.UNABLE_TO_UPDATE,"", locale);
			}
		}

		return result;
	}
    
    /** Name of the Method: approveRegistration
     * Version:@1.0
     * Date:12/08/2017     
     * Author:PRABHU.S
     * Modified By:         Date:
     * Purpose of this Program: Approve Employee registration.
     */
    public static Map<String, Object> approveRegistration(DispatchContext dctx,
			Map<String, ? extends Object> context) {
		Map<String, Object> result = ServiceUtil.returnSuccess();

		GenericDelegator delegator = (GenericDelegator) dctx.getDelegator();
		GenericValue userLogin = (GenericValue) context.get("userLogin");
		Locale locale = (Locale) context.get("locale");
		LocalDispatcher dispatcher = dctx.getDispatcher();
		//Map<String, Object> inMap = FastMap.newInstance();
        Map<String,Object> inMap = new HashMap<String, Object>();

		String registrationId = (String) context.get("registrationId");
		String actionFlag = (String) context.get("actionFlag");
		String title = null;
		String firstName = null;
		String middleName = null;
		String lastName = null;
		String gender = null;
		java.sql.Date dateOfBirth = null;
		String meritalStatus = null;
		String fatherName = null;
		String motherName = null;
		String placeofBirth = null;
		String contactNumber = null;
		String emailAddress = null;
		String permanentAddress = null;
		String currentAddress = null;
		String city = null;
		String state = null;
		String pincode = null;
		String mobileNo = null;
		String community = null;		
		String nationality = null;
		String village = null;
		String aadharCardNumber = null;	
		String employeeCode = null;
		String officeId = null;
		String designation = null;
		String employeeId = null;
		String appointmentType = null;		
		java.sql.Date dateOfJoining = null;		
		String payScaleId = null;
		java.math.BigDecimal basicPay = null;
		String remarks = (String) context.get("remarks");	

		//List<GenericValue> getEmployeeDetail= FastList.newInstance();
		List<GenericValue> getEmployeeDetail = new LinkedList<GenericValue>();


		if(UtilValidate.isNotEmpty(registrationId) && UtilValidate.isNotEmpty(actionFlag))	{      

			try
			{/*
				if("N".equals(actionFlag)) {      
					if(UtilValidate.isNotEmpty(registrationId)) {
						Map empDetails = UtilMisc.toMap("status","REVERTED","remarks",remarks);
						int update = delegator.storeByCondition("EmplRegistration",
								empDetails, EntityCondition.makeCondition(
										"registrationId", EntityOperator.EQUALS,
										registrationId));

						result.put(EmployeeConstants.SUCCESS_MESSAGE,UIMessage.getSuccessMessage(
								resource,EmployeeConstants.REGISTRATION_REVERTED_SUCCESSFULLY + " For ", registrationId, locale));
                    Added by saurabh gupta on 04.11.2014 bug no 1405
						result.put(EmployeeConstants.SUCCESS_MESSAGE,UIMessages.getSuccessMessage(
								resource,EmployeeConstants.REGISTRATION_REVERTED_SUCCESSFULLY,"", locale));
   					}
				}*/ if("Y".equals(actionFlag)) {
					if(UtilValidate.isNotEmpty(registrationId)) {
						getEmployeeDetail=delegator.findList("EmplRegistration", EntityCondition.makeCondition(
								"registrationId", EntityOperator.EQUALS, registrationId), null, null, null, false);

						if(UtilValidate.isNotEmpty(getEmployeeDetail)) {

							title = getEmployeeDetail.get(0).getString("title");
							firstName = getEmployeeDetail.get(0).getString("firstName");
							middleName = getEmployeeDetail.get(0).getString("middleName");
							lastName = getEmployeeDetail.get(0).getString("lastName");
							gender = getEmployeeDetail.get(0).getString("gender");
							dateOfBirth = getEmployeeDetail.get(0).getDate("dateOfBirth");
							community = getEmployeeDetail.get(0).getString("community");
							fatherName = getEmployeeDetail.get(0).getString("fatherName");
							motherName = getEmployeeDetail.get(0).getString("motherName");							
							aadharCardNumber = getEmployeeDetail.get(0).getString("aadharCardNumber");
							contactNumber = getEmployeeDetail.get(0).getString("contactNumber");
							emailAddress = getEmployeeDetail.get(0).getString("emailAddress");
							permanentAddress = getEmployeeDetail.get(0).getString("permanentAddress");
							currentAddress = getEmployeeDetail.get(0).getString("currentAddress");
							city = getEmployeeDetail.get(0).getString("city");
							state = getEmployeeDetail.get(0).getString("state");
							pincode = getEmployeeDetail.get(0).getString("pincode");
							village = getEmployeeDetail.get(0).getString("village");
							nationality = getEmployeeDetail.get(0).getString("nationality");
							mobileNo = getEmployeeDetail.get(0).getString("mobileNo");
							meritalStatus = getEmployeeDetail.get(0).getString("meritalStatus");
							employeeCode = getEmployeeDetail.get(0).getString("employeeCode");
							officeId = getEmployeeDetail.get(0).getString("officeId");
							designation = getEmployeeDetail.get(0).getString("designation");
							appointmentType = getEmployeeDetail.get(0).getString("appointmentType");
							dateOfJoining = getEmployeeDetail.get(0).getDate("dateOfJoining");
							payScaleId = getEmployeeDetail.get(0).getString("payScaleId");
							basicPay = getEmployeeDetail.get(0).getBigDecimal("basicPay");
							
						}

						inMap.put("personalTitle", title);
						inMap.put("firstName", firstName);
						inMap.put("middleName", middleName);
						inMap.put("lastName", lastName);
						inMap.put("gender", gender);
						inMap.put("birthDate", dateOfBirth);
						inMap.put("userLogin", userLogin);
						

						Map party = dispatcher.runSync("createPerson", inMap);

						if(UtilValidate.isNotEmpty(party)) {
							employeeId = (String) party.get("partyId");

							inMap.clear();
							inMap.put("userLogin", userLogin);
							inMap.put("partyId", employeeId);
							inMap.put("roleTypeId", "EMPLOYEE");
						}

						Map empDetails = UtilMisc.toMap("status","APPROVED", "partyId", employeeId,"remarks",remarks);

						int update = delegator.storeByCondition("EmplRegistration",
								empDetails, EntityCondition.makeCondition(
										"registrationId", EntityOperator.EQUALS, registrationId));

						if(UtilValidate.isNotEmpty(employeeId)) {
							Map roleMap = dispatcher.runSync("createPartyRole", inMap);
					        							

							if(UtilValidate.isNotEmpty(permanentAddress)){
								Map postalAddress = dispatcher.runSync("createPartyPostalAddress",
										UtilMisc.toMap("partyId", employeeId,"contactMechPurposeTypeId","GENERAL_LOCATION","address1", permanentAddress,
												"city","NA","postalCode","NA","userLogin", userLogin));
							}

							if(UtilValidate.isNotEmpty(contactNumber)){
								inMap.clear();
								inMap.put("partyId", employeeId);
								inMap.put("userLogin", userLogin);
								inMap.put("roleTypeId", "EMPLOYEE");
								inMap.put("contactMechPurposeTypeId", "PHONE_MOBILE");
								inMap.put("countryCode", "91");
								inMap.put("contactNumber", contactNumber);

								Map contactMap = dispatcher.runSync("createPartyTelecomNumber", inMap);
								inMap.clear();
							}

							if(UtilValidate.isNotEmpty(emailAddress))
							{
								inMap.put("userLogin", userLogin);
								inMap.put("partyId", employeeId);
								inMap.put("contactMechPurposeTypeId", "PRIMARY_EMAIL");
								inMap.put("emailAddress", emailAddress);
								Map emailMap = dispatcher.runSync("createPartyEmailAddress",inMap);
								inMap.clear();
							}
								
							List<EntityExpr> expList = new LinkedList<EntityExpr>();
			 				/*	List<EntityExpr> expList = FastList.newInstance();*/
								EntityCondition mainCondition = null;

								
									expList.add(EntityCondition.makeCondition("appointmentTypeId",EntityOperator.EQUALS, appointmentType));
									mainCondition = EntityCondition.makeCondition(expList,EntityOperator.AND);
									  List<GenericValue> resultList = new LinkedList<GenericValue>();
									//List<GenericValue> resultList = FastList.newInstance();
									try {
										resultList = delegator.findList("AppointmentType",
												mainCondition, UtilMisc.toSet("appointmentTypeId"), null,
												null, false);
										if (UtilValidate.isEmpty(resultList)) {
											 Map appointmentTypemap = UtilMisc.toMap(					
														"appointmentTypeId", appointmentType 
																					
														);
												GenericValue saveAppointmentType = delegator.makeValue("AppointmentType", appointmentTypemap);
												saveAppointmentType.create();
										}
									} catch (GenericEntityException e1) {
										e1.printStackTrace();
									}

							
								
							String printName = null;
							java.sql.Timestamp fromDate1 = UtilDateTime.nowTimestamp();
							java.sql.Timestamp fromDate2 = UtilDateTime.nowTimestamp();
							String emplPositionId =delegator.getNextSeqId("EmplPosition");
							
							java.sql.Timestamp dateOfJoiningTimestamp = new java.sql.Timestamp(dateOfJoining.getTime());

					        Map EmployeeDetails = UtilMisc.toMap(
									"emplPositionId",emplPositionId,
									"statusId", "EMPL_POS_ACTIVE",
									"partyId", employeeId,																
									"emplPositionTypeId",designation,
									"officeId", officeId,
									"appointmentTypeId", appointmentType, 
									"actualFromDate", dateOfJoiningTimestamp,
									"serviceAction", "Joining",
									"dateOfAppointment", dateOfJoiningTimestamp,
									"cadreOfficeId", officeId, 
									"bandPay", basicPay, 
									"payScaleId", payScaleId,
									"estimatedFromDate", fromDate1,
									"estimatedThruDate", fromDate2									
									);
							GenericValue saveEmployeePosition = delegator.makeValue("EmplPosition", EmployeeDetails);
							saveEmployeePosition.create();

							if((middleName== null) &&(lastName== null))
								printName = firstName;
							if(((middleName== null)||(middleName== "")) && (lastName!= null))
								printName = firstName + " " + lastName;
							if(((lastName== null)||(lastName== "") ) && (middleName!= null))
								printName = firstName + " " + middleName;
							if((middleName!= null) &&(lastName!= null) && (firstName!= null))
								printName = firstName + " " + middleName+ " " + lastName;
							if(title != null)
								printName = title+" "+printName;
							
							List<EntityExpr> expList1 = new LinkedList<EntityExpr>();
			 				/*	List<EntityExpr> expList = FastList.newInstance();*/
								EntityCondition mainCondition1 = null;

								
								expList1.add(EntityCondition.makeCondition("statusId",EntityOperator.EQUALS, "PARTY_REL_ACTIVE"));
								mainCondition1 = EntityCondition.makeCondition(expList1,EntityOperator.AND);
									  List<GenericValue> resultList1 = new LinkedList<GenericValue>();
									//List<GenericValue> resultList = FastList.newInstance();
									try {
										resultList1 = delegator.findList("StatusItem",
												mainCondition1, UtilMisc.toSet("statusId"), null,
												null, false);
										if (UtilValidate.isEmpty(resultList1)) {
											 Map StatusItemmap = UtilMisc.toMap("statusId", "PARTY_REL_ACTIVE");
												GenericValue saveStatusItem = delegator.makeValue("StatusItem", StatusItemmap);
												saveStatusItem.create();
										}
									} catch (GenericEntityException e2) {
										e2.printStackTrace();
									}


							/*Map employeepersonalDetails = dispatcher.runSync(
									"createPersonalDetails", UtilMisc.toMap("partyId", employeeId,"employeeCode", employeeCode,
											"fatherHusbandName", fatherName,"motherName", motherName,"contactNumber2", contactNumber,
											"printName", printName, "dateOfSuperannuation", dateOfRetirement, "userLogin", userLogin));*/
							java.sql.Timestamp fromDate = UtilDateTime.nowTimestamp();

							if(UtilValidate.isNotEmpty(officeId))
							{
															
								List<EntityExpr> expList2 = new LinkedList<EntityExpr>();
				 				/*	List<EntityExpr> expList = FastList.newInstance();*/
									EntityCondition mainCondition2 = null;

									
									expList2.add(EntityCondition.makeCondition("partyRelationshipTypeId",EntityOperator.EQUALS, "OFFICE_TO_EMPLOYEE"));
									mainCondition2 = EntityCondition.makeCondition(expList2,EntityOperator.AND);
										  List<GenericValue> resultList2 = new LinkedList<GenericValue>();
										//List<GenericValue> resultList = FastList.newInstance();
										try {
											resultList2 = delegator.findList("PartyRelationshipType",
													mainCondition2, UtilMisc.toSet("partyRelationshipTypeId"), null,
													null, false);
											if (UtilValidate.isEmpty(resultList2)) {
												 Map RelationshipTypeIdMap = UtilMisc.toMap("partyRelationshipTypeId", "OFFICE_TO_EMPLOYEE");
													GenericValue saveRelationshipTypeId = delegator.makeValue("PartyRelationshipType", RelationshipTypeIdMap);
													saveRelationshipTypeId.create();
											}
										} catch (GenericEntityException e3) {
											e3.printStackTrace();
										}

								 
								 
								 Map officeParent = dispatcher.runSync("createPartyRelationship", UtilMisc.toMap("partyIdFrom",
										 officeId, "partyIdTo", employeeId, "roleTypeIdFrom",
										 "OFFICE", "roleTypeIdTo","EMPLOYEE", "partyRelationshipTypeId", "OFFICE_TO_EMPLOYEE", "userLogin", userLogin));
							}	
							
							/*if(UtilValidate.isNotEmpty(permanentAddress)){
								Map postalAddress = dispatcher.runSync("createPartyPostalAddress",
										UtilMisc.toMap("partyId", employeeId,"contactMechPurposeTypeId","GENERAL_LOCATION","address1", permanentAddress,
												"city","NA","postalCode","NA","userLogin", userLogin));
							}*/
							//Map emplReportsToDetails = dispatcher.runSync("createReportsToDetails", UtilMisc.toMap("selectedItem", officeId, "userLogin", userLogin));

							result.put(EmployeeConstants.SUCCESS_MESSAGE,UIMessages.getSuccessMessage(
									resource,EmployeeConstants.REGISTRATION_APPROVED_SUCCESSFULLY + " For ", printName, locale));	
						}
					} 
				}
			}catch (GenericServiceException e) {
				// Returning the result map with error message.

				result.put(EmployeeConstants.ERROR_MESSAGE, UIMessages
						.getErrorMessage(resource,
								EmployeeConstants.ERROR_MESSAGE, "",locale));

			}	
			catch (GenericEntityException e) {
				// Returning the result map with error message.

				result.put(EmployeeConstants.ERROR_MESSAGE, UIMessages
						.getErrorMessage(resource,
								EmployeeConstants.ERROR_MESSAGE, "",locale));
			}	
		}
		return result;
	}

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
    
    
    
	/*
	 * Should be moved to Framework util
	 * Need to check if already exist in framework
	 * 
	 */
	
	private static java.sql.Date convertToDate(String toBeConvertedDate) {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date d = null;
		try {
			d = df.parse(toBeConvertedDate);
		} catch (ParseException e1) {
		}
		// need to handle here if there is an exception
		// what should be the defalut value ??
		java.sql.Date sqlDate = new java.sql.Date(d.getTime());
		return sqlDate;
	}
	
	
	// Converts date from "dd/MM/yyyy" format to "yyyy-MM-dd hh:mm:ss.SSS" format. - Used when date is taken from UI and needs to be updated to database.
	private static java.sql.Timestamp convertToTimeStampDate(String toBeConvertedDate)
	{
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date d = null;
		java.sql.Timestamp sqlDate = null;
		try {
			d = df.parse(toBeConvertedDate);
		} catch (ParseException e1) {
		}
		// need to handle here if there is an exception
		// what should be the defalut value ??
		if(UtilValidate.isNotEmpty(d.getTime()))
		{
		sqlDate = new java.sql.Timestamp(d.getTime());
		}
		return sqlDate;
	}
	
	
	//Converts date from "yyyy-MM-dd hh:mm:ss.SSS" format to the same format - Used when current Timestamp is used as Date. 
	//Current timestamp behaviour is unpredictable. It takes 2 digits for seconds sometimes and 3 digits at times.
	// To overcome this we are using this conversion.
	private static java.sql.Timestamp convertStringToTimeStamp(String toBeConvertedDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		java.util.Date d = null;
		try {
			d = df.parse(toBeConvertedDate);
		} catch (ParseException e1) {
		}
		// need to handle here if there is an exception
		// what should be the defalut value ??
		java.sql.Timestamp sqlDate = new java.sql.Timestamp(d.getTime());
		return sqlDate;
	}
	
	
	
	// Converts the first letter of every word in a sentence, to upper case.
	
	private static String convertFirstLetterToUpper(String value) {

		final StringTokenizer st = new StringTokenizer(value, " ", true);
		final StringBuilder sb = new StringBuilder();

		while (st.hasMoreTokens()) {
			String token = st.nextToken();
			token = String.format("%s%s", Character
					.toUpperCase(token.charAt(0)), token.substring(1));
			sb.append(token);
		}

		return sb.toString();

	}
    
}
