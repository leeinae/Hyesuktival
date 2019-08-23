package kr.co.fedal.exception;

public class AlreadyExistingIdException extends RuntimeException {
	public AlreadyExistingIdException(String message) {
		super(message);
	}
}
