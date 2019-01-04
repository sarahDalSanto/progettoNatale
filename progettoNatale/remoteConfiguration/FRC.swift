//
//  FRC.swift
//  progettoNatale
//
//  Created by Sarah Dal Santo on 04/01/19.
//  Copyright © 2019 Sarah Dal Santo. All rights reserved.
//

import Foundation
import Firebase
import FirebaseRemoteConfig

class FRC : NSObject{
    
    var remoteConfig : RemoteConfig!
    
    func getStrings(name : String)->String{
        
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
        //remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        remoteConfig.fetch(withExpirationDuration: TimeInterval(20)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            //var stringa = self.remoteConfig[name].stringValue
        }
        var stringa = self.remoteConfig[name].stringValue
        print("STRNGA",stringa)
        return stringa ?? ""
    }
    
}
