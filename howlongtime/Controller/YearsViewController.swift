//
//  YearsViewController.swift
//  howlongtime
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class YearsViewController: UIViewController {
    
    @IBOutlet var yearsLabel: UILabel!
    
    var start: Date?
    var end: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "years"
        
        guard let start = self.start else { return }
        guard let end = self.end else { return }
        yearsLabel.text = "\(end.years(from: start))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let monthsVC = segue.destination as? MonthsViewController
        monthsVC?.start = start
        monthsVC?.end = end
    }
    
    
}
