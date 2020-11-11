//
//  Beer.swift
//  Project
//
//  Created by Florian Goossens on 11/11/2020.
//

import Foundation

struct Beer {
    var id: Int
    var name: String
    var abv: Double
    var rating: Int?
    var isFavorit: Bool
}

struct BeerMapper {
    
    static func getBeersDummyData() -> [Beer] {
        return [
            Beer(id: 1, name: "Duvel", abv: 4.50, rating: nil, isFavorit: true),
            Beer(id: 2, name: "Stella", abv: 3.50, rating: 9, isFavorit: true),
            Beer(id: 3, name: "Heiniken", abv: 3.00, rating: 5, isFavorit: false),
            Beer(id: 4, name: "Carlsberg", abv: 3.50, rating: 6, isFavorit: false)
        ]
    }
}
