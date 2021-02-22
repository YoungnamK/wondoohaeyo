package bean;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Customer {
	private final String MUST_INPUT = "필수 입력 사항입니다.";
	
	@Length(min=8, max=50, message="이메일 주소는 최소 8자리 이상입니다.")
	private String cust_Email;
	
	@Length(min=8, max=20, message="비밀번호는 최소 8자리 이상입니다.")
	private String cust_PW;
	
	@Length(min=2, max=20, message="이름은 최소 2자리 이상입니다.")	
	private String cust_Name;
	
	@Length(min=11, max=20, message="휴대폰번호는 최소 11자리 이상입니다.")
	private String cust_Contact;
	
	@Length(min=6, max=6, message="생년월일은 주민번호 앞 6자리로 입력해주세요.")
	private String cust_Birth;
	
	private String cust_Zipcode;
	
	private String cust_ADR01;
	
	private String cust_ADR02;
	
	private String cust_Pic;
	
	private String cust_RegDate;
	
	@NotNull(message="개인정보 동의는 반드시 체크가 되어야 합니다.")
	private String cust_Join;
	
	private String remark;
	
	private int savepoint;
	
	
	public String getCust_Email() {
		return cust_Email;
	}
	public void setCust_Email(String cust_Email) {
		this.cust_Email = cust_Email;
	}
	public String getCust_PW() {
		return cust_PW;
	}
	public void setCust_PW(String cust_PW) {
		this.cust_PW = cust_PW;
	}
	public String getCust_Name() {
		return cust_Name;
	}
	public void setCust_Name(String cust_Name) {
		this.cust_Name = cust_Name;
	}
	public String getCust_Contact() {
		return cust_Contact;
	}
	public void setCust_Contact(String cust_Contact) {
		this.cust_Contact = cust_Contact;
	}
	public String getCust_Birth() {
		return cust_Birth;
	}
	public void setCust_Birth(String cust_Birth) {
		this.cust_Birth = cust_Birth;
	}
	public String getCust_Zipcode() {
		return cust_Zipcode;
	}
	public void setCust_Zipcode(String cust_Zipcode) {
		this.cust_Zipcode = cust_Zipcode;
	}
	public String getCust_ADR01() {
		return cust_ADR01;
	}
	public void setCust_ADR01(String cust_ADR01) {
		this.cust_ADR01 = cust_ADR01;
	}
	public String getCust_ADR02() {
		return cust_ADR02;
	}
	public void setCust_ADR02(String cust_ADR02) {
		this.cust_ADR02 = cust_ADR02;
	}
	public String getCust_Pic() {
		return cust_Pic;
	}
	public void setCust_Pic(String cust_Pic) {
		this.cust_Pic = cust_Pic;
	}
	public String getCust_RegDate() {
		return cust_RegDate;
	}
	public void setCust_RegDate(String cust_RegDate) {
		this.cust_RegDate = cust_RegDate;
	}
	public String getCust_Join() {
		return cust_Join;
	}
	public void setCust_Join(String cust_Join) {
		this.cust_Join = cust_Join;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getSavepoint() {
		return savepoint;
	}
	public void setSavepoint(int savepoint) {
		this.savepoint = savepoint;
	}
	public String getMUST_INPUT() {
		return MUST_INPUT;
	}
	
	
	@Override
	public String toString() {
		return "Customer [MUST_INPUT=" + MUST_INPUT + ", cust_Email=" + cust_Email + ", cust_PW=" + cust_PW
				+ ", cust_Name=" + cust_Name + ", cust_Contact=" + cust_Contact + ", cust_Birth=" + cust_Birth
				+ ", cust_Zipcode=" + cust_Zipcode + ", cust_ADR01=" + cust_ADR01 + ", cust_ADR02=" + cust_ADR02
				+ ", cust_Pic=" + cust_Pic + ", cust_RegDate=" + cust_RegDate + ", cust_Join=" + cust_Join + ", remark="
				+ remark + ", savepoint=" + savepoint + "]";
	}
	
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}

	

}