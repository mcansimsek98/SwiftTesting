//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by Mehmet Can Şimşek on 25.08.2022.
//

import XCTest

class SwiftTestingUITests: XCTestCase {


    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["SwiftTesting.View"].buttons["add"]
       
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let okButton = elementsQuery.buttons["OK"]
        
        let adedCell = app.tables.cells.containing(.staticText, identifier:"fdsfsaf").element
       
        addButton.tap()
        textField.tap()
        textField.typeText("fdsfsaf")
        okButton.tap()
        
        XCTAssertTrue(adedCell.exists)
        
    }
    
    func testDeleteItem() throws {
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["SwiftTesting.View"].buttons["add"]
       
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let okButton = elementsQuery.buttons["OK"]
        
        let adedCell = app.tables.cells.containing(.staticText, identifier:"fdsfsaf").element
       
        //tables
        let tablesQuery = app.tables
        let deleteButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        addButton.tap()
        textField.tap()
        textField.typeText("fdsfsaf")
        okButton.tap()
        
        adedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(adedCell.exists)
        
             
    }

   
}

