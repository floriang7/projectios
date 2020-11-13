//
//  BeerRepository.swift
//  Project
//
//  Created by Florian Goossens on 13/11/2020.
//

import Foundation

class BeerRepository {
    var beers: [Beer]
    var beerMapper: BeerMapper
    
    init() {
        self.beerMapper = BeerMapper()
        self.beers = beerMapper.getBeersDummyData()
    }
    
    func getBeers() -> [Beer] {
        return self.beers
    }
    
    func addBeer(beer:Beer) {
        beerMapper.addBeerToDummyData(beer: beer)
    }
    
}
