//
//  AddRecipeViewController.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 19/06/21.
//

import UIKit

enum Segment: String {
    case ingredient
    case process
}

class recipeNameCell: UITableViewCell {
    
    @IBOutlet weak var recipeNameText: UITextField!
    
    var delegate: setValueDelegate?
    
    @IBAction func getVal(_ sender: Any) {
        self.delegate?.setCategory(fieldName: "recipeName", value: recipeNameText.text!)
    }
}

class sourceLinkCell: UITableViewCell {
    
    @IBOutlet weak var sourceLinkText: UITextField!
    
    var delegate: setValueDelegate?
    
        @IBAction func getVal(_ sender: Any) {
            self.delegate?.setCategory(fieldName: "linkSource", value: sourceLinkText.text!)
        }
    
    
}

class AddRecipeViewController: UIViewController, setValueDelegate, deleteCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var categories = ["Soup", "Broth", "Topping", "Tare"]
    var number:[Int] = Array(1...20)
    
    var selectedSteps : Segment = .ingredient
    var testIng:[String] = [""]
    var testProc:[String] = [""]
    
    var category = "Soup"
    var serving = "1"
    var cooking = "0 hours 1 minutes"
    var recipeName = ""
    var linkSource = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Save", style: .plain, target: self, action: #selector(buttonClicked(sender:)))
        
    }
    
    @objc func buttonClicked(sender: UIBarButtonItem) {
        print(recipeName)
        print(linkSource)
        print(category)
        print(cooking)
        print(serving)
    }
    
    
    @IBAction func addCell(_ sender: Any) {
        if selectedSteps == .ingredient {
            testIng.append("")
        } else {
            testProc.append("")
        }
        
        tableView.reloadData()
    }
    
    @IBAction func segmentIngProc(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.selectedSteps = .ingredient
        } else {
            self.selectedSteps = .process
        }
        self.tableView.reloadData()
    }
    
    func setCategory(fieldName: String, value : String){
        if fieldName == "category"{
            category = value
            tableView.reloadRows(at: [IndexPath(row: 2, section: 1)], with: .none)
        } else if fieldName == "cooking" {
            cooking = value
            tableView.reloadRows(at: [IndexPath(row: 4, section: 1)], with: .none)
        } else if fieldName == "serving" {
            serving = value
            tableView.reloadRows(at: [IndexPath(row: 6, section: 1)], with: .none)
        } else if fieldName == "recipeName"{
            recipeName = value
        } else if fieldName == "linkSource"{
            linkSource = value
        }
    }
    
    func deleteCell(row: Int){
        if selectedSteps == .ingredient {
            testIng.remove(at: row)
        } else {
            testProc.remove(at: row)
        }
    }
    
}

protocol setValueDelegate: AnyObject {
    func setCategory(fieldName: String, value: String)
}

protocol deleteCellDelegate: AnyObject {
    func deleteCell(row: Int)
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
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeName", for: indexPath) as! recipeNameCell
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 && indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "linkSource", for: indexPath) as! sourceLinkCell
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 && indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! detailCell
            cell.setContent(titleRight: "Category", titleLeft: category)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCategory", for: indexPath) as! categoryPickerCell
            cell.categories = categories
            cell.delegate = self
            cell.isHidden = true
            cell.categoryPicker.reloadAllComponents();
            return cell
        } else if indexPath.section == 1 && indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! detailCell
            cell.setContent(titleRight: "Cooking Time", titleLeft: cooking)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cookingPicker", for: indexPath) as! cookingPickerCell
            cell.isHidden = true
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 && indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! detailCell
            cell.setContent(titleRight: "Total Serving", titleLeft: "\(serving) servings")
            return cell
        } else if indexPath.section == 1 && indexPath.row == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "servingPicker", for: indexPath) as! servingPickerCell
            cell.totalServing = number
            cell.delegate = self
            cell.isHidden = true
            cell.servingPicker.reloadAllComponents();
            return cell
        } else if indexPath.section == 2 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "segmentIngProc", for: indexPath)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        } else if indexPath.section == 2 && indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ingProcTableCell
            if selectedSteps == .ingredient {
                cell.dataTable = testIng
            } else {
                cell.dataTable = testProc
            }
            cell.delegate = self
            cell.tableView.reloadData()
            return cell
        } else if indexPath.section == 3 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addButton", for: indexPath)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let categoryPicker = NSIndexPath(row: 3, section: 1) as IndexPath
        let cookingPicker = NSIndexPath(row: 5, section: 1) as IndexPath
        let servingPicker = NSIndexPath(row: 7, section: 1) as IndexPath
        
        let categoryCell =  tableView.cellForRow(at: categoryPicker)
        let cookingCell =  tableView.cellForRow(at: cookingPicker)
        let servingCell =  tableView.cellForRow(at: servingPicker)
        
        let categoryTrue = categoryPicker == indexPath && (categoryCell?.isHidden == true || categoryCell?.isHidden == nil)
        let categoryFalse = categoryPicker == indexPath && categoryCell?.isHidden == false
        
        let cookingTrue = cookingPicker == indexPath && (cookingCell?.isHidden == true || cookingCell?.isHidden == nil)
        let cookingFalse = cookingPicker == indexPath && cookingCell?.isHidden == false
        
        let servingTrue = servingPicker == indexPath && (servingCell?.isHidden == true || servingCell?.isHidden == nil)
        let servingFalse = servingPicker == indexPath && servingCell?.isHidden == false
        
        var tempHeight:CGFloat = 44
        
        if indexPath.section == 0 && indexPath.row == 0 {
            tempHeight = 218
        }
        if indexPath.section == 2 && indexPath.row == 1 {
            tempHeight = 230.0
        }
        
        if indexPath.section == 2 && indexPath.row == 0 {
            tempHeight = 56.0
        }
        if indexPath.section == 3 && indexPath.row == 0 {
            tempHeight = 50
        }
        
        if cookingTrue || servingTrue || categoryTrue {
            tempHeight = 0.0
        } else if cookingFalse || servingFalse || categoryFalse {
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
            hiddenViewDatePicker(fieldName: "serving", indexPath: servingPicker)
        } else if cookingPath as IndexPath == indexPath {
            hiddenViewDatePicker(fieldName: "cooking" ,indexPath: cookingPicker)
        } else if categoryPath as IndexPath == indexPath {
            hiddenViewDatePicker(fieldName: "category",indexPath: categoryPicker)
        }
    }
    
    func animateDatePickerView(iP : IndexPath){
        UIView.animate(withDuration:0.3, animations: { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.deselectRow(at: iP, animated: true)
            self.tableView.endUpdates()
        })
    }
    
    func hiddenViewDatePicker(fieldName: String, indexPath: IndexPath){
        let categoryPicker = NSIndexPath(row: 3, section: 1) as IndexPath
        let cookingPicker = NSIndexPath(row: 5, section: 1) as IndexPath
        let servingPicker = NSIndexPath(row: 7, section: 1) as IndexPath

        let categoryCell =  tableView.cellForRow(at: categoryPicker)
        let cookingCell =  tableView.cellForRow(at: cookingPicker)
        let servingCell =  tableView.cellForRow(at: servingPicker)
        
        categoryCell?.isHidden = fieldName == "category" ? !categoryCell!.isHidden : true;
        servingCell?.isHidden = fieldName == "serving" ? !servingCell!.isHidden : true;
        cookingCell?.isHidden = fieldName == "cooking" ? !cookingCell!.isHidden : true ;
        
        animateDatePickerView(iP: indexPath)
    
    }

    
}
