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
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var defaultImgButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        //<SOURCE https://stackoverflow.com/questions/37229132/swift-how-to-resign-first-responder-on-all-uitextfield/43865849>
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        //</SOURCE>
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       AppUtility.lockOrientation(.portrait) //<SOURCE https://stackoverflow.com/questions/28938660/how-to-lock-orientation-of-one-view-controller-to-portrait-mode-only-in-swift>
        //</SOURCE>
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
       AppUtility.lockOrientation(.all) //<SOURCE https://stackoverflow.com/questions/28938660/how-to-lock-orientation-of-one-view-controller-to-portrait-mode-only-in-swift>
    //</SOURCE>
   }
    

    //ACTIONS
    @IBAction func addBeer(_ sender: UIButton) {
        guard let name = nameTextField.text, let abv: Double = Double(abvTextField.text!), let rating = Int(ratingTextField.text!), let beerImage: UIImage = beerImageView.image else {
            showAlert(titleAlert: "Error", message: "Couldn't add the beer!", styleAlert: .alert, titleAction: "Ok", styleAction: .default, sender: sender)
            return
        }
        
        if(abv < 0.0 || rating < 0) {
            showAlert(titleAlert: "Error", message: "Couldn't add the beer!", styleAlert: .alert, titleAction: "Ok", styleAction: .default, sender: sender)
            return
        }

        let newBeer = Beer(name: name, abv: abv, rating: rating, isFavorit: false, image: beerImage.pngData()!)
        
        beers.append(newBeer)
        BeerController.saveToFile(beers: beers)
        
        resetTextfFields()
        resetImgView()
        
        showAlert(titleAlert: "Succes", message: "\(newBeer.name) has been added", styleAlert: .actionSheet, titleAction: "Ok", styleAction: .default, sender: sender)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        } else {
            return
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func defaultImageButtonTapped(_ sender: UIButton) {
        beerImageView.image = UIImage(named: "beersample")
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
        cameraButton.layer.cornerRadius = 10
        defaultImgButton.layer.cornerRadius = 10
        nameTextField.delegate = self
        abvTextField.delegate = self
        ratingTextField.delegate = self
        
        updateImgViewUI()
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
    
    func updateImgViewUI() {
        beerImageView.layer.borderColor = UIColor(red: 240/255, green: 140/255, blue: 80/255, alpha: 1.0).cgColor
        beerImageView.layer.masksToBounds = true
        beerImageView.contentMode = .scaleToFill
        beerImageView.layer.borderWidth = 4
        beerImageView.layer.cornerRadius = 10
    }
    
    func resetImgView() {
        beerImageView.image = nil
    }
    
    
    //<SOURCE https://stackoverflow.com/questions/37229132/swift-how-to-resign-first-responder-on-all-uitextfield/43865849>
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    //</SOURCE>
}

extension AddBeerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
