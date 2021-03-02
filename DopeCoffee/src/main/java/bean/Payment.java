package bean;


public class Payment {
	private int pay_no;
	private int shoppingbasket;
	private int accountnumber; //계좌번호
	private String bankname; //은행이름
	private String name; //예금주
	private int totalprice;
	private String remark;
	
	
	
	@Override
	public String toString() {
		return "Payment [pay_no=" + pay_no + ", shoppingbasket=" + shoppingbasket + ", accountnumber=" + accountnumber
				+ ", bankname=" + bankname + ", name=" + name + ", totalprice=" + totalprice + ", remark=" + remark
				+ "]";
	}

	public Payment(int pay_no, int shoppingbasket, int accountnumber, String bankname, String name, int totalprice,
			String remark) {
		super();
		this.pay_no = pay_no;
		this.shoppingbasket = shoppingbasket;
		this.accountnumber = accountnumber;
		this.bankname = bankname;
		this.name = name;
		this.totalprice = totalprice;
		this.remark = remark;
	}

	public Payment() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
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
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	} 
		
	
}
