package thread;

public class MyThread extends Thread {
	String data;
	
	public MyThread(String data) {
		this.data = data;
	}
	
	// 쓰레드로 만들 시 수행할 메소드
	// 해당 쓰레드가 수행할 작업
	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			System.out.println(data);
			// Thread.sleep(n) : n 밀리초동안 잠시 멈춤
			try { sleep(1000); } catch (InterruptedException e) {}
		}
	}
}
