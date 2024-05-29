package drivietryApply.domain;

public class DriveLoungeVO {
	// insert 용
		private int dlseq;        		// 라운지 시퀀스  
	    private String area;			// 도 이름     
	    private String city;			// 시,구 이름
	    private String place_name;		// 라운지 이름
	    private String d_address;		// 라운지 주소
	    private String phone;     		// 라운지 번호
		public int getDlseq() {
			return dlseq;
		}
		public void setDlseq(int dlseq) {
			this.dlseq = dlseq;
		}
		public String getArea() {
			return area;
		}
		public void setArea(String area) {
			this.area = area;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getPlace_name() {
			return place_name;
		}
		public void setPlace_name(String place_name) {
			this.place_name = place_name;
		}
		public String getD_address() {
			return d_address;
		}
		public void setD_address(String d_address) {
			this.d_address = d_address;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		
}
