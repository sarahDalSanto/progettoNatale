//
//  OrologioController2.swift
//  progettoNatale
//
//  Created by Sarah Dal Santo on 28/12/18.
//  Copyright © 2018 Sarah Dal Santo. All rights reserved.
//

import UIKit

class OrologioController2: UIViewController {
    
    
    @IBOutlet weak var secs: UIView!
    @IBOutlet weak var hours: UIView!
    @IBOutlet weak var mins: UIView!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var clockView: UIView!
    @IBOutlet weak var buttonTabBar: UITabBarItem!
    
    var timer : Timer!
    let date = Date() // save date, so all components use the same date
    let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        var title = FRC().getStrings(name: "item2_tabBar")
        buttonTabBar.title = title
        
        clockLabel.text = "h \(hour) m \(minute) s \(second)"
        clockView.layer.cornerRadius = 104
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
                
                self.clockLabel.text = "h \(hour) m \(minute) s \(second)"
                
                //at least i tried :')
                self.mins.layer.anchorPoint = CGPoint(x: 0, y: 1)
                self.mins.transform = CGAffineTransform(rotationAngle: CGFloat(minute*6)*CGFloat((Double.pi/180)))
                
                self.hours.layer.anchorPoint = CGPoint(x: 0, y: 1)
                self.hours.transform = CGAffineTransform(rotationAngle: CGFloat(hour*30)*CGFloat((Double.pi/180)))
                
                self.secs.layer.anchorPoint = CGPoint(x: 0, y: 1)
                self.secs.transform = CGAffineTransform(rotationAngle: CGFloat(second*6)*CGFloat((Double.pi/180)))
                
            }else{
                print("TUTTO ROTTOOOOOOO")
            }
        }
    }
    

}
