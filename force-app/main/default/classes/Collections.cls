public with sharing class Collections 
{
    public Collections() 
    {
        listMethods();
    }

    /***
     * Lists: Ordered collection of elements that allows duplicates.
     * Lists are indexed and starts from 0.
     * Lists can primiives, custom objects, sObjects etc.
     * Lists are mutable. they can have duplicates
     */
    public void listMethods()
    {
        List<Integer> intList = new List<Integer>{10,200,30,40,50};         // predefined list of elements

        List<Integer> evenNumbersList; //No intialization with new means list will ne null

        evenNumbersList.add(2); // add element to the list

        evenNumbersList = new List<Integer>(); //Initialized empty list
        evenNumbersList.add(2);  // index = 0
        evenNumbersList.add(4);  // index = 1
        evenNumbersList.add(6);  // index = 2
        evenNumbersList.add(2,8);  // index = 2 value=8, shifts rest of the elements to right

        System.debug('List Elements: ' + evenNumbersList);
        System.debug('Element at index 1: ' + evenNumbersList[1]); // Access element at index 1 using array-like syntax
        System.debug('Size of List: ' + evenNumbersList.size()); // Get size of the list
        System.debug('List is empty: ' + evenNumbersList.isEmpty()); // Check if list is empty
        System.debug('List contains 2: ' + evenNumbersList.contains(2)); // Check if list contains element 2
        system.debug('Check if element exits at the specific index:'+evenNumbersList.get(2)); // Get element at specific index

        //remove elements rom list
        evenNumbersList.remove(1); // Remove element at index 1
        System.debug('List after removing element at index 1: ' + evenNumbersList);
        evenNumbersList.remove(); // Remove last element
        System.debug('List after removing last element: ' + evenNumbersList);

        //clone list
        List<Integer> clonedList = evenNumbersList.clone();
        System.debug('Cloned List: ' + clonedList);

        //add all elements from one list to another
        clonedList.addAll(intList);
        System.debug('List after adding all elements from intList: ' + evenNumbersList);
        clonedList.add(intlist.get(3));

        //List of sobject
        List<Account> accountList = new List<Account>();
        accountList.add(new Account(Name='Acme Corporation', Industry='Manufacturing'));
        accountList.add(new Account(Name='Global Tech', Industry='Technology'));
        System.debug('Account List: ' + accountList);

        Account newAccount= new Account();
        newAccount.Name='Innovate Solutions';
        newAccount.Industry='Consulting';
        accountList.add(newAccount);
        System.debug('Account List after adding new account: ' + accountList);

        List<Contact> contactList = [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 5];
        System.debug('Contact List from SOQL: ' + contactList);

        //sobject list manipulation
        List<sObject> sObjList = new List<sObject>();
        sObjList.addAll(accountList);
        sObjList.addAll(contactList);
        System.debug('sObject List containing Accounts and Contacts: ' + sObjList);

        sobjectlist.add(new Lead(FirstName='John', LastName='Doe', Company='JD Solutions'));
        System.debug('sObject List after adding Lead: ' + sObjList);
    }

    public void setMethods()
    {
        /***
         * Sets: Unordered collection of unique elements.
         * Sets do not allow duplicates.
         * Sets are mutable. No indexed.
         * Sets can contain primitives, custom objects, sObjects,apex types etc.
         */
        Set<String> stringSet = new Set<String>(); // Initialize empty set

        stringSet.add('Apple');
        stringSet.add('Banana');
        stringSet.add('Orange');
        stringSet.add('Apple'); // Duplicate, will not be added

        System.debug('Set Elements: ' + stringSet);
        System.debug('Set size: ' + stringSet.size());

        System.debug('Set is empty: ' + stringSet.isEmpty());
        System.debug('Set contains Banana: ' + stringSet.contains('Banana')); // Check if set contains element

        stringSet.remove('Orange');
        System.debug('Set after removing Orange: ' + stringSet);

        Set<Integer> intSet = new Set<Integer>{1, 2, 3, 4, 5};
        System.debug('Integer Set: ' + intSet);

        intSet.addAll(new Set<Integer>{6, 7, 8});
        System.debug('Integer Set after adding new elements: ' + intSet);

        intSet.remove(3);
        System.debug('Integer Set after removing 3: ' + intSet);

        Set<Account> accountSet = new Set<Account>();
        accountSet.add(new Account(Name='Acme Corp', Industry='Technology'));
    }

    public void mapMethods()
    {
        /***
         * Maps: Collection of key-value pairs.
         * Keys are unique, values can be duplicate.
         * Maps are mutable. Keys are used to access values.
         * Maps can contain primitives, custom objects, sObjects etc.
         */
        Map<Integer,String> employeesWIthID = new Map<Integer,String>();
        employeesWIthID.put(101,'John Doe');
        employeesWIthID.put(102,'Jane Smith');
        employeesWIthID.put(103,'Mike Johnson');
        System.debug('Employee Map: ' + employeesWIthID);
        
        //retrieving an element at specific key
        System.debug('Employee with ID 102: ' + employeesWIthID.get(102));
        System.debug('Map size: ' + employeesWIthID.size());
        System.debug('Map contains key 101: ' + employeesWIthID.containsKey(101));
        System.debug('Map contains value Jane Smith: ' + employeesWIthID.containsValue('Jane Smith'));

        employeesWIthID.keySet(); // Get all keys
        employeesWIthID.values(); // Get all values
        employeesWIthID.putAll(new Map<Integer,String>{104 => 'Emily Davis', 105 => 'David Wilson'});
        System.debug('Employee Map after putAll: ' + employeesWIthID);
        employeesWIthID.remove(103);
        System.debug('Employee Map after removing key 103: ' + employeesWIthID);


        Map<Id, Contact> contactMap = new Map<Id, Contact>();
        for(COntact con : [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 5])
        {
            System.debug('Contact Name: ' + con.FirstName + ' ' + con.LastName);
            // You can also add contacts to a map with Id as key
            contactMap.put(con.Id, con);
        }

        System.debug('Contact Map: ' + contactMap);
        //retrieve contact by Id
        Id sampleContactId = [SELECT Id FROM Contact LIMIT 1].Id;
        Contact sampleContact = contactMap.get(sampleContactId);

        System.debug('Contact with Id ' + sampleContactId + ': ' + contactMap.get(sampleContactId));
    }

}