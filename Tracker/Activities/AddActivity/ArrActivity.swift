
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
    public var userImageName = ""
    public var totalTask = ""
    public var completedTask = ""
    
    public var isSwipe = ""
    
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
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.InsertActiviryMasterList(desc, title: title, image: imageName, dueDate: dueDate)
        
        db.closeDatabase()
    }
    
    func updateActivity(_ ID: String, title: String, desc: String, imageName: String, dueDate: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.UpdateActivityMasterList(ID, description: desc, title: title, image: imageName, dueDate: dueDate)
        
        db.closeDatabase()
    }
    
    /// getting all Task from Single Activity
    ///
    /// - Parameter activityID: activityID
    /// - Returns: array of tasks
    func getAllActivity() -> [ArrActivity] {
        
        var arr = [ArrActivity]()
        
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        let sql = "SELECT amt." + db.dbID + ", amt." + db.dbActivityTitle
            + ", amt." + db.dbActivityDescription + ", amt." + db.dbDueDate
            + ", amt." + db.dbIsActivityStop + ", amt." + db.dbLastUpdate
            + ", amt." + db.dbImageName + ", amt." + db.dbIsActivitySwipe
            + ", amt." + db.dbStartTime
            + ", (SELECT group_concat(apt." + db.dbUserID + ", ',')"
            + " from " + db.ActivityParticipent_Tlb + " as apt"
            + " INNER JOIN " + db.Users_Tlb + " as umt on umt." + db.dbID
            + " = apt." + db.dbUserID + " AND amt." + db.dbID
            + " = apt." + db.dbActivityMasterID + " ) as Images, "
            + "(SELECT COUNT(*) FROM " + db.ActivityTaskTransaction_Tlb + " as att "
            + " WHERE att." + db.dbActivityMasterID + " = amt." + db.dbID + " ) AS TotalTask, "
            + "(SELECT COUNT(*) FROM " + db.ActivityTaskTransaction_Tlb + " as att "
            + " WHERE att." + db.dbActivityMasterID + " = amt." + db.dbID
            + " AND att." + db.dbTaskStatus + " = 1 ) AS TotalTaskComplete"
            + " from " + db.ActivityMaster_Tlb + " as amt"
        
        guard let cursor = db.selectRecords(sql) else {
            return arr
        }
        
        while cursor.next() {
            let activity = ArrActivity()
            activity.id = cursor.stringValue(0)
            activity.title = cursor.stringValue(1)
            activity.description = cursor.stringValue(2)
            activity.dueDate = cursor.stringValue(3)
            activity.isActivityStop = cursor.stringValue(4)
            activity.lastUpdate = cursor.stringValue(5)
            activity.imageName = cursor.stringValue(6)
            
            if !cursor.columnIndexIsNull(7) {
                activity.isSwipe = cursor.stringValue(7)
            } else {
                activity.isSwipe = "0"
            }
            
            activity.startTime = cursor.stringValue(8)
            activity.userImageName = cursor.stringValue(9)
            activity.totalTask = cursor.stringValue(10)
            activity.completedTask = cursor.stringValue(11)
            
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
        db.openDatabase(false)
        
        let sql = "SELECT " + db.dbUserID + " from " + db.ActivityParticipent_Tlb
            + " where " + db.dbActivityMasterID + " = " + activityID
        
        guard let cursor = db.selectRecords(sql) else {
            db.closeDatabase()
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
    
    func startActivity(_ activityID: String, isStatus: String, lastUpdate: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
       
        if isStatus.equals("0") {
            db.UpdateActivityStart(activityID, isStart: "0")
            db.UpdateActivityLastTime(activityID, lastUpdate: lastUpdate)
        } else {
            db.UpdateActivityStart(activityID, isStart: "1")
            db.UpdateActivityStartTime(activityID, startTime: lastUpdate)
        }
        
        db.closeDatabase()
    }
    
    func swipeActivity(_ ID: String) {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.UpdateSwipeActivity(ID)
        db.closeDatabase()
    }
    
    func swipeReset() {
        let db = DatabaseOperation()
        db.openDatabase(true)
        
        db.ResetSwipeActivity()
        db.closeDatabase()
    }
}
