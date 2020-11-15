//
//  BeersViewController.swift
//  Project
//
//  Created by Florian Goossens on 26/10/2020.
//

import UIKit

class BeersViewController: UIViewController {
    
    var beerRepository = BeerRepository()
    var beers: [Beer] = []
    
    
    @IBOutlet var beersTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*ApiManager().getBeers { (res) in
            switch res {
            case .success(let beers): beers.forEach( { (beer) in
                print(beer.name)
            })
            case .failure(let err): print("Failed to fetch beers", err)
            }
        }*/
        
        beers = beerRepository.getBeers()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beersTableView.delegate = self
        beersTableView.dataSource = self
        beersTableView.separatorStyle = .none
        //beersTableView.showsVerticalScrollIndicator = false
    }
    
    //ACTIONS
    
    //FUNCTIONS
    
    
}// end BeersViewController


// extensions
extension BeersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = beersTableView.dequeueReusableCell(withIdentifier: "beerCell") as! BeerTableViewCell
        let beer = beers[indexPath.row]
        
        cell.beerImage.image = UIImage(named: "beersample")
        cell.beerTitleLbl.text = beer.name
        cell.abvLbl.text = "abv: \(beer.abv)"
        cell.ratingLbl.text = "rating: \(beer.rating)"
        cell.favoritButton.imageView?.image = UIImage(named: "star")
        
        return cell
    }
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
