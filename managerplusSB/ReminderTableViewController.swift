//
//  ReminderTableViewController.swift
//  managerplusSB
//
//  Created by Anthony Peterson on 11/24/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//

import UIKit

class ReminderTableViewController: UITableViewController {
    // Properties
    var reminders = [Reminder]()
    let dateFormatter = DateFormatter()
    let locale = NSLocale.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        // load saved reminders, if any
            if let savedReminders = loadReminders() {
            reminders += savedReminders
        }
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
        
    // Table view data
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "reminderCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        
        let reminder = reminders[indexPath.row]
        // Fetches the appropriate info if reminder exists
        cell.textLabel?.text = reminder.name
        cell.detailTextLabel?.text = "Due " + dateFormatter.string(from: reminder.time as Date)
        
        // Make due date red if overdue
        if NSDate().earlierDate(reminder.time as Date) == reminder.time as Date {
            cell.detailTextLabel?.textColor = UIColor.red
        }
        else {
            cell.detailTextLabel?.textColor = UIColor.blue
        }
        return cell
    }
    
    // Override to support editing the table view.
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let toRemove = reminders.remove(at: indexPath.row)
            UIApplication.shared.cancelLocalNotification(toRemove.notification)
            saveReminders()
            tableView.deleteRows(at: [(indexPath as IndexPath)], with: .fade)
        }
    }
    
    // NSCoding
    
    func saveReminders() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(reminders, toFile: Reminder.ArchiveUrl.path)
        if !isSuccessfulSave {
            print("Failed to save reminders...")
        }
    }
    
    func loadReminders() -> [Reminder]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Reminder.ArchiveUrl.path) as? [Reminder]
    }
    
    // When returning from AddReminderViewController
     @IBAction func unwindToReminderList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddReminderViewController, let reminder = sourceViewController.reminder {
               // add a new reminder
            let newIndexPath = NSIndexPath(row: reminders.count, section: 0)
               reminders.append(reminder)
            tableView.insertRows(at: [(newIndexPath as IndexPath)], with: .bottom)
               saveReminders()
               tableView.reloadData()
           }
    }
}
