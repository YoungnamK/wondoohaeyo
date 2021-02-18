package bean;

public class OnedayClass {
	private String code; // 등록 코드
	private String sell_email; // 사업자 이메일
	private String regdate; // 등록 일자
	private String type; // 등록 타입 (ex. 커피 , 도자기)
	private String classname; // 클래스 이름
	private String instructor; // 강사명
	private int person; // 인원수
	private int oneprice; // 1인 기준 가격
	private String approval; // 관리자 승인 여부
	private String startdate; // 관리자 승인 일자(=상품 판매 시작 일자)
	private String enddate; // 상품 판매 종료 일자
	private int opentime; // 수업 오픈 시간
	private int closetime; // 수업 마감 시간
	private int add_opentime1; // 추가_수업 오픈 시간1
	private int add_closetime1; // 추가_수업 마감 시간1
	private int add_opentime2; // 추가_수업 오픈 시간2
	private int add_closetime2; // 추가_수업 마감 시간2
	private String zipcode; // 우편 번호
	private String address1; // 주소
	private String address2; // 상세주소
	private String content; // 수업 내용
	private String main_image; // 메인 사진
	private String detail_image1; // 추가 사진(상세)
	private String detail_image2; // 추가 사진(상세)
	private String remark; // 비고

	public OnedayClass() {
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSell_email() {
		return sell_email;
	}

	public void setSell_email(String sell_email) {
		this.sell_email = sell_email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public int getOneprice() {
		return oneprice;
	}

	public void setOneprice(int oneprice) {
		this.oneprice = oneprice;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public int getOpentime() {
		return opentime;
	}

	public void setOpentime(int opentime) {
		this.opentime = opentime;
	}

	public int getClosetime() {
		return closetime;
	}

	public void setClosetime(int closetime) {
		this.closetime = closetime;
	}

	public int getAdd_opentime1() {
		return add_opentime1;
	}

	public void setAdd_opentime1(int add_opentime1) {
		this.add_opentime1 = add_opentime1;
	}

	public int getAdd_closetime1() {
		return add_closetime1;
	}

	public void setAdd_closetime1(int add_closetime1) {
		this.add_closetime1 = add_closetime1;
	}

	public int getAdd_opentime2() {
		return add_opentime2;
	}

	public void setAdd_opentime2(int add_opentime2) {
		this.add_opentime2 = add_opentime2;
	}

	public int getAdd_closetime2() {
		return add_closetime2;
	}

	public void setAdd_closetime2(int add_closetime2) {
		this.add_closetime2 = add_closetime2;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMain_image() {
		return main_image;
	}

	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}

	public String getDetail_image1() {
		return detail_image1;
	}

	public void setDetail_image1(String detail_image1) {
		this.detail_image1 = detail_image1;
	}

	public String getDetail_image2() {
		return detail_image2;
	}

	public void setDetail_image2(String detail_image2) {
		this.detail_image2 = detail_image2;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "OnedayClass [code=" + code + ", sell_email=" + sell_email + ", regdate=" + regdate + ", type=" + type
				+ ", classname=" + classname + ", instructor=" + instructor + ", person=" + person + ", oneprice="
				+ oneprice + ", approval=" + approval + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", opentime=" + opentime + ", closetime=" + closetime + ", add_opentime1=" + add_opentime1
				+ ", add_closetime1=" + add_closetime1 + ", add_opentime2=" + add_opentime2 + ", add_closetime2="
				+ add_closetime2 + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2
				+ ", content=" + content + ", main_image=" + main_image + ", detail_image1=" + detail_image1
				+ ", detail_image2=" + detail_image2 + ", remark=" + remark + "]";
	}

}
