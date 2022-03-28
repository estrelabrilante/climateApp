//
//  WeatherManager.swift
//  Clima
//
//  Created by user202406 on 3/22/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    //API key : 692d5c0caa06a72f35debdc0b98b39f3
    //API CALL : request by city name https://api.openweathermap.org/data/2.5/weather?q=London&appid={apikey}&units=metric
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=692d5c0caa06a72f35debdc0b98b39f3&units=metric";
    //define function fetchWeather(input:datatype)
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)";
        print(urlString)
        //calling the function performRequest(parameter: input)
        performRequest(urlString: urlString);
    }
    //define function performRequest(input: datatype)
    func performRequest(urlString: String) {
        //4 steps of networking
        //create a URL object
        
        if let url = URL(string: urlString){
            //create a URLSession which going to do networking
            let session = URLSession(configuration: .default);
            
            //Give URLSession a task
           /*let task =  session.dataTask(with: url, completionHandler: handle(data:response:error:))
 */
           
            let task =  session.dataTask(with: url, completionHandler: {(data,response,error) in
                //error case : not execute function
                if error != nil {
                print(error!)
                    return
                }
                //no error
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                    //****************************
                    //web case: utf8
                  /*  let dataString = String(data: safeData, encoding:.utf8 )
                    print(dataString!);*/
                }
            
            })
            //start the task(enter the search)
            task.resume()
            
        }
    }

//parse JSON format into actual swift object
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder();
        //calling
        do{
       let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
           // print(decodedData.name)
           // print(decodedData.main.temp)
           // print(decodedData.weather[0].description)
           // print(decodedData.weather[0].id);
            let id = decodedData.weather[0].id;           print(getConditionName(weatherId: id));
        }catch{
            print(error)
        }
    }
    func getConditionName(weatherId:Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        
        default:
           return "cloud"
        }
    }
//***********************************************
    //not return : Void
   /* func handle(data:Data?, response:URLResponse? ,error: Error?) ->Void  {
        
        //error case : not execute function
        if error != nil {
        print(error!)
            return
        }
        //no error
        if let safeData = data {
            //web case: utf8
            let dataString = String(data: safeData, encoding:.utf8 )
            print(dataString);
        }
    }*/
}
