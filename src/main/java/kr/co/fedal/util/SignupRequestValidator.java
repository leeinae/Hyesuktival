package kr.co.fedal.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//signup.jsp���� �ۼ��� �͵��� ��ȿ���� �˻�
public class SignupRequestValidator implements Validator {
	//�̸����� ����ǥ��
	private static final String emailRegExp =
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;

	public SignupRequestValidator() {
	        pattern = Pattern.compile(emailRegExp);
	    }

	@Override
	public boolean supports(Class<?> clazz) {
		return SignupRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		SignupRequest regReq = (SignupRequest) target;

		if (regReq.getEmail() == null || regReq.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "required", "�ʼ� ���� �Դϴ�.");
		} else {
			Matcher matcher = pattern.matcher(regReq.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "bad", "�ùٸ��� ���� �����Դϴ�.");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required", "���̵� �Է����ּ���.");
		ValidationUtils.rejectIfEmpty(errors, "password", "required", "�н����带 �Է����ּ���.");
		ValidationUtils.rejectIfEmpty(errors, "password2", "required", "�н����尡 ��ġ���� �ʽ��ϴ�.");
		ValidationUtils.rejectIfEmpty(errors, "nickname", "required", "�г����� �Է����ּ���.");
		if (!regReq.getPassword().isEmpty()) {
			if (!regReq.isPwEqualToCheckPw()) {
				errors.rejectValue("password2", "nomatch", "�н����尡 ��ġ���� �ʽ��ϴ�.");
			}
		}
	}

}
