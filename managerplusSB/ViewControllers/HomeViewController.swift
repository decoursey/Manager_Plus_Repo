//
//  HomeViewController.swift
//  managerplusSB
//
//  Created by Dylan DeCoursey on 11/9/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//

import UIKit
import FSCalendar


class HomeViewController: UIViewController {
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // In loadView or viewDidLoad
        let calendar = FSCalendar()
        //calendar.dataSource = self
        //calendar.delegate = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)
        calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        

        
        calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 600).isActive = true
        self.calendar = calendar
        
        
        
        
        
        
        
        
        
        
        
    }
    
    

}
//extension HomeViewController: FSCalendarDataSource, FSCalendarDelegate {
    
//}
