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
    }
    

    //ACTIONS
    @IBAction func addBeer(_ sender: UIButton) {
        guard let name = nameTextField.text, let abv: Double = Double(abvTextField.text!), let rating = Int(ratingTextField.text!) else {
            showAlert(titleAlert: "Error", message: "Couldn't add the beer, check your input!", styleAlert: .alert, titleAction: "Ok", styleAction: .default, sender: sender)
            return
        }
        
        let newBeer = Beer(name: name, abv: abv, rating: rating, isFavorit: false)
        
        beers.append(newBeer)
        Beer.saveToFile(beers: beers)
        
        print("beer \(newBeer.name) added")
        
        showAlert(titleAlert: "Succes", message: "Beer added", styleAlert: .actionSheet, titleAction: "Ok", styleAction: .default, sender: sender)
        
        resetTextfFields()
        
        //TODO Segue too HomeVC or BeersVC
    }
    
    //FUNCTIONS
    fileprivate func updateView() {
        addButton.layer.cornerRadius = 10
    }
    
    
    fileprivate func createAlertAction(alertView: UIAlertController, title: String, style: UIAlertAction.Style) {
        alertView.addAction(UIAlertAction(title: title, style: style, handler: nil))
    }
    
    func showAlert(titleAlert: String, message:String, styleAlert: UIAlertController.Style, titleAction: String, styleAction: UIAlertAction.Style, sender: UIButton) {
        let textAlertViewController = UIAlertController(title: title, message: message, preferredStyle: styleAlert)
        createAlertAction(alertView: textAlertViewController, title: titleAction, style: styleAction)
        textAlertViewController.popoverPresentationController?.sourceView = sender
        self.present(textAlertViewController, animated: true, completion: nil)
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
