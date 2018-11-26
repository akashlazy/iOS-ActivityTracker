
import Foundation

class FileManagement {
    
    class func createFolder(_ folderName: String) {
        let homeDir = NSHomeDirectory()
        let filemgr = FileManager.default
    
        let newDir = homeDir + "/Documents/\(folderName)"
    
        do {
            try filemgr.createDirectory(atPath: newDir, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            
        }
    }
 }

