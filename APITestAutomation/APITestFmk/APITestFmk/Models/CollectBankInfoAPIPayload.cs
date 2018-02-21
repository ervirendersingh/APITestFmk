using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace APITestFmk.Models
{
    [Serializable]
    public class CollectBankInfoAPIPayload
    {
        public string Payment_Method { get; set; }
        public string Bank_Country_Code { get; set; }
        public string Account_Name { get; set; }
        public string Account_Number { get; set; }
        public string Swift_Code { get; set; }
        public string bsb { get; set; }
        public string aba { get; set; }

        public CollectBankInfoAPIPayload()
        {

        }

        public CollectBankInfoAPIPayload(string Payment_Method, string Bank_Country_Code,
                            string Account_Name, string Account_Number,
                            string Swift_Code, string bsb,
                            string aba)
        {
            this.Payment_Method = Payment_Method;
            this.Bank_Country_Code = Bank_Country_Code;
            this.Account_Name = Account_Name;
            this.Account_Number = Account_Number;
            this.Swift_Code = Swift_Code;
            this.bsb = bsb;
            this.aba = aba;
        }

        public string GetJSON()
        {
            var serializer = new JavaScriptSerializer();
            Dictionary<string, string> jsonData = new Dictionary<string, string>();

            jsonData.Add("payment_method", this.Payment_Method);
            jsonData.Add("bank_country_code", this.Bank_Country_Code);
            jsonData.Add("account_name", this.Account_Name);
            jsonData.Add("account_number", this.Account_Number);
            jsonData.Add("swift_code", this.Swift_Code);
            jsonData.Add("bsb", this.bsb);
            jsonData.Add("aba", this.aba);

            return serializer.Serialize(jsonData);
        }

        public override string ToString()
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(this);
        }
    }

    
}
