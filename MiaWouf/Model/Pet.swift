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
}
