package thread;

public class ThreadMain {
	public static void main(String[] args) {
//		MyThread t1 = new MyThread("☆");
//		MyThread t2 = new MyThread("★");
//		
//		t1.start();
//		t2.start();
		
		MyRunnable r1 = new MyRunnable("♡");
		MyRunnable r2 = new MyRunnable("♥");
		
		Thread t3 = new Thread(r1);
		Thread t4 = new Thread(r2);
		
		System.out.println("-----출력시작-----");
		t3.start();
		t4.start();
		
		// thread객체.join() : 이 쓰레드의 작업 수행 동안 다른 쓰레드를 멈추기
		try {
			t3.join();
			t4.join();
		} catch (InterruptedException e) {}
		
		System.out.println("-----출력끝-----");
	}
}