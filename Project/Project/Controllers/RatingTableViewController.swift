//
//  RatingTableViewController.swift
//  Project
//
//  Created by Florian Goossens on 19/11/2020.
//

import UIKit

class RatingTableViewController: UITableViewController {

    var beers: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return beers.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = beers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Rating", for: indexPath)
        cell.textLabel?.text = "\(beer.name)"
        cell.detailTextLabel?.text = "Rating: \(beer.rating)"
        
        return cell
    }

}
