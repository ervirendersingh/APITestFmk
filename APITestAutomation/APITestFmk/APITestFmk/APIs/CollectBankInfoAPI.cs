using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using APITestFmk.Models;

namespace APITestFmk.APIs
{
    public class CollectBankInfoAPI
    {
        CollectBankInfoAPIResponseData responseData;

        public CollectBankInfoAPIResponseData SendRequest(CollectBankInfoAPIPayload payload)
        {
            string bankInfoPayloadJSON = payload.GetJSON();

            // Prepare web request...
            HttpWebRequest httpWebRequest =
              (HttpWebRequest)WebRequest.Create(ConfigurationManager.AppSettings.Get("CollectBankInfoAPIURL"));

            httpWebRequest.Method = "POST";
            httpWebRequest.ContentType = "application/json";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                streamWriter.Write(bankInfoPayloadJSON);
                streamWriter.Flush();
                streamWriter.Close();
            }

            try
            {
                using (var response = httpWebRequest.GetResponse() as HttpWebResponse)
                {
                    if (httpWebRequest.HaveResponse && response != null)
                    {
                        using (var streamReader = new StreamReader(response.GetResponseStream()))
                        {
                            var result = streamReader.ReadToEnd();
                            System.Console.WriteLine(result.ToString());
                            var serializer = new JavaScriptSerializer();
                            responseData = serializer.Deserialize<CollectBankInfoAPIResponseData>(result.ToString());
                        }
                    }
                }
            }

            catch(WebException webExp)
            {
                if(webExp.Response !=null)
                {
                    using (var errResponse = (HttpWebResponse)webExp.Response)
                    {
                        using (var streamReader = new StreamReader(errResponse.GetResponseStream()))
                        {
                            var result = streamReader.ReadToEnd();
                            System.Console.WriteLine(result.ToString());
                            var serializer = new JavaScriptSerializer();
                            responseData = serializer.Deserialize<CollectBankInfoAPIResponseData>(result.ToString());
                        }

                    }
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine("Exception - " + e.Message);
            }
            return responseData;
        }

    }
}
