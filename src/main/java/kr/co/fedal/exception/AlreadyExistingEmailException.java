package kr.co.fedal.exception;

public class AlreadyExistingEmailException extends RuntimeException {
	public AlreadyExistingEmailException(String message) {
		super(message);
	}
}
