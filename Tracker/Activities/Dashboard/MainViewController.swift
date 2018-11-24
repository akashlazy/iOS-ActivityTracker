//
//  MainViewController.swift
//  Tracker
//
//  Created by Dolphin on 21/11/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hideView: UIView!
    @IBOutlet weak var hideLabel: UILabel!
    
    
    var a = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "Activities"
        
        self.view.backgroundColor = CustomColor.background()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        self.navigationItem.rightBarButtonItem = add
        
        hideLabel.textColor = CustomColor.dark_gray()
    }
    
    
    @objc func addButtonClick() {
        let addActivity = AddActivityVC(nibName: "AddActivityVC", bundle: nil)

        let nav = UINavigationController(rootViewController: addActivity)
        
        self.present(nav, animated: true, completion: {
            self.a -= 1
            self.refreshList()
        })

    }
    
    func refreshList() {
        if a == 0 {
            tableView.isHidden = true
            hideView.isHidden = false
        } else {
            tableView.isHidden = false
            hideView.isHidden = true
            tableView.reloadData()
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        
        tableView.setEditing(editing, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ActivityCell! = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellReuseIdentifier: "ActivityCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklistVC = ChecklistVC(nibName: "ChecklistVC", bundle: nil)
        self.navigationController?.pushViewController(checklistVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            a -= 1
////            arrStudentName.remove(at: indexPath.row)
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .middle)
//            tableView.endUpdates()
//        }
//    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MainViewController {
    func createUsers()  {
        
    }
}
