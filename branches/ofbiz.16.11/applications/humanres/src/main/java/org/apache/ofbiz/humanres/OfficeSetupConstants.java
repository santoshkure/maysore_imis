package org.apache.ofbiz.humanres;

public interface OfficeSetupConstants {

	public static final String PARENT_OFFICE = "WRDMP";

	/*
	 * Error Message Constants
	 */
	public static final String ERROR_MESSAGE = "errorMessage";

	public static final String OFFICE_CANNOT_BE_EMPTY = "createOffice.empty_office";

	public static final String CANNOT_CREATE_OFFICE = "createOffice.cant_create_office";

	public static final String CANNOT_UPDATE_OFFICE_ADDRESS = "createOffice.cant_update_address_of_office";

	public static final String CANNOT_CREATE_OFFICE_WITHOUT_PARENT = "createOffice.cant_create_office_withoutparent";

	public static final String DUPLICATE_OFFICE = "createOffice.cant_create_duplicate_office";

	public static final String OFFICE_ID_EMPTY = "getOfficedetail.officeid_empty";

	public static final String ERROR_GETTING_OFFICE_DETAIL = "getOfficedetail.error_getting_office_detail";

	public static final String ERROR_GETTING_OFFICE_EMPLOYEES = "updateofficeDetail.error_getting_office_employees";

	public static final String CANNOT_UPDATE_OFFICE = "updateofficeDetail.cannot_update_office";

	public static final String CANNOT_UPDATE_ADDRESS_OF_OFFICE = "updateofficeDetail.cant_update_address_of_office";

	public static final String CANNOT_CREATE_PARENT_OF_WRDMP = "updateofficeDetail.cannot_create_parent_of_wrdmp";

	public static final String CANNOT_UPDATE_PARENTOFFICE = "updateofficeDetail.cannot_update_parentoffice";

	public static final String CANNOT_UPDATE_OFFICENAME = "updateofficeDetail.cannot_update_officename";

	public static final String CANNOT_UPDATE_OFFICETYPE = "updateofficeDetail.cannot_update_officetype";

	public static final String CAN_NOT_DISABLE_OFFICE = "updateofficeDetail.cannot_Disable_office";

	public static final String CANNOT_DELETE_OFFICE = "deleteOffice.cannot_delete_office";

	public static final String ERROR_DELETE_OFFICE = "deleteOffice.error_delete_office";

	public static final String OFFICE_DELETED = "deleteOffice.office_deleted_successfully";

	public static final String SUCCESS_MESSAGE = "successMessage";

	public static final String OFFICE_CREATED = "createOffice.office_created";

	public static final String OFFICE_UPDATED = "updateofficeDetail.office_updated";

	public static final String DESIGNATION_STATUS = "EMPL_POS_ACTIVE";

	public static final String CANNOT_COUNT_EMPLOYEE = "countOfficeEmployees.cannot_count_employee";

	public static final String CANNOT_FIND_SUBOFFICE = "getSubOffices.cannot_find_suboffices";

	public static final String INCUMBENCY_CREATED = "INCUMBENCY_CREATED_SUCCESSFULLY";

	public static final String ROLE_CREATED = "ROLE_CREATED_SUCCESSFULLY";

	public static final String EMPL_DETAILS_CREATED = "EMPLOYEE_DETAILS_UPDATED_SUCCESSFULLY";

	public static final String ERROR_ROLE_CREATE = "ERROR_CREATE_ROLE";

	public static final String ERROR_EMPL_DETAILS_CREATED = "ERROR_EMPLOYEE_DETAILS_UPDATE";

	public static final String INCUMBENCY_UPDATED = "manpowermaster.updated_record";
	public static final String Status_Updated = "Travel Tour Status Updated.";

	public static final String Group_A = "Group A";

	public static final String Group_B = "Group B";

	public static final String Group_C = "Group C";

	public static final String Group_D = "Group D";

	public static final String Group_0 = "Group 0";

	// ********************************************************************************************************
	// Employee related Constants
	// ********************************************************************************************************

	public static final String PARTY_ROLE_TYPE = "OFFICE";

	public static final String OFFICE = "Office";

	public static final String EMPLOYEE_ROLE_TYPE = "EMPLOYEE";

	public static final String PARTY_GROUP = "PARTY_GROUP";

	public static final String HOD_ROLE = "HOD";

	public static final String HOO_ROLE = "HOO";

	public static final String OFFICE_TYPE = "IMIS";

	public static final String PARTY_ENABLED = "PARTY_ENABLED";

	public static final String PARTY_DISABLED = "PARTY_DISABLED";

	public static final String CHECK_EMPLOYEE_ROLE = "entered.hoo.notan.employee";

	public static final String PARTY_RELATIONSHIP_TYPE_ID = "CHILD";

	public static final String[] OFFICE_TYPES = { "PWD", "IMIS", "EIC", "Region", "Circle", "Division", "Sub Division",
			"Section" };
	/*
	 * Pagination section
	 */
	public static final int DEFAULT_LIST_SIZE = 10;

	public static final int DEFAULT_PAGE = 0; // Zero is first page

	public static final String CLASS_ZERO = null;

	public static final String CLASS_ONE = null;

	public static final String CLASS_TWO = null;

	public static final String CLASS_THREE = null;

	public static final String CLASS_FOUR = null;

	public static String APPROVED_SUCCESSFULLY = "Record Approved Successfully.";
	public static int viewSize = 10;
	public static String SAVE_SUCCESSFULLY = "Record Saved Successfully.";
	public static String RECORD_UPDATE_SUCCESSFULLY = "Record Updated Successfully.";
	public static String RECORD_APPROVE_SUCCESSFULLY = "Record Approved Successfully.";
	public static String RECORD_Compassionate_Approved = "Compassionate Approved Successfully.";
	public static String RECORD_REMOVED_SUCCESSFULLY = "Record Removed Successfully.";

}
