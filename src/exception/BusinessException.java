package exception;


public class BusinessException extends RuntimeException {
	private static final long serialVersionUID = 3152616724785436891L;

	public BusinessException(String frdMessage) {
		super(createFriendlyErrMsg(frdMessage));
	}

	public BusinessException(Throwable throwable) {
		super(throwable);
	}

	public BusinessException(Throwable throwable, String frdMessage) {
		super(throwable);
	}

	private static String createFriendlyErrMsg(String msgBody) {
		String prefixStr = "��Ǹ��";
		String suffixStr = " ���Ժ����Ի������Ա��ϵ��";

		StringBuffer friendlyErrMsg = new StringBuffer("");

		friendlyErrMsg.append(prefixStr);

		friendlyErrMsg.append(msgBody);

		friendlyErrMsg.append(suffixStr);

		return friendlyErrMsg.toString();
	}
}
