//
//  Card.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import UIKit

class Ramen {
    var id: Int?
    var image: UIImage!
    var tags: String!
    var name: String!
    
    var created: Date?
    var duration: Int?
    var serving: Int?
    var source: String?
    var feedbacks: [Feedbacks]?
    var ingredients: [Ingredients]?
    var process: [Processes]?
    
    init(id: Int, image: UIImage, tags: String, name: String, created: Date, duration: Int, serving: Int, source: String, feedbacks: [Feedbacks], ingredients: [Ingredients], process: [Processes]) {
        self.id = id
        self.image = image
        self.tags  = tags
        self.name  = name
        self.created     = created
        self.duration    = duration
        self.serving     = serving
        self.source      = source
        self.feedbacks   = feedbacks
        self.ingredients = ingredients
        self.process     = process
    }
    
    ///For card at start page
    init(image: UIImage, tags: String, name: String) {
        self.image = image
        self.tags = tags
        self.name = name
    }

}

func getCard(tags: String = tag_enum.all.rawValue) -> [Ramen] {
    let tempCard: [Ramen] = [
        Ramen(image: #imageLiteral(resourceName: "image_2"), tags: tag_enum.noodle.rawValue, name: "Test Noodle"),
        Ramen(image: #imageLiteral(resourceName: "image_1"), tags: tag_enum.broth.rawValue, name: "Test broth"),
        Ramen(image: #imageLiteral(resourceName: "image_3"), tags: tag_enum.tare.rawValue, name: "Test Tare")
    ]
    let tempTag = tags.trimmingCharacters(in: .whitespacesAndNewlines)
    var resultCard: [Ramen] = []
    if tempTag != "" {
        for card in tempCard {
            if card.tags == tempTag || tempTag == tag_enum.all.rawValue {
                resultCard.append(card)
            }
        }
    }
    else {
        resultCard = tempCard
    }
    
    return resultCard
}
