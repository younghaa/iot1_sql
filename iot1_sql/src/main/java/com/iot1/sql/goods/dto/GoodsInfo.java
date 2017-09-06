package com.iot1.sql.goods.dto;

import org.springframework.stereotype.Component;

@Component
public class GoodsInfo {
	private int giNum;
	private String giName;
	private String giDesc;
	private int viNum;
	private String giCredat;
	private String giCretim;
	
	public int getGiNum() {
		return giNum;
	}
	public void setGiNum(int giNum) {
		this.giNum = giNum;
	}
	public String getGiName() {
		return giName;
	}
	public void setGiName(String giName) {
		this.giName = giName;
	}
	public String getGiDesc() {
		return giDesc;
	}
	public void setGiDesc(String giDesc) {
		this.giDesc = giDesc;
	}
	public int getViNum() {
		return viNum;
	}
	public void setViNum(int viNum) {
		this.viNum = viNum;
	}
	public String getGiCredat() {
		return giCredat;
	}
	public void setGiCredat(String giCredat) {
		this.giCredat = giCredat;
	}
	public String getGiCretim() {
		return giCretim;
	}
	public void setGiCretim(String giCretim) {
		this.giCretim = giCretim;
	}
	@Override
	public String toString() {
		return "GoodsInfo [giNum=" + giNum + ", giName=" + giName + ", giDesc=" + giDesc + ", viNum=" + viNum
				+ ", giCredat=" + giCredat + ", giCretim=" + giCretim + "]";
	}
	
}
