
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
}
