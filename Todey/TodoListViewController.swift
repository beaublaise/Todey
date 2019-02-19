//
//  ViewController.swift
//  Todey
//
//  Created by Beau Blaise on 19/02/2019.
//  Copyright © 2019 Beau Blaise. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    let itemArray = ["Find Mike", "Buy eggs", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //TODO: Declare numberOfRowsInSection here:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
      // make table view delegates method that get fired whenever we click on any cell
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        // if table view current cell at current selected index path already has an accessory
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
//    messageTableView.delegate = self
//
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
//    messageTableView.addGestureRecognizer(tapGesture)

    

}

