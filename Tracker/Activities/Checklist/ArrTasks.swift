//
//  ArrTasks.swift
//  Tracker
//
//  Created by lazy on 11/24/18.
//  Copyright © 2018 World. All rights reserved.
//

import Foundation

class ArrTasks {
    static let sharedInstance = ArrTasks()
    
    public var id = ""
    public var name = ""
    public var status = ""
    public var activityID = ""
  
    /// Add Tasks in Database
    ///
    /// - Parameters:
    ///   - name: task Name
    ///   - activityID: activityID
    func createUser(_ name: String, activityID: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.InsertActivityTaskList(name, status: "0", activityMasterID: activityID)
        db.closeDatabase()
    }
    
    /// getting all Task from Single Activity
    ///
    /// - Parameter activityID: activityID
    /// - Returns: array of tasks
    func getAllTasks(_ activityID: String) -> [ArrTasks] {
       
        var arr = [ArrTasks]()
        
        let db = DatabaseOperation()
        db.openDatabase(false)
        
        let sql = "SELECT " + db.dbID + "," + db.dbTaskName
            + "," + db.dbTaskStatus
            + " from " + db.ActivityTaskTransaction_Tlb
            + " where " + db.dbActivityMasterID + " = " + activityID
            + " OR " + db.dbActivityMasterID + " = 0 "
//            + "order by " + db.dbID
        
        guard let cursor = db.selectRecords(sql) else {
            return arr
        }
        
        while cursor.next() {
            let task = ArrTasks()
            task.id = cursor.stringValue(0)
            task.name = cursor.stringValue(1)
            task.status = cursor.stringValue(2)
            
            arr.append(task)
        }
        
        cursor.close()
        db.closeDatabase()
        
        return arr
    }
    
    func deleteTask(_ ID: String) {
        
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.DeleteActivityTaskList(ID)
        
        db.closeDatabase()
    }
}
