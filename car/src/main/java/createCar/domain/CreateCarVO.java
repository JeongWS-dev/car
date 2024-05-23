package createCar.domain;

public class CreateCarVO {
	// insert 용
	private String carName;        // 차량 이름  
    private String powerTrainTitle;// 엔진 옵션 이름     
    private String DriveTrainTitle;// 구동 옵션 이름 
    private String OutColorTitle;// 선택 외장 색상 이름
    private String InColorTitle;// 선택 내장 색상 이름
    private String TotalPrice;     // 총 가격
    private String carType;		   // 차종
    private String carpoint;       // 차포인트
	private String incolor_price; //내장색상 가격
    
    
	
	// == getter and setter start == //
    public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getPowerTrainTitle() {
		return powerTrainTitle;
	}
	public void setPowerTrainTitle(String powerTrainTitle) {
		this.powerTrainTitle = powerTrainTitle;
	}
	public String getDriveTrainTitle() {
		return DriveTrainTitle;
	}
	public void setDriveTrainTitle(String driveTrainTitle) {
		DriveTrainTitle = driveTrainTitle;
	}
	public String getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getOutColorTitle() {
		return OutColorTitle;
	}
	public void setOutColorTitle(String outColorTitle) {
		OutColorTitle = outColorTitle;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String cartype) {
		this.carType = cartype;
	}
	public String getInColorTitle() {
		return InColorTitle;
	}
	public void setInColorTitle(String inColorTitle) {
		InColorTitle = inColorTitle;
	}
	public String getCarpoint() {
		return carpoint;
	}
	public void setCarpoint(String carpoint) {
		this.carpoint = carpoint;
	}
	public String getIncolor_price() {
		return incolor_price;
	}
	public void setIncolor_price(String incolor_price) {
		this.incolor_price = incolor_price;
	}
} // end of public class CreateCarVO {
