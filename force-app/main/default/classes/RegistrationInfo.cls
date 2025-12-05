/*
 * Class access modifiers - Public, Private, Global
 * Keywords - Virtual, Abstract
 * Class has - Variables, Methods, Class
 * Object => Class
 * Field => Variable
 * Field has:
 * Data Type, Name, Assignment (Dynamic,Static -Constant)
 * Variables must us camelCase
 * Constants are all UPPERCASE
 */

/**
 * @Description: This class demonstrate different data types in Apex
 * @Author: Sheetal Chougule
 * @Used in: Flows, Classes
 * @Test Class:
 * @Version History:
 * Modified By.     | COmments                              | US #
 * Sheetal Chougule | Created new CLass for APex Data Types | -
 */
public class RegistrationInfo 
{
	//Variable - Primitive and Non-Primitives
	
    //Constructor doe not return anything and is having same name as class name
    Public RegistrationInfo()
    {
        //Name  - logical placeholder  - What u want to store
        //Data Type - Which data u want to store
        //[Access Modifier][Keywords][data_type][name][=value]
        
        //Variable declaraion
        Integer iCount;  //Declaration
        
        //Variable Intialization
        iCount = 0;
        
        String strName = 'Shalet John'; //Declaration with initializaion
        Decimal decValue = 123.6;
        Double piValue = 3.14159; //64 bit number with decimal
        Long lngValue = 123678L; //64 bit wihtout decimal
        
        Boolean bIsActive = true; // values = true, false, null
        Date todaysDate = Date.Today(); 
        DateTime dtNow = DateTime.Now();
        Time tmMonrningShift = Time.newInstance(9,0,0,0);  // 
        
        //print values to log
        system.debug('Integer Data Value >>>>' + iCount);
        system.debug('String Data Value >>>>' + strName);
        system.debug('Double Data Value >>>>' + piValue);
        system.debug('Decimal Data Value >>>>' + decValue);
        system.debug('Long Data Value >>>>' + lngValue);
        
        //All apex data types are inherited from Object
        Object objType = 'This is my object data type';
        Object intData = 190;
        Object isDataType = true;
        
       /* sObject accnt = new Account();
        accnt.Name = 'New Account';*/
        
        Account accntNew = new Account();
        accntNew.AnnualRevenue = 1900000;
        
        //Registration__c newReg = new Registration__c();
        //newReg.Name or newReg.Confirmed__c 
   
        //COnstants
        FINAL Integer RESERVATION_COUNT = 10;
        //RESERVATION_COUNT = 20;  // throw an error : Run time error 
        
        Account acctRecords = [SELECT Name FROM Account LIMIT 1];
        system.debug('Account Records>>>>'+acctRecords);
    }
}