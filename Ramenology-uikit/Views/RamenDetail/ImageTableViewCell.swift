//
//  ImageTableViewCell.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 15/06/21.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var imageLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
