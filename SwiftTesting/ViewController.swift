//
//  ViewController.swift
//  SwiftTesting
//
//  Created by Mehmet Can Şimşek on 25.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var toDoList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Add Item", message: "Enter Your To Do Item", preferredStyle: .alert)
        ac.addTextField { textField in
            textField.placeholder = "Enter Item"
        }
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            guard let textField = ac.textFields?[0], let inputText = textField.text, !inputText.isEmpty else { return }
            self.toDoList.insert(inputText, at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }))
        present(ac, animated: true)
        
    }
    
    
    
}

