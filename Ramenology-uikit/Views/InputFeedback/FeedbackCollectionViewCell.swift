//
//  FeedbackCollectionViewCell.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 17/06/21.
//

import UIKit

class FeedbackCollectionViewCell: UICollectionViewCell {

    
    var isButtonSelected: Bool = false
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func select() {
        self.isButtonSelected = !self.isButtonSelected
        if (self.isButtonSelected) {
            button.tintColor = .red
            button.backgroundColor = .blue
        }
        
    }

}
