public with sharing class CreditCardPaymenServices 
{
    public void processPayment(Booking__c booking)
    {
        //validate cc
        //check if cc numer is blank and expiry is not in past
        if(booking.Credit_Card_Number__c != null)
        {
            //process payment
            //call payment gateway
            //update booking status to paid
            booking.Payment_Status__c = 'Paid';
            booking.Booking_Status__c = 'Confirmed';
            update booking;
        }
    }    

}