package bean;

import org.springframework.web.multipart.MultipartFile;

public class Coffee {
	private int c_no;
	private int c_type;
	private String c_seller_email; // 판매자의 이메일을 통해
	private String c_name;
	private int c_price;
	private String c_origin;
	private String c_weight;
	private String c_roasting;
	private String c_blending;
	private String c_crushing_status;
	private int c_qty;
	private String c_image;
	private String c_image2;
	private String c_image3;
	private String remark;
	// multipart
	private MultipartFile cf_image;
	private MultipartFile cf_image2;
	private MultipartFile cf_image3;
	
	
	public MultipartFile getCf_image() {
		return cf_image;
	}

	public void setCf_image(MultipartFile cf_image) {
		this.cf_image = cf_image;
		if (this.cf_image!=null) {
			this.c_image = this.cf_image.getOriginalFilename();
		}
	}

	public MultipartFile getCf_image2() {
		return cf_image2;
	}

	public void setCf_image2(MultipartFile cf_image2) {
		this.cf_image2 = cf_image2;
		if (this.cf_image2!=null) {
			this.c_image2 = this.cf_image2.getOriginalFilename();
		}
	}

	public MultipartFile getCf_image3() {
		return cf_image3;
	}

	public void setCf_image3(MultipartFile cf_image3) {
		this.cf_image3 = cf_image3;
		if (this.cf_image3!=null) {
			this.c_image3 = this.cf_image3.getOriginalFilename();
		}
	}

	public Coffee() {
		// TODO Auto-generated constructor stub
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public String getC_seller_email() {
		return c_seller_email;
	}

	public void setC_seller_email(String c_seller_email) {
		this.c_seller_email = c_seller_email;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public String getC_origin() {
		return c_origin;
	}

	public void setC_origin(String c_origin) {
		this.c_origin = c_origin;
	}

	public String getC_weight() {
		return c_weight;
	}

	public void setC_weight(String c_weight) {
		this.c_weight = c_weight;
	}

	public String getC_roasting() {
		return c_roasting;
	}

	public void setC_roasting(String c_roasting) {
		this.c_roasting = c_roasting;
	}

	public String getC_blending() {
		return c_blending;
	}

	public void setC_blending(String c_blending) {
		this.c_blending = c_blending;
	}

	public String getC_crushing_status() {
		return c_crushing_status;
	}

	public void setC_crushing_status(String c_crushing_status) {
		this.c_crushing_status = c_crushing_status;
	}

	public int getC_qty() {
		return c_qty;
	}

	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}

	public String getC_image() {
		return c_image;
	}

	public void setC_image(String c_image) {
		this.c_image = c_image;
	}

	public String getC_image2() {
		return c_image2;
	}

	public void setC_image2(String c_image2) {
		this.c_image2 = c_image2;
	}

	public String getC_image3() {
		return c_image3;
	}

	public void setC_image3(String c_image3) {
		this.c_image3 = c_image3;
	}



	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Coffee [c_no=" + c_no + ", c_type=" + c_type + ", c_seller_email=" + c_seller_email + ", c_name="
				+ c_name + ", c_price=" + c_price + ", c_origin=" + c_origin + ", c_weight=" + c_weight
				+ ", c_roasting=" + c_roasting + ", c_blending=" + c_blending + ", c_crushing_status="
				+ c_crushing_status + ", c_qty=" + c_qty + ", c_image=" + c_image + ", c_image2=" + c_image2
				+ ", c_image3=" + c_image3 ;
	}


	
	
	
}