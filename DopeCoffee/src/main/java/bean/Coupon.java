package bean;

public class Coupon {
	private int coupon_no; 
	private String  coupon_name; // 쿠폰 이름 
	private int coupon_discountrate; // 쿠폰 할인율
	private int coupon_discountpay; //쿠폰 할인금액
	private String coupon_startdate;//쿠폰 발급일
	private String coupon_enddate;//쿠폰 종료일
	private String coupon_use; //쿠폰 사용유무
	private String user_email; //쿠폰의 주인을 찾을 포린키
	private String remark; //비고
	
	
	
	@Override
	public String toString() {
		return "Coupon [coupon_no=" + coupon_no + ", coupon_name=" + coupon_name + ", coupon_discountrate="
				+ coupon_discountrate + ", coupon_discountpay=" + coupon_discountpay + ", coupon_startdate="
				+ coupon_startdate + ", coupon_enddate=" + coupon_enddate + ", coupon_use=" + coupon_use
				+ ", user_email=" + user_email + ", remark=" + remark + "]";
	}



	public Coupon() {}
	
	
	
	public int getCoupon_no() {
		return coupon_no;
	}






	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}






	public String getCoupon_name() {
		return coupon_name;
	}






	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}






	public int getCoupon_discountrate() {
		return coupon_discountrate;
	}






	public void setCoupon_discountrate(int coupon_discountrate) {
		this.coupon_discountrate = coupon_discountrate;
	}






	public int getCoupon_discountpay() {
		return coupon_discountpay;
	}






	public void setCoupon_discountpay(int coupon_discountpay) {
		this.coupon_discountpay = coupon_discountpay;
	}






	public String getCoupon_startdate() {
		return coupon_startdate;
	}






	public void setCoupon_startdate(String coupon_startdate) {
		this.coupon_startdate = coupon_startdate;
	}






	public String getCoupon_enddate() {
		return coupon_enddate;
	}






	public void setCoupon_enddate(String coupon_enddate) {
		this.coupon_enddate = coupon_enddate;
	}






	public String getCoupon_use() {
		return coupon_use;
	}






	public void setCoupon_use(String coupon_use) {
		this.coupon_use = coupon_use;
	}






	public String getUser_email() {
		return user_email;
	}






	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}






	public String getRemark() {
		return remark;
	}






	public void setRemark(String remark) {
		this.remark = remark;
	}






	public Coupon(int coupon_no, String coupon_name, int coupon_discountrate, int coupon_discountpay,
			String coupon_startdate, String coupon_enddate, String coupon_use, String user_email, String remark) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_discountrate = coupon_discountrate;
		this.coupon_discountpay = coupon_discountpay;
		this.coupon_startdate = coupon_startdate;
		this.coupon_enddate = coupon_enddate;
		this.coupon_use = coupon_use;
		this.user_email = user_email;
		this.remark = remark;
	}
	
	
}
