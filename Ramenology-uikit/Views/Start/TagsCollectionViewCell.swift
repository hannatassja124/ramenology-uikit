//
//  TagsCollectionViewCell.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagLabelView: UILabel!
    var delegate_card:cardProtocols?
    var delegate_tag:tagsProtocols?
    
    func setTag(tag: Tag) {
        tagLabelView.text = "  "+tag.name+"  "
        tagLabelView.borderColor = .appRed
        tagLabelView.borderWidth = 1
        if tag.isSelected {
            tagLabelView.backgroundColor = .appRed
            tagLabelView.textColor = .appWhite
        }
        else {
            tagLabelView.backgroundColor = .appWhite
            tagLabelView.textColor = .appRed
        }
        tagLabelView.cornerRadius = 5
        
        tagLabelView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickable))
        tapGesture.numberOfTouchesRequired = 1
        tagLabelView.addGestureRecognizer(tapGesture)
    }
    
    @objc func clickable(sender: UITapGestureRecognizer) {
        let selected = tagLabelView.text!
        self.delegate_card?.initCard(tags: selected)
        self.delegate_tag?.initTag(selected: selected)
    }
    
}
