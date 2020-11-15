//
//  BeerTableViewCell.swift
//  Project
//
//  Created by Florian Goossens on 09/11/2020.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    
    @IBOutlet var beerView: UIView!
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerTitleLbl: UILabel!
    @IBOutlet var abvLbl: UILabel!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var favoritButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with beer:Beer) {
        beerImage.image = UIImage(named: "beersample")
        beerTitleLbl.text = beer.name
        abvLbl.text = "abv: \(beer.abv)"
        ratingLbl.text = "rating: \(beer.rating)"
        favoritButton.imageView?.image = UIImage(named: "star")
        
    }

}
