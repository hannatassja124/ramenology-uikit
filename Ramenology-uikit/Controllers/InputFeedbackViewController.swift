//
//  InputFeedbackViewController.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 17/06/21.
//

import UIKit

class InputFeedbackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var listFeedback: [FeedbackDetail]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFeedback()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "InputFeedbackTableViewCell", bundle: .main), forCellReuseIdentifier: "InputFeedbackTableViewCell")
        self.tableView.register(UINib.init(nibName: "SubmitButtonTableViewCell", bundle: .main), forCellReuseIdentifier: "SubmitButtonTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listFeedback.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.listFeedback.count {
            let cell:SubmitButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubmitButtonTableViewCell", for: indexPath) as! SubmitButtonTableViewCell
            return cell
        } else {
            let cell:InputFeedbackTableViewCell = tableView.dequeueReusableCell(withIdentifier: "InputFeedbackTableViewCell", for: indexPath) as! InputFeedbackTableViewCell
            cell.selectionStyle = .none
            cell.desc.text = self.listFeedback[indexPath.row].description
            cell.title.text = self.listFeedback[indexPath.row].title
            cell.feedbackItem = self.listFeedback[indexPath.row].title
            cell.getOption()
            return cell
        }
    }
    
    func getFeedback() {
        let tempFeedback: [FeedbackDetail] = [
            FeedbackDetail(id: 1, title: "Texture", rating: 0, description: "", level: ""),
            FeedbackDetail(id: 2, title: "Richness", rating: 0, description: "", level: ""),
            FeedbackDetail(id: 3, title: "Dashi", rating: 0, description: "", level: ""),
            FeedbackDetail(id: 4, title: "Taste", rating: 0, description: "", level: "")
        ]
        self.listFeedback = tempFeedback
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
