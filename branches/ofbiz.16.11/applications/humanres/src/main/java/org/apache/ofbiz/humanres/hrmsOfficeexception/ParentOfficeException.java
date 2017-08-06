package org.apache.ofbiz.humanres.hrmsOfficeexception;

public class ParentOfficeException extends OfficeSetUpException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ParentOfficeException() {
		super();
	}

	public ParentOfficeException(String message) {
		super(message);
	}

	public ParentOfficeException(Throwable nested) {
		super(nested);
	}

	public ParentOfficeException(String str, Throwable nested) {
		super(str, nested);
	}
}
