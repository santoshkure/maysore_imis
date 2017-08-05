package org.apache.ofbiz.humanres.hrmsOfficeexeption;

public class CheckUserIsEmployeeException extends OfficeSetUpException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CheckUserIsEmployeeException() {
		super();
	}

	public CheckUserIsEmployeeException(String message) {
		super(message);
	}

	public CheckUserIsEmployeeException(Throwable nested) {
		super(nested);
	}

	public CheckUserIsEmployeeException(String str, Throwable nested) {
		super(str, nested);
	}
}
