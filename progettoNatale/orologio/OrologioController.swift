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
    let currentDateTime = Date()
    var timer = Timer()
    let date = Date() // save date, so all components use the same date
    let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        labelWatch.text = "h \(hour) m \(minute) s \(second)"
        
        scheduledTimerWithTimeInterval()
    }
    

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        labelWatch.text = "h \(hour) m \(minute) s \(second)"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
