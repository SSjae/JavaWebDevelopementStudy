package com.delivery.action;

public class ActionTo {
	private String path;
  
	private boolean isRedirect;
  
	public String getPath() {
		return this.path;
	}
  
	public void setPath(String path) {
		this.path = path;
	}
  
	public boolean isRedirect() {
		return this.isRedirect;
	}
  
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}