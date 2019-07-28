//
//  AddCarVC.swift
//  CarsForSale
//
//  Created by Эмиль Шалаумов on 28/07/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class AddCarVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!

    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        //For providing temporary sol.
        brandTextField.delegate = self
        modelTextField.delegate = self
    }
    
    // Temporary solution to make possible hide keyboard when put car details - will be removed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        carImageView.image = selectedImage
    }
    
    @IBAction func addCarBtnPressed(_ sender: UIButton) {
        if let brand = brandTextField.text, let model = modelTextField.text {
            Car.cars.append(Car(photo: "", brand: brand, model: model))
        }
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "carsLoaded"), object: nil))
    }
    
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
