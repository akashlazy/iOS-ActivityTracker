//
//  ArrAssignUsers.swift
//  Tracker
//
//  Created by lazy on 11/25/18.
//  Copyright © 2018 World. All rights reserved.
//

import Foundation


class ArrAssignUsers {
    
    static let sharedInstance = ArrAssignUsers()
    
    public var id = ""
    public var userID = ""
    public var activityID = ""

    
    
    func selectUser(_ userID: String, activityID: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.InsertActivityParticipentList(userID, activityMasterID: activityID)
        db.closeDatabase()
    }
    
    func unSelectUser(_ userID: String, activityID: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.DeleteActivityParticipentList(userID, activityID: activityID)
        db.closeDatabase()
    }

}
