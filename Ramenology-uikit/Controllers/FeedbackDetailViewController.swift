//
//  FeedbackDetailViewController.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 16/06/21.
//

import UIKit

class FeedbackDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "FeedbackDetailTableViewCell", bundle: .main), forCellReuseIdentifier: "FeedbackDetailTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FeedbackDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackDetailTableViewCell", for: indexPath) as! FeedbackDetailTableViewCell
        cell.selectionStyle = .none
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
