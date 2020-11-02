//
//  ViewController.swift
//  Project
//
//  Created by Florian Goossens on 23/10/2020.
//

import UIKit

class HomeViewController: UIViewController {

    //OUTLETS
    @IBOutlet var beersButton: UIButton!
    @IBOutlet var cocktailsButton: UIButton!
    @IBOutlet var favoritsButton: UIButton!
    @IBOutlet var ratingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Extra view setup
        //TODO zet dit in een subclass van UIButton
        beersButton.layer.cornerRadius = 10
        beersButton.clipsToBounds = true
        cocktailsButton.layer.cornerRadius = 10
        cocktailsButton.clipsToBounds = true
        favoritsButton.layer.cornerRadius = 10
        favoritsButton.clipsToBounds = true
        ratingsButton.layer.cornerRadius = 10
        ratingsButton.clipsToBounds = true
    }
    

    @IBAction func navigateToNextScreen(_ sender: UIButton) {
        
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        performSegue(withIdentifier: buttonTitle, sender: nil)
    }
    
}

