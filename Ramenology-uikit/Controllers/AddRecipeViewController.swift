//
//  AddRecipeViewController.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 19/06/21.
//

import UIKit

class categoryPickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var categoryPicker: UIPickerView!

    var categories:Array<String>!
    override func awakeFromNib() {
        self.categories = Array<String>()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        super.awakeFromNib()
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
    
}

class servingPickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var servingPicker: UIPickerView!
    
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
    
    
}

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories = ["Soup", "Broth", "Topping", "Tare"]
    var number:[Int] = Array(1...20)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //self.categoryPicker.delegate = self
        //self.categoryPicker.dataSource = self
    }


}

extension AddRecipeViewController: UITableViewDelegate {
    
}

extension AddRecipeViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return 1
        } else if (section == 1){
            return 8
        } else if (section == 2){
            return 2
        } else if (section == 3) {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageView", for: indexPath)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeName", for: indexPath)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "linkSource", for: indexPath)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCategory", for: indexPath) as! categoryPickerCell
           //cell.categories = categories
            //cell.isHidden = true
            //cell.categoryPicker.reloadAllComponents();
            return cell
        } else if indexPath.section == 1 && indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cookingTime", for: indexPath)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cookingPicker", for: indexPath)
            //cell.isHidden = true
            return cell
        } else if indexPath.section == 1 && indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "totalServing", for: indexPath)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "servingPicker", for: indexPath) as! servingPickerCell
            //cell.totalServing = number
            //cell.isHidden = true
            //cell.servingPicker.reloadAllComponents();
            return cell
        } else if indexPath.section == 2 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "segmentIngProc", for: indexPath)
            return cell
        } else if indexPath.section == 2 && indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        } else if indexPath.section == 3 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addButton", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeName", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let categoryPicker = NSIndexPath(row: 3, section: 1) as IndexPath
        let cookingPicker = NSIndexPath(row: 5, section: 1) as IndexPath
        let servingPicker = NSIndexPath(row: 7, section: 1) as IndexPath
        
        let categoryCell =  tableView.cellForRow(at: categoryPicker)
        //        let cookingCell =  tableView.cellForRow(at: cookingPicker)
        //        let servingCell =  tableView.cellForRow(at: servingPicker)
        
        var tempHeight:CGFloat = 44
        
        if indexPath.section == 0 && indexPath.row == 0 {
            tempHeight = 168.0
        }
        
        if indexPath.section == 1 && indexPath.row == 3 && categoryCell?.isHidden == true {
            tempHeight = 0.0
        } else if indexPath.section == 1 && indexPath.row == 3 && categoryCell?.isHidden == false{
            tempHeight = 147.0
        }
        
        
        
        return tempHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryPath = NSIndexPath(row: 2, section: 1)
        let servingPath = NSIndexPath(row: 6, section: 1)
        let cookingPath = NSIndexPath(row: 4, section: 1)
        
        let categoryPicker = NSIndexPath(row: 3, section: 1) as IndexPath
        let cookingPicker = NSIndexPath(row: 5, section: 1) as IndexPath
        let servingPicker = NSIndexPath(row: 7, section: 1) as IndexPath
        
        if servingPath as IndexPath == indexPath {
            hiddenViewDatePicker(indexPath: servingPicker)
        } else if cookingPath as IndexPath == indexPath {
            hiddenViewDatePicker(indexPath: cookingPicker)
        } else if categoryPath as IndexPath == indexPath {
            hiddenViewDatePicker(indexPath: categoryPicker)
        }
    }
    
    func animateDatePickerView(iP : IndexPath){
        UIView.animate(withDuration:0.3, animations: { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.deselectRow(at: iP, animated: true)
            self.tableView.endUpdates()
        })
    }
    
    func hiddenViewDatePicker(indexPath: IndexPath){
//        let categoryPicker = NSIndexPath(row: 3, section: 1) as IndexPath
//        let cookingPicker = NSIndexPath(row: 5, section: 1) as IndexPath
//        let servingPicker = NSIndexPath(row: 7, section: 1) as IndexPath
//
//        let categoryCell =  tableView.cellForRow(at: categoryPicker)
//        let cookingCell =  tableView.cellForRow(at: cookingPicker)
//        let servingCell =  tableView.cellForRow(at: servingPicker)
//
//        categoryCell?.isHidden = fieldName == "category" ? !categoryCell!.isHidden : true
//        servingCell?.isHidden = fieldName == "serving" ? !servingCell!.isHidden : true
//        cookingCell?.isHidden = fieldName == "cooking" ? !cookingCell!.isHidden : true
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isHidden = !(cell?.isHidden ?? true)
        animateDatePickerView(iP: indexPath)
    }

    
}
