package kr.co.fedal.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//signup.jsp에서 작성한 것들의 유효성을 검사
public class SignupRequestValidator implements Validator {
	// 이메일의 정규표현
	private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
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
			errors.rejectValue("email", "required", "필수 정보 입니다.");
		} else {
			Matcher matcher = pattern.matcher(regReq.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "bad", "올바르지 않은 형식입니다.");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required", "아이디를 입력해주세요.");
		ValidationUtils.rejectIfEmpty(errors, "password", "required", "패스워드를 입력해주세요.");
		ValidationUtils.rejectIfEmpty(errors, "password2", "required", "패스워드가 일치하지 않습니다.");
		ValidationUtils.rejectIfEmpty(errors, "nickname", "required", "닉네임을 입력해주세요.");
		if (!regReq.getPassword().isEmpty()) {
			if (!regReq.isPwEqualToCheckPw()) {
				errors.rejectValue("password2", "nomatch", "패스워드가 일치하지 않습니다.");
			}
		}
	}

}
