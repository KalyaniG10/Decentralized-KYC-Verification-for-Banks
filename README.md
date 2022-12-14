                              Decentralized KYC Verification Process for Banks


Origin of KYC:
Know your Customer aka KYC originated as a standard to fight against the laundering of illicit money flowing from terrorism, organized crime and drug trafficking. The main process behind KYC is that government and enterprises need to track the customers for illegal and money laundering activities. Moreover, KYC also enables banks to better understand their customers and their financial dealings. This helps them manage their risks and make better decisions.


Need for KYC:
Taking in from the origin of KYC, we can state that there are four major sectors in banking where KYC is needed:

1) Customer Admittance: Making anonymous accounts as restricted entry into the banking system. In    other words, no anonymous accounts are allowed. Preliminary information such as names, birth dates,  addresses, contact numbers is to be collected to provide banking service.

2) Customer Identification: In the case of suspicious banking transactions through a customer, customer accounts can be tracked and flagged. Further, it can be sent to process under the bank head office for review.

3) Monitoring of Bank Activities: Suspicious and doubtful activities in any account can be zeroed in by the bank after understanding its customer base using KYC.

4) Risk Management: Now that bank has all the preliminary information and activity pattern, it can assess the risk and the likelihood of the customer being involved in illegal transactions.

These requirements make the KYC process an essential entity in the banking and financial world. The traditional KYC process is already in place under banks, but there are major challenges related to the same and through this case study we are going to assess and tackle these challenges. Let’s first list out the challenges related to the traditional KYC process.
Problems/Challenges in KYC

 * The disparity in Specifications for KYC.

 i) Every bank has their own KYC process setup and customers need to do the KYC again and again for each bank.

 ii) Due to lack of KYC standards, compiling reach request is time-consuming.

   
* Adverse impact on Customer relationship.

i)  It becomes irksome for the customers to provide the same information to different banking entities and industries.

ii) Banks sometimes even follow up with customers to get more details for KYC.

* Escalating Costs and Time for Banks
      
i) A recent study concluded that overheads of KYC in a bank increase the onboarding cost for a customer by 18% and the minimum time required to 26 days.


Solution using Blockchain:

The blockchain is an immutable distributed ledger shared with everyone involved in the network. Every participant interacts with the blockchain using a public-private cryptographic key combination. Moreover, immutable record storage is provided, which is very hard to tamper.

Banks can utilize the feature set of Blockchain to reduce the difficulties faced by the traditional KYC process. A distributed ledger can be set up between all the banks, where one bank can upload the KYC of a customer and other banks can vote on the legitimacy of the customer details. KYC for the customers will be immutably stored on the blockchain and will be accessible to all the banks in the Blockchain.


Features of the application:

1. Add new bank to Blockchain ledger:

This function is used by the admin to add a new bank to the KYC Contract. This function can be called by admin only. This function takes the below input parameters:

i) bankName of string type: The name of the bank
ii)address of address type: The unique Ethereum address of the bank
 

2. Add New customer to the bank:

This function will add a customer to the customer list. This function takes the below input parameters:

i) custName of string type:  The name of the customer
ii)custData of string type: Customer supporting data such as address and mobile number
 

3. Check KYC status of existing bank customers:

This function is used to fetch customer KYC status from the smart contract. If true, then the customer is verified. This function takes the below input parameter:

i) custName of string type: The name of the customer for whom KYC is to be done
   Output: Return the KYC status, either true or false.

 
4. Perform the KYC of the customer and update the status:

This function is used to add the KYC request to the requests list. If a bank is in banned status then the bank won’t be allowed to add requests for any customer. This function takes the below input parameter:

i) custName of string type: The name of the customer for whom KYC is to be done
 

5. Block bank to add any new customer:

This function can only be used by the admin to block any bank from adding any new customer. This function takes the below input parameter:

i) add of address type: The unique Ethereum address of the bank
 

6. Block bank to do KYC of the customers:

This function can only be used by the admin to change the status of KYC permission of any of the banks at any point of time. This function takes the below input parameter:

i) add of address type: The unique Ethereum address of the bank
 

7. Allow the bank to add new customers which was banned earlier:

This function can only be used by the admin to allow any bank to add any new customer. This function takes the below input parameter:

i) add of address type: The unique Ethereum address of the bank
 

 8. Allow the bank to perform customer KYC which was banned earlier:

This function can only be used by the admin to change the status of KYC Permission of any of the banks at any point of time. This function takes the below input parameter:

i) add of address type: Unique Ethereum address of the bank
 

9. View customer data:

This function allows a bank to view details of a customer. This function takes the below input parameter:

i) custName of string type: The name of the customer



Technologies used:

1) Smart Contract development: Solidity
2) IDE tool: Remix
3) Blockchain: Ethereum
4) Server: Ganache Block

