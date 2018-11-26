
import Foundation
import FMDB

class DBInfo {
    var pathToDatabase: String!
    var database: FMDatabase!
        
    ///////Users Table
    let Users_Tlb = "UsersMasterTable"
    let dbID = "ID"
    let dbUserID = "UserID"
    let dbUserName = "UserName"
    let dbImageName = "ImageName"
    let dbCreateDate = "CreateDate"
    let dbUpdatedDate = "UpdatedDate"
    let dbCreatedby = "Createdby"
    let dbUpdatedby = "Updatedby"
    
    func UsersListTableCreate(_ db: FMDatabase) {
        //prepare table creations query
        let UsersListTableCreate = "create table "
            + Users_Tlb + " (" + dbID + " integer primary key autoincrement, "
            + dbUserID + " integer, " + dbUserName + " text, "
            + dbImageName + " text, " + dbCreateDate + " text, "
            + dbUpdatedDate + " text, " + dbUpdatedby
            + " text, " + dbCreatedby + " text " + " ); "
        
        sqlExecute(UsersListTableCreate)
    }
    func UsersListTableUpgrade(_ db: FMDatabase, oldVersion: Int, newVersion: Int) {
        let UsersListTableDelete = "DROP TABLE IF EXISTS " + Users_Tlb
        sqlExecute(UsersListTableDelete)
        UsersListTableCreate(db)
    }
    ///////// end Users Table
    
    ///////ActivityMaster Table
    let ActivityMaster_Tlb = "ActivityMasterTable"
    let dbActivityDescription = "Description"
    let dbActivityTitle = "Title"
    let dbDueDate = "DueDate"
    let dbStartTime = "StartTime"
    let dbLastUpdate = "LastUpdate"
    let dbIsActivityStop = "IsActivityStop"
    let dbIsActivitySwipe = "IsActivitySwipe"
    
    func ActivityListTableCreate(_ db: FMDatabase) {
        //prepare table creations query
        let ActivityListTableCreate = "create table "
            + ActivityMaster_Tlb + " (" + dbID + " integer primary key autoincrement, "
            + dbActivityDescription + " text, " + dbActivityTitle + " text, "
            + dbImageName + " text, " + dbCreateDate + " text, "
            + dbLastUpdate + " text, " + dbDueDate + " text, "
            + dbStartTime + " text, " + dbIsActivityStop + " text, " + dbIsActivitySwipe
            + " text " + " ); "
        
        sqlExecute(ActivityListTableCreate)
    }
    func ActivityListTableUpgrade(_ db: FMDatabase, oldVersion: Int, newVersion: Int) {
        let ActivityListTableDelete = "DROP TABLE IF EXISTS " + ActivityMaster_Tlb
        sqlExecute(ActivityListTableDelete)
        ActivityListTableCreate(db)
    }
    ///////// end ActivityMaster Table
    
    ///////ActivityParticipent Table
    let ActivityParticipent_Tlb = "ActivityParticipentTable"
    let dbActivityMasterID = "ActivityMasterID"
    
    func ActivityParticipentListTableCreate(_ db: FMDatabase) {
        //prepare table creations query
        let ActivityParticipentListTableCreate = "create table "
            + ActivityParticipent_Tlb + " (" + dbID + " integer primary key autoincrement, "
            + dbUserID + " integer, " + dbActivityMasterID + " integer " + " ); "
        
        sqlExecute(ActivityParticipentListTableCreate)
    }
    func ActivityParticipentListTableUpgrade(_ db: FMDatabase, oldVersion: Int, newVersion: Int) {
        let ParticipentListTableDelete = "DROP TABLE IF EXISTS " + ActivityParticipent_Tlb
        sqlExecute(ParticipentListTableDelete)
        ActivityParticipentListTableCreate(db)
    }
    ///////// end ActivityParticipent Table
    
    ///////ActivityTask Table
    let ActivityTaskTransaction_Tlb = "ActivityTaskTransaction"
    let dbTaskName = "TaskName"
    let dbTaskStatus = "TaskStatus"  // "1" for Pending, "2" for Completed, "3" for Progress
    
    func ActivityTaskListTableCreate(_ db: FMDatabase) {
        //prepare table creations query
        let ActivityTaskListTableCreate = "create table "
            + ActivityTaskTransaction_Tlb + " (" + dbID + " integer primary key autoincrement, "
            + dbTaskName + " text, " + dbTaskStatus + " text, "
            + dbActivityMasterID + " integer " + " ); "
        
        sqlExecute(ActivityTaskListTableCreate)
    }
    func ActivityTaskListTableUpgrade(_ db: FMDatabase, oldVersion: Int, newVersion: Int) {
        let ActivityTaskListTableDelete = "DROP TABLE IF EXISTS " + ActivityTaskTransaction_Tlb
        sqlExecute(ActivityTaskListTableDelete)
        ActivityListTableCreate(db)
    }
    ///////// end ActivityMaster Table
    
    
    ///////ActivityLog Table
    let ActivityLog_Tlb = "ActivityLog"
    let dbEndTime = "EndTime"
    
    func ActivityLogListTableCreate(_ db: FMDatabase) {
        //prepare table creations query
        let ActivityLogListTableCreate = "create table "
            + ActivityLog_Tlb + " (" + dbID + " integer primary key autoincrement, "
            + ActivityMaster_Tlb + " integer, " + dbStartTime + " text, "
            + dbEndTime + " text " + " ); "
        
        sqlExecute(ActivityLogListTableCreate)
    }
    func ActivityLogListTableUpgrade(_ db: FMDatabase, oldVersion: Int, newVersion: Int) {
        let ActivityLogListTableDelete = "DROP TABLE IF EXISTS " + ActivityLog_Tlb
        sqlExecute(ActivityLogListTableDelete)
        ActivityListTableCreate(db)
    }
    ///////// end ActivityLog Table
    
   
    func sqlExecute(_ sqlString: String) {
        if database!.executeStatements(sqlString) {
            
        } else {
            print("Databse Error===\(database!.lastErrorMessage()) in \n \(sqlString)")
        }
    }
    
    func selectRecords(_ queryString: String) -> FMResultSet? {
        do {
            return try database!.executeQuery(queryString, values: nil)
        } catch {
            print("Databse Error===\(database.lastErrorMessage())")
            return nil
        }
    }
    
    
    
    func insertExecuteBind(_ tableName: String, parameter: NSMutableDictionary, value: NSMutableDictionary) {
        
        var query = "INSERT INTO \(tableName)"
        
        var paraStr = ""
        var valueStr = ""
        var arr = [String]()
        
        for i in 0 ..< parameter.count {
            paraStr = paraStr + "\(paraStr.isEmpty ? "\(parameter.value(forKey: "\(i+1)") as! String)":",\(parameter.value(forKey: "\(i+1)") as! String)")"
            valueStr  = valueStr + "\(valueStr.isEmpty ? "?":",?")"
            arr.append(value.value(forKey: "\(i+1)") as! String)
        }
        query = query + "(" + paraStr + ") VALUES (" + valueStr + ");"
        
        if database.executeUpdate(query, withArgumentsIn: arr) {
            return
        } else {
            print("Databse Insert Error===\(database.lastErrorMessage())")
        }
    }
    
    func insertMultipleExecuteBind(_ tableName: String, parameter: NSMutableDictionary, value: NSMutableArray) {
        
        var query = "INSERT INTO \(tableName)"
        
        var paraStr = ""
        var valueStr = ""
        
        
        for i in 0 ..< parameter.count {
            paraStr = paraStr + "\(paraStr.isEmpty ? "\(parameter.value(forKey: "\(i+1)") as! String)":",\(parameter.value(forKey: "\(i+1)") as! String)")"
            valueStr  = valueStr + "\(valueStr.isEmpty ? "?":",?")"
        }
        query = query + "(" + paraStr + ") VALUES (" + valueStr + ");"
        
        database.beginTransaction()
        for i in 0 ..< value.count {
            let dict = value.object(at: i) as! NSMutableDictionary
            var arr = [String]()
            for j in 0 ..< dict.count {
                arr.append(dict.value(forKey: "\(j+1)") as! String)
            }
            
            if database.executeUpdate(query, withArgumentsIn: arr) {
                continue
            } else {
                print("Databse Multiple Insert Error===\(database.lastErrorMessage())")
            }
        }
        database.commit()
    }
    
    func updateExecuteBind(_ tableName: String, parameter: NSMutableDictionary, value: NSMutableDictionary, condition: String) {
        
        var query = "UPDATE \(tableName) SET "
        var arr = [String]()
        
        for i in 0 ..< parameter.count {
            query = query + "\(parameter.value(forKey: "\(i+1)") as! String) = ?" + (((i+1) != parameter.count) ? "," : "")
            arr.append(value.value(forKey: "\(i+1)") as! String)
        }
        if !condition.isEmpty {
            query = query + " WHERE " + condition
        }
        
        if database.executeUpdate(query, withArgumentsIn: arr) {
            return
        } else {
            print("Databse Error===\(database!.lastErrorMessage()) in \n \(query)")
        }
    }

    func deleteRecord(_ tableName: String, condition: String) {
        var query = "";
        if condition.isEmpty {
            query = "delete from " + tableName;
        } else {
            query = "delete from " + tableName + " WHERE " + condition;
        }
        
        let a = [Any]()
        
        if database!.executeUpdate(query, withArgumentsIn: a) {
            return
        } else {
            print("Databse Error===\(database!.lastErrorMessage())")
        }
    }
}

extension FMResultSet {
    func stringValue(_ Index: Int32) -> String {
        guard let value = self.string(forColumnIndex: Index) else {
            return ""
        }
        return value
    }
    
    func doubleValue(_ Index: Int32) -> Double {
        return self.double(forColumnIndex: Index)
    }
}
