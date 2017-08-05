package org.apache.ofbiz.humanres.hrmsOfficeexeption;

import org.apache.ofbiz.base.util.GeneralException;

public class OfficeSetUpException extends GeneralException {
	

	private static final long serialVersionUID = 1L;

	public OfficeSetUpException()
	{
		super();
	}
	public OfficeSetUpException(String message)
	{
		super(message);
	}
	
	public OfficeSetUpException(Throwable nested) {
	        super(nested);
	}
	
    public OfficeSetUpException(String str, Throwable nested) {
        super(str, nested);
    }
}
