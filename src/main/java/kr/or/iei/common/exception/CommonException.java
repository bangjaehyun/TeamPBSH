package kr.or.iei.common.exception;

import java.util.ArrayList;

//사용자 정의 예외
public class CommonException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private String errorCode;
	private String systemMsg;
	private String userMsg;
	private Object data;

	public CommonException() {
		super();
	}

	public CommonException(String msg) {
		super(msg);
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getSystemMsg() {
		return systemMsg;
	}

	public void setSystemMsg(String systemMsg) {
		this.systemMsg = systemMsg;
	}

	public String getUserMsg() {
		return userMsg;
	}

	public void setUserMsg(String userMsg) {
		this.userMsg = userMsg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
