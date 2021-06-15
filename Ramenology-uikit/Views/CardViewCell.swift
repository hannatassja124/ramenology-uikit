//
//  CardViewCell.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import UIKit

class CardViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var tagsLabelView: UILabel!
    @IBOutlet weak var nameLabelView: UILabel!
    
    func setCard(card: Card) {
        cardImageView.image = card.image
        tagsLabelView.text = "  "+card.tags+"  "
        nameLabelView.text = "  "+card.name+"  "
        
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.cornerRadius = 10
        
        tagsLabelView.backgroundColor = .appRed
        tagsLabelView.textColor = .appWhite
        
        nameLabelView.backgroundColor = .appWhiteLight
        nameLabelView.textColor = .appBlack
    }
}
