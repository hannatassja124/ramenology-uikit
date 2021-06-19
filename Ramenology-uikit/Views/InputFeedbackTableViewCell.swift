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
    var selectedStar: UIImage = #imageLiteral(resourceName: "filled-star")
    var ratingImage: UIImage = #imageLiteral(resourceName: "Star")
    var selectedRating = 0
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("input feedbackk bung")
        let nibName = UINib(nibName: "FeedbackCollectionViewCell", bundle:nil)
        myCollectionView.register(nibName, forCellWithReuseIdentifier: "FeedbackCollectionViewCell")
        self.myCollectionView.dataSource = self

    }
    
    func callDatasource() {
        self.myCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FeedbackCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedbackCollectionViewCell", for: indexPath)  as! FeedbackCollectionViewCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
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
