package com.jhta.finalproject.yr.vo;

import java.sql.Date;

public class PointVo {
//	MNUM	NUMBER
//	BPAYNUM	NUMBER
//	TRANPOINT	NUMBER
//	PREGDATE	DATE

	private int mnum;
	private int bpaynum;
	private int tranpoint;
	private Date pregdate;
	
	public PointVo() {
		// TODO Auto-generated constructor stub
	}
	
	public PointVo(int mnum, int bpaynum, int tranpoint, Date pregdate) {
		super();
		this.mnum = mnum;
		this.bpaynum = bpaynum;
		this.tranpoint = tranpoint;
		this.pregdate = pregdate;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getBpaynum() {
		return bpaynum;
	}
	public void setBpaynum(int bpaynum) {
		this.bpaynum = bpaynum;
	}
	public int getTranpoint() {
		return tranpoint;
	}
	public void setTranpoint(int tranpoint) {
		this.tranpoint = tranpoint;
	}
	public Date getPregdate() {
		return pregdate;
	}
	public void setPregdate(Date pregdate) {
		this.pregdate = pregdate;
	}
	
	

}
