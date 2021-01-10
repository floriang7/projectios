//
//  FavoritsTableViewController.swift
//  Project
//
//  Created by Florian Goossens on 08/01/2021.
//

import UIKit

class FavoritsTableViewController: UITableViewController {

    var beers: [Beer] = []
    var favorits: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorits = beers.filter {
            $0.isFavorit == true
        }

        tableView.reloadData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return favorits.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = favorits[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorit", for: indexPath)
        cell.textLabel?.text = "\(beer.name)"
        cell.detailTextLabel?.text = "Rating: \(beer.rating)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView,
     editingStyleForRowAt indexPath: IndexPath) ->
     UITableViewCell.EditingStyle {
     return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit
    editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
     IndexPath) {
        if editingStyle == .delete {
            let beer = favorits[indexPath.row]
            favorits.remove(at: indexPath.row)
            
            let indexOfBeerInBeers: Int? = beers.firstIndex {
                $0.name == beer.name
            }
            beers[indexOfBeerInBeers!].isFavorit = false
            
            tableView.deleteRows(at: [indexPath], with: . automatic)
            
            BeerController.saveToFile(beers: beers)
        }
    }

}
