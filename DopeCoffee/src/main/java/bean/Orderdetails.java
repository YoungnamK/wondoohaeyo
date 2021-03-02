package bean;

public class Orderdetails {
	
private	int odid;
private	int oid;
private	int cfno;
private	int qty;
private	String remark;




public Orderdetails(int odid, int oid, int cfno, int qty, String remark) {
	super();
	this.odid = odid;
	this.oid = oid;
	this.cfno = cfno;
	this.qty = qty;
	this.remark = remark;
}
public Orderdetails() {}

@Override
public String toString() {
	return "Orderdetails [odid=" + odid + ", oid=" + oid + ", cfno=" + cfno + ", qty=" + qty + ", remark=" + remark
			+ "]";
}
public int getOdid() {
	return odid;
}
public void setOdid(int odid) {
	this.odid = odid;
}
public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public int getCfno() {
	return cfno;
}
public void setCfno(int cfno) {
	this.cfno = cfno;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}





}
