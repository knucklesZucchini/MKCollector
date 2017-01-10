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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    
    }

    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    
    
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }

    
    @IBAction func addTapped(_ sender: Any) {
    }





}
