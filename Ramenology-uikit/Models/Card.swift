//
//  Card.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import Foundation
import UIKit

class Card {
    var image: UIImage
    var tags: String
    var name: String
    
    init(image: UIImage, tags: String, name: String) {
        self.image = image
        self.tags = tags
        self.name = name
    }
}
