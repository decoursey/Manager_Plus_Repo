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


class ViewController: UIViewController {
    struct eventData: Codable{
        let stuff: Events
    }

    struct Events: Codable{
        let events: EventCont
        //let time:
    }




    struct EventCont: Codable{
        let title: String?
        let location_name: String?
    }





        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

            func stringToDate(date: String){
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
                let dateFromString = dateFormatter.date(from: date)
            }

            let jsonURLString = "https://campusevents.uncc.edu/api/2/events"
            guard let url = URL(string: jsonURLString) else
            { return }

            URLSession.shared.dataTask(with: url) { (data, response, err) in

                guard let data = data else { return }

                //let dataAsString = String(data: data, encoding: .utf8)
                //print(dataAsString)


                do {
                    let eventName = try
                        JSONDecoder().decode(eventData.self, from: data)
                    //maybe name
                    print(eventName)
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                }

                }.resume()
        }


    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set up video in the background
        setUpVideo()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }
    
    func setUpVideo() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
    
        
    }


}



