//
//  WeeksViewController.swift
//  howlongtime
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//


import UIKit

class WeeksViewController: UIViewController {
    
    @IBOutlet var weeksLabel: UILabel!
    
    var start: Date?
    var end: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "weeks"
        
        guard let start = self.start else { return }
        guard let end = self.end else { return }
        self.weeksLabel.text = "\(end.weeks(from: start))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let daysVC = segue.destination as? DaysViewController
        daysVC?.start = start
        daysVC?.end = end
    }
    
    
}
