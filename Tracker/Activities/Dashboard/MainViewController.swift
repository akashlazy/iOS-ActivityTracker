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
    
    private var arrActivity = [ArrActivity]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.refreshList()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "strActivities".localized
        
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
        
        self.present(nav, animated: true, completion: nil)
    }
    
    func refreshList() {
        
        arrActivity = [ArrActivity]()
        arrActivity = ArrActivity.sharedInstance.getAllActivity()
        
        if arrActivity.isEmpty {
            tableView.isHidden = true
            hideView.isHidden = false
        } else {
            tableView.isHidden = false
            hideView.isHidden = true
            tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrActivity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ActivityCell! = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellReuseIdentifier: "ActivityCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell
        }
        
        cell.configureCell(arrActivity, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklistVC = ChecklistVC(nibName: "ChecklistVC", bundle: nil)
        
        checklistVC.activityID = arrActivity[indexPath.row].id
        
        self.navigationController?.pushViewController(checklistVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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


extension MainViewController {
    
}
