//
//  ViewController.swift
//  ToDoey
//
//  Created by MBP on 26/12/2017.
//  Copyright © 2017 MBP. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    var itemArray = ["westworld","game of thrones","billions"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK:- Tableview DataSource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return  cell
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
 
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        //stop the flash
        tableView.deselectRow(at: indexPath, animated: true)
        
        //add check mark when cell is tapped
        //remove check mark if cell already selected
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
          tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK:- Add new Button
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        
        //for passing data form action text field input to the action button
       var textFieldInput = UITextField()
       
     
   
        let alertVC = UIAlertController(title: "Add New ToDoey", message: "", preferredStyle: .alert)
        
        let alertButton = UIAlertAction(title: "Add item", style: .default){ (alertButton) in
            
            //what will happen after user clicks add item in the uialert
        self.itemArray.append(textFieldInput.text!)
        self.tableView.reloadData()
        
        }
        
        alertVC.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textFieldInput = alertTextField
          
       
        }
        
        alertVC.addAction(alertButton)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

