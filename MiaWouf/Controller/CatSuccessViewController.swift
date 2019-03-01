//
//  CatSuccessViewController.swift
//  MiaWouf
//
//  Created by Alex on 18/02/2019.
//  Copyright © 2019 Alexandre Holet. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {
    var cat: Pet!
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = createText()
        let font = UIFont.systemFont(ofSize: 60)
        text.font = font
        text.adjustsFontSizeToFitWidth = true
        text.minimumScaleFactor = 0.2
    }
    

    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    private func createText() -> String {
        var textToWrite = "Miaou de Bienvenue à\n"
        textToWrite += "\(cat.name!)\n"
        textToWrite += "Vous avez bien été ajouté à notre base de données ! Nous vous contacterons par SMS quand nous aurons trouvé votre âme soeur."
        
        return textToWrite
    }

}
