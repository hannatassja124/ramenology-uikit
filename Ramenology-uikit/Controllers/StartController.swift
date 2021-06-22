//
//  StartController.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 14/06/21.
//

import UIKit
import CoreData

class StartController: UIViewController, cardProtocols, tagsProtocols {
    
    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var subheadingLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    // Data for the table
    var tags: [Tag] = []
    var cards: [Recipe] = []
    var selectedRamen: Recipe?
    
    // Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCard(tags: "")
        initTag(selected: tag_enum.all.rawValue)
        initAddButton()
        cardTableView.backgroundColor = .appWhite
        cardTableView.delegate = self
        cardTableView.dataSource = self
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self
    }
    
    func initCard(tags: String) {
        // Fetch the data from Core Data to disply in the tableview
        do {
            let request = Recipe.fetchRequest() as NSFetchRequest<Recipe>
            
            // Set the filtering on the request
            let tempTag = tags.trimmingCharacters(in: .whitespacesAndNewlines)
//            if tempTag != "" || tempTag != tag_enum.all.rawValue {
                let filter = NSPredicate(format: "%K = %@", "category", tags)
                request.predicate = filter
//            }
            
            print(tags)
            print(tempTag)
            
            self.cards = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.cardTableView.reloadData()
            }
        } catch {
            
        }
        
        self.cardTableView.reloadData()
    }
    
    func initAddButton() {
        subheadingLabel.textColor = .appGray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(performAdd(sender:))
        )
        //addButtonView.setTitleColor(.appRed, for: .normal)
    }
    
    @objc func performAdd(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "gotoAddRecipe", sender: Any?.self)
    }
    
    func initTag(selected: String){
        tags = getTag(selected: selected)
        tagsCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let seguee = segue.identifier {
            if seguee.elementsEqual("goToDetailRamen") , let controller = segue.destination as? RamenDetailViewController {
                controller.ramenDetail = self.selectedRamen
            }
        }
    }

}

protocol cardProtocols {
    func initCard(tags: String)
}

protocol tagsProtocols {
    func initTag(selected: String)
}

extension StartController: UITableViewDataSource {
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

extension StartController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedRamen = cards[indexPath.row]
        performSegue(withIdentifier: "goToDetailRamen", sender: Any?.self)
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
