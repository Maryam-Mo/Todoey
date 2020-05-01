//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Maryam on 5/1/20.
//  Copyright © 2020 Sofftech. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let cellIdentifier = "TodoItemCell"
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demongargan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                    tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

