public interface IPaymentProcessor 
{
    void validate();
    void processPayment(Booking__c booking);
    void confirmBooking(Booking__c booking);
}