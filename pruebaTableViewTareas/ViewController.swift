//
//  ViewController.swift
//  pruebaTableViewTareas
//
//  Created by APPS2M on 20/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CheckableTableViewCell
         
        cell.delegate = self
         
        cell.question = “Question Text”
        cell.options = [“Option1”, “Option2”, “Option3”] // Option array
        cell.answer = "Answer Text"
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 44 //Or any value you want.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }


}

