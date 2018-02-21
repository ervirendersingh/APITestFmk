using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace APITestFmk.Models
{
    [Serializable]
    public class CollectBankInfoAPIResponseData
    {
        public string success { get; set; }
        public string error { get; set; }

        public string Success_Error_Message
        {
            get { if (success != null) return success;
                else return error;
            }
        }

        public CollectBankInfoAPIResponseData()
        {

        }

        public CollectBankInfoAPIResponseData(string success, string error)
        {
            this.success = success;
            this.error = error;
        }

        public override string ToString()
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(this);
        }

        public bool ValidateSuccessMessageWith(string message)
        {
            if (success == message)
                return true;
            else
                return false;
        }

        public bool ValidateErrorMessageWith(string message)
        {
            if (error == message)
                return true;
            else
                return false;
        }
    }
}
