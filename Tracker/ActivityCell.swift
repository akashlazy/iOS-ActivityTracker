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
    
    @IBOutlet weak var editView: CardView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var imgUser2: UIImageView!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtUserCounter: UILabel!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubTitle: UILabel!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var imgTask: UIImageView!
    @IBOutlet weak var txttaskCounter: UILabel!
    @IBOutlet weak var txtTime: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    
    private var toogle: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 10
        
       // backView.backgroundColor = UIColor.green
        
        editView.backgroundColor = CustomColor.shamrock()
        
        imgUser1.layer.cornerRadius = imgUser1.frame.height / 2
        imgUser1.layer.masksToBounds = false
        
        imgUser2.layer.cornerRadius = imgUser2.frame.height / 2
        imgUser2.layer.masksToBounds = true
        imgUser2.layer.borderWidth = 1
        imgUser2.layer.borderColor = UIColor.white.cgColor
        
        let a = UISwipeGestureRecognizer(target: self, action: #selector(xyz))
        a.direction = .left
        backView.addGestureRecognizer(a)
        
        let b = UITapGestureRecognizer(target: self, action: #selector(abc))
        self.addGestureRecognizer(b)
        
        let c = UITapGestureRecognizer(target: self, action: #selector(abc1))
        editView.addGestureRecognizer(c)
        
        configuration()
    }
    
    func configuration() {
        imgIcon.image = UIImage(named: "Logo_1")
        
        txtTitle.textColor = CustomColor.darker_gray()
        
        txtSubTitle.textColor = CustomColor.light_gray()
        
        txtDate.textColor = CustomColor.dark_gray()
        
        txttaskCounter.textColor = CustomColor.dark_gray()
        
        txtTime.textColor = CustomColor.darker_gray()
        
        txtUserCounter.textColor = CustomColor.light_gray()
    }
    
    @objc func xyz() {
        if self.backView.frame.origin.x < 40 {
            UIView.animate(withDuration: 0.3, animations: {
                self.backView.frame = CGRect(x: -100, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.backView.frame = CGRect(x: 10, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
            }, completion: nil)
        }
    }
    
    
    @objc func abc() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backView.frame = CGRect(x: 10, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
        }, completion: nil)
    }
    
    @objc func abc1() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backView.frame = CGRect(x: 10, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
        }, completion: nil)
        
        print("Click")
    }
    
    
    @IBAction func playButtonClick(_ sender: UIButton) {
        if !toogle {
            toogle = true
            sender.setImage(UIImage(named: "Timer_1"), for: .normal)
        } else {
            toogle = false
            sender.setImage(UIImage(named: "Timer_2"), for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
