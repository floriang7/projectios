//
//  Beer.swift
//  Project
//
//  Created by Florian Goossens on 11/11/2020.
//

import Foundation

struct Beer {
    //var id: Int
    var name: String
    var abv: Double
    var rating: Int
    var isFavorit: Bool
    
    init(name: String, abv: Double, rating: Int, isFavorit: Bool) {
        self.name = name
        self.abv = abv
        self.rating = rating
        self.isFavorit = isFavorit
    }

}

struct BeerMapper {
    
    var beers: [Beer]
    
    init() {
        self.beers = [
            Beer(name: "Duvel", abv: 4.50, rating: 8, isFavorit: true),
            Beer(name: "Stella", abv: 3.50, rating: 9, isFavorit: true),
            Beer(name: "Heiniken", abv: 3.00, rating: 5, isFavorit: false),
            Beer(name: "Carlsberg", abv: 3.50, rating: 6, isFavorit: false)
        ]
    }
    
    
    func getBeersDummyData() -> [Beer] {
        return self.beers
    }
    
    mutating func addBeerToDummyData(beer: Beer) {
        self.beers.append(beer)
    }
}
