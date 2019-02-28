//
//  FormViewController.swift
//  MiaWouf
//
//  Created by Alex on 18/02/2019.
//  Copyright © 2019 Alexandre Holet. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmented: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var racePicker: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func validateForm() {
        createPetObject()
    }
    @IBAction func dismissKeyboards(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let majority = majoritySwitch.isOn
        let genderIndex = genderSegmented.selectedSegmentIndex
        let gender : Pet .Gender = genderIndex == 0 ? .male : .female
        let raceIndex = racePicker.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        
        let dog = Pet( name: name, hasMajority: majority, phone: phone, race: race, gender: gender)
        
    }
}
