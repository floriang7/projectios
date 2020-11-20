//
//  BeersViewController.swift
//  Project
//
//  Created by Florian Goossens on 26/10/2020.
//

import UIKit

class BeersViewController: UIViewController {
    
    var beers: [Beer] = []
    
    @IBOutlet var beersTableView: UITableView!
    @IBOutlet var sortAllButton: UIButton!
    @IBOutlet var sortByAbvButton: UIButton!
    @IBOutlet var sortByRatingButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        beers = Beer.loadFromFile()
        beersTableView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTableView()
    }
    
    //ACTIONS
    @IBAction func sortAll(_ sender: Any) {
        //TODO
        let allBeers = Beer.loadFromFile()
        beers = allBeers
        beersTableView.reloadData()
    }
    
    @IBAction func sortByAbv(_ sender: Any) {
        //TODO
        let beersSortedOnAbv = beers.sorted {
            $0.abv > $1.abv
        }
        beers = beersSortedOnAbv
        beersTableView.reloadData()
    }
    
    @IBAction func sortByRating(_ sender: Any) {
        let beersSortedOnRating = beers.sorted {
            $0.rating > $1.rating
        }
        beers = beersSortedOnRating
        beersTableView.reloadData()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        //TODO
    }
    
    //FUNCTIONS
    fileprivate func initializeTableView() {
        beersTableView.delegate = self
        beersTableView.dataSource = self
        beersTableView.separatorStyle = .none
        beersTableView.cellLayoutMarginsFollowReadableWidth = true
        //beersTableView.showsVerticalScrollIndicator = false
        //beersTableView.rowHeight = UITableView.automaticDimension
        //beersTableView.estimatedRowHeight = 200
    }
    
    
}// end of BeersViewController


// EXTENSIONS
extension BeersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return beers.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = beersTableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        let beer = beers[indexPath.row]
        
        cell.update(with: beer)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        print(beer.name)
        //TODO segue naar detail scherm waar je de rating kan aanpassen
    }
    
    func tableView(_ tableView: UITableView,
     editingStyleForRowAt indexPath: IndexPath) ->
     UITableViewCell.EditingStyle {
     return .delete
    }
    
    func tableView(_ tableView: UITableView, commit
    editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
     IndexPath) {
        if editingStyle == .delete {
            beers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: . automatic)
            Beer.saveToFile(beers: beers)
        }
    }

}

