//
//  AddViewController.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 14/06/21.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        scrollView.contentSize = CGSize(width: 390, height: 1000)
        // Do any additional setup after loading the view.
    }

}

extension AddViewController: UITableViewDelegate {
    
}

extension AddViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
