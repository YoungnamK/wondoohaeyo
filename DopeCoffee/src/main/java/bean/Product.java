package bean;

public class Product {
	private int p_no;							   
	private int p_type;							   
	private String p_seller_email;						  
	private String p_name;						   
	private String p_price;					  
	private String p_origin;	
	private String p_qty;							    
	private String p_image;							   
	private String p_image2;							    
	private String p_image3;							   
	private String remark;
		
	public Product() {}
	
	public Product(int p_no, int p_type, String p_seller_email, String p_name, String p_price, String p_origin,
			String p_qty, String p_image, String p_image2, String p_image3, String ramark) {
		super();
		this.p_no = p_no;
		this.p_type = p_type;
		this.p_seller_email = p_seller_email;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_origin = p_origin;
		this.p_qty = p_qty;
		this.p_image = p_image;
		this.p_image2 = p_image2;
		this.p_image3 = p_image3;
		this.remark = ramark;
	}
	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_type=" + p_type + ", p_seller_email=" + p_seller_email + ", p_name="
				+ p_name + ", p_price=" + p_price + ", p_origin=" + p_origin + ", p_qty=" + p_qty + ", p_image="
				+ p_image + ", p_image2=" + p_image2 + ", p_image3=" + p_image3 + ", ramark=" + remark + "]";
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getP_type() {
		return p_type;
	}
	public void setP_type(int p_type) {
		this.p_type = p_type;
	}
	public String getP_seller_email() {
		return p_seller_email;
	}
	public void setP_seller_email(String p_seller_email) {
		this.p_seller_email = p_seller_email;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_origin() {
		return p_origin;
	}
	public void setP_origin(String p_origin) {
		this.p_origin = p_origin;
	}
	public String getP_qty() {
		return p_qty;
	}
	public void setP_qty(String p_qty) {
		this.p_qty = p_qty;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_image2() {
		return p_image2;
	}
	public void setP_image2(String p_image2) {
		this.p_image2 = p_image2;
	}
	public String getP_image3() {
		return p_image3;
	}
	public void setP_image3(String p_image3) {
		this.p_image3 = p_image3;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String ramark) {
		this.remark = ramark;
	}
	
	
	
	
	
}
