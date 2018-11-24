//
//  FileManagement.swift
//  RigvApp
//
//  Created by Swapnil Jambhulkar on 21/03/16.
//  Copyright © 2016 Akash. All rights reserved.
//

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
    
    class func deleteFolder(_ folderName: String) {
        let homeDir = NSHomeDirectory()
        let filemgr = FileManager.default
        
        let newDir = homeDir + "/Documents/\(folderName)"
        
        if filemgr.fileExists(atPath: newDir) {
            do {
                try filemgr.removeItem(atPath: newDir)
            } catch let error as NSError {
               
            }
        }
    }
    
    class func deletePlist(_ folderName: String) {
        let plistPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
        let filemgr = FileManager.default
        
        let newDir = plistPath + "/Preferences/\(folderName)"
        
        if filemgr.fileExists(atPath: newDir) {
            do {
                try filemgr.removeItem(atPath: newDir)
            } catch let error as NSError {
                
            }
        }
    }
    
    class func RenameFile(_ getFileName: String, setFileName: String) {
        let filemgr = FileManager.default
        if filemgr.fileExists(atPath: getFileName) {
            do {
                try filemgr.moveItem(atPath: getFileName, toPath: setFileName)
            } catch let error as NSError {
                
            }
        }
    }
 }

