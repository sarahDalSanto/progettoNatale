//
//  ViewController.swift
//  progettoNatale
//
//  Created by Sarah Dal Santo on 27/12/18.
//  Copyright © 2018 Sarah Dal Santo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseRemoteConfig
import Lobster

class ViewController: UIViewController {

    var remoteConfig : RemoteConfig!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // Lobster.shared[.welcomeMessage] = "Benvenuto!"
        Lobster.shared.fetch { [weak self] _ in
            self?.textField.text = Lobster.shared[.welcomeMessage]
        }
            print(Lobster.shared[.welcomeMessage], "CCCCCCCCCCCCCCCCCCC")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
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
            
            var welcomeMessage = self.remoteConfig["welcome_message"].stringValue
            self.textField.text = welcomeMessage
            print("AAAAAAAAAAAAAAAAA", welcomeMessage,self.remoteConfig["welcome_message"])
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        FirebaseRemoteConf().fetchRemoteConfig(completion: {result in
            if result {
                print("QUALCOSAAAAAA")
            }
            
        })
    }

}

