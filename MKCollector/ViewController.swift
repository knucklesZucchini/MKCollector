//
//  ViewController.swift
//  MKCollector
//
//  Created by Mark Krawczuk on 1/9/17.
//  Copyright © 2017 Mark Krawczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var mkgames : [MK] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        do {mkgames = try context.fetch(MK.fetchRequest())
            print(mkgames)

        } catch {
        }
        
   
    
    
    
    }


}

