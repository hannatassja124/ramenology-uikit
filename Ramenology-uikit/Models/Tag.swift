//
//  Tag.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import UIKit

class Tag {
    var id: Int
    var name: String
    var isSelected: Bool
    
    init(id: Int, name: String, isSelected: Bool) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}

func getTag(selected: String = tag_enum.all.rawValue) -> [Tag] {
    let tempTags: [Tag] = [
        Tag(id: 1,name: tag_enum.all.rawValue, isSelected: false),
        Tag(id: 2,name: tag_enum.broth.rawValue, isSelected: false),
        Tag(id: 3,name: tag_enum.tare.rawValue, isSelected: false),
        Tag(id: 4,name: tag_enum.topping.rawValue, isSelected: false),
        Tag(id: 5,name: tag_enum.noodle.rawValue, isSelected: false),
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

enum tag_enum: String {
    case all = "All"
    case broth = "Broth"
    case tare = "Tare"
    case topping = "Topping"
    case noodle = "Noodle"
}
