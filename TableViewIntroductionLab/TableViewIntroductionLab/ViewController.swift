//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tasklist = Task.allTasks
    var statOfTask = [[Task]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        
    }
    
    func loadData() {
        statOfTask = Task.getSections()
    }

    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statOfTask[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "task", for: indexPath)
        
        let task = statOfTask[indexPath.section][indexPath.row]
        
        
        cell.textLabel?.text = task.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a zzzz"
        let dateAsString = dateFormatter.string(from: task.dueDate)
        cell.detailTextLabel?.text = dateAsString
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return statOfTask.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return statOfTask[section].first
        
    }
    
    

}
