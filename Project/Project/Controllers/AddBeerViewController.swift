//
//  CocktailsViewController.swift
//  Project
//
//  Created by Florian Goossens on 26/10/2020.
//

import UIKit

class AddBeerViewController: UIViewController {
    
    var beers: [Beer] = []

    //OUTLETS
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var abvTextField: UITextField!
    @IBOutlet var ratingTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        print(beers)
    }
    

    //ACTIONS
    @IBAction func addBeer(_ sender: UIButton) {
        guard let name = nameTextField.text, let abv: Double = Double(abvTextField.text!), let rating = Int(ratingTextField.text!) else {
            showAlert(titleAlert: "Error", message: "Couldn't add the beer, check your input!", styleAlert: .alert, titleAction: "Ok", styleAction: .default)
            return
        }
        
        let newBeer = Beer(name: name, abv: abv, rating: rating, isFavorit: false)
        
        beers.append(newBeer)
        print(beers)
        Beer.saveToFile(beers: beers)
        
        print("beer \(newBeer.name) added")
        showAlert(titleAlert: "Succes", message: "Beer added", styleAlert: .alert, titleAction: "Ok", styleAction: .default)
        
        resetTextfFields()
        
        //TODO Segue too HomeVC or BeersVC
    }
    
    //FUNCTIONS
    fileprivate func updateView() {
        addButton.layer.cornerRadius = 10
    }
    
    //<SOURCE https://www.youtube.com/watch?v=esRZCt21TnQ&t=910s, functions wel zelf geschreven>
    fileprivate func createAlertAction(alertView: UIAlertController, title: String, style: UIAlertAction.Style) {
        alertView.addAction(UIAlertAction(title: title, style: style, handler: nil))
    }
    
    func showAlert(titleAlert: String, message:String, styleAlert: UIAlertController.Style, titleAction: String, styleAction: UIAlertAction.Style) {
        let textAlertView = UIAlertController(title: title, message: message, preferredStyle: styleAlert)
        createAlertAction(alertView: textAlertView, title: titleAction, style: styleAction)
        
        self.present(textAlertView, animated: true, completion: nil)
    }
    //</SOURCE>
    
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
