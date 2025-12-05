public class CreditCardPayment implements IPaymentProcessor,IBookingConformation
{
    public void validate()
    {
        system.debug('Validating Credit Card Payment>>>>>>');
    }

    public void processPayment(Booking__c booking)
    {
        system.debug('Processing Credit Card Payment>>>>>>');
    }

    public void confirmBooking(Booking__c booking)
    {
        system.debug('Confirming Credit Card Payment>>>>>>');
    }

    public void cancelBooking(Booking__c booking)
    {
        system.debug('Canceling Credit Card Payment>>>>>>');
    }

    public void refundPayment(Booking__c booking)
    {
        system.debug('Refunding Credit Card Payment>>>>>>');
    }
    
    public void processVIPBooking(Booking__c booking)
    {
        system.debug('Processing  CVIP booking>>>>>>');
    }

    public void updateBooking(Booking__c booking)
    {
        system.debug('updating booking request>>>>>');
    }
}