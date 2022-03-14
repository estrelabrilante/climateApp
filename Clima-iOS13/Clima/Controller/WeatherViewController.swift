//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var serachTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //textField will notify viewController
        serachTextField.delegate = self
    }
  //search button pressed
    @IBAction func searchPressed(_ sender: UIButton) {
        serachTextField.endEditing(true)
        print(serachTextField.text!);
    }
    //Return key  should act
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        serachTextField.endEditing(true)
        print(serachTextField.text!)
        return true;
    }
    //useful for multiple textFileds if identity is not specified
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if serachTextField.text != ""{
            return true
        }
        else{
            serachTextField.placeholder = "Enter a city name"
            return false
        }
    }
    //clear textField after pressing search button or return key("Here : GO")
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use search.text to get weather for that city before editing to empty / reset textField
        serachTextField.text = ""
        
    }
    
    
}

