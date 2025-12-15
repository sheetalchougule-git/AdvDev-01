/**
 * sOQL: Reading stored or saved data from salesforce database
 * Inline SOQL = Direcct SOQL query inside the Apex code
 * Dynamic SOQL = SOQL query stored in a string variable and executed at runtime
 * Ids are returned implicitly as 18-character case-insensitive strings
 */
public with sharing class SOQLDemo {
    public SOQLDemo() 
    {
        inlineSOQLDemo();
        soqlWithBindVariables();
        subQueryDemo();
        setMethods();
        mapMethods();
        listMethods();
    }

    public static void inlineSOQLDemo() 
    {
        //Inline soql - []
        //SOQL will rettuen and assign results to single sobject or list of sobject
        Account acc = [SELECT Id, Name FROM Account WHERE Name = 'Acme']; // null pointer exception if no record found
        System.debug('Account Name: ' + acc.Name);

        /***
         * SOQL Structure:
         * SELECT - Keyword to start the query
         * Fields - Comma separated list of fields to retrieve. Use API names for fields
         * FROM - Keyword to specify the object
         * Object - API Name of the object to query
         * WHERE - Optional clause to filter records based on conditions
         * Conditions - Logical expressions to filter records (e.g., Name = 'Acme')
         * ORDER BY - Optional clause to sort the results based on specified fields
         * LIMIT - Optional clause to limit the number of records returned
         */
        Account[] accRecords = [SELECT Id, Name FROM Account];      //array notation
        System.debug('Total Accounts: ' + accRecords.size());
        System.debug('Account Records: ' + accRecords[0].Name  + ', ' + accRecords[1].Name); //accessing list elements

        List<Account> accList = [SELECT Id,Name
                                FROM Account]; //list notation
    }

    public static void selectiveQuery()
    {
        //Selective Query - Querying only required fields to optimize performance
        List<Contact> conList = [SELECT Id, FirstName, LastName
                                 FROM Contact
                                 WHERE FirstName = 'John'
                                 AND LastName = 'Doe'];
        System.debug('Total Contacts for Acme: ' + conList.size());
    }

    public static void soqlWithBindVariables()
    {
        String accName = 'Acme';
        //Using bind variables in SOQL
        //Bind variable are useful when the data is dynaamic and cannot be hardcoded
        //SOQL is apex can reference apex variables directly using colon (:)
        List<Account> accList = [SELECT Id, Name
                                 FROM Account
                                 WHERE Name = :accName]; //bind variable with colon (:)
        System.debug('Accounts with Name ' + accName + ': ' + accList.size());
    }

    public static void subQueryDemo()
    {
        Account accntRec = [SELECT Id FROM Account LIMIT 1]; //example account id
        //relationship queries in SOQL
        //1. Child to parent relationship - Using dot notation to access parent fields from child object
        List<Contact> conList = [SELECT Id, FirstName, LastName, Account.Name,Emergency_Contact__r.Name,Vendor_Company__r.Industry__c
                                 FROM Contact
                                 WHERE AccountId = : accntRec.Id]; //example account id

        //2. Parent to child relationship - multiple related child records can be retrieved using subquery
        //Retrieve accounts with related contacts
        //in case of suq=bqueries we use the plural name of the child relationship
        List<Account> accountsWithContacts = [SELECT Id, Name,
                                                 (SELECT Id, FirstName, LastName
                                                  FROM Contacts),
                                                  (SELECT Id,Name FROM Opportunities WHERE isClosed = false) //subquery to fetch related contacts
                                                 FROM Account
                                                 WHERE Id = : accntRec.Id]; //example account id

        //retriebve all contacts where current contact is emergency contact
        //For custom relationships, use the child relationship name defined in the lookup/master-detail field
        List<Contact> emergencyContacts = [SELECT Id, FirstName, LastName,
                                                 (SELECT Id, FirstName, LastName
                                                  FROM EmergencyContactForTrainees__r) 
                                                 FROM Contact
                                                 WHERE Id = : accntRec.Id]; //example contact id

        //Subquery - Querying related records using nested SOQL
        List<Account> accList = [SELECT Id, Name,
                                 (SELECT Id, FirstName, LastName
                                  FROM Contacts) //subquery to fetch related contacts
                                 FROM Account
                                 WHERE Name = 'Acme'];
        
        //semi-join query - retrieve records from one object based on related records in another object
        List<Contact> contactsInAcme = [SELECT Id, FirstName, LastName
                                        FROM Contact
                                        WHERE AccountId IN (SELECT Id FROM Account WHERE Name = 'Acme')];
        System.debug('Contacts in Acme: ' + contactsInAcme.size());

        Set<Id> emergencyContactIds = new Set<Id>{'0035g00000XXXXXXAA','0035g00000YYYYYYAA'};
        List<Contact> contactsWithEmergencyContacts = [SELECT Id, FirstName, LastName
                                                      FROM Contact
                                                      WHERE Id IN :emergencyContactIds];
        System.debug('Contacts with specified emergency contacts: ' + contactsWithEmergencyContacts.size());

        //anti-join query - retrieve records from one object that do not have related records in another object
        List<Contact> contactsWithoutOpportunities = [SELECT Id, FirstName, LastName
                                              FROM Contact
                                              WHERE AccountId NOT IN (SELECT AccountId FROM Opportunity)];
        System.debug('Contacts without Opportunities: ' + contactsWithoutOpportunities.size());
    }
}