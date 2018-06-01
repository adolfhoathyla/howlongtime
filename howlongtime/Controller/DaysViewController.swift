//
//  DaysViewController.swift
//  howlongtime
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//


import UIKit

class DaysViewController: UIViewController {
    
    @IBOutlet var daysLabel: UILabel!
    
    var start: Date?
    var end: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "days"
        
        guard let start = self.start else { return }
        guard let end = self.end else { return }
        self.daysLabel.text = "\(end.days(from: start))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - actions
    @IBAction func backToHome(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
