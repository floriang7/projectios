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
        // Do any additional setup after loading the view.
    }
    

    @IBAction func navigateToNextScreen(_ sender: UIButton) {
        
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        performSegue(withIdentifier: buttonTitle, sender: nil)
    }
    
}

