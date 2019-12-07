//
//  EventsViewController.swift
//  managerplusSB
//
//  Created by Anthony Peterson on 12/5/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//

import UIKit
import WebKit

class EventsViewController: UIViewController{
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://campusevents.uncc.edu/calendar")
        let request = URLRequest(url : url!)
        webview.load(request)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
  






























 
 

 //@IBOutlet weak var FirstTitleLabel: UILabel!
 
 
 
 
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

 //var titleArray : [String] = []

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
            





    
    



                /*
                func stringToDate(date: String){
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                    dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
                    _ = dateFormatter.date(from: date)
                }
*/
