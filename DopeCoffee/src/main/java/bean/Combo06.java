package bean;

public class Combo06 {
	private String coffeename ; // 상품 이름
	private String custname ; // 사람 이름
	private String custid ; // 아이디
	private String buydate ; // 구매한 날짜
	private int qty ; // 구매 수량
	private int price ; // 가격
	private int amount ; // 총 금액
	
	public Combo06() {
		// TODO Auto-generated constructor stub
	}



	public int getQty() {
		return qty;
	}

	public String getCoffeename() {
		return coffeename;
	}



	public void setCoffeename(String coffeename) {
		this.coffeename = coffeename;
	}



	public String getCustname() {
		return custname;
	}



	public void setCustname(String custname) {
		this.custname = custname;
	}



	public String getCustid() {
		return custid;
	}



	public void setCustid(String custid) {
		this.custid = custid;
	}



	public String getBuydate() {
		return buydate;
	}



	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}



	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

		
	
}