//
//  FormViewController.swift
//  MiaWouf
//
//  Created by Alex on 18/02/2019.
//  Copyright © 2019 Alexandre Holet. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    var dog: Pet!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmented: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var racePicker: UIPickerView!
    
    
    @IBAction func validateForm() {
        createPetObject()
        checkStatuts()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess" {
            let successVC = segue.destination as! SuccessViewController
            successVC.dog = dog
        }
    }
    
    private func checkStatuts() {
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "segueToSuccess", sender: self)
        case .rejected(let error):
            createAndDisplayAlert(error: error)
        }
    }
    
    private func createAndDisplayAlert(error: String){
        let alertVC = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
    
    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let majority = majoritySwitch.isOn
        let genderIndex = genderSegmented.selectedSegmentIndex
        let gender : Pet .Gender = genderIndex == 0 ? .male : .female
        let raceIndex = racePicker.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        
        dog = Pet( name: name, hasMajority: majority, phone: phone, race: race, gender: gender)
        
    }
}

extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
}

extension FormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKeyboards(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}
