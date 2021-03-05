package bean;

public class Orders {
 
 private int oid;
 private String custid;
 private String orderdate ;
 private String remark;
 
 
 
 
 @Override
public String toString() {
	return "Orders [oid=" + oid + ", custid=" + custid +  ", orderdate=" + orderdate + ", remark="
			+ remark + "]";
}

public Orders() {
	// TODO Auto-generated constructor stub
}
 
public Orders(int oid, String custid,  String orderdate, String remark) {
	super();
	this.oid = oid;
	this.custid = custid;
	this.orderdate = orderdate;
	this.remark = remark;
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
