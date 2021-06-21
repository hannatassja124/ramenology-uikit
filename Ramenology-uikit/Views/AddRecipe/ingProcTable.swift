//
//  ingProcTable.swift
//  Ramenology-uikit
//
//  Created by Hannatassja Hardjadinata on 21/06/21.
//

import UIKit

class ingProcTableCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate : deleteCellDelegate?

    var dataTable:Array<String>!
    override func awakeFromNib() {
        self.dataTable = Array<String>()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        super.awakeFromNib()
    }
    
    func addCell() {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: dataTable.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                dataTable.remove(at: indexPath.row)
                self.delegate?.deleteCell(row: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
    }
    
    
    
    
    
}
