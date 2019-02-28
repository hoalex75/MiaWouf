//
//  Pet.swift
//  MiaWouf
//
//  Created by Alex on 19/02/2019.
//  Copyright © 2019 Alexandre Holet. All rights reserved.
//

import Foundation
struct Pet{
    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
    
    enum Gender{
        case male
        case female
    }
    
    enum Status {
        case accepted
        case rejected(String)
    }
    
    var status: Status {
        if name == nil || name == "" {
            return .rejected("Vous n'avez pas indiqué votre nom !")
        }
        if phone == nil || phone == "" {
            return .rejected("Vous n'avez pas indiqué votre téléphone !")
        }
        if race == nil || race == "" {
            return .rejected("Quel est votre race ?")
        }
        if !hasMajority {
            return .rejected("Les mineurs ne sont pas admis.")
        }
        return .accepted
    }
}
