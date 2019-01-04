//
//  ViewController.swift
//  progettoNatale
//
//  Created by Sarah Dal Santo on 27/12/18.
//  Copyright © 2018 Sarah Dal Santo. All rights reserved.
//

import UIKit
import Lobster

class ViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Lobster.shared[.welcomeMessage] = "Benvenuto!"
        //Lobster.shared.fetch { [weak self] _ in
        //    self?.textField.text = Lobster.shared[.welcomeMessage]
        //}
        var title = FRC().getStrings(name: "welcome_message")
        self.textField.text = title
        var button = FRC().getStrings(name: "button_message")
        buttonOutlet.setTitle(button, for: .normal)
        
    }

    
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        FirebaseRemoteConf().fetchRemoteConfig(completion: {result in
            if result {
                print("QUALCOSAAAAAA")
            }
            
        })
    }*/

}

