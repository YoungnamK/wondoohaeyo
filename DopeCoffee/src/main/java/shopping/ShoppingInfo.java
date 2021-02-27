package shopping;

// 고객이 주문한 상품 1개에 대한 정보를 저장하고 있는 Bean 클래스
public class ShoppingInfo {
	// mid 컬럼은 ShoppingInfos 테이블에 저장할 때만 사용됩니다.
	private String custid ; // 고객 아이디
	private int cfno ; // 상품 번호
	private String cfname ; // 상품 이름
	private int qty ; // 구매 수량
	private int price ; // 단가
	private String image; // 상품 이미지 이름
	
	
	public ShoppingInfo() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "ShoppingInfo [custid=" + custid + ", cfno=" + cfno + ", cfname=" + cfname + ", qty=" + qty + ", price="
				+ price + ", image=" + image + "]";
	}
	public ShoppingInfo(String custid, int cfno, String cfname, int qty, int price, String image) {
		super();
		this.custid = custid;
		this.cfno = cfno;
		this.cfname = cfname;
		this.qty = qty;
		this.price = price;
		this.image = image;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public int getCfno() {
		return cfno;
	}
	public void setCfno(int cfno) {
		this.cfno = cfno;
	}
	public String getCfname() {
		return cfname;
	}
	public void setCfname(String cfname) {
		this.cfname = cfname;
	}
	public int getQty() {
		return qty;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	//private int amount ;
	
}