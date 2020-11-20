//
//  ViewController.swift
//  Project
//
//  Created by Florian Goossens on 23/10/2020.
//

import UIKit

class HomeViewController: UIViewController {

    var beers: [Beer] = []
    
    //OUTLETS
    @IBOutlet var beersButton: UIButton!
    @IBOutlet var addBeersButton: UIButton!
    @IBOutlet var favoritsButton: UIButton!
    @IBOutlet var ratingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if !Beer.loadFromFile().isEmpty {
        beers = Beer.loadFromFile()
        //} else {
        //    beers = Beer.loadSampleBeers()
        //}
        
        updateView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "Beers":
            let nextViewController = segue.destination as! BeersViewController
            nextViewController.beers = beers
        case "Add Beer":
            let nextViewController = segue.destination as! AddBeerViewController
            nextViewController.beers = beers
        case "Ratings":
            let nextViewController = segue.destination as! RatingTableViewController
            nextViewController.beers = beers
        default: return
        }
        
    }
    
    //ACTIONS
    @IBAction func navigateToNextScreen(_ sender: UIButton) {
        
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        performSegue(withIdentifier: buttonTitle, sender: nil)
    }
    
    //FUNCTIONS
    fileprivate func updateView() {
        //TODO zet dit in een subclass van UIButton
        beersButton.layer.cornerRadius = 10
        beersButton.clipsToBounds = true
        addBeersButton.layer.cornerRadius = 10
        addBeersButton.clipsToBounds = true
        favoritsButton.layer.cornerRadius = 10
        favoritsButton.clipsToBounds = true
        ratingsButton.layer.cornerRadius = 10
        ratingsButton.clipsToBounds = true
    }
    
    
    
    
}

