//
//  categoryPickerCell.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 21/06/21.
//

import UIKit

class categoryPickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var categoryPicker: UIPickerView!

    var categories:Array<String>!
    
    weak var delegate: setValueDelegate?
    
    override func awakeFromNib() {
        self.categories = Array<String>()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(categories[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.delegate?.setCategory(fieldName: "category", value:"\(categories[row])")
    }
}
