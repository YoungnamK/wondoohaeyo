package bean;

import org.springframework.web.multipart.MultipartFile;

public class Coffee {
	private final String MUST_INPUT = "지정 해주세요.";
	private int c_no;

	private int c_type;
	private String c_seller_email; // 판매자의 이메일을 통해
	// @NotEmpty ( message="상품의 이름을 " + MUST_INPUT)
	private String c_name;
	// @NotEmpty (message = "상품의 가격을 " + MUST_INPUT)
	private int c_price;
	// @NotEmpty (message ="상품의 원산지를 " + MUST_INPUT)
	private String c_origin;
	// @Min(value=234 ,message = "상품의 무게는 최소 235g이상으로 " + MUST_INPUT)
	private int c_weight;
	// @NotEmpty(message = "로스팅의 여부를 " + MUST_INPUT)
	private String c_roasting;
	// @NotEmpty (message = "블렌딩의 종류를 " + MUST_INPUT)
	private String c_blending;

	private String c_crushing_status;
	// @Min(value=10 , message="재고 수량은 최소 10개 이상이어야 합니다.")
	private int c_qty;

	public MultipartFile getCf_image() {
		return cf_image;
	}

	public void setCf_image(MultipartFile cf_image) {

		if (this.cf_image != null) {
			
			this.c_image = cf_image.getOriginalFilename();
			
		}
	}

	public MultipartFile getCf_image2() {
		return cf_image2;
	}

	public void setCf_image2(MultipartFile cf_image2) {
		this.cf_image2 = cf_image2;
	}

	public MultipartFile getCf_image3() {
		return cf_image3;
	}

	public void setCf_image3(MultipartFile cf_image3) {
		this.cf_image3 = cf_image3;
	}

	// 메인
	private String c_image;

	private MultipartFile cf_image;

	// 상세
	private String c_image2;

	private MultipartFile cf_image2;

	// 상세2
	private String c_image3;
	private MultipartFile cf_image3;

	private String ramark;

	public Coffee() {
	}

	public int getC_weight() {
		return c_weight;
	}

	@Override
	public String toString() {
		return "c_no=" + c_no + ", c_type=" + c_type + ", c_seller_email=" + c_seller_email + ", c_name=" + c_name
				+ ", c_price=" + c_price + ", c_origin=" + c_origin + ", c_weight=" + c_weight + ", c_roasting="
				+ c_roasting + ", c_blending=" + c_blending + ", c_crushing_status=" + c_crushing_status + ", c_qty="
				+ c_qty + ", c_image=" + c_image + ", c_image2=" + c_image2 + ", c_image3=" + c_image3 + ", ramark="
				+ ramark + "]";
	}

	public void setC_weight(int c_weight) {
		this.c_weight = c_weight;
	}

	public int getC_qty() {
		return c_qty;
	}

	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}

	public Coffee(int c_no, int c_type, String c_seller_email, String c_name, int c_price, String c_origin,
			int c_weight, String c_roasting, String c_blending, String c_crushing_status, int c_qty, String c_image,
			MultipartFile cf_image, String c_image2, MultipartFile cf_image2, String c_image3, MultipartFile cf_image3,
			String ramark) {
		super();
		this.c_no = c_no;
		this.c_type = c_type;
		this.c_seller_email = c_seller_email;
		this.c_name = c_name;
		this.c_price = c_price;
		this.c_origin = c_origin;
		this.c_weight = c_weight;
		this.c_roasting = c_roasting;
		this.c_blending = c_blending;
		this.c_crushing_status = c_crushing_status;
		this.c_qty = c_qty;
		this.c_image = c_image;
		this.cf_image = cf_image;
		this.c_image2 = c_image2;
		this.cf_image2 = cf_image2;
		this.c_image3 = c_image3;
		this.cf_image3 = cf_image3;
		this.ramark = ramark;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public String getC_seller_email() {
		return c_seller_email;
	}

	public void setC_seller_email(String c_seller_email) {
		this.c_seller_email = c_seller_email;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public String getC_origin() {
		return c_origin;
	}

	public void setC_origin(String c_origin) {
		this.c_origin = c_origin;
	}

	public String getC_roasting() {
		return c_roasting;
	}

	public void setC_roasting(String c_roasting) {
		this.c_roasting = c_roasting;
	}

	public String getC_blending() {
		return c_blending;
	}

	public void setC_blending(String c_blending) {
		this.c_blending = c_blending;
	}

	public String getC_crushing_status() {
		return c_crushing_status;
	}

	public void setC_crushing_status(String c_crushing_status) {
		this.c_crushing_status = c_crushing_status;
	}

	public String getC_image() {
		return c_image;
	}

	public void setC_image(String c_image) {
		this.c_image = c_image;
	}

	public String getC_image2() {
		return c_image2;
	}

	public void setC_image2(String c_image2) {
		this.c_image2 = c_image2;
	}

	public String getC_image3() {
		return c_image3;
	}

	public void setC_image3(String c_image3) {
		this.c_image3 = c_image3;
	}

	public String getRamark() {
		return ramark;
	}

	public void setRamark(String ramark) {
		this.ramark = ramark;
	}

	// 파일 업로드

}