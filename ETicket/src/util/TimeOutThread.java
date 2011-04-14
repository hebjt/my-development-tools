package util;

/**
 * 本线程设置了一个超时时间 该线程开始运行后，经过指定超时时间， 
 * 该线程会抛出一个未检查异常通知调用该线程的程序超时
 * 在超时结束前可以调用该类的cancel方法取消计时
 */
public class TimeOutThread extends Thread {
	/**
	 * 计时器超时时间
	 */
	private long timeOut;

	/**
	 * 计时是否被取消
	 */
	private boolean isCanceled = false;

	/**
	 * 当计时器超时时抛出的异常
	 */
	private TimeOutException timeOutException;
	

	/**
	 * 构造器
	 * 
	 * @param timeOut
	 * @param timeOutErr
	 * 指定超时的时间
	 */
	public TimeOutThread(long timeOut, TimeOutException timeOutErr) {
		super();
		this.timeOut = timeOut;
		this.timeOutException = timeOutErr;
		// 设置本线程为守护线程
		this.setDaemon(true);
	}

	/**
	 * 取消计时
	 */
	public synchronized void cancel() {
		isCanceled = true;
	}

	/**
	 * 启动超时计时器
	 * @throws TimeOutException 
	 */
	public void run(){
		try {
			Thread.sleep(timeOut);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if (!isCanceled){
			throw timeOutException;
		}
	}
}
