//
//  InputFeedbackViewController.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 17/06/21.
//

import UIKit

class InputFeedbackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.register(UINib.init(nibName: "InputFeedbackTableViewCell", bundle: .main), forCellReuseIdentifier: "InputFeedbackTableViewCell")
        self.tableView.register(UINib.init(nibName: "SubmitButtonTableViewCell", bundle: .main), forCellReuseIdentifier: "SubmitButtonTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:InputFeedbackTableViewCell = tableView.dequeueReusableCell(withIdentifier: "InputFeedbackTableViewCell", for: indexPath) as! InputFeedbackTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == 2 {
            let cell:SubmitButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubmitButtonTableViewCell", for: indexPath) as! SubmitButtonTableViewCell
            return cell
        }
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
