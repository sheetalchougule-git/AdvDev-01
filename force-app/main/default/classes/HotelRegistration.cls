public virtual class HotelRegistration 
{
    //method overloading - default discount
    public Decimal calculateDiscount(){
        system.debug('default dicount applied : 10% >>>>>>');
        return 10.0;
    }

    //Method overloaded
    //Allowed to be overridden in child classes
    public virtual Decimal calculateDiscount(Integer age, String membershipLevel)
    {
        system.debug('default dicount applied : 5% >>>>>>');
        return 5.0;
    }

    //method overloading - discuount calculation for senior citizens
    public Decimal calculateDiscount(Integer age){

        if(age >= 65){
            system.debug('senior citizen discont : 15% >>>>>>');
            return 15.0;
        }else{
            return calculateDiscount();
        }
    }

    //Discounts for regular customer
    public Decimal calculateDiscount(String customerType){

        if(customerType == 'regular'){
            system.debug('regular customer discont : 10% >>>>>>');
            return 10.0;
        }else{
            return calculateDiscount();
        }
    }

    //discounts for corporate bookings
    public virtual Decimal calculateDiscount(Integer roomsReserved, Boolean isCorporateBooking){

        Decimal corporateDiscount = 10.0;

        if(isCorporateBooking){
            
             corporateDiscount = roomsReserved * 1.5; // addiitonal 1.5% pr room reservred
             corporateDiscount  = Math.min(corporateDiscount,25.0); // no discount above 25%
        }
        else {
            corporateDiscount = calculateDiscount();
        }
        system.debug('corportae Discount applied>>>>'+ corporateDiscount);
        return corporateDiscount;
    }

}