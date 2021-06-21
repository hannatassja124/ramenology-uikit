//
//  cookingPickerCell.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 21/06/21.
//

import UIKit

class cookingPickerCell: UITableViewCell  {

    @IBOutlet weak var cookingPicker: UIDatePicker!
    weak var delegate: setValueDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func durationChanged(_ sender: UIDatePicker) {
        let duration = labelDuration(duration: Int(cookingPicker.countDownDuration))
        self.delegate?.setCategory(fieldName: "cooking", value: duration)
    }
    
    func labelDuration (duration : Int) -> String{
        let (h, m, _) = secondsToHoursMinutesSeconds(seconds: duration)
        let text = duration < 3600 ? "\(m) minutes" : "\(h) hours \(m) minutes"
        return text
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    
    

}
