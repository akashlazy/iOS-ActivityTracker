//
//  ActivityCell.swift
//  Tracker
//
//  Created by Dolphin on 21/11/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    @IBOutlet weak var backView: CardView!
    @IBOutlet weak var backStackViewView: UIStackView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var imgUser2: UIImageView!
    @IBOutlet weak var txtDate: UILabel!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubTitle: UILabel!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var imgTask: UIImageView!
    @IBOutlet weak var txttaskCounter: UILabel!
    @IBOutlet weak var txtTime: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backView.layer.cornerRadius = 24
        backView.layer.masksToBounds = false
        
        imgUser1.layer.cornerRadius = imgUser1.frame.height / 2
        imgUser1.layer.masksToBounds = false
        
        imgUser2.layer.cornerRadius = imgUser2.frame.height / 2
        imgUser2.layer.masksToBounds = true
        imgUser2.layer.borderWidth = 1
        imgUser2.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
