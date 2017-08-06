/*******************************************************************************
 * Copyright (c) 2014 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/
package org.apache.ofbiz.humanres.hrmsOfficeexception;

import org.apache.ofbiz.base.util.GeneralException;

public class FacilityException extends GeneralException{
	private static final long serialVersionUID = 1L;

	public FacilityException()
	{
		super();
	}
	public FacilityException(String message)
	{
		super(message);
	}
	
	public FacilityException(Throwable nested) {
	        super(nested);
	}
	
    public FacilityException(String str, Throwable nested) {
        super(str, nested);
    }
	
}
