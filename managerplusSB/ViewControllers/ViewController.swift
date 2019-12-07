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

/*
protocol ourFunctions {
    func getTitle(num: Int)
    func getLocation(num: Int)
}
*/




class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    /*func displayEventVC() {
       let vc = EventsViewController()
       vc.delegate = self
       self.present(vc, animated: true)
    }
    
  
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




*/
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

            /*func stringToDate(date: String){
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
               _ = dateFormatter.date(from: date) */
            }

            /*let jsonURLString = "https://campusevents.uncc.edu/api/2/events"
            guard let url = URL(string: jsonURLString) else
            { return }

            Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
                if response.result.isSuccess {
                    let data = JSON(response.result.value!)
                    
                    let events = data["events"].arrayValue
                    
                    var eventData: JSON?
                    //var eventTitle: String?
                    
                
                    
                    func getTitle(num: Int)-> String{
                    var eventTitles: [String] = []
                        self.removeFromSuperView()
                    for event in events {
                        eventData = event["event"]
                        eventTitles.append(((eventData?["title"].stringValue)!))
                        
                    }
                        return eventTitles[num]
                    }
                    
                    
                    func getLocation(num: Int)-> String{
                        var eventLoc: [String] = []
                        for event in events {
                        eventData = event["event"]
                        eventLoc.append(((eventData?["location_name"].stringValue)!))
                        
                    }
                        return eventLoc[num]
                    }
                
                  
                   func getDate(num: Int)-> String{
                       var eventDate: [String] = []
                       for event in events {
                        eventData = event["event"]
                       eventInst = eventData["event_instance"]
                       eventDate.append(((eventInst?["location_name"].stringValue)!))
                       
                   }
                       return eventInst[num]
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




*/
}
