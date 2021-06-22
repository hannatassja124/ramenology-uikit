//
//  FeedbackDetailViewController.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 16/06/21.
//

import UIKit

class FeedbackDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var ramenTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createdDate: UILabel!
    
    var feedback : Feedback!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "FeedbackDetailTableViewCell", bundle: .main), forCellReuseIdentifier: "FeedbackDetailTableViewCell")
    }
    
    func drawData() {
        self.category.text = self.feedback.feedback_category_type
        self.ramenTitle.text = self.feedback.feedback_name
        self.createdDate.text = "Created : \(self.feedback.created_at!)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedback.feedback_details!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FeedbackDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackDetailTableViewCell", for: indexPath) as! FeedbackDetailTableViewCell
        cell.selectionStyle = .none
        let feedbackDetail = self.feedback.feedback_details!.allObjects as! [FeedbackDetail]
        cell.title.text = feedbackDetail[indexPath.row].feedback_detail_name
        cell.rating.text = "Rating \(feedbackDetail[indexPath.row].feedback_detail_rating!) /5"
        cell.desc.text = feedbackDetail[indexPath.row].feedback_detail_description
        return cell
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
