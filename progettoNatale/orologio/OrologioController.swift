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
        
        //scheduledTimerWithTimeInterval()
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
                
                self.mins.transform = CGAffineTransform(rotationAngle: CGFloat(minute*6)*CGFloat((Double.pi/180)))
                self.hours.transform = CGAffineTransform(rotationAngle: CGFloat(hour*30)*CGFloat((Double.pi/180)))
                self.secs.transform = CGAffineTransform(rotationAngle: CGFloat(second*6)*CGFloat((Double.pi/180)))
                
            }else{
                print("TUTTO ROTTOOOOOOO")
            }
        }
    }


}

public extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.x, y: -origin.y,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}
