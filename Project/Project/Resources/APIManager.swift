//
//  APIManager.swift
//  Project
//
//  Created by Florian Goossens on 06/11/2020.
//

import Foundation


// <SOURCE https://www.youtube.com/watch?v=1en4JyW3XSI&t=607s >
class APIManager {
    
    func getBeers(completion: @escaping (Result<[BeerAPI], Error>) -> ()) {
        guard let url = URL(string: "http://ontariobeerapi.ca/beers/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            //succesful
            do {
                let beers = try JSONDecoder().decode([BeerAPI].self, from: data!)
            //DispatchQueue.main.async {
                completion(.success(beers))
            //}
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}
//<SOURCE>
