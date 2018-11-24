//
//  DBOpr.swift
//  RigV
//
//  Created by Swapnil Jambhulkar on 11/01/17.
//  Copyright © 2017 Akash. All rights reserved.
//

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
    func InsertUsersList(_ name: String, userID: String,  image: String, createDate: String, updateDate: String, createby: String, updateby: String) {
        
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
        values.setValue(createDate, forKey: "4")
        values.setValue(updateDate, forKey: "5")
        values.setValue(createby, forKey: "6")
        values.setValue(updateby, forKey: "7")
        
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
    func InsertActiviryMasterList(_ description: String, title: String, image: String, createDate: String, dueDate: String, startTime: String, lastUpdated: String, isActivityStop: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbActivityDescription, forKey: "1")
        parameter.setValue(dbActivityTitle, forKey: "2")
        parameter.setValue(dbImageName, forKey: "3")
        parameter.setValue(dbCreateDate, forKey: "4")
        parameter.setValue(dueDate, forKey: "5")
        parameter.setValue(startTime, forKey: "6")
        parameter.setValue(lastUpdated, forKey: "7")
        parameter.setValue(isActivityStop, forKey: "8")
        
        let values = NSMutableDictionary()
        values.setValue(description, forKey: "1")
        values.setValue(title, forKey: "2")
        values.setValue(image, forKey: "3")
        values.setValue(createDate, forKey: "4")
        values.setValue(dueDate, forKey: "5")
        values.setValue(startTime, forKey: "6")
        values.setValue(lastUpdated, forKey: "7")
        values.setValue(isActivityStop, forKey: "8")
        
        insertExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values)
    }
    func UpdateActivityMasterList(_ ID: String, description: String, title: String, image: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbActivityDescription, forKey: "1")
        parameter.setValue(dbActivityTitle, forKey: "2")
        parameter.setValue(dbImageName, forKey: "3")
        
        let values = NSMutableDictionary()
        values.setValue(description, forKey: "1")
        values.setValue(title, forKey: "2")
        values.setValue(image, forKey: "3")
        
        updateExecuteBind(ActivityMaster_Tlb, parameter: parameter, value: values, condition: dbID + " ='" + ID)
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
//    func DeleteActivityMasterList(_ ID: String) {
//
//        let delete = "delete from " + ActivityMaster_Tlb + " WHERE \(dbID) = '\(ID)'"
//        sqlExecute(delete)
//    }
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
    
    func UpdateActivityTaskList(_ name: String, status: String, activityMasterID: String) {
        
        let parameter = NSMutableDictionary()
        parameter.setValue(dbTaskName, forKey: "1")
        parameter.setValue(dbTaskStatus, forKey: "2")
        parameter.setValue(dbActivityMasterID, forKey: "3")
        
        let values = NSMutableDictionary()
        values.setValue(name, forKey: "1")
        values.setValue(status, forKey: "2")
        values.setValue(activityMasterID, forKey: "3")
        
        updateExecuteBind(ActivityTaskTransaction_Tlb, parameter: parameter, value: values, condition: dbActivityMasterID + " ='" + activityMasterID)
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
