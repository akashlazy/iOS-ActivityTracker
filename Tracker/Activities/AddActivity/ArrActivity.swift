//
//  ArrActivity.swift
//  Tracker
//
//  Created by Dolphin on 24/11/18.
//  Copyright © 2018 World. All rights reserved.
//

import Foundation

class ArrActivity {
    
    static let sharedInstance = ArrActivity()
    
    public var id = ""
    public var description = ""
    public var title = ""
    public var imageName = ""
    public var dueDate = ""
    public var startTime = ""
    public var lastUpdate = ""
    public var isActivityStop = ""
    public var taskList = ""
    public var userImageName = ""
    
    public var arrAssignUser = [String]()
    
    /// Add Activity in Database
    ///
    /// - Parameters:
    ///   - name: task Name
    ///   - activityID: activityID
    
    
    
    /// Add Activity in Database
    ///
    /// - Parameters:
    ///   - title: Activity Name
    ///   - desc: Activity description
    ///   - imageName: Activity imageName
    ///   - dueDate: Activity dueDate
    ///   - isActivityStop: // 0 = stop, 1 = start
    func createActivity(_ title: String, desc: String, imageName: String, dueDate: String) {
//        let db = DatabaseOperation()
//        db.openDatabase(true)
        
//        db.InsertActiviryMasterList(desc, title: title, image: imageName, dueDate: dueDate)
        
//        db.closeDatabase()
    }
    
    /// getting all Task from Single Activity
    ///
    /// - Parameter activityID: activityID
    /// - Returns: array of tasks
    func getAllActivity() -> [ArrActivity] {
        
        var arr = [ArrActivity]()
        
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        let sql = "SELECT " + db.dbID + "," + db.dbActivityTitle
            + "," + db.dbActivityDescription + "," + db.dbImageName
            + "," + db.dbDueDate + "," + db.dbStartTime
            + " from " + db.ActivityMaster_Tlb
        
        "select amt.id , amt.title, amt.description,
        (Select group_concat(apt.UserID, ',') FROM ActivityParticipentTable as apt inner join UsersMasterTable as umt on umt.ID = apt.userID AND amt.ID = apt.activitymasterid )  AS images,
        (SELECT COUNT(*)  FROM ActivityTaskTransaction AS att WHERE att.activitymasterid = amt.ID ) AS totalTask,
        (SELECT COUNT(*)  FROM ActivityTaskTransaction AS att WHERE att.activitymasterid = amt.ID AND att.taskstatus=1 ) AS totalTaskComplete
        from
        ActivityMasterTable as amt"
        
//            + " where " + db.dbActivityMasterID + " = " + activityID
        
        guard let cursor = db.selectRecords(sql) else {
            return arr
        }
        
        while cursor.next() {
            let activity = ArrActivity()
            activity.id = cursor.stringValue(0)
            activity.title = cursor.stringValue(1)
            activity.description = cursor.stringValue(2)
            activity.imageName = cursor.stringValue(3)
            activity.dueDate = cursor.stringValue(4)
            activity.startTime = cursor.stringValue(6)
            
            arr.append(activity)
        }
        
        cursor.close()
        db.closeDatabase()
        
        return arr
    }
    
    func assignUserToActivity(_ userID: String, activityID: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.InsertActivityParticipentList(userID, activityMasterID: activityID)
        
        db.closeDatabase()
    }
    
    func getAssignUser(_ activityID: String) -> [String] {
        var arr = [String]()
        
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        let sql = "SELECT " + db.dbUserID + " from " + db.ActivityParticipent_Tlb
            + " where " + db.dbActivityMasterID + " = " + activityID
        
        
        guard let cursor = db.selectRecords(sql) else {
            return arr
        }
        
        while cursor.next() {
            let userID = cursor.stringValue(0)
            arr.append(userID)
        }
        
        cursor.close()
        db.closeDatabase()
        
        return arr
    }
}
