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
        self.category.text = self.feedback.tag.rawValue
        self.ramenTitle.text = self.feedback.name
        self.createdDate.text = "Created : \(self.feedback.created)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedback.feedbackDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FeedbackDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackDetailTableViewCell", for: indexPath) as! FeedbackDetailTableViewCell
        cell.selectionStyle = .none
        cell.title.text = self.feedback.feedbackDetail[indexPath.row].title
        cell.rating.text = "Rating \(self.feedback.feedbackDetail[indexPath.row].rating) /5"
        cell.desc.text = self.feedback.feedbackDetail[indexPath.row].description
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
