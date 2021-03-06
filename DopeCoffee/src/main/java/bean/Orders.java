package bean;

public class Orders {
 
 private int oid;
 private String custid;
 private int coffeeid;
 private String sellerid;
 private String orderdate ;
 private String remark;
 private String zipcode;
 private String address1;
 private String address2;
 private int totalprice;
 
 
 




@Override
public String toString() {
	return "Orders [oid=" + oid + ", custid=" + custid + ", coffeeid=" + coffeeid + ", sellerid=" + sellerid
			+ ", orderdate=" + orderdate + ", remark=" + remark + ", zipcode=" + zipcode + ", address1=" + address1
			+ ", address2=" + address2 + ", totalprice=" + totalprice + "]";
}


public int getTotalprice() {
	return totalprice;
}


public void setTotalprice(int totalprice) {
	this.totalprice = totalprice;
}


public int getCoffeeid() {
	return coffeeid;
}


public void setCoffeeid(int coffeeid) {
	this.coffeeid = coffeeid;
}


public String getSellerid() {
	return sellerid;
}


public void setSellerid(String sellerid) {
	this.sellerid = sellerid;
}


public String getZipcode() {
	return zipcode;
}


public void setZipcode(String zipcode) {
	this.zipcode = zipcode;
}


public String getAddress1() {
	return address1;
}


public void setAddress1(String address1) {
	this.address1 = address1;
}


public String getAddress2() {
	return address2;
}


public void setAddress2(String address2) {
	this.address2 = address2;
}


public Orders() {
	// TODO Auto-generated constructor stub
}
 

public String getOrderdate() {
	return orderdate;
}

public void setOrderdate(String orderdate) {
	this.orderdate = orderdate;
}

public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public String getCustid() {
	return custid;
}
public void setCustid(String custid) {
	this.custid = custid;
}


public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
 
 
 
 
}
