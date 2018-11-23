//
//  Icon.swift
//  Tracker
//
//  Created by lazy on 11/22/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit

public struct Icon {
    
    /// Get the icon by the file name.
    private static func icon(_ name: String) -> UIImage! {
        return UIImage(named: name)!
    }
    
    public static var add = Icon.icon("Add")
    public static var activity = Icon.icon("Activity_Image")
    public static var checklist = Icon.icon("Checklist")
    public static var logo1 = Icon.icon("Logo_1")
    public static var logo2 = Icon.icon("Logo_2")
    public static var logo3 = Icon.icon("Logo_3")
    public static var member1 = Icon.icon("Member_1")
    public static var member2 = Icon.icon("Member_1")
    public static var timer1 = Icon.icon("Timer_1")
    public static var timer2 = Icon.icon("Timer_2")
    public static var checked = Icon.icon("Checked")
    public static var unchecked = Icon.icon("Unchecked")
    public static var back = Icon.icon("Back")
}
