//
//  ViewController.swift
//  Quantity Measurement
//
//  Created by gadgetzone on 11/07/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var array = ["Feet To Yard", "Feet To Inch", "Yard To Feet", "Yard To Inch", "Inch To Feet", "Inch To Yard"]
    
    @IBOutlet weak var chooseConversionPicker: UIPickerView!
    @IBOutlet weak var convertedResultLabel: UILabel!
    @IBOutlet weak var enterNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseConversionPicker.delegate = self
        chooseConversionPicker.dataSource = self
        enterNumberTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedNumbers = CharacterSet.decimalDigits
        let digitSet = CharacterSet(charactersIn: string)
        return allowedNumbers.isSuperset(of: digitSet)
    }
    
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let result: Double
        switch array[row] {
        case "Feet To Yard":
            let result = Double(enterNumberTextField.text!)! / 3.0
            convertedResultLabel.text = (" \(String(format: "%.4f", result)) yd")
        case "Feet To Inch":
            result = Double(enterNumberTextField.text!)! * 12
            convertedResultLabel.text = ("\(String(format: "%.2f", result)) in")
        case "Yard To Feet":
            let feet = Double(enterNumberTextField.text!)
            result = feet! * 3
            convertedResultLabel.text = ("\(String(format: "%.4f", result)) ft")
        case "Yard To Inch":
            result = Double(enterNumberTextField.text!)! * 36
            convertedResultLabel.text = ("\(String(format: "%.2f", result)) in")
        case "Inch To Feet":
            result = Double(enterNumberTextField.text!)! / 12
            convertedResultLabel.text = ("\(String(format: "%.4f", result)) ft")
        case "Inch To Yard":
            result = Double(enterNumberTextField.text!)! / 36
            convertedResultLabel.text = ("\(String(format: "%.4f", result)) yd")
        default:
            break
        }
    }
}
