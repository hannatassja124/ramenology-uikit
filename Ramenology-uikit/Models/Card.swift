//
//  Card.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

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

func getCard(tags: String = tag.all.rawValue) -> [Card] {
    let tempCard: [Card] = [
        Card(image: #imageLiteral(resourceName: "image_2"), tags: tag.noodle.rawValue, name: "Test Noodle"),
        Card(image: #imageLiteral(resourceName: "image_1"), tags: tag.broth.rawValue, name: "Test broth"),
        Card(image: #imageLiteral(resourceName: "image_3"), tags: tag.tare.rawValue, name: "Test Tare")
    ]
    let tempTag = tags.trimmingCharacters(in: .whitespacesAndNewlines)
    var resultCard: [Card] = []
    if tempTag != "" {
        for card in tempCard {
            if card.tags == tempTag || tempTag == tag.all.rawValue {
                resultCard.append(card)
            }
        }
    }
    else {
        resultCard = tempCard
    }
    
    return resultCard
}
