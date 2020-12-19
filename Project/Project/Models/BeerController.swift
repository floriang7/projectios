//
//  BeerController.swift
//  Project
//
//  Created by Florian Goossens on 30/11/2020.
//

import Foundation

class BeerController {
    static let archiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("beers").appendingPathExtension("plist")
    
    static func saveToFile(beers: [Beer]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedBeers = try? propertyListEncoder.encode(beers)
        
        try? encodedBeers?.write(to: archiveUrl,
          options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Beer] {
        var beers = [Beer]()
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedBeersData = try? Data(contentsOf: archiveUrl),
            let decodedBeers = try?
              propertyListDecoder.decode(Array<Beer>.self, from:
              retrievedBeersData) {
            beers = decodedBeers
        }

        return beers
    }
}
