//
//  howlongtimeUITests.swift
//  howlongtimeUITests
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import XCTest
@testable import howlongtime

class howlongtimeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHowLongTimeMain() {
        //pegando ano atual
        let year = Calendar.current.component(.year, from: Date())
        
        //pegando dia atual
        let day = Calendar.current.component(.day, from: Date())
        
        //pegando mês atual
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        let monthName = formatter.string(from: Date())
        
        //entrando com dados
        let app = XCUIApplication()
        let datePickersQuery = app.datePickers
        datePickersQuery.pickerWheels["\(year)"].adjust(toPickerWheelValue: "1993")
        datePickersQuery.pickerWheels["\(day)"].adjust(toPickerWheelValue: "26")
        datePickersQuery.pickerWheels[monthName].adjust(toPickerWheelValue: "April")
        app.otherElements.containing(.navigationBar, identifier:"how long time?").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1).tap()
        datePickersQuery.pickerWheels["1993"].adjust(toPickerWheelValue: "2002")
        datePickersQuery.pickerWheels["26"].adjust(toPickerWheelValue: "19")
        datePickersQuery.pickerWheels["April"].adjust(toPickerWheelValue: "February")
        app.buttons["Done"].tap()
        
        //testando anos
        XCTAssert(app.staticTexts["9"].exists, "Resultado deveria ser 8")
        
        app.buttons["months"].tap()
        
        //testando meses
        XCTAssert(app.staticTexts["105"].exists, "Resultado deveria ser 105")
        
        app.buttons["weeks"].tap()
        
        //testando semanas
        XCTAssert(app.staticTexts["460"].exists, "Resultado deveria ser 460")
        
        app.buttons["days"].tap()
        
        //testando dias
        XCTAssert(app.staticTexts["3221"].exists, "Resultado deveria ser 3221")
        
        app.buttons["home"].tap()
        
    }
    
}
