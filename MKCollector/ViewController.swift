//
//  ViewController.swift
//  MKCollector
//
//  Created by Mark Krawczuk on 1/9/17.
//  Copyright © 2017 Mark Krawczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var mkgames : [MK] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        do {mkgames = try context.fetch(MK.fetchRequest())
tableView.reloadData()
        } catch {
        }
        
   
    
    
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mkgames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
            let mkgame = mkgames[indexPath.row]
            cell.textLabel?.text = mkgame.title
        cell.imageView?.image = UIImage(data: mkgame.image as! Data)
        
            return cell
        
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mkgame = mkgames[indexPath.row]
        performSegue(withIdentifier: "mkgameSegue", sender: mkgame)

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! MKViewController
        nextVC.mkgame = sender as? MK
    }
    
    
}

