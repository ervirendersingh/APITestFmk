Steps to execute the tests:
1. Using Visual Studio IDE
	- Open the solution in visual studio
	- Navigate to Test Explorer (Test -> Windows -> Test Explorer)
	- Select the desired tests and Run

2. Using NUnit Console
	- Open Command Prompt
	- Under the solution folder, search for a folder named "packages" and open it
	- Open NUnit.ConsoleRunner.3.8.0 -> tools folder
	- Copy the directory path and change the directory in the Command Prompt to this location
	- Run command:
		nunit3-console.exe %Solution_Folder_Path%\APITestFmk\bin\Debug\APITestFmk.dll
	- TestResults xml for the tests execution can be found under NUnit.ConsoleRunner.3.8.0 -> tools folder

Note: 
Configuring API URL - 
	API url is configurable from "App.config" under Project "APITestFmk"
	To update the URL, open App.config from above location and update the value under key=CollectBankInfoAPIURL
	<appSettings>
    		<add key="CollectBankInfoAPIURL" value="http://preview.airwallex.com:30001/bank" />
  	</appSettings>