//
//  ingProcTable.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 21/06/21.
//

import UIKit

class ingProcTableCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataTable:Array<String>!
    override func awakeFromNib() {
        self.dataTable = Array<String>()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.awakeFromNib()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataTable[indexPath.row]
        return cell
    }
    
    
}
