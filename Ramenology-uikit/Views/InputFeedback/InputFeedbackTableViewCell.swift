//
//  InputFeedbackTableViewCell.swift
//  Ramenology-uikit
//
//  Created by Maritia Pangaribuan on 17/06/21.
//

import UIKit

class InputFeedbackTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var rating2: UIButton!
    @IBOutlet weak var rating3: UIButton!
    @IBOutlet weak var rating4: UIButton!
    @IBOutlet weak var rating5: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    
    var selectedStar: UIImage = UIImage(named: "filled-star")!
    var ratingImage: UIImage = #imageLiteral(resourceName: "Star")
    var selectedRating = 0
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var feedbackItem: String!
    var textureOption: [String] = ["Heavy", "Thin", "Clear", "Merky", "Rating"]
    var richnessOption: [String] = ["None", "Light", "Medium", "Rich", "Extra Rich"]
    var dashiOption: [String] = ["Light", "Medium", "High"]
    var tasteOption: [String] = ["Salty", "Sweet", "Sour", "Savory", "Bitter"]
    var selectedOption: [String]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibName = UINib(nibName: "FeedbackCollectionViewCell", bundle:nil)
        myCollectionView.register(nibName, forCellWithReuseIdentifier: "FeedbackCollectionViewCell")
        self.initCollectionView()
        self.drawRating()
    }
    
    
    func drawRating() {
        self.rating.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        self.rating2.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        self.rating3.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        self.rating4.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        self.rating5.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
    }
    
    func initCollectionView() {
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
    }
    func getOption() {
        if (self.feedbackItem == "Texture") {
            self.selectedOption = self.textureOption
        }
        if (self.feedbackItem == "Richness") {
            self.selectedOption = self.richnessOption
        }
        if (self.feedbackItem == "Dashi") {
            self.selectedOption = self.dashiOption
        }
        if (self.feedbackItem == "Taste") {
            self.selectedOption = self.tasteOption
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.selectedOption != nil) ? self.selectedOption.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FeedbackCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedbackCollectionViewCell", for: indexPath)  as! FeedbackCollectionViewCell
        cell.button.setTitle(self.selectedOption[indexPath.row], for: .normal)
        return cell
    }
    
    @IBAction func ratingSelected(_ sender: Any) {
        self.selectedRating = 1
        self.rating.setImage(selectedStar, for: .normal)
        self.rating2.setImage(ratingImage, for: .normal)
        self.rating3.setImage(ratingImage, for: .normal)
        self.rating4.setImage(ratingImage, for: .normal)
        self.rating5.setImage(ratingImage, for: .normal)
    }
    
    @IBAction func rating2Selected(_ sender: Any) {
        self.selectedRating = 2
        self.rating.setImage(selectedStar, for: .normal)
        self.rating2.setImage(selectedStar, for: .normal)
        self.rating3.setImage(ratingImage, for: .normal)
        self.rating4.setImage(ratingImage, for: .normal)
        self.rating5.setImage(ratingImage, for: .normal)
    }
    
    @IBAction func rating3Selected(_ sender: Any) {
        self.selectedRating = 3
        self.rating.setImage(selectedStar, for: .normal)
        self.rating2.setImage(selectedStar, for: .normal)
        self.rating3.setImage(selectedStar, for: .normal)
        self.rating4.setImage(ratingImage, for: .normal)
        self.rating5.setImage(ratingImage, for: .normal)
    }
    
    @IBAction func rating4Selected(_ sender: Any) {
        self.selectedRating = 4
        self.rating.setImage(selectedStar, for: .normal)
        self.rating2.setImage(selectedStar, for: .normal)
        self.rating3.setImage(selectedStar, for: .normal)
        self.rating4.setImage(selectedStar, for: .normal)
        self.rating5.setImage(ratingImage, for: .normal)
    }
    
    @IBAction func rating5Selected(_ sender: Any) {
        self.selectedRating = 5
        self.rating.setImage(selectedStar, for: .normal)
        self.rating2.setImage(selectedStar, for: .normal)
        self.rating3.setImage(selectedStar, for: .normal)
        self.rating4.setImage(selectedStar, for: .normal)
        self.rating5.setImage(selectedStar, for: .normal)
    }
}
