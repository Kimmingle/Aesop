package com.aesop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {

	private int pno;
	private String category;
	private String pname;
	private String com;
	private String img1;
	private String img2;
	private String img3;
	private int iprice;
	private int oprice;
	private int amount;
	private int price;
}
