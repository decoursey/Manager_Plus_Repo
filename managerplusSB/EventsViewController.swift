//
//  EventsViewController.swift
//  managerplusSB
//
//  Created by Anthony Peterson on 12/5/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//

import UIKit
import FSCalendar
import AVKit
import Alamofire
import SwiftyJSON

class EventsViewController: UIViewController {


    @IBOutlet weak var FirstTitleLabel: UILabel!
    
    
    
    
    //@IBOutlet weak var FirstLabelUI: UILabel!
   // var LabelTextST = String()
    
    
    
    
    
    /*
    protocol ourFunctions {
        func getTitle(num: Int)
        func getLocation(num: Int)
    }
    */




        
        
     
        
      /*
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
                /*
                func stringToDate(date: String){
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                    dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
                    _ = dateFormatter.date(from: date)
                }
*/
                
                
                let jsonURLString = "https://campusevents.uncc.edu/api/2/events"
                guard let url = URL(string: jsonURLString) else
                { return }

                Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
                    if response.result.isSuccess {
                        let data = JSON(response.result.value!)
                        
                        let events = data["events"].arrayValue
                        
                        var eventData: JSON?
                        //var eventTitle: String?
                        
                    
                        
                        
                        var eventTitles: [String] = []
                        for event in events {
                            eventData = event["event"]
                            eventTitles.append(((eventData?["title"].stringValue)!))
                            
                        }
                        //print(eventTitles[1])
                        self.FirstTitleLabel.text = eventTitles[1]
                        
                        //self.FirstLabelUI.text = eventTitles[1]
                        
                        
                        
                        
                            var eventLoc: [String] = []
                            for event in events {
                            eventData = event["event"]
                            eventLoc.append(((eventData?["location_name"].stringValue)!))
                        }
                       
                    
                      /*
                       func getDate(num: Int)-> String{
                           var eventDate: [String] = []
                           for event in events {
                            eventData = event["event"]
                           eventInst = eventData["event_instance"]
                           eventDate.append(((eventInst?["location_name"].stringValue)!))
                           
                       }
                           return eventInst[num]
                       }
                        
                        */
                        
                        
                        
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
    
    //self.delegate?.getTitle(0)
    //self.delegate?
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


