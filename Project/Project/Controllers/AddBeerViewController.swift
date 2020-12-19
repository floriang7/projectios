//
//  CocktailsViewController.swift
//  Project
//
//  Created by Florian Goossens on 26/10/2020.
//

import UIKit

class AddBeerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var beers: [Beer] = []

    //OUTLETS
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var abvTextField: UITextField!
    @IBOutlet var ratingTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var beerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    

    //ACTIONS
    @IBAction func addBeer(_ sender: UIButton) {
        guard let name = nameTextField.text, let abv: Double = Double(abvTextField.text!), let rating = Int(ratingTextField.text!), let beerImage: UIImage = beerImageView.image else {
            showAlert(titleAlert: "Error", message: "Couldn't add the beer, check your input!", styleAlert: .alert, titleAction: "Ok", styleAction: .default, sender: sender)
            return
        }
        //TODO beerimage aan constructor toevoegen in Beer struct
        let newBeer = Beer(name: name, abv: abv, rating: rating, isFavorit: false)
        
        beers.append(newBeer)
        BeerController.saveToFile(beers: beers)
        
        resetTextfFields()
        
        showAlert(titleAlert: "Succes", message: "\(newBeer.name) added", styleAlert: .actionSheet, titleAction: "Ok", styleAction: .default, sender: sender)
        
        //TODO Segue too HomeVC
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                print("camera selected")
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        } else {
            print("camera not available")
        }
          
        //alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func defaultImageButtonTapped(_ sender: UIButton) {
        beerImageView.image = UIImage(named: "beersample")
        beerImageView.isHidden = false
    }
    
    
    
    //FUNCTIONS
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        beerImageView.image = selectedImage
        beerImageView.isHidden = false
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func updateUI() {
        addButton.layer.cornerRadius = 10
        nameTextField.delegate = self
        abvTextField.delegate = self
        ratingTextField.delegate = self
        
        if beerImageView.image == nil {
            beerImageView.isHidden = true
        }
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

}

extension AddBeerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
