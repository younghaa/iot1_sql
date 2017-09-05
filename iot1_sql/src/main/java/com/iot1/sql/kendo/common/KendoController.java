package com.iot1.sql.kendo.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class KendoController {

	private class Product{
		String productName;
		double unitPrice;
		String unitsInStock;
		String header1;
		public String getHeader1() {
			return header1;
		}
		public void setHeader1(String header1) {
			this.header1 = header1;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public double getUnitPrice() {
			return unitPrice;
		}
		public void setUnitPrice(double unitPrice) {
			this.unitPrice = unitPrice;
		}
		public String getUnitsInStock() {
			return unitsInStock;
		}
		public void setUnitsInStock(String unitsInStock) {
			this.unitsInStock = unitsInStock;
		}
		
	}
	@RequestMapping(value="/grid/api/read", method=RequestMethod.GET)
	public @ResponseBody List<Product> getList(){
		List<Product> proList = new ArrayList<Product>();
		for(int i=1;i<30;i++){
			Product p = new Product();
			p.setProductName("test" + i);
			p.setUnitPrice(i*1.1);
			p.setUnitsInStock("유닛테스트" + (i%2));
			p.setHeader1("헤더" + i);
			proList.add(p);
		}
		return proList;
	}
}
