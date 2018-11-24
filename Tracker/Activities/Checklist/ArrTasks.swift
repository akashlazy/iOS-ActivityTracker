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
        
        var task = ArrTasks()
        var arr = [ArrTasks]()
        
        task.name = "Add Task"
        arr.append(task)
        
        let db = DatabaseOperation()
        db.openDatabase(false)
        
        let sql = "SELECT " + db.dbTaskName + "," + db.dbTaskStatus
            + " from " + db.ActivityTaskTransaction_Tlb
            + " where " + db.dbActivityMasterID + " = " + activityID
        
        guard let cursor = db.selectRecords(sql) else {
            return arr
        }
        
        
        
        while cursor.next() {
            task = ArrTasks()
            task.name = cursor.stringValue(0)
            task.status = cursor.stringValue(1)
            
            arr.append(task)
        }
        
        cursor.close()
        db.closeDatabase()
        
        return arr
    }
    
    func deleteTask(_ arr: [ArrTasks], index: Int) {
        let task = arr[index]
        
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.DeleteActivityTaskList(task.activityID)
    }
}
