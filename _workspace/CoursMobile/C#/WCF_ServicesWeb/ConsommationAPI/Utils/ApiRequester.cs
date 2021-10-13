using ConsommationAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http.Headers;

namespace ConsommationAPI.Utils
{
    public class ApiRequester
    {
        private string _baseAddress = "https://localhost:44362/api/";

        private HttpClient _client;

        public ApiRequester()
        {
            _client = new HttpClient();
            _client.BaseAddress = new Uri(_baseAddress);
            _client.DefaultRequestHeaders.Accept.Clear();
            _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public User Login(string email, string password)
        {
            string json = JsonConvert.SerializeObject(new { email = email, password = password });
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            using(HttpResponseMessage message = _client.PostAsync("user/login", content).Result)
            {
                if (!message.IsSuccessStatusCode)
                {
                    Console.WriteLine(message.StatusCode);
                }

                string jsonResponse = message.Content.ReadAsStringAsync().Result;
                return JsonConvert.DeserializeObject<User>(jsonResponse);
            }
        }

        public TResult Get<TResult>(string url, string token)
        {
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            using(HttpResponseMessage message = _client.GetAsync(url).Result)
            {
                if(!message.IsSuccessStatusCode)
                {
                    Console.WriteLine(message.StatusCode);
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

        public void Delete(int id)
        {
            using(HttpResponseMessage message = _client.DeleteAsync("contact/" + id).Result)
            {
                if (!message.IsSuccessStatusCode)
                    Console.WriteLine("Message: " + message.StatusCode);
            }
        }

        public void Update(int id, ContactForm form)
        {
            string json = JsonConvert.SerializeObject(form);
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            using(HttpResponseMessage message = _client.PutAsync("contact/" + id, content).Result)
            {
                if (!message.IsSuccessStatusCode)
                    throw new HttpRequestException();
            }
        }
    }
}
