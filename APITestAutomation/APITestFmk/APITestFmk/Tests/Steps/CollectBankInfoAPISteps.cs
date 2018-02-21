using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;
using APITestFmk.APIs;
using APITestFmk.Models;
using NUnit.Framework;

namespace APITestFmk.Tests.Steps
{
    [Binding]
    public class CollectBankInfoAPISteps
    {
        CollectBankInfoAPI CollectBankInfoAPI;
        CollectBankInfoAPIResponseData responseData;

        public CollectBankInfoAPISteps()
        {
            CollectBankInfoAPI = new CollectBankInfoAPI();
        }

        [Given(@"Collect Bank Account Info API is called with details")]
        public void GivenCollectBankAccountInfoAPIIsCalledWithDetails(Table table)
        {
            var payloadFields = table.CreateInstance<CollectBankInfoAPIPayload>();
            responseData =  CollectBankInfoAPI.SendRequest(payloadFields);
        }

        [Then(@"Success Message ""(.*)"" is returned")]
        public void ThenSuccessMessageIsReturned(string msg)
        {
            Assert.AreEqual(msg, responseData.Success_Error_Message);
        }

        [Then(@"Error Message ""(.*)"" is returned")]
        public void ThenErrorMessageIsReturned(string msg)
        {
            Assert.AreEqual(msg, responseData.Success_Error_Message);
        }

    }
}
