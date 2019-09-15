//
//  ContinuityDemoViewController.swift
//  BasicSample
//
//  Created by Omer Rahmany on 01/09/2019.
//  Copyright © 2019 bold360ai. All rights reserved.
//

import UIKit
import Bold360AI

class ContinuityDemoViewController: AgentViewController {

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let baseTrackParams = BaseTrackParams()

        baseTrackParams.baseUri = URL(fileURLWithPath: "https://qa07.nanorep.com/~jio/api/analytics/v1/track/event")
        baseTrackParams.headers = ["":"","":""]

        chatController.eventTrackerHandler = EventTrackerHandler(baseTrackParams: baseTrackParams)
        let trackEventData1 = TrackEventData()

        trackEventData1.eventName = "KEY - First Query to Bot Sent";
        trackEventData1.isActive = true
        let trackEventData2 = TrackEventData()
        trackEventData2.eventName = "LIVECHAT - In Queue"
        trackEventData2.isActive = false

        let trackingEventDataDict = [TrackKeys.0:trackEventData1, TrackKeys.1:trackEventData2]
        
//        chatController.eventTrackerHandler.events =  (trackingEventDataDict as NSDictionary).mutableCopy() as! NSMutableDictionary
//        let eventParams = EventParams(trackKey: FIRST_QUERY_BOLD)
//        eventParams.aiAccountName = "myAccount"
//        eventParams.chatProvider = "myChatProvider"
//        chatController.eventTrackerHandler.trackEvent(eventParams)
//
//         BOT event Tracking
        chatController.eventTrackerHandler = BotEventTrackerHandler(baseTrackParams: baseTrackParams)
        chatController.eventTrackerHandler.events =  (trackingEventDataDict as NSDictionary).mutableCopy() as! NSMutableDictionary
        let botEventParams = BotEventParams(trackKey: TrackKeys.0 as String)
        botEventParams.kbLanguage = "mobiledemo"
        botEventParams.chatProvider = "europe"
        botEventParams.from = "faq"
        
        chatController.eventTrackerHandler.trackEvent(botEventParams)
    }
}
