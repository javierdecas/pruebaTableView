//
//  ViewController.swift
//  pruebaTableViewTareas
//
//  Created by APPS2M on 20/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, CheckableTableViewCellDelegate, UITableViewDelegate
{
    func checkableTableViewCell(_ cell: CheckableTableViewCell, option: Int)
    {
        
    }
    
    var userTasks: [UserTask]?
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 44 //Or any value you want.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        if let tasks = userTasks {
//            return tasks.count
//        }
//        return 0
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! CheckableTableViewCell
         
        cell.delegate = self
         
        cell.question = "Tarea 1: Investigación de AR"
        cell.options = ["Pass", "Merit", "Distintion"] // Option array
        cell.answer = "Answer Text"
        
        cell.selectedOption = 1 // Starts with index 0.
        
        return cell
    }

}

