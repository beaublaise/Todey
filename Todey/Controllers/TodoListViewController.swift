//
//  ViewController.swift
//  Todey
//
//  Created by Beau Blaise on 19/02/2019.
//  Copyright © 2019 Beau Blaise. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find ur love"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "guhje"
        itemArray.append(newItem2)
        
        
        let newItem3 = Item()
        newItem3.title = "lmj"
        itemArray.append(newItem3)
        
       

        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items

        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //TODO: Declare numberOfRowsInSection here:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title

        
        // this is a ternary operator used instead of an if statement
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
    }
      // make table view delegates method that get fired whenever we click on any cell
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       
        
        tableView.reloadData()
        
       
        
        // if table view current cell at current selected index path already has an accessory
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - ADD NEW iTEMS
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our ui allert
            
            
            
        let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            print(alertTextField.text)
            textField = alertTextField
            
    
            
        }
        
        alert.addAction(action)
        
        present (alert, animated: true, completion: nil)
        
    }
    
//    messageTableView.delegate = self
//
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
//    messageTableView.addGestureRecognizer(tapGesture)

    

}

