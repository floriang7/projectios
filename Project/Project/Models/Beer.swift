//
//  Beer.swift
//  Project
//
//  Created by Florian Goossens on 11/11/2020.
//

import Foundation
import UIKit



struct Beer: Codable {
    var name: String
    var abv: Double
    var rating: Int
    var isFavorit: Bool
    var dateAdded: Date
    var image: Data
    
    enum CodingKeys: String, CodingKey {
        case name
        case abv
        case rating
        case isFavorit
        case dateAdded
        case image
    }
  
    init(name: String, abv: Double, rating: Int, isFavorit: Bool, image: Data) {
        self.name = name
        self.abv = abv
        self.rating = rating
        self.isFavorit = isFavorit
        self.dateAdded = Date()
        self.image = image
    }
    

}

