package org.apache.ofbiz.humanres.hrmsOfficeexception;

public class DuplicateOfficeException extends OfficeSetUpException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DuplicateOfficeException() {
		super();
	}

	public DuplicateOfficeException(String message) {
		super(message);
	}

	public DuplicateOfficeException(Throwable nested) {
		super(nested);
	}

	public DuplicateOfficeException(String str, Throwable nested) {
		super(str, nested);
	}
}
