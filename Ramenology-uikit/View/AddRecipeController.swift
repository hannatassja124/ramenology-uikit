//
//  AddRecipeController.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 14/06/21.
//

import UIKit


class AddRecipeController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var servingPicker: UIPickerView!
    @IBOutlet weak var cookingTimePicker: UIDatePicker!
    @IBOutlet weak var ingredientProcessTable: UITableView!
    
    var categories: [String] = []
    var number:[Int] = Array(1...20)
    var process:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        self.servingPicker.delegate =  self
        self.servingPicker.dataSource = self
        
        categories = ["Soup", "Broth", "Topping", "Tare"]
        
        hiddenViewDatePicker(fieldName: "init", indexPath: [-1])
        
        process = ["test", "test1", "test2"]

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return categories.count
        } else {
            return number.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return categories[row]
        } else {
            return "\(number[row])"
        }
    }
    
    func hiddenViewDatePicker(fieldName : String, indexPath: IndexPath){
        categoryPicker.isHidden = fieldName == "category" ? !categoryPicker.isHidden : true
        servingPicker.isHidden = fieldName == "serving" ? !servingPicker.isHidden : true
        cookingTimePicker.isHidden = fieldName == "duration" ? !cookingTimePicker.isHidden : true
        
        animateDatePickerView(iP: indexPath)
    }
    
    func animateDatePickerView(iP : IndexPath){
        UIView.animate(withDuration:0.3, animations: { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.deselectRow(at: iP, animated: true)
            self.tableView.endUpdates()
        })
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isCellCategory = indexPath.section == 0 && indexPath.row == 3
        let isCellServing = indexPath.section == 0 && indexPath.row == 7
        let isCellDuration = indexPath.section == 0 && indexPath.row == 5
        
        //let isCellImage = indexPath.section == 0 && indexPath.row == 0
        
        var tempHeight:CGFloat = 44.0
        
        if (isCellServing && servingPicker.isHidden) || (isCellCategory && categoryPicker.isHidden) || (isCellDuration && cookingTimePicker.isHidden){
            tempHeight = 0.0
        }
        
        if (isCellServing && !servingPicker.isHidden) || (isCellCategory && !categoryPicker.isHidden) || (isCellDuration && !cookingTimePicker.isHidden){
            tempHeight = 170.0
        }
        
//        if (isCellImage){
//            tempHeight = 170.0
//        }
        
        return tempHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryPath = NSIndexPath(row: 2, section: 0)
        let servingPath = NSIndexPath(row: 6, section: 0)
        let durationPath = NSIndexPath(row: 4, section: 0)

        
        if categoryPath as IndexPath == indexPath {
            hiddenViewDatePicker(fieldName: "category", indexPath: indexPath)
        } else if servingPath as IndexPath == indexPath {
            hiddenViewDatePicker(fieldName: "serving", indexPath: indexPath)
        } else if durationPath as IndexPath == indexPath {
            hiddenViewDatePicker(fieldName: "duration", indexPath: indexPath)
        }
    }
    
    

    
    
    

}




