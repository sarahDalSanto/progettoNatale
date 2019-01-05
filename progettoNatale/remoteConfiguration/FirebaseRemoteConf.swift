//
//  Firebase.swift
//  progettoNatale
//
//  Created by Sarah Dal Santo on 27/12/18.
//  Copyright © 2018 Sarah Dal Santo. All rights reserved.
//
/*
import Foundation
import Lobster


extension ConfigKeys{
    static let welcomeMessage = ConfigKey<String>("welcome_message")
}
class FirebaseRemoteConf : NSObject{
    
    func fetchRemoteConfig(completion: @escaping (_ result: Bool)->Void){
       
        #if DEBUG
        Lobster.shared.debugMode = true
        Lobster.shared.fetchExpirationDuration = 0.0
        #endif
        
        Lobster.shared.fetch{_ in
            self.loadConstants(completion: {result in
                completion(true)
                })
        }
    }
    
    func loadConstants(completion: @escaping (_ result: Bool)->Void){
        let stringa = Lobster.shared[.welcomeMessage]
        
        completion(true)
    }
    
    
        
   
    
    
    
    
}
 */
