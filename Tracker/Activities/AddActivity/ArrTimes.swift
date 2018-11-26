//
//  ArrTimes.swift
//  Tracker
//
//  Created by Dolphin on 26/11/18.
//  Copyright © 2018 World. All rights reserved.
//

import Foundation

class ArrTimes {
    static let sharedInstance = ArrTimes()
    
    var ID = ""
    var startTime = ""
    var stopTime = ""
    
    func getTime(_ activityID: String) -> [ArrTimes] {
        
        var arr = [ArrTimes]()
        
        let db = DatabaseOperation()
        db.openDatabase(false)
        
        let sql = "SELECT " + db.dbStartTime + ", " + db.dbEndTime
            + " from " + db.ActivityLog_Tlb
            + " where " + db.dbActivityMasterID + " = " + activityID
        
        guard let cursor = db.selectRecords(sql) else {
            db.closeDatabase()
            return arr
        }
        
        while cursor.next() {
            let time = ArrTimes()
            
            time.startTime = cursor.stringValue(0)
            time.stopTime = cursor.stringValue(1)
            
            arr.append(time)
        }
        
        cursor.close()
        db.closeDatabase()
        
        return arr
    }
    
//    func start(_ activityID: String, startTime: String, stopTime: String) {
//        
//        let db = DatabaseOperation()
//        db.openDatabase(true)
//        
//        db.InsertActivityLogist(activityID, start: startTime, end: stopTime)
//        
//        db.closeDatabase()
//    }
}
