//
//  Beer.swift
//  Project
//
//  Created by Florian Goossens on 11/11/2020.
//

import Foundation

struct Beer: Codable {
    //var id: Int
    var name: String
    var abv: Double
    var rating: Int
    var isFavorit: Bool
    var dateAdded: Date
    
    static let archiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("beers").appendingPathExtension("plist")
  
  
    init(name: String, abv: Double, rating: Int, isFavorit: Bool) {
        self.name = name
        self.abv = abv
        self.rating = rating
        self.isFavorit = isFavorit
        self.dateAdded = Date()
    }
    
    /*static func saveToFile(beers: [Beer]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedBeers = try? propertyListEncoder.encode(beers)
        
        try? encodedBeers?.write(to: Beer.archiveUrl,
          options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Beer] {
        var beers = [Beer]()
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedBeersData = try? Data(contentsOf: Beer.archiveUrl),
            let decodedBeers = try?
              propertyListDecoder.decode(Array<Beer>.self, from:
              retrievedBeersData) {
            beers = decodedBeers
        }

        return beers
    }*/
    
    /*static func loadSampleBeers() -> [Beer] {
        	return [
                Beer(name: "Duvel", abv: 4.50, rating: 8, isFavorit: true),
                Beer(name: "Stella", abv: 3.50, rating: 9, isFavorit: true),
                Beer(name: "Heiniken", abv: 3.00, rating: 5, isFavorit: false),
                Beer(name: "Carlsberg", abv: 3.50, rating: 6, isFavorit: false)
            ]
    }*/

}

