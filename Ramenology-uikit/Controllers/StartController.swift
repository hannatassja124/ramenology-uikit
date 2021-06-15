//
//  StartController.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 14/06/21.
//

import UIKit

class StartController: UIViewController, cardProtocols, tagsProtocols {
    
    @IBOutlet weak var addButtonView: UIButton!
    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    var tags: [Tag] = []
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCard(tags: "")
        initTag(selected: tag.all.rawValue)
        initAddButton()
        cardTableView.backgroundColor = .appWhite
        cardTableView.delegate = self
        cardTableView.dataSource = self
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self
    }
    
    func initCard(tags: String) {
        cards = getCard(tags: tags)
        cardTableView.reloadData()
    }
    
    func initAddButton() {
        addButtonView.setTitleColor(.appRed, for: .normal)
    }
    
    func initTag(selected: String){
        tags = getTag(selected: selected)
        tagsCollectionView.reloadData()
    }

}

protocol cardProtocols {
    func initCard(tags: String)
}

protocol tagsProtocols {
    func initTag(selected: String)
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

extension StartController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tag = tags[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagsLabelCollectionCell", for: indexPath) as! TagsCollectionViewCell
        cell.setTag(tag: tag)
        cell.delegate_card = self
        cell.delegate_tag = self
        return cell
    }
    
    
}
