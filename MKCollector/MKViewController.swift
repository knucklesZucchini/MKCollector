//
//  MKViewController.swift
//  MKCollector
//
//  Created by Mark Krawczuk on 1/9/17.
//  Copyright © 2017 Mark Krawczuk. All rights reserved.
//

import UIKit

class MKViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var MKImageView: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    var mkgame : MK? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if mkgame != nil {
            print("we have an item")
            
        } else {
            print("we don't have an item")
        
        }
    
    }

    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
         }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        MKImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }

    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let mk = MK(context: context)
        mk.title = titleTextField.text
        mk.image = UIImagePNGRepresentation(MKImageView.image!)! as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }





}
