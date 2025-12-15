public with sharing class AdvSOQLDemo {
    public AdvSOQLDemo() {

    }

    /***
     * You need to fetch all the fields from object - standard, custom, all
     * Purpose: Selecting fields from object wiithout specifying each field name
     * Note: Using SELECT * is not supported in SOQL
     * [Solution]
     * 1. Use Schema.DescribeSObjectResult to get field names dynamically
     * 2. SOQL keywords - FIELDS(ALL), FIELDS(STANDARD), FIELDS(CUSTOM)
     * 3. Dynamic SOQL - Using dynamic SOQL to fetch all fields
     * 4. FIeldsets - Using fieldsets to define a set of fields to be queried
     * 
     */
    private void selectFieldsDemo() {

        //Retrieve all fields using FIELDS(ALL)
        //Considered as unbound query - may hit governor limits if object has too many fields
        List<Account> accListAllFields = [SELECT FIELDS(ALL) FROM Account LIMIT 10];
        System.debug('Accounts with all fields: ' + accListAllFields.size());

        //Retrieve standard fields using FIELDS(STANDARD)
        List<Account> accListStandardFields = [SELECT FIELDS(STANDARD) FROM Account LIMIT 10];
        System.debug('Accounts with standard fields: ' + accListStandardFields.size());

        //Retrieve custom fields using FIELDS(CUSTOM)
        List<Account> accListCustomFields = [SELECT FIELDS(CUSTOM) FROM Account LIMIT 10];
        System.debug('Accounts with custom fields: ' + accListCustomFields.size());

        //Use few standard and custom fields along with FIELDS(CUSTOM)
        List<Account> accListMixedFields = [SELECT Name, Industry, FIELDS(CUSTOM) FROM Account LIMIT 10];
        System.debug('Accounts with mixed fields: ' + accListMixedFields.size());
    }

    private void fieldSetDemo() {
        //Retrieve all the fields from fieldset and construct dynamic SOQL query
        List<Schema.FieldSetMember> emeafieldSetMembers = 
            SObjectType.Account.FieldSets.EMEA.getFields();
            //return me list of fields - 1. Name    2.,Industry 3.,AnnualRevenue = Name,Industry,AnnualRevenue
            //form q query string to perform a query
        
        system.debug('EMEA Field Set Members: ' + emeafieldSetMembers.size());

        //cretae a sting to store field names
        String fieldNames = '';
        //ietrate over the list of fields in fieldset
        //append field names to the string to form a comma-separated list for SOQL query
        for(Schema.FieldSetMember fsm : emeafieldSetMembers) 
        {
            fieldNames += fieldNames == '' ? fsm.getFieldPath() : ',' + fsm.getFieldPath();
        }
        System.debug('Field Names from Field Set: ' + fieldNames);

        //Construct dynamic SOQL query using field names from fieldset
        String query = 'SELECT ' + fieldNames + ' FROM Account LIMIT 10';
        System.debug('Dynamic SOQL Query: ' + query);

        List<Account> accList = Database.query(query);                  //execute dynamic SOQL query. 
        System.debug('Accounts retrieved using fieldset: ' + accList.size());
    }

    /***
     * @DDescription: Dynamically retrieve all the sObjects and their fields using Schema class
     * allowing you to construct dynamic SOQL queries based on metadata.
     * @DUsage: Use Schema class to dynamically retrieve all the sObjects and their fields
     */

    private void globalDescribeDemo() {
        //Gets a map of all objects and their metadata in the org
        Map<String, Schema.SObjectType> globalDescMap = Schema.getGlobalDescribe();
        System.debug('Total SObjects in Org: ' + globalDescMap.size());

        //Iterate over the map to get sObject names
        for(String sObjName : globalDescMap.keySet()) {
            System.debug('SObject Name: ' + sObjName);
        }

        //Get describe result for a specific sObject - Account
        Schema.SObjectType accountType = globalDescMap.get('Account');
        Schema.DescribeSObjectResult accountDesc = accountType.getDescribe();

        //Get field map for Account object
        Map<String, Schema.SObjectField> accountFieldMap = accountDesc.fields.getMap();
        System.debug('Total Fields in Account: ' + accountFieldMap.size());

        //Iterate over the field map to get field names
        for(String fieldName : accountFieldMap.keySet()) {
            System.debug('Account Field Name: ' + fieldName);
        }

        String soqlQuery = 'SELECT ' + accountDesc.fields.getMap().keySet().join(',') + ' FROM Account LIMIT 10';
        System.debug('Dynamic SOQL Query for Account: ' + soqlQuery);
    }

}