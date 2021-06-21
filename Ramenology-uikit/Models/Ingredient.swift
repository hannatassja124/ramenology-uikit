//
//  Ingredient.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 19/06/21.
//

import UIKit

class Ingredient {
    var id: Int
    var amount: Int
    var measurement: measurement_enum
    var name: String
    
    init(id: Int, amount: Int, measurement: measurement_enum, name: String) {
        self.id = id
        self.amount = amount
        self.measurement = measurement
        self.name = name
    }
}

enum measurement_enum: String {
    case kg   = "Kg"
    case g    = "gr"
    case pcs  = "pcs"
    case tbsp = "tbsp"
    case cup  = "cup"
}
