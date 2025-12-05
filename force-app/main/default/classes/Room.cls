public with sharing class Room implements Comparable 
{
    public Integer roomNumber;
    public Integer roomCapcity;
    public Decimal price;

    public Room(Integer roomNumber, Integer roomCapcity, Decimal price)
    {
        this.roomNumber = roomNumber;
        this.roomCapcity = roomCapcity;
        this.price = price;
    }

    //comparable INterface mehod implementation
    public Integer compareTo(Object compareToObj)
    {
        Room otherRoom = (Room)compareToObj;

        //sort based on the price (ascending order)
        if(this.price == otherRoom.price)
        {
            return 0;
        }
        else if(this.price > otherRoom.price)
        {
            return 1;
        }
        else
        {
            return -1;
        }
    }
}