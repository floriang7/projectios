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
    @IBOutlet var rateButton: UIButton!
    @IBOutlet var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
