
import Foundation
class ConvertionClass {
    
    //Default Format
    static func conLongToDate(_ timeInterval: Double) -> String {
        return conLongToDate(timeInterval, dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    //Custom Format
    static func conLongToDate(_ timeInterval: Double, dateFormat: String) -> String {
        let df = DateFormatter()
        df.dateFormat = dateFormat
        
        let stringFromDate = df.string(from: Date(timeIntervalSince1970: timeInterval))
        return stringFromDate
    }
    
    //Default Format
    static func conDateToLong(_ insertDate: String) -> TimeInterval {
        return conDateToLong(insertDate, dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    //Custom Format
    static func conDateToLong(_ insertDate: String, dateFormat: String) -> TimeInterval {
        let df = DateFormatter()
        df.dateFormat = dateFormat
        
        let date = df.date(from: insertDate)
        return date!.timeIntervalSince1970
    }
    
    static func conDateToLong(_ insertDate: Date) -> TimeInterval {
        return insertDate.timeIntervalSince1970
    }
    
    //Default Format
    static func currentTime() -> Double {
        // get current date/time
        let today = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        let currentTime = dateFormatter.string(from: today)
        
        return ConvertionClass.conDateToLong(currentTime, dateFormat: "dd-MM-yyyy HH:mm:ss")
    }
    
    static func currentDate() -> String {
        let today = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: today)
    }
    
    static func getDiffFromCurrentDate(_ time: Double) -> String {
        var timeStr = ""
        
        var time = time
        time = abs(ConvertionClass.currentTime() - time)
        time = Double(time / 60) // in minute
        
        if time <= 59 {
            timeStr = "\(time)" + " min"
        } else {
            time = Double(time / 60) // in hour
            if time <= 23 {
                timeStr = "\(time)" + " hour"
            } else {
                time = Double(time / 24) // in days
                if(time <= 30) {
                    timeStr = "\(time)" + " days"
                } else {
                    time = Double(time / 30) // in month
                    if time <= 11 {
                        timeStr = "\(time)" + " month"
                    } else {
                        time = Double(time / 12) // in year
                        timeStr = "\(time)" + " year"
                    }
                }
            }
        }
        return timeStr
    }
    
    
    static func getDiffFromCurrentDate(_ time1: Double, time2: Double) -> String {
        var timeStr = ""
        var time1: Int64 = Int64(time1)
        
        time1 = abs(time1 - Int64(time2)) // time in sec
        
        if time1 <= 59 {
            timeStr = "\(time1)"
            //                + " sec"
        } else {
            time1 = (time1 / 60) // in min
            if time1 <= 59 {
                timeStr = "\(time1)"
                //                    + " min"
            } else {
                time1 = (time1 / 60) // in hour
                if time1 <= 23 {
                    timeStr = "\(time1)"
                    //                        + " hour"
                } else {
                    time1 = (time1 / 24) // in days
                    if time1 <= 30 {
                        timeStr = "\(time1)"
                        //                            + " days"
                    } else {
                        time1 = (time1 / 30) // in month
                        if time1 <= 11 {
                            timeStr = "\(time1)"
                            //                                + " month"
                        } else {
                            time1 = (time1 / 12) // in year
                            timeStr = "\(time1)"
                            //                                + " year"
                        }
                    }
                }
            }
        }
        return timeStr;
    }
}


extension Date {
    func adding(time: Int) -> Date {
        var time = time
        
        if time <= 59 {
            return Calendar.current.date(byAdding: .second, value: time, to: self)!
        } else {
            time = (time / 60) // in minute
            
            if time <= 59 {
                return Calendar.current.date(byAdding: .minute, value: time, to: self)!
            } else {
                time = (time / 60) // in hour
                if time <= 23 {
                    return Calendar.current.date(byAdding: .hour, value: time, to: self)!
                }
            }
            return Calendar.current.date(byAdding: .second, value: time, to: self)!
        }
    }
}
