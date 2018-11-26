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
     txtCounter.textColor = CustomColor.dark_gray()
    }

    func configureCell(_ arrTasks: [ArrTasks], index: Int) {
        
        let task = arrTasks[index]
        
        let counter = index + 1
        
        if index == (arrTasks.count - 1) {
            txtCounter.isHidden = true
            txtTaskName.text =  task.name
            imgStatus.image = UIImage(named: "Add")
            txtTaskName.textColor = CustomColor.darker_gray()
        } else {
            txtCounter.isHidden = false
            txtCounter.text = "\(counter)."
            txtTaskName.textColor = CustomColor.textColor()
            
            if task.status.equals("1") {
                imgStatus.image = UIImage(named: "Checked")
                txtTaskName.attributedText =  NSAttributedString().strikeThrough(task.name)
            } else {
                imgStatus.image = UIImage(named: "Unchecked")
                txtTaskName.attributedText =  NSAttributedString().plainText(task.name)
            }
            txtCounter.sizeToFit()
        }
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        
        // Configure the view for the selected state
    }
    
}

extension NSAttributedString {
    func strikeThrough(_ text: String) -> NSMutableAttributedString {
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
    
    func plainText(_ text: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
