//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var taskList = Task.allTasks
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }

    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "task", for: indexPath)
        
        let task = taskList[indexPath.row]
        
        
        cell.textLabel?.text = task.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a zzzz"
        let dateAsString = dateFormatter.string(from: task.dueDate)
        cell.detailTextLabel?.text = dateAsString
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var taskNotStarted = [Task]()
        var taskInProgress = [Task]()
        var taskCompleted = [Task]()
        var items = [Task]()

        for task in taskList {
            if task.status == .notStarted {
                taskNotStarted.append(task)
            } else if task.status == .inProgress {
                taskInProgress.append(task)
            } else if task.status == .completed {
                taskCompleted.append(task)
            }
        }

        var taskStats = [[taskNotStarted], [taskInProgress], [taskCompleted]]
        
        switch section {
        case 0 :
            items = taskNotStarted
            return "Not Started"
        case 1 :
            items = taskInProgress
            return "In Progress"
        case 2 :
            items = taskCompleted
            return "Completed"
        default :
            return "unknown"
        }
    }

}
