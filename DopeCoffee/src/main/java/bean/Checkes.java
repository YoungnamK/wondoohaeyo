package bean;

public class Checkes {	
	private String mykey ;
	private String myvalue ;
	private String module ; //모듈 이름 : 회원, 게시물 등등
	private String field ; // 컬럼 이름
	private String kind ; // 유형 : 'checkbox', 'radio', 'select'
	public String getMykey() {
		return mykey;
	}
	public void setMykey(String mykey) {
		this.mykey = mykey;
	}
	public String getMyvalue() {
		return myvalue;
	}
	public void setMyvalue(String myvalue) {
		this.myvalue = myvalue;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
}