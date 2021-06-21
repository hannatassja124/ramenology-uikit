//
//  detailCell.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 21/06/21.
//

import UIKit

class detailCell: UITableViewCell {
    
    @IBOutlet weak var textLabelRight: UILabel!
    @IBOutlet weak var textLabelLeft: UILabel!
    
    func setContent(titleRight: String, titleLeft: String) {
        textLabelRight.text = titleRight
        textLabelLeft.text = titleLeft
    }
}
