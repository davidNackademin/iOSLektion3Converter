//
//  ViewController.swift
//  iOsFri26Converter
//
//  Created by David Svensson on 2018-01-26.
//  Copyright © 2018 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private let converter = Converter()
    
    private var temperatureValues = (-100...100).map{$0}
    private let userDefaultsRowKey = "defaultCelsiusPickerRow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let row = initialPickerRow()
        celsiusPicker.selectRow(row,  inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: row, inComponent: 0)
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        if let row = savedRow {
            return row
        } else {
            return celsiusPicker.numberOfRows(inComponent: 0) / 2
        }
        
//        if savedRow != 0 {
//            return savedRow
//        } else {
//            return celsiusPicker.numberOfRows(inComponent: 0) / 2
//        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureValues[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureFor(row: row)
        saveSelected(row: row)
        
    }
    
    func displayConvertedTemperatureFor(row: Int) {
        let degreeCelsius = temperatureValues[row]
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreesCelsius: degreeCelsius))°F"
    }
    
    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

