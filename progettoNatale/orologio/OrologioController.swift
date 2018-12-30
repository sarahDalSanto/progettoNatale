//
//  OrologioController.swift
//  progettoNatale
//
//  Created by Sarah Dal Santo on 28/12/18.
//  Copyright © 2018 Sarah Dal Santo. All rights reserved.
//

import UIKit

class OrologioController: UIViewController {

    @IBOutlet weak var labelWatch: UILabel!

    var timer : Timer!
    let date = Date() // save date, so all components use the same date
    let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
    
    @IBOutlet weak var clock: UIImageView!
    @IBOutlet weak var mins: UIImageView!
    @IBOutlet weak var hours: UIImageView!
    
    @IBOutlet weak var secs: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        labelWatch.text = "h \(hour) m \(minute) s \(second)"
        
        clockTimer()
    }
    

    
    func clockTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timer.isValid {
                
                let date = Date() // save date, so all components use the same date
                let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
                
                let hour = calendar.component(.hour, from: date)
                let minute = calendar.component(.minute, from: date)
                let second = calendar.component(.second, from: date)
                
                self.labelWatch.text = "h \(hour) m \(minute) s \(second)"
                //print("h \(hour) m \(minute) s \(second)")
                
                
                UIView.animate(withDuration: 0.8, animations: {
                    self.mins.transform = CGAffineTransform(rotationAngle: CGFloat(minute*6)*CGFloat((Double.pi/180)))
                    self.hours.transform = CGAffineTransform(rotationAngle: CGFloat(hour*30)*CGFloat((Double.pi/180)))
                    self.secs.transform = CGAffineTransform(rotationAngle: CGFloat(second*6)*CGFloat((Double.pi/180)))
                })
                
                /*self.mins.transform = CGAffineTransform(rotationAngle: CGFloat(minute*6)*CGFloat((Double.pi/180)))
                self.hours.transform = CGAffineTransform(rotationAngle: CGFloat(hour*30)*CGFloat((Double.pi/180)))
                self.secs.transform = CGAffineTransform(rotationAngle: CGFloat(second*6)*CGFloat((Double.pi/180)))*/
                
            }else{
                print("TUTTO ROTTOOOOOOO")
            }
        }
    }


}

