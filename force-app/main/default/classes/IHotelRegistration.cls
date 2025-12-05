public interface IHotelRegistration 
{
    //No implementation
    //Interface methods are public by default
    void registerGuest(String guestName,String roomType);
    Decimal calculatePrice(Integer nightsBooked);
    void cancelBooking(String bookingId);
    String getBookingInfo(String bookingId);
}