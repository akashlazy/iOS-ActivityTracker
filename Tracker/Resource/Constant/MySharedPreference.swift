
import UIKit

class MySharedPreference: NSObject {
    var objCommon = UserDefaults()

    override init() {
        super.init()
        
        objCommon = UserDefaults.standard
    }
    
    // User countr
    func getUserCounter() -> Int {
        return objCommon.integer(forKey: "UserCounter")
    }
    func setUserCounter(_ text: Int) {
        objCommon.set(text, forKey: "UserCounter")
        objCommon.synchronize()
    }
    
    func getISDBOperationCreated() -> Bool {
        return objCommon.bool(forKey: "ISDBOperationCreated")
    }
    func setISDBOperationCreated(_ text: Bool) {
        objCommon.set(text, forKey: "ISDBOperationCreated")
        objCommon.synchronize()
    }
    
    func getISStart() -> Bool {
        return objCommon.bool(forKey: "ISStart")
    }
    func setISStart(_ text: Bool) {
        objCommon.set(text, forKey: "ISStart")
        objCommon.synchronize()
    }
    
    func getISSwipe() -> Bool {
        return objCommon.bool(forKey: "ISSwipe")
    }
    func setISSwipe(_ text: Bool) {
        objCommon.set(text, forKey: "ISSwipe")
        objCommon.synchronize()
    }
    
    
    func getActivityID() -> String {
        return objCommon.value(forKey: "ActivityID") as! String
    }
    func setActivityID(_ text: String) {
        objCommon.setValue(text, forKey: "ActivityID")
        objCommon.synchronize()
    }
    
    func getIndex() -> Int {
        return objCommon.integer(forKey: "Index")
    }
    func setIndex(_ text: Int) {
        objCommon.set(text, forKey: "Index")
        objCommon.synchronize()
    }
   
}
