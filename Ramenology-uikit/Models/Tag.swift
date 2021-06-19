//
//  Tag.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import UIKit

class Tag {
    var name: String
    var isSelected: Bool
    
    init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
}

func getTag(selected: String = tag.all.rawValue) -> [Tag] {
    let tempTags: [Tag] = [
        Tag(name: tag.all.rawValue, isSelected: false),
        Tag(name: tag.broth.rawValue, isSelected: false),
        Tag(name: tag.tare.rawValue, isSelected: false),
        Tag(name: tag.topping.rawValue, isSelected: false),
        Tag(name: tag.noodle.rawValue, isSelected: false),
    ]
    
    let tempTag = selected.trimmingCharacters(in: .whitespacesAndNewlines)
    var resultTag: [Tag] = []
    for tag in tempTags {
        if tag.name == tempTag {
            tag.isSelected = true
        }
        resultTag.append(tag)
    }
    return resultTag
}

enum tag: String {
    case all = "All"
    case broth = "Broth"
    case tare = "Tare"
    case topping = "Topping"
    case noodle = "Noodle"
}
