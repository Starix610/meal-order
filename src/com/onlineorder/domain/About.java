package com.onlineorder.domain;

import java.util.List;

public class About {
	private String id;
	private String name;
	private String address;
	private String contact;
	private String telephone;
	private String desc_path;
	private List<String> allDescLines;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getDesc_path() {
		return desc_path;
	}
	public void setDesc_path(String desc_path) {
		this.desc_path = desc_path;
	}
	public List<String> getAllDescLines() {
		return allDescLines;
	}
	public void setAllDescLines(List<String> allDescLines) {
		this.allDescLines = allDescLines;
	}
	
}
