// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract KYC{
    address admin;

    constructor () public{
        admin =msg.sender;
    }
    
    /*
    @ checks whether the requestor is admin
    */
     modifier onlyadmin(){
        require(msg.sender ==admin,"Only admin to operate this functionality");
        _;
    }
    
     struct Bank{
        string name;
        address Address;
        uint256 kycCount;
        bool isAllowedToAddCustomer;
        bool kycPrivilege;
    }
     
     struct Customer{
        string name;
        string data;
        address validatedBank;
        bool kycStatus;
    }

     mapping (address => Bank)banks; // Mapping a bank's address to the Bank
     mapping (string => Customer)customersDetails; // Mapping a customer's username to the Customer

   




 /**
     *
     *  Name        :   areBothStringSame
     *  Description :   This is an internal function is verify equality of strings
     *  Parameters  :
     *  @param {string} a :   1st string
     *  @param  {string} b :   2nd string
     *
    **/

     function areBothStringSame(string memory a, string memory b) private pure returns (bool) {
        if(bytes(a).length != bytes(b).length) {
            return false;
        } else {
            return keccak256(bytes(a)) == keccak256(bytes(b));
        }
    }
    
    
     /**
     *  Name        :   addNewBank
     *  Description :   This function is used by the admin to add a new bank to the KYC Contract. This function can be called by admin only.
     *  Parameters  :
     *  param  {string} bankName :  The name of the bank/organisation.
     *  param  {address} add :  The  unique Ethereum address of the bank/organisation
     *
     **/

     function addNewBank(string memory bankName,address add) public onlyadmin{
        require(!areBothStringSame (banks[add].name,bankName),"A bank already exist with same name");
        banks[add]=Bank(bankName,add,0,true,true);

    }
    
    /**
     *
     *  Name        :   blockBankFromKYC
     *  Description :   This function can only be used by the admin to change the status of kyc Permission of any of the
     *                  banks at any point of the time.
     *  Parameters  :
     *    @param  {address} add :  The  unique Ethereum address of the bank
     *
     **/
         
    

    function blockBankFromKYC(address add) public onlyadmin returns(int){
        require(banks[add].Address != address(0),"Bank not found");
        banks[add].kycPrivilege =false;
        return 1;
    }

    /**
     *
     *  Name        :   allowBankFromKYC
     *  Description :   This function can only be used by the admin to change the status of kyc Permission of any of the
     *                  banks at any point of the time.
     *  Parameters  :
     *      @param  {address} add :  The  unique Ethereum address of the bank
     *
     **/

     function allowBankFromKYC(address add) public onlyadmin returns(int){
        require(banks[add].Address != address(0),"Bank not found");
        banks[add].kycPrivilege =true;
        return 1;
    }


      /**
     *
     *  Name        :   blockBankFromAddingNewCustomers
     *  Description :   This function can only be used by the admin to block any bank to add any new customer.
     *  Parameters  :
     *      @param  {address} add :  The  unique Ethereum address of the bank
     *
     **/
    

     function blockBankFromAddingNewCustomers(address add) public onlyadmin returns(int){
        require(banks[add].Address != address(0),"Bank not found");
        require(banks[add].isAllowedToAddCustomer,"Requested Banks is already blocked to add new customers");
        banks[add].isAllowedToAddCustomer =false;
        return 1;
    }

    





/**
     *
     *  Name        :   allowBankFromAddingNewCustomers
     *  Description :   This function can only be used by the admin to allow any bank to add any new           customer.
     *  Parameters  :
     *      @param  {address} add :  The  unique Ethereum address of the bank
     *
     **/

     function allowBankFromAddingNewCustomers(address add) public onlyadmin returns(int){
        require(banks[add].Address != address(0),"Bank not found");
        require(!banks[add].isAllowedToAddCustomer,"Requested Banks is already allowed to add new   customers");
        banks[add].isAllowedToAddCustomer =true;
        return 1;
    }

     /**
     *
     *  Name        :   addNewCustomerToBank
     *  Description :   This function will add a customer to the customer list. If IsAllowed is false then don't process
     *                  the request.
     *  Parameters  :
     *      param {string} custName :  The name of the customer
     *      param {string} custData :  The hash of the customer data as a string.
     *
     **/
   
     function addNewCustomerToBank(string memory custName,string memory custData) public{
        require(banks[msg.sender].isAllowedToAddCustomer,"Requested Banks is blocked to add new customers");
        require(customersDetails[custName].validatedBank ==address(0),"requested cutomers already exists");
        customersDetails[custName]= Customer(custName,custData,msg.sender,false);
    }

    /**
     *
     *  Name        :   addNewCustomerRequestForKYC
     *  Description :   This function is used to add the KYC request to the requests list. If kycPermission is set to false bank won’t be allowed to add requests for any customer.
     *  Parameters  :
     *      @param  {string} custName :  The name of the customer for whom KYC is to be done
     *
     **/

     
     function addNewCustomerRequestForKYC(string memory custName) public returns(int){
        require(banks[msg.sender].kycPrivilege,"Requested Bank do not have kyc privilege");
        customersDetails[custName].kycStatus =true;
        banks[msg.sender].kycCount++;
        return 1;
    }

    /**
     *
     *  Name        :   getCustomerKycStatus
     *  Description :   This function is used to fetch customer kyc status from the smart contract. If true then the customer
     *                  is verified.
     *  Parameters  :
     *      @param  {string} custName :  The name of the customer
     *
     **/

     function getCustomerKycStatus (string memory custName) public view returns(bool){
        require(customersDetails[custName].validatedBank != address(0), "Requested Customer not found");
        return (customersDetails[custName].kycStatus);

    }

    /**
     *
     *  Name        :   viewCustomerData
     *  Description :   This function allows a bank to view details of a customer.
     *  Parameters  :
     *      @param  {string} custName :  The name of the customer
     *
    **/

     function viewCustomerData(string memory custName) public view returns(string memory,bool){
        require(customersDetails[custName].validatedBank != address(0), "Requested Customer not found");
        return (customersDetails[custName].data,customersDetails[custName].kycStatus);

    }

}

