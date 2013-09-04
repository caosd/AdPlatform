package com.stomato.exception;

public class ServiceException extends Exception {

	private static final long serialVersionUID = 3289828510676648143L;

	public ServiceException() {
		super();
	}

	public ServiceException(String message) {
		super( message );
	}

	public ServiceException(String message, Throwable cause) {
		super( message , cause );
	}

	public ServiceException(Throwable cause) {
		super( cause );
	}
}
