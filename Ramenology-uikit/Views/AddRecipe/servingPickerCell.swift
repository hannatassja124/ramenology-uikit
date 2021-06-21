//
//  servingPickerCell.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 21/06/21.
//

import UIKit

class servingPickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var servingPicker: UIPickerView!
    
    weak var delegate: setValueDelegate?
    
    var totalServing:Array<Int>!
    override func awakeFromNib() {
        self.totalServing = Array<Int>()
        self.servingPicker.delegate = self
        self.servingPicker.dataSource = self
        super.awakeFromNib()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return totalServing.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(totalServing[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.delegate?.setCategory(fieldName: "serving", value:"\(totalServing[row])")
        print("test", totalServing[row])
    }
    
}
