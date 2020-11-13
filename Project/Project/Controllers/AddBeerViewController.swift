//
//  CocktailsViewController.swift
//  Project
//
//  Created by Florian Goossens on 26/10/2020.
//

import UIKit

class AddBeerViewController: UIViewController {
    
    var beerMapper = BeerMapper()

    //OUTLETS
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var abvTextField: UITextField!
    @IBOutlet var ratingTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 10
    }
    

    //ACTIONS
    @IBAction func addBeer(_ sender: UIButton) {
        print("add button tapped")
        guard let name = nameTextField.text else {
            return
        }
        guard let abv: Double = Double(abvTextField.text!) else {
            return
        }
        guard let rating = Int(ratingTextField.text!) else {
            return
        }
        
        let newBeer = Beer(name: name, abv: abv, rating: rating, isFavorit: false)
        
        beerMapper.addBeerToDummyData(beer: newBeer)
        
        print("beer \(newBeer.name) added")
        
        resetTextfFields()
        
        //TODO toevoegen van alert
        
    }
    
    //FUNCTIONS
    func showAlert() {
        
    }
    
    func resetTextfFields() {
        nameTextField.text = ""
        abvTextField.text = ""
        ratingTextField.text = ""
    }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
