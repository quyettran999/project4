package DuAn2.Dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import DuAn2.Model.RoomType;

public class BookingDTO {

	@NotNull(message = "Name cannot be blank")
    private String name;
	@NotNull(message = "Phone Number cannot be blank")
	
    private String phoneNumber;
	@NotNull(message = "Email cannot be blank")
	@Email(message="Must be Email format")
    private String email;
	@NotNull(message = "Check-in Date cannot be blank")
    private String checkInDate;
	@NotNull(message = "Check-out Date cannot be blank")
    private String checkOutDate;
	@NotNull(message = "Room Type cannot be blank")
    private String roomType;
    private int roomCode;

    public int getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(int roomCode) {
        this.roomCode = roomCode;
    }

    public BookingDTO() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
}
