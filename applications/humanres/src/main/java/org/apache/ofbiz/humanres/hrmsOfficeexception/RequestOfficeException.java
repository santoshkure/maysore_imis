package org.apache.ofbiz.humanres.hrmsOfficeexception;

import org.apache.ofbiz.base.util.GeneralException;

public class RequestOfficeException extends GeneralException {
	

	private static final long serialVersionUID = 1L;

	public RequestOfficeException()
	{
		super();
	}
	public RequestOfficeException(String message)
	{
		super(message);
	}
	
	public RequestOfficeException(Throwable nested) {
	        super(nested);
	}
	
    public RequestOfficeException(String str, Throwable nested) {
        super(str, nested);
    }
}
