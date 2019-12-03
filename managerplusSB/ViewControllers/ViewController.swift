//
//  ViewController.swift
//  managerplusSB
//
//  Created by Dylan DeCoursey on 11/9/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//
import FSCalendar
import UIKit
import AVKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    
   struct Events: Decodable{
        let events: EventDetails
        //let events: Dictionary<String, String>
    }

    struct EventDetails: Decodable{
        let eventCont: [EventCont]
        //let time:
    }




    struct EventCont: Decodable{
        let title: String?
        let locationName: String?
    }

    struct EventInst: Decodable{
        let eventInst: [EventInstances]
    }

    struct EventInstances: Decodable{
        let start: String?
    }





        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

            func stringToDate(date: String){
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
                _ = dateFormatter.date(from: date)
            }

            let jsonURLString = "https://campusevents.uncc.edu/api/2/events"
            guard let url = URL(string: jsonURLString) else
            { return }

            Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
                if response.result.isSuccess {
                    let data = JSON(response.result.value!)
                    
                    let events = data["events"].arrayValue
                    
                    var eventData: JSON?
                    var eventTitle: String?
                    
                    for event in events {
                        eventData = event["event"]
                        eventTitle = eventData?["title"].stringValue
                        print(eventTitle!)
                    }
                    
                    
                    
                } else {
                    print("Error")
                }
                
            })
            
//            URLSession.shared.dataTask(with: url) { (data, response, err) in
//
//                guard let data = data else { return }
//
//                let dataAsString = JSON(response)
//                print(dataAsString)
//
//
////                do {
////                    let eventName = try
////                        JSONDecoder().decode(eventData.self, from: data)
////                    //maybe name
////                    print(eventName)
////                } catch let jsonErr {
////                    print("Error serializing json:", jsonErr)
////                }
//
//                }.resume()
        }





}
