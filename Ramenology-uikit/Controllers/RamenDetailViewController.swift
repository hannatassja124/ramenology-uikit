//
//  RamenDetailViewController.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 14/06/21.
//

import UIKit
import CoreData

class RamenDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ramenDetail: Recipe?
    
    var selectedStep: Steps = .feedback
    var ingredients: [String] = ["1 Kg, Chicken backs","900g, Chicken wings","500g Chicken feet","1, Onion, whole and quartered", "10-15, Garlic cloves,  minced", "3, Carrots, peeled", "3 tbsp, Mirin", "1/4 cup, Sake"]
    var steps: [String] = ["1. Add the chicken to a stockpot", "2. Bring the soup up to a boil briefly, skim any scum. Hold here for 5-10 minutes, or until scum subsides.", "3. Reduce heat back down to below simmer (around  88 °C/190 °F), hold for 5 hours."]
    // enable this to see empty state
    var feedback: [Feedback]!
    var selectedFeedback: Feedback!
    //    var feedback: [String] = []
    
    
    @IBOutlet weak var ramenTitle: UILabel!
    @IBOutlet weak var segmenttedStep: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var cookingHours: UILabel!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var cookingServings: UILabel!
    @IBOutlet weak var source: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFeedback()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: .main), forCellReuseIdentifier: "ImageTableViewCell")
        self.tableView.register(UINib.init(nibName: "TextTableViewCell", bundle: .main), forCellReuseIdentifier: "TextTableViewCell")
        self.tableView.register(UINib.init(nibName: "EmptyStateTableViewCell", bundle: .main), forCellReuseIdentifier: "EmptyStateTableViewCell")
        self.initValue()
    }
    
    func getFeedback() {
        // Fetch the data from Core Data to disply in the tableview
        do {
            let feedbacks = self.ramenDetail?.feedbacks!.allObjects as! [Feedback]
            self.feedback = feedbacks
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func initValue() {
        ramenTitle.text = ramenDetail!.recipe_name
        category.text = ramenDetail!.category
    }
    
    @IBAction func didChangeSegment2(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.selectedStep = .feedback
        } else if sender.selectedSegmentIndex == 1 {
            self.selectedStep = .ingredients
        } else {
            self.selectedStep = .cookingSteps
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let seguee = segue.identifier {
            if seguee.elementsEqual("goToDetailFeedback") , let controller = segue.destination as? FeedbackDetailViewController {
                controller.feedback = self.selectedFeedback
            }
        }
    }
    
    @IBAction func addFeedback(_ sender: Any) {
        performSegue(withIdentifier: "inputFeedback", sender: Any?.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.selectedStep == .ingredients) {
            return self.ingredients.count
        } else if  (self.selectedStep == .cookingSteps) {
            return self.steps.count
        } else if (self.selectedStep == .feedback) {
            return self.feedback.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.selectedStep == .feedback) {
            self.selectedFeedback = self.feedback[indexPath.row]
            performSegue(withIdentifier: "goToDetailFeedback", sender: Any?.self)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.selectedStep == .ingredients) {
            let cell:TextTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            cell.selectionStyle = .none
            cell.label.text =  self.ingredients[indexPath.row]
            return cell
            
        } else if (self.selectedStep == .cookingSteps) {
            print(indexPath.row)
            let cell:TextTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            cell.selectionStyle = .none
            cell.label.text = self.steps[indexPath.row]
            return cell
            
        } else {
            if (self.feedback.count == 0) {
                let cell:EmptyStateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmptyStateTableViewCell", for: indexPath) as! EmptyStateTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            let cell:ImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
            cell.selectionStyle = .none
            
            // Create Date Formatter
            let dateFormatter = DateFormatter()
            // Set Date Format
            dateFormatter.dateFormat = "YY/MM/dd"
            // Convert Date to String
            cell.imageLabel.text = dateFormatter.string(from: self.feedback[indexPath.row].created_at!)
            return cell 
        }
    }

}


enum Steps: String {
    case feedback
    case ingredients
    case cookingSteps
}
