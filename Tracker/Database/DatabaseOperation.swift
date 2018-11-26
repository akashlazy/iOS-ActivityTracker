
import Foundation
import SQLite3
import FMDB

class DatabaseOperation: DBInfo {
    
    static let sharedInstance = DatabaseOperation()
    
    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(Constant.Database.DATABASE_NAME_Tracker)")
    }
    
    func openDatabase(_ isReadWrite: Bool) {
        // Call for create database, if not available
        if database == nil {
            database = FMDatabase(path: pathToDatabase)
        }
        
        if database != nil {
            if isReadWrite {
                if database.open() {
                    let appPref = MySharedPreference()
                    if !appPref.getISDBOperationCreated() {
                        self.createDatabase()
                    }
                }
            } else {
                if !database.open(withFlags: 2) {
                    return
                }
            }
        }
    }
    
    func closeDatabase() {
        database.close()
    }
    
    func createDatabase() {
        UsersListTableCreate(database)
        ActivityListTableCreate(database)
        ActivityParticipentListTableCreate(database)
        ActivityTaskListTableCreate(database)
        ActivityLogListTableCreate(database)
        
//        InsertActiviryMasterList("iOS Developer", title: "Apple", image: "", dueDate: "")
//        InsertActiviryMasterList("Android Developer", title: "Google", image: "", dueDate: "")
//        InsertActiviryMasterList("Windows Developer", title: "Microsoft", image: "", dueDate: "")
//        
        InsertActivityTaskList("Add Task", status: "0", activityMasterID: "0")
//        InsertActivityTaskList("Design", status: "1", activityMasterID: "1")
//        InsertActivityTaskList("Coding", status: "0", activityMasterID: "1")
//        InsertActivityTaskList("Testing", status: "0", activityMasterID: "2")
//        InsertActivityTaskList("Publish", status: "1", activityMasterID: "3")
//        
//        
        InsertUsersList("", userID: "", image: "Add")
        let sharedPref = MySharedPreference()
        sharedPref.setUserCounter(1)
        
//        InsertUsersList("Akash", userID: "1", image: "")
//        InsertUsersList("Ashish", userID: "2", image: "")
//        InsertUsersList("Kunal", userID: "3", image: "")
//        
//        
//        InsertActivityParticipentList("1", activityMasterID: "1")
//        InsertActivityParticipentList("2", activityMasterID: "1")
//        InsertActivityParticipentList("3", activityMasterID: "2")
//        InsertActivityParticipentList("1", activityMasterID: "2")
//        InsertActivityParticipentList("1", activityMasterID: "3")
//        
        
        let appPref = MySharedPreference()
        appPref.setISDBOperationCreated(true)
    }
    
    func dropPreviousTable() {
        UsersListTableUpgrade(database, oldVersion: 0, newVersion: 0)
        ActivityListTableUpgrade(database, oldVersion: 0, newVersion: 0)
        ActivityParticipentListTableUpgrade(database, oldVersion: 0, newVersion: 0)
        ActivityTaskListTableUpgrade(database, oldVersion: 0, newVersion: 0)
        ActivityLogListTableUpgrade(database, oldVersion: 0, newVersion: 0)
    }
    
    /////////////////UsersList
    func InsertUsersList(_ name: String, userID: String,  image: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbUserName, forKey: "1")
        parameter.setValue(dbUserID, forKey: "2")
        parameter.setValue(dbImageName, forKey: "3")
        parameter.setValue(dbCreateDate, forKey: "4")
        parameter.setValue(dbUpdatedDate, forKey: "5")
        parameter.setValue(dbCreatedby, forKey: "6")
        parameter.setValue(dbUpdatedby, forKey: "7")
        
        let values = NSMutableDictionary()
        values.setValue(name, forKey: "1")
        values.setValue(userID, forKey: "2")
        values.setValue(image, forKey: "3")
        values.setValue("", forKey: "4")
        values.setValue("", forKey: "5")
        values.setValue("", forKey: "6")
        values.setValue("", forKey: "7")
        
        insertExecuteBind(Users_Tlb, parameter: parameter, value: values)
    }
    
    //Update UsersList userName
    func UpdateUserList(_ userID: String, name: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbUserName, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue(name, forKey: "1")
        
        updateExecuteBind(Users_Tlb, parameter: parameter, value: values, condition: dbUserID + " ='" + userID)
    }
    
    //Delete all record into UserList List type table
    func TruncateUsersList() {
        let delete = "delete from " + Users_Tlb
        sqlExecute(delete)
    }
    
    func DeleteUserList(_ userID: String) {
        
        let delete = "delete from " + Users_Tlb + " WHERE \(dbUserID) = '\(userID)'"
        sqlExecute(delete)
    }
    
    /////////// end UsersList
    
    ///////////ActivityMaster
    func InsertActiviryMasterList(_ description: String, title: String, image: String, dueDate: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbActivityDescription, forKey: "1")
        parameter.setValue(dbActivityTitle, forKey: "2")
        parameter.setValue(dbImageName, forKey: "3")
        parameter.setValue(dbCreateDate, forKey: "4")
        parameter.setValue(dbDueDate, forKey: "5")
        parameter.setValue(dbStartTime, forKey: "6")
        parameter.setValue(dbLastUpdate, forKey: "7")
        parameter.setValue(dbIsActivityStop, forKey: "8")
        
        let values = NSMutableDictionary()
        values.setValue(description, forKey: "1")
        values.setValue(title, forKey: "2")
        values.setValue(image, forKey: "3")
        values.setValue("\(ConvertionClass.currentTime())", forKey: "4")
        values.setValue(dueDate, forKey: "5")
        values.setValue("", forKey: "6")
        values.setValue("", forKey: "7")
        values.setValue("0", forKey: "8")
        
        insertExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values)
    }
    func UpdateActivityMasterList(_ ID: String, description: String, title: String, image: String, dueDate: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbActivityDescription, forKey: "1")
        parameter.setValue(dbActivityTitle, forKey: "2")
        parameter.setValue(dbImageName, forKey: "3")
        parameter.setValue(dbDueDate, forKey: "4")
        
        let values = NSMutableDictionary()
        values.setValue(description, forKey: "1")
        values.setValue(title, forKey: "2")
        values.setValue(image, forKey: "3")
        values.setValue(dueDate, forKey: "4")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }
    
    func UpdateActivityStart(_ ID: String, isStart: String) {
        
        UpdateActivityStopAll(isStart)
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbIsActivityStop, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue(isStart, forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }
    
    private func UpdateActivityStop(_ ID: String, isStop: String) {
        
        UpdateActivityStartAll(isStop)
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbIsActivityStop, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue(isStop, forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }
    
    private func UpdateActivityStartAll(_ isStart: String) {
        let parameter = NSMutableDictionary()
        parameter.setValue(dbIsActivityStop, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue("1", forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: "")
    }
    
    func UpdateActivityStopAll(_ isStart: String) {
        let parameter = NSMutableDictionary()
        parameter.setValue(dbIsActivityStop, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue("0", forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: "")
    }
    
    func UpdateActivityLastTime(_ ID: String, lastUpdate: String) {
        
        var stop = lastUpdate
        
        if stop.isEmpty {
            stop = "\(ConvertionClass.currentTime())"
            
            
        }
        
        print("StopTime===", ConvertionClass.conLongToDate(Double(stop)!))
        
        
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbLastUpdate, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue(stop, forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }
    
    func UpdateActivityStartTime(_ ID: String, startTime: String) {
        
        var start = startTime
        
        if start.isEmpty {
            start = "\(ConvertionClass.currentTime())"
        }
        
     
        print("StartTime===", ConvertionClass.conLongToDate(Double(start)!))

        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbStartTime, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue(start, forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }
    
    func UpdateSwipeActivity(_ ID: String) {
        
        ResetSwipeActivity()
    
        let parameter = NSMutableDictionary()
        parameter.setValue(dbIsActivitySwipe, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue("1", forKey: "1")
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }

    
    func ResetSwipeActivity() {
        let parameter = NSMutableDictionary()
        parameter.setValue(dbIsActivitySwipe, forKey: "1")
        
        let values = NSMutableDictionary()
        values.setValue("0", forKey: "1")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: "")
    }
    
    func DeleteActivityMasterList(_ ID: String) {
        
        let delete = "delete from " + ActivityMaster_Tlb + " WHERE \(dbID) = '\(ID)'"
        sqlExecute(delete)
    }
    //Delete all record into ActivityMaster List type table
    func TruncateActivityMasterList() {
        let delete = "delete from " + ActivityMaster_Tlb
        sqlExecute(delete)
    }
    /////////// end ActivityMaster
    
    //////////ActivityParticipent
    func InsertActivityParticipentList(_ userID: String, activityMasterID: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbUserID, forKey: "1")
        parameter.setValue(dbActivityMasterID, forKey: "2")
        
        let values = NSMutableDictionary()
        values.setValue(userID, forKey: "1")
        values.setValue(activityMasterID, forKey: "2")
        
        insertExecuteBind(ActivityParticipent_Tlb, parameter: parameter, value: values)
    }
    func DeleteActivityParticipentList(_ userID: String, activityID: String) {

        let delete = "delete from " + ActivityParticipent_Tlb + " WHERE \(dbUserID) = '\(userID)'"
        sqlExecute(delete)
    }
    /////////// end ActivityParticipent
    
    //////////ActivityTask
    func InsertActivityTaskList(_ name: String, status: String, activityMasterID: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbTaskName, forKey: "1")
        parameter.setValue(dbTaskStatus, forKey: "2")
        parameter.setValue(dbActivityMasterID, forKey: "3")
        
        let values = NSMutableDictionary()
        values.setValue(name, forKey: "1")
        values.setValue(status, forKey: "2")
        values.setValue(activityMasterID, forKey: "3")
        
        insertExecuteBind(ActivityTaskTransaction_Tlb, parameter: parameter, value: values)
    }
    
    func UpdateActivityTaskList(_ status: String, ID: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbTaskStatus, forKey: "1")
        
        
        let values = NSMutableDictionary()
        values.setValue(status, forKey: "1")
        
        updateExecuteBind(ActivityTaskTransaction_Tlb, parameter: parameter, value: values, condition: dbID + " = " + ID)
    }
    
    func DeleteActivityTaskList(_ ID: String) {
        
        let delete = "delete from " + ActivityTaskTransaction_Tlb + " WHERE \(dbID) = '\(ID)'"
        sqlExecute(delete)
    }
    /////////// end ActivityTask
    
    //////////ActivityLog
    func InsertActivityLogist(_ activityMasterID: String, start: String, end: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbActivityMasterID, forKey: "1")
        parameter.setValue(dbStartTime, forKey: "2")
        parameter.setValue(dbEndTime, forKey: "3")
        
        let values = NSMutableDictionary()
        values.setValue(activityMasterID, forKey: "1")
        values.setValue(start, forKey: "2")
        values.setValue(end, forKey: "3")
        
        insertExecuteBind(ActivityLog_Tlb, parameter: parameter, value: values)
    }
    
    func UpdateActivityTaskList(_ activityMasterID: String, start: String, end: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbTaskName, forKey: "1")
        parameter.setValue(dbTaskStatus, forKey: "2")
        parameter.setValue(dbActivityMasterID, forKey: "3")
        
        let values = NSMutableDictionary()
        values.setValue(activityMasterID, forKey: "1")
        values.setValue(start, forKey: "2")
        values.setValue(end, forKey: "3")
        
        updateExecuteBind(ActivityLog_Tlb, parameter: parameter, value: values, condition: dbActivityMasterID + " ='" + activityMasterID)
    }
    /////////// end ActivityTask
}
