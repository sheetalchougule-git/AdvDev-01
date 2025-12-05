/**
 * @Desription: Class to dmonstarte the OOP in Apex
 * @Author: Sheetal Chougule
 * @Used in: Flows, Classes
 * @Test Class:
 * @Version History:
 * Version | Changes Made by | Details | Reference (jira #)
 * 1.0 | Sheetal CHougule | Created new CLass| - |
 */
public class Dog 
{
    //Variable - Primitive and Non-Primitives
    public String name;
    public Integer age;
    public String breed;
    public String color;
    public Date birthdate;

    //Constants
    public static final Integer No_OF_LEGS = 4;

    //Constructor does not return anything and is having same name as class name
    //Default constructor
    Public Dog()
    {
        //DEfaulting the attribute values
        this.breed = 'Labrador';
        this.color = 'Black';
    }

    
    //Parameterized constructor
    //Construcotr can be overloaded
    //By creating parameterized constructor
    Public Dog(String breed)
    {
        this.breed = breed;
    }

    public Dog(String breed, Date birthdate)
    {
        this.breed = breed;
        this.birthdate = birthdate;

        //calculate age
        this.age = calculateAge(birthdate);
    }

    //WIn Parameterized constrcutor sequence of parameters is considered. else, constructor will throw an error
    public Dog(String breed, String color,Date birthdate)
    { 
        //constructor chaining
        this(breed,birthdate);

        this.color = color;
    }

    public Dog(String breed,Date birthdate,String color)
    { 
        //For constructor chaining, this should be the first argument to call anoher constructor
        //Arguments passed to this() determines which constructor to call
        //this(birthdate,color,breed); //error
        this(breed,birthdate);

        this.color = color;
    }

    /**
     * @Access Modifier - Public
     * @Description - Method to make dog bark. Method wiihout parameters and returns void
     * @Param - None
     * @Return - void
     */
    public void bark()
    {
        system.debug('Woof! Woof!');
    }

    /**
     * @Access Modifier - Public
     * @description - Method to calculate age based on the birthdate. Mehod with no parameters and returns Integer
     * @param - None
     * @return - Integer
     * @throws - None
     * @version - 1.0
     */
    public Integer calculateAge()
    {
        return Date.Today().year() - this.birthdate.year();
    }

    /**
     * @Access Modifier - Public
     * @description - Method to calculate age based on the birthdate. Method with parameters and returns Integer
     * @param - birthdate
     * @returns - Age of Dog
     * @throws - None
     * @version - 1.0
     */
    public Integer calculateAge(Date birthdate)
    {
        //This variable is accessible only within this method. Local Variable
        Date todayDate = Date.Today();
        Integer age = todayDate.year() - birthdate.year();  //birthyear - 2028. today year- 2025 . 30th oct 2025 < 2028

        
        if(todayDate < birthdate.addYears(age))
        {
           // age = age - 1;
           age--;
        }
        return age;
    }

    /**
     * @Description: Getter and Setter methods
     */
    public String getBreed()
    {
        return this.breed;
    }
    public void setBreed(String breed)
    {
        this.breed = breed;
    }

    //public String breed {get;set;}
    /**
     * Static methods are invoked directly using class name
     */
    public static void huntingDog()
    {
        system.debug( 'Yes, this is a hunting dog');
    }

    //System Defined classes and methods
    public static void dateClass()
    {
        Date todayDate = Date.Today();
        system.debug('Today Date >>>> '+todayDate);

        Date yesterdayDate = Date.Today().addDays(-1);   //adds he number of days to the current date
        system.debug('Yesterday Date >>>> '+yesterdayDate);

        Date todaysDate = Date.Today();
        Date customDate = Date.newInstance(2023,10,30); //create a date with year, month and day
        system.debug('Days between today and custom date >>>> '+todaysDate.daysBetween(customDate));

        System.debug('IsLeapYear >>>> '+Date.IsLeapYear(customDate.year()));
    }
}