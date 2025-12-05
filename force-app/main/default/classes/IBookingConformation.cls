public  interface IBookingConformation 
{
    void processVIPBooking(Booking__c booking);

    void cancelBooking(Booking__c booking);

    void updateBooking(Booking__c booking);

    void refundPayment(Booking__c booking);
}