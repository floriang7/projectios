//
//  Beer.swift
//  Project
//
//  Created by Florian Goossens on 06/11/2020.
//

import Foundation

struct BeerAPI: Codable {
    var product_id: Int
    var name: String
    var size: String
    var price: Double
    var beer_id: Int
    var image_url: String
    var category: String
    var abv: Double
    var style: String
    var attributes: String
    var type: String
    var brewer: String
    var country: String
    var on_sale: Bool
}

//sample data until api is fixed
struct BeerAPIMapper {
    func getBeers() -> [BeerAPI] {
        return [
            BeerAPI(product_id: 1, name: "beer1", size: "25cl", price: 2.50, beer_id: 1, image_url: "", category: "strong beer", abv: 4.50, style: "strong", attributes: "", type: "beer", brewer: "brewer", country: "belgium", on_sale: true),
            BeerAPI(product_id: 2, name: "beer2", size: "33cl", price: 3.00, beer_id: 2, image_url: "", category: "light beer", abv: 3.00, style: "light", attributes: "", type: "beer", brewer: "brewer", country: "france", on_sale: false),
            BeerAPI(product_id: 3, name: "beer3", size: "33cl", price: 3.50, beer_id: 3, image_url: "", category: "light beer", abv: 4.00, style: "light", attributes: "", type: "beer", brewer: "brewer", country: "belgium", on_sale: true),
            BeerAPI(product_id: 4, name: "beer4", size: "25cl", price: 3.50, beer_id: 4, image_url: "", category: "strong beer", abv: 4.00, style: "strong", attributes: "", type: "beer", brewer: "brewer", country: "germany", on_sale: true)
        ]
    }
}

