public with sharing class CorporateRegistration extends HotelRegistration
{
    public override Decimal calculateDiscount(Integer roomsReserved, Boolean isCorporateBooking)
    {
        Decimal corporateDiscount = 15.0;
        if(isCorporateBooking && roomsReserved > 10)
        {
            corporateDiscount = roomsReserved * 2.0; // addiitonal 2.0% pr room reservred
            corporateDiscount  = Math.min(corporateDiscount,30.0); // no discount above 30%
        }
        else {
            corporateDiscount = super.calculateDiscount(roomsReserved, isCorporateBooking);
        }

        system.debug('corporate Discount applied from base class>>>>'+ corporateDiscount);
        return corporateDiscount;
    }
}