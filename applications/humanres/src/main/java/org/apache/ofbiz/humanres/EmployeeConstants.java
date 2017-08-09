package org.apache.ofbiz.humanres;

public interface EmployeeConstants {

	
	/*
	 *   Error Message Constants
	 */
	public static final String Registered_Successfully = "Registered Successfully.";
	
	public static final String UPDATED_SUCCESS = "Registration has been Updated Successfully.";
	
	public static final String UNABLE_TO_UPDATE = "Unable to Updated Details.";
	
	public static final String REGISTRATION_REVERTED_SUCCESSFULLY = "Registration has been Reverted Successfully.";
    
    public static final String REGISTRATION_APPROVED_SUCCESSFULLY = "Registration has been Approved Successfully.";
	
	public static final String EMPLOYEE_ID_CANNOT_BE_EMPTY = "createemployee.empty_employee_id";
	
	public static final String CANNOT_CREATE_EMPLOYEE = "createemployee.cant_create_employee";

	public static final String EMPL_POS_PENDING_APPROVAL = "EMPL_POS_PENDING_APPROVAL";

	public static final String EMPL_POS_ACTIVE = "EMPL_POS_ACTIVE";
	
	public static final String EMPL_PARTY_REL_ACTIVE = "PARTY_REL_ACTIVE";
	
	public static final String EMPL_PARTY_REL_INACTIVE = "PARTY_REL_INACTIVE";
	
	public static final String[] ROLE_HEIRARCHY = {"GLOBAL_ADMIN","HOO","LOCAL_ADMIN","ACTIVITY_ADMIN","EMPLOYEE"}; //Edited by nidhi
	
	public static final String DUPLICATE_EMPLOYEEID = "createemployee.cant_create_duplicate_employee_id";
	
	public static final String CANNOT_CREATE_EMPLOYEE_PERSONAL_DETAILS = "createemployee.cant_create_employee_personal_details";
	
	public static final String CANNOT_CREATE_EMPLOYEE_EDUCATIONAL_DETAILS = "createemployee.cant_create_employee_educational_details";

	public static final String CANNOT_CREATE_DUPLICATE_GPFACCOUNTNUMBER = "createemployee.cant_create_duplicate_gpf_account_number";
	

	public static final String NO_PARTY_FOUND= "createemployee.no_partyid_found_for_party";
	
	public static final String CANNOT_RETRIEVE_DATA_FROM_GPFACCOUNT= "cant_retrieve_data_from_gpf_account";
	
	public static final String CANNOT_RETRIEVE_DATA_FROM_PARTY= "cant_retrieve_data_from_party";
	
	public static final String CANNOT_RETRIEVE_DATA_FROM_PARTYROLE= "cant_retrieve_data_from_party_role";
	
	public static final String NO_EMPLOYEE_POSITION_ID_FOUND= "createemployee.cant_create_official_details_without_employee_position_id";
		
	public static final String CANNOT_CREATE_EMPLOYEE_DETAILS = "createemployee.cant_create_employee_quick_details";
	
	public static final String CANNOT_CREATE_EMPLOYEE_PERSONAL_ASSETS_DETAILS = "createemployee.cant_create_employee_personal_assets_details";
	
	public static final String CANNOT_CREATE_EMPLOYEE_FAMILY_DETAILS = "createemployee.cant_create_employee_family_details";
	
	public static final String CANNOT_UPDATE_EMPLOYEE_PERSONAL_DETAILS = "createemployee.cant_update_employee_personal_details";
	
	public static final String CANNOT_CREATE_PERSONAL_ASSETS_WITHOUT_ASSETID = "createemployee.cant_create_employee_personal_assets_without_id";
	
	public static final String CANNOT_CREATE_PARTY_POSTAL_ADDRESS = "createemployee.cant_create_party_postal_address";
	
	public static final String EMPLOYEE_PERSONAL_DETAILS_CREATED = "createemployee.employee_personal_details_created_successfully";
	
	public static final String EMPLOYEE_PERSONAL_ASSETS_CREATED = "createemployee.employee_personal_assets_details_created_successfully";

	public static final String EMPLOYEE_PERSONAL_FAMILY_DETAILS_CREATED = "createemployee.employee_personal_family_details_created_successfully";

	public static final String EMPLOYEE_DETAILS_CREATED = "createemployee.employee_quick_add_details_created_successfully";
	
	public static final String EMPLOYEE_ID_EMPTY = "getemployee.employee_id_empty";
	
	public static final String ERROR_GETTING_PERSONAL_DETAIL = "getemployee.error_while_getting_employee_details";
	
	public static final String ERROR_GETTING_ADDRESS_DETAIL = "getemployee.error_while_getting_employee_details";
	
	public static final String ERROR_GETTING_FAMILY_INFORMATION_DETAIL = "getemployee.error_while_getting_employee_family_details";
	
	public static final String GENERAL_LOCATION = "GENERAL_LOCATION";
	
	public static final String ERROR_GETTING_ASSETS_DETAIL = "getemployee.error_while_getting_employee_assets_details";
	
	public static final String NO_CONTACTMECHID_FOR_PERMANENT_ADDRESS = "createemployee.employee_contactmechid_not_found_for_permanent_address";
	
	public static final String NO_CONTACTMECHID_FOR_PRESENT_ADDRESS = "createemployee.employee_contactmechid_not_found_for_present_address";
	
	public static final String NO_CONTACTMECHID_FOR_TELECOM_NUMBER = "createemployee.employee_contactmechid_not_found_for_telecom_number";
	
	public static final String NO_CONTACTMECHID_FOR_EMAIL_ADDRESS = "createemployee.employee_contactmechid_not_found_for_email_address";
	
	public static final String PHONE_MOBILE = "PHONE_MOBILE";
	
	public static final String PHONE_HOME = "PHONE_HOME";
	
	public static final String PHONE_QUICK = "PHONE_QUICK";
	
	public static final String PRIMARY_EMAIL = "PRIMARY_EMAIL";

    //public static final String SUCCESS_MESS="successMessage";
    
    public static final String ERROR_GETTING_CONTACT_DETAIL = "getemployee.error_while_getting_contact_details";
	
    public static final String CANNOT_UPDATE_IN_EMPL_DETAILS = "cannot.update.in.empl.details";

	public static final String CANNOT_CREATE_ADDITIONAL_DETAILS = "cant_create_additional_details";
	
	public static final String SUCCESS_PERSONAL_DETAILS = "success.personal.details";

	public static final String SUCCESS_CONTACT_DETAILS = "success.contact.details";

	public static final String SUCCESS_EDUCATIONAL_DETAILS = "success.educational.details";

	public static final String SUCCESS_ADDITIONAL_DETAILS = "success.additional.details";
	
	public static final String SUCCESS_REC_DETAILS = "Recruitment details are saved successfully. For Employee Code:";


    //Added By Vanitha 

	//Added By Manu
	
	//Modified Date : 5th June 
	//Modified By : Prashant
	//Reason : To display Suspended Employees in list. (I replaced the below commented line with below line,Added EMPL_POS_SUSPENDED status)
	public static final String[] DESIGNATION_STATUS = {"EMPL_POS_ACTIVE","EMPL_POS_PENDING_APPROVAL","EMPL_POS_SUSPENDED"};
  //public static final String[] DESIGNATION_STATUS = {"EMPL_POS_ACTIVE","EMPL_POS_PENDING_APPROVAL"};
	
	public static final String PARTY_STATUS = "PARTY_ENABLED";
	
	public static final String EMPLOYEE_CANNOT_FOUND = "employee_cannot_found";

	public static final String USER_CANNOT_ABLE_TO_SEARCH = "user_cannot_search_employee";
		
	
	public static final String PARTY_TYPE = "PERSON";
	
	public static final String PARTY_RELATIONSHIP = "REPORTS_TO";
	
	public static final String[] PARTY_RELATIONSHIP_STATUS = {"PARTY_REL_ACTIVE","PARTY_REL_INACTIVE"};

	public static final String DUPLICATE_ADDITIONAL_DEDUCTIONS = "alloctaion_deduction_already_exists_for_employee";

	public static final String CANNOT_CREATE_EMPLOYEE_ALLOCATION_DETAILS = "cannot_save_allocation_details";	
	
	public static final String EMPLOYEE_ALLOCATION_DETAILS_CREATED = "allocation_details_successfully_saved";

	public static final String VEHICLE_CHARGE= "VC";
	
	//Modified Date 30.06/2010
	public static final String HOUSE_RENT= "HRR";
	
	public static final String ERROR_GETTING_ALLOCATION_DETAILS= "error_in_getting_allocation_details";
	
	
	public static final String VEHICLE_ALLOCATION_DETAILS= "vehicle_allocation_details_successfully_saved";
	
	public static final String VEHICLE_ALLOCATION_DETAILS_UPDATED= "vehicle_allocation_details_successfully_updated";
	
	public static final String QUARTER_ALLOCATION_DETAILS_UPDATED= "quarter_allocation_details_successfully_updated";
	
	public static final String QUARTER_ALLOCATION_DETAILS= "quarter_allocation_details_successfully_saved";
	
	public static final String ERROR_VEHICLE_ALLOCATION_DETAILS= "Failure_while_saving_vehicle_allocation_details";
	
	public static final String ERROR_QUARTER_ALLOCATION_DETAILS= "Failure_while_saving_quarter_allocation_details";
	
	public static final String ERROR_QUARTER_ALLOCATION_DETAILS_UPDATE= "Failure_while_updating_quarter_allocation_details";
	
	public static final String ERROR_VEHICLE_ALLOCATION_DETAILS_UPDATE= "Failure_while_updating_vehicle_allocation_details";
	
	public static final String NO_ROLE_FOUND_FOR_PARTY = "no_role_found_for_party";
	
	public static final String DDO_ROLE = "PAYROLL_DDO";
	
	public static final String PROBATION_ACTION = "PROBATION";
	/*
	 *  Pagination section
	 */
	public static final int DEFAULT_LIST_SIZE = 10;
	
	public static final int DEFAULT_PAGE = 0; // Zero is first page

	public static final String ERROR_MESSAGE = "error message";

	public static int viewSize = 10;

	//Added By Manu
	
	
	
	
	// Added By BalaKrishna

	public static final String SUCCESS_MESSAGE= "successMessage";
	public static final String ERROR_MESSAGE_PF= "Unabletocreate.error_PF";
	public static final String SUBSCRIPTION_CREATED_PF= "createSubscription.Subscription_created_PF";
	public static final String DUPLICATE_EMPLOYEE_PF= "createsubscription.duplicate_PF";
	public static final String UPDATE_SUBSCRIPTION_CREATED_PF= "updatesubscription.created_PF";
	public static final String DUPLICATE_ACCOUNT_PF= "createsubscription.duplicate_account_PF";
	
	public static final String ERROR_MESSAGE_ALLOWANCE= "Unabletocreate.error_allowance";
	public static final String SUBSCRIPTION_CREATED_ALLOWANCE= "createSubscription.Subscription_created_allowance";
	public static final String DUPLICATE_EMPLOYEE_ALLOWANCE= "createsubscription.duplicate_allowance";
	public static final String UPDATE_ALLOWANCE_CREATED_PF= "updateallowance.created_PF";
	
	public static final String ERROR_MESSAGE_INSURANCE= "Unabletocreate.error_insurance";
	public static final String SUBSCRIPTION_CREATED_INSURANCE= "createSubscription.Subscription_created_insurance";
	public static final String SUBSCRIPTION_UPDATED_INSURANCE= "createSubscription.Subscription_updated_insurance";
	public static final String DUPLICATE_EMPLOYEE_INSURANCE= "createsubscription.duplicate_insurance";
	
	public static final String ERROR_MESSAGE_DEDUCTION= "Unabletocreate.error_deduction";
	public static final String SUBSCRIPTION_CREATED_DEDUCTION= "createSubscription.Subscription_created_deduction";
	public static final String DUPLICATE_EMPLOYEE_DEDUCTION= "createsubscription.duplicate_deduction";
	public static final String UPDATE_DEDUCTION_CREATED_PF= "updateallowance.created_PF";
	
	public static final String ERROR_GETTING_SUBSCRPTION_PF_DETAIL = "cannot_retrieve_subscription_details";
	
	public static final String ERROR_MESSAGE_List_PF= "listoffundsubscriptions.Failure_togetdata_PF";

	public static final String SUBSCRIPTION_CREATED_GPF= "createSubscription.Subscription_created_GPF";
	
	public static final String SUBSCRIPTION_CREATED_GISINSURANCE= "createSubscription.Subscription_created_gis_insurance";
	
	public static final String CANNOT_CREATE_EMPLOYEE_OFFICIALS_DETAILS_WITH_DUPLICATE_FROMDATE = "createemployee.cant_create_employee_officials_details_with_duplicate_fromdate";
	
	
	// Added By BalaKrishna


	
	//Service Book : Added By Manohar 
	
	public static final String CANNOT_CREATE_SERVICE_BOOK_NOTES = "servicebookservices.cannot_create_service_book_notes";
	
	public static final String CANNOT_UPDATE_SERVICE_BOOK_NOTES = "cannot_update_service_book_notes";
	
	public static final String SERVICE_BOOK_NOTE_UPDATED = "servicebooknote_successfully_updated";
	
	public static final String CANNOT_CREATE_SERVICE_BREAK_RECORDS= "servicebookservices.cannot_create_service_break_records";
	
	public static final String SERVICE_BOOK_NOTE= "service_book_notes_successfully_saved";
	
	public static final String CANNOT_RETRIEVE_DATA_FROM_SERVICE_PERIOD = "cannot_retrieve_service_period_record";
	
	public static final String SERVICE_BREAK_RECORDS= "servicebookservices.service_break_records_successfully_saved";

	public static final String FAMILY_DEPENDANTS_DETAILS = "Family_dependants_details_successfully_saved";
	
	public static final String ERROR_FAMILY_DEPENDANT_DETAILS_UPDATED = "Failure_while_updating_family_dependants_details";
	
	public static final String FAMILY_DEPENDANTS_DETAILS_UPDATED = "Family_dependants_details_successfully_updated";
	
	public static final String ERROR_GETTING_DEPENDANT_DETAILS = "Error_getting_in_family_dependant_details";
	
	public static final String MEMBER_EMPLOYEE_DETAILS = "Member_employee_details_successfully_saved";
	
	public static final String MEMBER_EMPLOYEE_DETAILS_UPDATED = "Member_employee_details_successfully_updated";
	
	public static final String ERROR_MEMBER_EMPLOYEE_DETAILS = "Error_while_saving_member_employee_details";
	
	public static final String ERROR_FAMILY_DEPENDANT_DETAILS = "Error_while_saving_family_dependant_details";
	
	public static final String ERROR_MEMBER_EMPLOYEE_DETAILS_UPDATE = "Error_while_updating_member_employee_details";

	public static final String EMPLOYEE_ASSET_DETAILS = "Asset_details_successfully_saved";
	
	public static final String EMPLOYEE_ASSET_DETAILS_UPDATED = "Asset_details_successfully_updated";
	
	public static final String ERROR_CREATE_ASSET_DETAILS = "Failur_while_saving_asset_details";
	
	public static final String ERROR_UPDATE_ASSET_DETAILS = "Failur_while_updating_asset_details";
	
	public static final String ERROR_GETTING_ASSET_DETAILS = "Error_getting_in_asset_details";
	
	public static final String PARTY_NOT_FOUND= "party_not_found";

	public static final String NO_PERMISSION_FOUND_FOR_PARTY = "No_permission_to_view_other_office_details";
	
	public static final String[] PARTY_GROUP_NAME = {"Department","Office"};
	//Service Book : Added By Manohar 
	
	//Employee Position : Added By BalaKrishna
	
	
	public static final String CANNOT_CREATE_EMPLOYEE_POSITION_DETAILS = "createemployee.cant_create_employee_positions_details";
	public static final String CANNOT_UPDATE_EMPLOYEE_POSITION_DETAILS = "createemployee.cant_update_employee_positions_details";
	public static final String EMPLOYEE_POSITION_DETAILS_UPDATED = "createemployee.employee_positions_details_updated_successfully";
	public static final String EMPLOYEE_POSITION_DETAILS_CREATED = "createemployee.employee_positions_details_created_successfully";
	public static final String CANNOT_CREATE_EMPLOYEE_POSITION_DETAILS_WITHOUT_UPDATION ="createemployee.cant_create_employee_positions_details_without_updation_older_thrudate";
	public static final String CANNOT_CREATE_EMPLOYEE_POSITION_DETAILS_WITH_DUPLICATE_FROMDATE ="createemployee.cant_create_employee_positions_details_with_duplicate_fromdate";
	public static final String EMPL_PARTY_REL_DELETED = "PARTY_REL_DELETED";
	public static final String EMPL_POSITION_DELETED = "EMPL_POS_DELETED";
	public static final String EMPL_POS_INACTIVE = "EMPL_POS_INACTIVE";
	public static final String RECORD_ALREADY_UPDATED = "record_already_updated";
	
	//Employee Position : Added By BalaKrishna
	
	//Official Details : Added By Yashaswini
	
	//For List of Reports To
	public static final String NO_OFFICIAL_DETAILS_FOUND = "no_official_details_found";
	
	public static final String EMPL_PRL_REL_TYPE = "OFFICE_TO_EMPLOYEE";
	
	public static final String NO_OFFICE_ID_FOUND = "no_office_id_found";
	//For List of Reports To
	
	public static final String NO_PREV_REPORTS_TO_FOUND = "no_prev_reportsTo_details_found";
	
	public static final String NO_REPORTS_TO_FOUND= "createemployee.cant_create_official_details_without_reportsTo_partyId";
	
	public static final String REPORTS_TO_DOES_NOT_EXIST_IN_PARTY= "reportsTo_does_not_exist_in_party";
	
	public static final String NO_REPORTS_TO_ROLE_TYPE_FOUND= "createemployee.no_role_type_exist_for_reportee";
	
	public static final String CANNOT_CREATE_EMPLOYEE_OFFICIALDETAILS= "createemployee.cant_create_official_details";
	
	public static final String CANNOT_UPDATE_EMPLOYEE_OFFICIALDETAILS= "updateemployee.cant_update_official_details";
	
	public static final String EMPLOYEE_OFFICIAL_DETAILS_CREATED = "createemployee.employee_official_details_created_successfully";
	
	public static final String EMPLOYEE_OFFICIAL_DETAILS_UPDATED = "employee_official_details_updated_successfully";

	//Official Details : Added By Yashaswini

	//GPF Ledger
	public static final String EMPLOYEE_ADVANCE_FLAG = "ADVANCE";
	
	public static final String EMPLOYEE_WITHDRAWAL_FLAG = "WITHDRAWAL";
	
	public static final String EMPLOYEE_AW_STATUS = "AW_SANCTIONED";
	
	public static final String CANNOT_RETRIEVE_GPF_DETAILS = "cannot_retrieve_GPF_details";
	
	public static final String ERROR_GPF_DETAILS = "error_gpf_details";
	
	//Added By Yashaswini : To get Date Of Joining
	
	public static final String DATE_OF_JOINING_NOT_FOUND = "cannot_retrieve_DOJ";
	
	public static final String SERVICE_ACTION = "Joining";
	
	//Added By Bala : 01/07/2010
	public static final String TRANCTION_TYPE_ID_ANNUAL_GPF = "GPF_ANNUAL_INTEREST";
	
	public static final String GPFINTEREST_CREATED= "createGPF.InterestDetails_created_Successfully";
	
	public static final String TRANCTION_TYPE_ID_MONTHLY_GPF_CONT = "MONTHLY_GPF_CONT";
	
	public static final String TRANCTION_TYPE_ID_MONTHLY_GIS_CONT = "MONTHLY_GIS_CONT";
	
	public static final String[] OFFICE_TYPE = {"IMIS","EIC","Circle","Division","Sub Division", "Region", "Section", "PWD"};
	
	public static final String CANNOT_UPLOAD_PHOTO = "Can_Not_Upload_Photo";
	
	public static final String PHOTO_UPLOADED = "Photo_Uploaded_Successfully";
	//Added By Nishant Kumar 30-Aug-2012 1501
	public static final String DEPUTATION_DETAIL_SUCCESS = "Successfully Applied for Deputation";
	
	public static final String DEPUTATION_SUCCESS = "Deputation Details Saved Successfully.";
	
	public static final String REQUEST_APPROVED_SUCCESS = "Request Approved Successfully";
	
	public static final String DEPUTATION_DETAIL_SAVE_SUCCESS = "Deputation Confirmed Successfully";
	
	public static final String DEPUTATION_DETAIL_ERROR = "Unable to Apply for Deputation";
	// Added By Ankit Solankion on 03 oct 2012
	public static final String EMPL_REJECTED_SUCCESS="Employee Rejected Successfully";
	public static final String UNABLE_REJECT_EMPL="Unable to Reject Employee";
	public static final String DUPLICATE_EMPLOYEE_DEG = "createemployee.cant_create_duplicate_employee_deg";
	public static final String ERROR_PAY_SCALE_SAVE="Unable to save Pay Scale Details.";
	public static final String SUCCESS_PAYSCALE_DETAILS="Pay Scale Details of Employee Saved Successfully.";
	
	public static final String EMPLOYEE_SERVICE_HISTORY_SUCCESS = "Employee Service History Saved Successfully.";
	public static final String EMPLOYEE_SERVICE_HISTORY_UPDATE_SUCCESS = "Employee Service History Updated Successfully.";
	
	public static final String EMPLOYEE_TRAINING_HISTORY_SUCCESS = "Employee Training History Saved Successfully.";
	public static final String EMPLOYEE_TRAINING_HISTORY_ERROR = "Unable to Save Training Details.";
	
	//Added by Ravi K on 12-July-2014
	   public static final String EMPLOYEE_PROBATION_CONFIRMATION_ERROR = "Unable to Save Probation and Confirmation Details.";
	   public static final String EMPLOYEE_PROBATION_CONFIRMATION_SUCCESS = "Employee Probation and Confirmation Details Saved Successfully.";
	   
	   public static final String EMPLOYEE_PUNISHMENT_ERROR = "Unable to Save Punishment Details.";
	   public static final String EMPLOYEE_PUNISHMENT_SUCCESS = "Employee Punishment Details Saved Successfully.";
	   
	   public static final String EMPLOYEE_SUSPENSION_ERROR = "Unable to Save Suspension Details.";
	   public static final String EMPLOYEE_SUSPENSION_SUCCESS = "Employee Suspension Detail Saved Successfully.";
	//End of Addition   
	  
	  public static final String EMPLOYEE_ADVANCE_HISTORY_SUCCESS = "Employee Advance Details Saved Successfully.";
	  public static final String EMPLOYEE_ADVANCE_HISTORY_SUCCESS1 = "Employee Advance Details Updated Successfully.";
	  public static final String EMPLOYEE_ADVANCE_HISTORY_ERROR = "Unable to Save Advance Details.";
	  
	  public static final String EMPLOYEE_EARNED_LEAVE_HISTORY_SUCCESS = "Employee Earned Leave Details Saved Successfully.";
	  
	  public static final String SUCCESS_PROPERTY_DETAILS = "Employee Immovable Property Details Saved Successfully.";
	  public static final String SUCCESS_PROPERTY_DETAILS1 = "Employee Immovable Property Details Updated Successfully.";
	  public static final String SUCCESS_POST_DETAILS = "Employee Post Held Details Saved Successfully.";
	  public static final String EMPLOYEE_APPOINTMENT_HISTORY_SUCCESS = "Employee Appointment, Regularisation and Increment Details Saved Successfully.";
	  
	  public static final String EMPLOYEE_DEPUTATION_HISTORY_SUCCESS = "Employee Deputation Details Saved Successfully.";
	  
	  public static final String EMPL_CANNT_BE_REPORT_HIM_SELF = "Select another employee as Controlling Officer.";
	  
	  public static final String ERROR_FILE_UPLOAD_SIZE = "Unable to Upload file maximum file is 20 MB";
	  public static final String SUCCESS_UPLOADING_DOCUMENT = "File Uploaded Successfully"; 
	  public static final String ERROR_UPLOADING_DOCUMENT = "Error Uploading File";
	  public static final String ERROR_DEL_DOCUMENT = "Error Deleting File";
	  public static final String SUCCESS_DEL_DOCUMENT = "File Deleted Successfully";
	  public static final String EMPLOYEE_APPOINTMENT_HISTORY_UPDATE_SUCCESS = "Employee Appointment, Regularisation and Increment Details Updated Successfully.";


}
