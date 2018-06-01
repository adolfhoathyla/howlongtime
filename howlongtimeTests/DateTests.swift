//
//  DateTests.swift
//  howlongtimeTests
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//


import XCTest
@testable import howlongtime

class DateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testYears() {
        let start = Date.dateFromBrazilianFormat(brazilianFormat: "26/04/1993")
        let end = Date.dateFromBrazilianFormat(brazilianFormat: "31/05/2018")
        XCTAssertEqual(end.years(from: start), 25)
    }
    
    func testMonths() {
        let start = Date.dateFromBrazilianFormat(brazilianFormat: "09/02/2017")
        let end = Date.dateFromBrazilianFormat(brazilianFormat: "30/05/2018")
        XCTAssertEqual(end.months(from: start), 15)
    }
    
    func testWeeks() {
        let start = Date.dateFromBrazilianFormat(brazilianFormat: "03/05/2018")
        let end = Date.dateFromBrazilianFormat(brazilianFormat: "29/05/2018")
        XCTAssertEqual(end.weeks(from: start), 3)
    }
    
    func testDays() {
        let start = Date.dateFromBrazilianFormat(brazilianFormat: "05/05/2018")
        let end = Date.dateFromBrazilianFormat(brazilianFormat: "30/05/2018")
        XCTAssertEqual(end.days(from: start), 25)
    }
    
    func testYear() {
        let date = Date.dateFromBrazilianFormat(brazilianFormat: "29/03/2017")
        XCTAssertEqual(date.getYear(), 2017)
    }
    
    func testDay() {
        let date = Date.dateFromBrazilianFormat(brazilianFormat: "26/04/1993")
        XCTAssertEqual(date.getDays(), 26)
    }
    
    func testeMonthName() {
        let date = Date.dateFromBrazilianFormat(brazilianFormat: "26/04/2007")
        XCTAssertEqual(date.getMonthName(), "April")
    }
    
}
