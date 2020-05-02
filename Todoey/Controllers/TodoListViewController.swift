//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Maryam on 5/1/20.
//  Copyright © 2020 Sofftech. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    let cellIdentifier = "TodoItemCell"
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    let arrayKey = "TodoListArray"
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Items.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadItems()
        
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
                var textField = UITextField()
                let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                    // what will happen when user click on Add I tem button
                    
//                    let newItem = Item()
                    let newItem = Item(context: self.context)
                    newItem.title = textField.text!// never textfield.text will be nil but it will be empty
                    newItem.done = false
                    self.itemArray.append(newItem)
                
                    self.saveItems()
                }
                alert.addTextField { (alertTextField) in
                    alertTextField.placeholder = "Create new item"
                    textField = alertTextField // we add a refrence of textfiled because when the closure will run we don't have any text
                }
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
        
    }
    
    func saveItems() {
        // Using UserDefaults
        // self.defaults.set(self.itemArray, forKey: self.arrayKey)
        
//        Using Coder
//        let encoder = PropertyListEncoder()
//
//        do {
//            let data  = try encoder.encode(itemArray)
//            try data.write(to: dataFilePath)
//        } catch {
//            print("Error encoding item array, \(error)")
//        }
        
        // Using CoreData
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        // Using UserDefaults
        //        if let items = defaults.array(forKey: arrayKey) as? [Item] {
        //            itemArray = items
        //        }
        
        //        Using Coder
//        if let data = try? Data(contentsOf: dataFilePath) {
//            let decoder = PropertyListDecoder()
//            do {
//            itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                print("Error decoding item array, \(error)")
//            }
//        }
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
}

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // delete an item from CoreData
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

