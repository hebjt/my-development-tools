package util;

public class TimeOutException extends RuntimeException {
	/**
	 * 超时异常
	 * 继承运行时异常
	 */
	private static final long serialVersionUID = 8072736381640203543L;

	public TimeOutException(String errMessage) {
		super(errMessage);
	}
}
