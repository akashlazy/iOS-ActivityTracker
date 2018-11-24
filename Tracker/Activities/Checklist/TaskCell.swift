//
//  TaskCell.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var txtTaskName: UILabel!
    @IBOutlet weak var txtCounter: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgStatus.image = UIImage(named: "Unchecked")
        
        txtTaskName.text = "sknsdkvfkvfls"
       
    }

    func configureCell(_ arrTasks: [ArrTasks], index: Int) {
        
        let task = arrTasks[index]
        
        let counter = index + 1
        
        if index == (arrTasks.count - 1) {
            txtCounter.isHidden = true
            txtTaskName.text =  task.name
            imgStatus.image = UIImage(named: "Add")
        } else {
            txtCounter.isHidden = false
            txtCounter.text = "\(counter)."
            txtTaskName.text =  task.name
            imgStatus.image = UIImage(named: "Unchecked")
            
            txtCounter.sizeToFit()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        
        // Configure the view for the selected state
    }
    
}
