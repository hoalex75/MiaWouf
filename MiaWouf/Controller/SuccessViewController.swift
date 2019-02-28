//
//  SuccessViewController.swift
//  MiaWouf
//
//  Created by Alex on 18/02/2019.
//  Copyright © 2019 Alexandre Holet. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    var dog: Pet!
    
    @IBOutlet weak var successTextView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        successTextView.text = createText()
        successTextView.font = UIFont.systemFont(ofSize: 50)
        successTextView.adjustsFontSizeToFitWidth = true
        successTextView.minimumScaleFactor = 0.2
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    private func createText() -> String {
        var text = "Wouf de Bienvenue à\n"
        text += "\(dog.name!)\n"
        text += "Vous avez bien été ajouté à notre base de données ! Nous vous contacterons par SMS quand nous aurons trouvé votre âme soeur."
        
        return text
    }

}
