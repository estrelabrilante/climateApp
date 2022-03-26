//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate {
    var weatherManager = WeatherManager();

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.delegate = self
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        searchField.endEditing(true)
        print(searchField.text!);    }
    //Return key  should act
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
        return true;
    }
    //useful for multiple textFileds if identity is not specified
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchField.text != ""{
            return true
        }
        else{
            searchField.placeholder = "Enter a city name"
            return false
        }
    }
    //clear textField after pressing search button or return key("Here : GO")
    func textFieldDidEndEditing(_ textField: UITextField) {
        //user enter city name in the searchField.text to get weather for that city before editing to empty / reset textField
        
        if let city = searchField.text{
            //calling the function fetchWeather
            weatherManager.fetchWeather(cityName: city)
        }
        //reset after clicking go key or search key
        searchField.text = ""
        
    }
    

}

