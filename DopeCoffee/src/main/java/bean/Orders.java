package bean;

//주문 정보입력
public class Orders {
	private int od_no; //
	private int od_basket; //장바구니 정보
	private String od_recipient; // 수령인 변경시 배송지
	private String od_phone; //새로운 수령인 폰번호
	private String od_address; //주소
	private String od_address2; //상세 주소
	private String od_memo; // 간단한 메모
	private String remark;
	
	
	
	
	@Override
	public String toString() {
		return "Orders [od_no=" + od_no + ", od_basket=" + od_basket + ", od_recipient=" + od_recipient + ", od_phone="
				+ od_phone + ", od_address=" + od_address + ", od_address2=" + od_address2 + ", od_memo=" + od_memo
				+ ", remark=" + remark + "]";
	}

	public Orders() {
		// TODO Auto-generated constructor stub
	}
	
	public Orders(int od_no, int od_basket, String od_recipient, String od_phone, String od_address, String od_address2,
			String od_memo, String remark) {
		super();
		this.od_no = od_no;
		this.od_basket = od_basket;
		this.od_recipient = od_recipient;
		this.od_phone = od_phone;
		this.od_address = od_address;
		this.od_address2 = od_address2;
		this.od_memo = od_memo;
		this.remark = remark;
	}
	public int getOd_no() {
		return od_no;
	}
	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}
	public int getOd_basket() {
		return od_basket;
	}
	public void setOd_basket(int od_basket) {
		this.od_basket = od_basket;
	}
	public String getOd_recipient() {
		return od_recipient;
	}
	public void setOd_recipient(String od_recipient) {
		this.od_recipient = od_recipient;
	}
	public String getOd_phone() {
		return od_phone;
	}
	public void setOd_phone(String od_phone) {
		this.od_phone = od_phone;
	}
	public String getOd_address() {
		return od_address;
	}
	public void setOd_address(String od_address) {
		this.od_address = od_address;
	}
	public String getOd_address2() {
		return od_address2;
	}
	public void setOd_address2(String od_address2) {
		this.od_address2 = od_address2;
	}
	public String getOd_memo() {
		return od_memo;
	}
	public void setOd_memo(String od_memo) {
		this.od_memo = od_memo;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
