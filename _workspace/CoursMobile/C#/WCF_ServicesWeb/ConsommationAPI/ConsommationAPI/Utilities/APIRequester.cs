using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using ConsommationAPI.Model;

namespace ConsommationAPI.Utilities
{
    public class APIRequester
    {
        private string _baseAddress = "https://localhost:44362/api/";

        private HttpClient _client;

        public APIRequester()
        {
            _client = new HttpClient();
            _client.BaseAddress = new Uri(_baseAddress);
        }

        public TResult Get<TResult>(string url)
        {
            using (HttpResponseMessage message = _client.GetAsync("contact").Result)
            {
                if (!message.IsSuccessStatusCode)
                {
                    throw new HttpRequestException();
                }

                string json = message.Content.ReadAsStringAsync().Result;

                return JsonConvert.DeserializeObject<TResult>(json);
            }
        }

        public void Post(ContactForm form)
        {
            string json = JsonConvert.SerializeObject(form);
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            using(HttpResponseMessage message = _client.PostAsync("contact", content).Result)
            {
                if (!message.IsSuccessStatusCode)
                {
                    throw new HttpRequestException();
                }
            }
        }
    }
}
