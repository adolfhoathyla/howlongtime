//
//  DateEx.swift
//  howlongtime
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

extension Date {
    
    func brazilianFormatStringDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
    
    static func dateFromBrazilianFormat(brazilianFormat: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: brazilianFormat)!
    }
    
    func isPrevThan(date: Date) -> Bool {
        return self.compare(date) == .orderedAscending
    }
    
    func getYear() -> Int {
        return Calendar.current.component(.year, from: self)
    }
    
    func getMonthName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        return formatter.string(from: self)
    }
    
    func getDays() -> Int {
        return Calendar.current.component(.day, from: self)
    }
    
}
