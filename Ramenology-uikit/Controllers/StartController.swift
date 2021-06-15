//
//  StartController.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 14/06/21.
//

import UIKit

class StartController: UIViewController {
    
    @IBOutlet weak var addButtonView: UIButton!
    @IBOutlet weak var cardTableView: UITableView!
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = initCard()
        initAddButton()
        cardTableView.backgroundColor = .appWhite
        cardTableView.delegate = self
        cardTableView.dataSource = self
    }
    
    func initAddButton() {
        addButtonView.setTitleColor(.appRed, for: .normal)
    }
    
    func initCard() -> [Card] {
        var tempCard: [Card] = []
        
        let card0 = Card(image: #imageLiteral(resourceName: "image_2"), tags: "Noodle", name: "Test Noodle")
        let card1 = Card(image: #imageLiteral(resourceName: "image_1"), tags: "Broth", name: "Test broth")
        let card2 = Card(image: #imageLiteral(resourceName: "image_3"), tags: "Tare", name: "Test Tare")
        
        tempCard.append(card0)
        tempCard.append(card1)
        tempCard.append(card2)
        
        return tempCard
    }

}

extension StartController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = cards[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardViewCell") as! CardViewCell
        
        cell.setCard(card: card)
        
        return cell
    }
    
    
}
