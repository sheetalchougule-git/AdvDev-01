/**
 * Naming Conventions:
 * Class Name - PascalCase - CalculateDiscountForGuest
 * Variable Names - camelCase - noOfModules
 * Method Names - camelCase - calculateDiscount
 * Class Names - PascalCase - CalculateDiscount
 */
public class ApexIntro 
{
    //Class Body - stmts to be executed 
    //Variables - storing specific data. scope - wihtin the class. Also called as member variables
    //Methods - process hte businsee logic. scope - within the class. Also called as member methods
    //Class - blueprint to create objects
    //Object - instance of the class
    //Constructor - default constructor. First entry initilizer for class  
    
    /**
     * @Descripion: Defining a bluprin for session on apex intro
     * 1. How many modules? - 4
     * 2. Names of the modules - class construct, varibles, methods
     * 3. What will be the duration of each module - 6 hrs
     * 4. What will be the agenda of each module - descriptinve text
     */

     /**
      * Declaration of variables
      * [Access Modifier][Keywords][data_type][name][=value]
      * [public|private|protected|global]
      * [virual|abstract|with sharing|without sharing]
      * [Data Type - Custom, Primitive, Non-Primitive]
      * [name - camelCase]
     //[=value]
        * if  varibales are not intialized, they are NULL 
     */
     public Integer noOfModules;

     public String module1;
     public String desriptionModule1;
     public Integer durationModule1;
     public Boolean isModule1Completed = true;
     public Static FINAL Integer NO_OF_MODULES = 4;

     //Assignment of Variables
     public Date moduleStartaDate = Date.Today();

     public ApexIntro()
     {
         this.noOfModules = 4;
     }

     /*Property*/
     public void setModule1(String module1)
     {
         this.module1 = module1;
     }

     public String getModule1()
     {
         return this.module1;
     }
     
     //Method
     public Integer getNoOfModules()
     {
         return this.noOfModules;
     }
}