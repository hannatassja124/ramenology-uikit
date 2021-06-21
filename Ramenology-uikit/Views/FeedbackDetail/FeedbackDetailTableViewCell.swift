//
//  FeedbackDetailTableViewCell.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 16/06/21.
//

import UIKit

class FeedbackDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
