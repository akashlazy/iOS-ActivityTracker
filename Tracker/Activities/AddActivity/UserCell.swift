//
//  UserCell.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgSelect: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = self.frame.height / 2
        imgUser.layer.cornerRadius = imgUser.frame.height / 2 
    }
    
    func configureCell(_ arrUsers: [ArrUsers], index: Int) {
        
        let user = arrUsers[index]
        
        if index == (arrUsers.count - 1) {
            imgUser.image = UIImage(named: "ic_add_white")
            imgUser.backgroundColor = UIColor.green
        } else {
            if loadImage(user.image) == nil {
                imgUser.image = UIImage(named: "Member_1")
            }
        }
    }
    private func loadImage(_ imageName: String) -> UIImage? {
      
        let mainPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let str = Constant.Folder.mainFolderName + Constant.Folder.folderUserImage + "\(imageName)/" + Constant.ImageExtension.jpeg
        guard let path = mainPath.appendingPathComponent(str) else {
            return nil
        }
        
        guard let image = UIImage(contentsOfFile: "\(path)") else {
            return nil
        }

        return image
    }
    
    
}
