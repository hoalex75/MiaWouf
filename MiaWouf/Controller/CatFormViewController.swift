//
//  CatFormViewController.swift
//  MiaWouf
//
//  Created by Alex on 18/02/2019.
//  Copyright © 2019 Alexandre Holet. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var racePicker: UIPickerView!
    var cat: Pet!
    
    @IBAction func validate() {
        createPetObject()
        checkStatuts()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phone.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToCatSuccess" {
           let successVC = segue.destination as! CatSuccessViewController
           successVC.cat = cat
        }
    }
    
    private func checkStatuts() {
        switch cat.status {
        case .accepted:
            performSegue(withIdentifier: "segueToCatSuccess", sender: self)
        case .rejected(let error):
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let actionAlert = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(actionAlert)
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func createPetObject() {
        let name = nameTextField.text
        let phone = self.phone.text
        let majority = majoritySwitch.isOn
        let genderIndex = sex.selectedSegmentIndex
        let gender : Pet .Gender = genderIndex == 0 ? .male : .female
        let raceIndex = racePicker.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        
        cat = Pet( name: name, hasMajority: majority, phone: phone, race: race, gender: gender)
        
    }
}
