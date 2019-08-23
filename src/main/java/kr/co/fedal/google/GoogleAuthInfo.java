package kr.co.fedal.google;

public class GoogleAuthInfo {
	private String clientId, clientSecret;

	public String getClientId() {
		return clientId;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public GoogleAuthInfo(String clientId, String clientSecret) {
		super();
		this.clientId = clientId;
		this.clientSecret = clientSecret;
	}

}
