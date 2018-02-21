Feature: CollectBankInfoAPISpecs
	Feature to verify the API for collecting bank account info 

	Scenario: CollectBankInfoAPI001_Verify that US bank account details are saved successfully
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   | 123            | ISBCUSBJ   | 11122233A |     |
	Then Success Message "Bank details saved" is returned
	
	Scenario: CollectBankInfoAPI002_Verify that bank account details are not saved when Payment method is incorrect
	Given Collect Bank Account Info API is called with details
	| Payment_Method  | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT_Incorrect | US                | Test User1   | 123            | ISBCUSBJ   | 11122233A |     |
	Then Error Message "'payment_method' field required, the value should be either 'LOCAL' or 'SWIFT'" is returned

	Scenario: CollectBankInfoAPI003_Verify that bank account details are not saved when Payment method is not provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	|                | US                | Test User1   | 123            | ISBCUSBJ   | 11122233A |     |
	Then Error Message "'payment_method' field required, the value should be either 'LOCAL' or 'SWIFT'" is returned

	Scenario: CollectBankInfoAPI004_Verify that US bank account details are saved successfully when Payment method is Local and no Swift Code is provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| LOCAL          | US                | Test User1   | 123            |            | 11122233A |     |
	Then Success Message "Bank details saved" is returned

	Scenario: CollectBankInfoAPI005_Verify that US bank account details are saved successfully when Payment method is Local and Swift Code is provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| LOCAL          | US                | Test User1   | 123            | ISBCUSBJ   | 11122233A |     |
	Then Success Message "Bank details saved" is returned

	Scenario: CollectBankInfoAPI006_Verify that bank account details are not saved when bank country code is not provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          |                   | Test User1   | 123            | ISBCUSBJ   | 11122233A |     |
	Then Error Message "'bank_country_code' is required, and should be one of 'US', 'AU', or 'CN'" is returned

	Scenario: CollectBankInfoAPI007_Verify that bank account details are not saved when account name is not provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                |              | 123            | ISBCUSBJ   | 11122233A |     |
	Then Error Message "'account_name' is required" is returned

	Scenario: CollectBankInfoAPI008_Verify that bank account details are not saved when account number is not provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   |                | ISBCUSBJ   | 11122233A |     |
	Then Error Message "'account_number' is required" is returned

	Scenario: CollectBankInfoAPI009_Verify that bank account details are not saved when Swift Code is not provided and Payment method is Swift
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   | 123            |            | 11122233A |     |
	Then Error Message "'swift_code' is required when payment method is 'SWIFT'" is returned

	Scenario: CollectBankInfoAPI010_Verify that bank account details are not saved when bsb is not provided and bank country code is AU
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | AU                | Test User1   | 12367856       | ISBCAUBJ   |     |     |
	Then Error Message "'bsb' is required when bank country code is 'AU'" is returned
	
	Scenario: CollectBankInfoAPI011_Verify that US bank account details are not saved when account number is more than 17 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number     | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   | 123456789012345678 | ISBCUSBJ   | 11122233A |     |
	Then Error Message "Length of account_number should be between 7 and 11 when bank_country_code is 'US'" is returned

	Scenario: CollectBankInfoAPI012_Verify that US bank account details are saved successfully when account number is 17 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number    | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   | 1234567890123ABCD | ISBCUSBJ   | 11122233A |     |
	Then Success Message "Bank details saved" is returned
	
	Scenario: CollectBankInfoAPI013_Verify that AU bank account details are not saved when account number is less than 6 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb    |
	| SWIFT          | AU                | Test User1   | 123            | ISBCAUBJ   |     | 887221 |
	Then Error Message "Length of account_number should be between 6 and 9 when bank_country_code is 'AU'" is returned

	Scenario: CollectBankInfoAPI014_Verify that AU bank account details are not saved when account number is more than 9 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb    |
	| SWIFT          | AU                | Test User1   | 1234567890     | ISBCAUBJ   |     | 887221 |
	Then Error Message "Length of account_number should be between 6 and 9 when bank_country_code is 'AU'" is returned

	Scenario: CollectBankInfoAPI015_Verify that AU bank account details are saved successfully
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb    |
	| SWIFT          | AU                | Test User1   | 123ABCDE       | ISBCAUBJ   |     | 887221 |
	Then Success Message "Bank details saved" is returned

	Scenario: CollectBankInfoAPI016_Verify that CN bank account details are not saved when account number is less than 8 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | AU                | Test User1   | 123            | ISBCAUBJ   |     |     |
	Then Error Message "Length of account_number should be between 8 and 20 when bank_country_code is 'CN'" is returned

	Scenario: CollectBankInfoAPI017_Verify that CN bank account details are not saved when account number is more than 20 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number           | Swift_Code | aba | bsb |
	| SWIFT          | AU                | Test User1   | 1234567890ABCDEFGHIJK223 | ISBCCNBJ   |     |     |
	Then Error Message "Length of account_number should be between 6 and 9 when bank_country_code is 'AU'" is returned

	Scenario: CollectBankInfoAPI018_Verify that CN bank account details are saved successfully
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | CN                | Test User1   | 123ABCDE       | ISBCCNBJ   |     |     |
	Then Success Message "Bank details saved" is returned

	Scenario: CollectBankInfoAPI019_Verify that CN bank account details are not saved when Swift Code is incorrect
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | CN                | Test User1   | 123ABCDE       | ISBCAUBJ   |     |     |
	Then Error Message "The swift code is not valid for the given bank country code: CN" is returned

	Scenario: CollectBankInfoAPI020_Verify that AU bank account details are not saved when Swift Code is incorrect
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb    |
	| SWIFT          | AU                | Test User1   | 123ABCDE       | ISBCCNBJ   |     | 567456 |
	Then Error Message "The swift code is not valid for the given bank country code: AU" is returned

	
	Scenario: CollectBankInfoAPI021_Verify that US bank account details are not saved when Swift Code is incorrect
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   | 123ABCDE       | ISBCCNBJ   | 11122233A |     |
	Then Error Message "The swift code is not valid for the given bank country code: US" is returned

	Scenario: CollectBankInfoAPI022_Verify that US bank account details are not saved when Swift Code is more than 11 characters
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code     | aba       | bsb |
	| SWIFT          | US                | Test User1   | 123ABCDE       | ISBCUSBJgggggg | 11122233A |     |
	Then Error Message "Length of 'swift_code' should be either 8 or 11" is returned

	Scenario: CollectBankInfoAPI023_Verify that US bank account details are not saved when Swift Code is less than 8 characters
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | Test User1   | 123ABCDEFGHI   | ISBCUS     | 11122233A |     |
	Then Error Message "Length of 'swift_code' should be either 8 or 11" is returned

	Scenario: CollectBankInfoAPI024_Verify that AU bank account details are not saved when bsb number is less than 6 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | AU                | Test User1   | 1234567        | ISBCAUBJ   |     | 887 |
	Then Error Message "Length of 'bsb' should be 6" is returned

	Scenario: CollectBankInfoAPI025_Verify that AU bank account details are not saved when bsb number is more than 6 characters long
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb     |
	| SWIFT          | AU                | Test User1   | 1234567        | ISBCAUBJ   |     | 8875678 |
	Then Error Message "Length of 'bsb' should be 6" is returned

	Scenario: CollectBankInfoAPI026_Verify that US bank account details are not saved when aba is not provided
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | US                | Test User1   | 123            | ISBCUSBJ   |     |     |
	Then Error Message "'aba' is required when bank country code is 'US'" is returned

	Scenario: CollectBankInfoAPI027_Verify that US bank account details are not saved when aba is less than 9 characters
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba | bsb |
	| SWIFT          | US                | Test User1   | 123            | ISBCUSBJ   | 123 |     |
	Then Error Message "Length of 'aba' should be 9" is returned

	Scenario: CollectBankInfoAPI028_Verify that US bank account details are not saved when aba is more than 9 characters
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba          | bsb |
	| SWIFT          | US                | Test User1   | 123            | ISBCUSBJ   | 123456789ABC |     |
	Then Error Message "Length of 'aba' should be 9" is returned

	Scenario: CollectBankInfoAPI029_Verify that bank account details are not saved when account name is of 1 character
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | T            | 123            | ISBCUSBJ   | 33311122A |     |
	Then Error Message "Length of account_name should be between 2 and 10" is returned

	Scenario: CollectBankInfoAPI030_Verify that bank account details are not saved when account name is of more than 10 characters
	Given Collect Bank Account Info API is called with details
	| Payment_Method | Bank_Country_Code | Account_Name | Account_Number | Swift_Code | aba       | bsb |
	| SWIFT          | US                | T1234567890  | 123            | ISBCUSBJ   | 33311122A |     |
	Then Error Message "Length of account_name should be between 2 and 10" is returned
	
