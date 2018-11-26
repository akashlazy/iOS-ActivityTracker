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
    @IBOutlet weak var txtActivityName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hrView: UIView!
    
    @IBOutlet weak var topHeight: NSLayoutConstraint!
    
    private let cellIdentifier = "TaskCell"
    
    private var arrTasks = [ArrTasks]()
    
    var activityID = ""
    var activityName = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = "strTask".localized
        
        txtActivityName.text = activityName
        
        let height = UIApplication.shared.statusBarFrame.height +
            self.navigationController!.navigationBar.frame.height
        
        topHeight.constant = height
        
        refreshView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsMultipleSelection = true
        
        viewConfiguration()
        
        updateCounter(activityID)
    }
    
    private func viewConfiguration() {
        hrView.backgroundColor = CustomColor.light_gray()
        
        txtActivityName.textColor = CustomColor.darker_gray()
        txtCounter.textColor = CustomColor.dark_gray()
    }
    
    private func refreshView() {
        arrTasks = [ArrTasks]()
        arrTasks = ArrTasks.sharedInstance.getAllTasks(activityID)
       
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TaskCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TaskCell
        
        if cell == nil {
            tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TaskCell
        }
        
        cell.configureCell(arrTasks, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == arrTasks.count - 1 {
            addTaskAlert()
        } else {
            let cell = tableView.cellForRow(at: indexPath) as! TaskCell
            cell.imgStatus.image = UIImage(named: "Checked")
            cell.txtTaskName.attributedText =  NSAttributedString().strikeThrough(arrTasks[indexPath.row].name)
            
            ArrTasks.sharedInstance.selectTasks("1", ID: arrTasks[indexPath.row].id)
            updateCounter(activityID)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.row == arrTasks.count - 1 {
            addTaskAlert()
        } else {
            let cell = tableView.cellForRow(at: indexPath) as! TaskCell
            cell.imgStatus.image = UIImage(named: "Unchecked")
            cell.txtTaskName.attributedText =  NSAttributedString().plainText(arrTasks[indexPath.row].name)
            ArrTasks.sharedInstance.selectTasks("0", ID: arrTasks[indexPath.row].id)
            updateCounter(activityID)
            
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == arrTasks.count - 1 {
            return false
        } else {
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ArrTasks.sharedInstance.deleteTask(arrTasks[indexPath.row].id)
            arrTasks.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
            refreshView()
        }
    }
    
    func addTaskAlert() {
        let alert = UIAlertController(title: "strAddTask".localized, message: "", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Done", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            
            guard let text = textField.text else {
                return
            }
            
            if text.isEmpty {
                
            } else {
                ArrTasks.sharedInstance.createTask(text, activityID: self.activityID)
                self.refreshView()
            }
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Task Name"
        }
        
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }

    func updateCounter(_ activityID: String) {
        let selectedTaskCount = "\(ArrTasks.sharedInstance.getSelectCount(activityID))"
        
        txtCounter.text = "(" + selectedTaskCount + "/" + "\(abs(arrTasks.count - 1))" + ")"
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
