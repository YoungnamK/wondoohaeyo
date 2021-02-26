package bean;
	//장바구니 
public class Shoppings {
	
	private String cust_email ; //구매자 아이디 
	private int	 sb_no; //
	private int  sb_product; //상품 정보
	private int	 sb_qty; //상품 수량
	private int	 sb_totalpay; //총금액
	private String ramark; //비고
	
	
	public Shoppings() {}
	
	public Shoppings(String cust_email, int sb_no, int sb_product, int sb_qty, int sb_totalpay, String ramark) {
		super();
		this.cust_email = cust_email;
		this.sb_no = sb_no;
		this.sb_product = sb_product;
		this.sb_qty = sb_qty;
		this.sb_totalpay = sb_totalpay;
		this.ramark = ramark;
	}


	@Override
	public String toString() {
		return "Shopcart [cust_email=" + cust_email + ", sb_no=" + sb_no + ", sb_product=" + sb_product + ", sb_qty="
				+ sb_qty + ", sb_totalpay=" + sb_totalpay + ", ramark=" + ramark + "]";
	}
	
	
	public String getCust_email() {
		return cust_email;
	}
	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}
	public int getSb_no() {
		return sb_no;
	}
	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}
	public int getSb_product() {
		return sb_product;
	}
	public void setSb_product(int sb_product) {
		this.sb_product = sb_product;
	}
	public int getSb_qty() {
		return sb_qty;
	}
	public void setSb_qty(int sb_qty) {
		this.sb_qty = sb_qty;
	}
	public int getSb_totalpay() {
		return sb_totalpay;
	}
	public void setSb_totalpay(int sb_totalpay) {
		this.sb_totalpay = sb_totalpay;
	}
	public String getRamark() {
		return ramark;
	}
	public void setRamark(String ramark) {
		this.ramark = ramark;
	}
	
	
}
