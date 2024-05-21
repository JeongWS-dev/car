package createCar.domain;

public class CreateCarVO {
	// insert 용
	private String carName;        // 차량 이름  
    private String powerTrainTitle;// 엔진 옵션 이름     
    private String DriveTrainTitle;// 구동 옵션 이름 
    private String OutColorTitle;// 선택 색상 이름
    private String TotalPrice;     // 총 가격
    private String carType;		   // 차종
	
    
    
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
	
    
	
} // end of public class CreateCarVO {
