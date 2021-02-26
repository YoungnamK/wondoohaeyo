package bean;
// 상품 결제 빈
public class ProductPay {
	private int propay_no; 
	private int shoppingbasket; //상바구니 정보
	private int accountnumber; //계좌번호
	private String bankname; //은행사
	private String name; //예금주
	private String remark; //비고
	
	public ProductPay() {
	}
	
	
	public ProductPay(int propay_no, int shoppingbasket, int accountnumber, String bankname, String name,
			String remark) {
		super();
		this.propay_no = propay_no;
		this.shoppingbasket = shoppingbasket;
		this.accountnumber = accountnumber;
		this.bankname = bankname;
		this.name = name;
		this.remark = remark;
	}



	@Override
	public String toString() {
		return "ProductPay [propay_no=" + propay_no + ", shoppingbasket=" + shoppingbasket + ", accountnumber="
				+ accountnumber + ", bankname=" + bankname + ", name=" + name + ", remark=" + remark + "]";
	}
	
	
	
	public int getPropay_no() {
		return propay_no;
	}
	public void setPropay_no(int propay_no) {
		this.propay_no = propay_no;
	}
	public int getShoppingbasket() {
		return shoppingbasket;
	}

	public void setShoppingbasket(int shoppingbasket) {
		this.shoppingbasket = shoppingbasket;
	}
	public int getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(int accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
