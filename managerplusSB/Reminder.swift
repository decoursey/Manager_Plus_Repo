 //
//  Reminder.swift
//  managerplusSB
//
//  Created by Anthony Peterson on 11/24/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//

import Foundation
import UIKit

class Reminder: NSObject, NSCoding {
    
    // properties
    var notification: UILocalNotification
    var name: String
    var time: NSDate
   
    // Archive paths for persistent data
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("reminders")
    
    // enum for property keys
    struct PropertyKey {
        static let nameKey = "name"
        static let timeKey = "time"
        static let notificationKey = "notification"
    }
    
    // initializer
    init(name: String, time: NSDate, notification: UILocalNotification) {
        self.name = name
        self.time = time
        self.notification = notification
        
        super.init()
    }
   
    // Destructor
    deinit {
        // cancel notification
        UIApplication.shared.cancelLocalNotification(self.notification)
    }
    
    // NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(time, forKey: PropertyKey.timeKey)
        aCoder.encode(notification, forKey: PropertyKey.notificationKey)
    }
    
    required convenience init (coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let time = aDecoder.decodeObject(forKey: PropertyKey.timeKey) as! NSDate
        let notification = aDecoder.decodeObject(forKey: PropertyKey.notificationKey) as! UILocalNotification
        
        self.init(name: name, time: time, notification: notification)
    }
    
}
