//
//  ArrUsers.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import Foundation

class ArrUsers {
    
    static let sharedInstance = ArrUsers()
    
    public var name = ""
    public var userID = ""
    public var image = ""
    public var createDate = ""
    public var updateDate = ""
    public var createby = ""
    public var updateby = ""
    
    
    
    /// Add user in Database
    ///
    /// - Parameters:
    ///   - name: User Name
    ///   - imageName: User Image Name
    func createUser(_ name: String, imageName: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.InsertUsersList(name, userID: imageName, image: imageName)
        
        db.closeDatabase()
    }
    
    
    /// getting all users from database
    ///
    /// - Returns: array of users
    func getAllUsers() -> [ArrUsers] {
        
        var arr = [ArrUsers]()
        
        let db = DatabaseOperation()
        db.openDatabase(false)
        
        let sql = "SELECT " + db.dbUserID + "," + db.dbUserName
            + "," + db.dbImageName
            + " from " + db.Users_Tlb
        
        guard let cursor = db.selectRecords(sql) else {
            return arr
        }
        
        while cursor.next() {
            let user = ArrUsers()
            user.userID = cursor.stringValue(0)
            user.name = cursor.stringValue(1)
            user.image = cursor.stringValue(2)
            
            arr.append(user)
        }
        
        cursor.close()
        db.closeDatabase()
        
        return arr
    }
}
