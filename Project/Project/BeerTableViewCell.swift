//
//  BeerTableViewCell.swift
//  Project
//
//  Created by Florian Goossens on 09/11/2020.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    //OUTLETS
    @IBOutlet var beerView: UIView!
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerTitleLbl: UILabel!
    @IBOutlet var abvLbl: UILabel!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var addedOnLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func updateView(with beer:Beer) {
        beerImage.image = UIImage(data: beer.image)
        beerTitleLbl.text = beer.name
        abvLbl.text = "Abv (%): \(beer.abv)"
        ratingLbl.text = "Rating: \(beer.rating)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        addedOnLbl.text = "Added on: \(dateFormatter.string(from: beer.dateAdded))"
        
        favoriteButton.setBackgroundImage(beer.isFavorit ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)

    }

}


