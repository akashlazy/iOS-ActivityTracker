//
//  ChecklistVC.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit

class ChecklistVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var txtCounter: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

    var a = 5
    
    private let cellIdentifier = "TaskCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TaskCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TaskCell
        
        if cell == nil {
            tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TaskCell
        }
        
        if indexPath.row == 4 {
            cell.imgStatus.image = UIImage(named: "Add")
            cell.txtTaskName.text = "Add Task"
            
        } else {

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let addTask = AddTaskVC(nibName: "AddTaskVC", bundle: nil)
            let nav = UINavigationController(rootViewController: addTask)
            
            self.present(nav, animated: true, completion: {
                self.a = self.a + 1
                tableView.reloadData()
            })
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
