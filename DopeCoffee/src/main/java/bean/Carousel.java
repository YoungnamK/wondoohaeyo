package bean;

public class Carousel {	
	private String largetitle ;
	private String captionlarge ; // <h3>에 들어갈 캡션
	private String caption ; // <p>에 들어갈 캡션
	public String getLargetitle() {
		return largetitle;
	}
	public void setLargetitle(String largetitle) {
		this.largetitle = largetitle;
	}
	public String getCaptionlarge() {
		return captionlarge;
	}
	public void setCaptionlarge(String captionlarge) {
		this.captionlarge = captionlarge;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}	
}