//
//  RickAndMortyExplorerUITests.swift
//  RickAndMortyExplorerUITests
//
//  Created by shirish gayakawad on 30/03/25.
//

//import XCTest
//
//final class RickAndMortyExplorerUITests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
//}
// RickAndMortyExplorerUITests.swift
import XCTest

final class RickAndMortyExplorerUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
    }

    func testCharacterListLoading() {
        let characterListTable = app.tables["characterList"]
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: characterListTable)
        let result = XCTWaiter().wait(for: [expectation], timeout: 50)
        XCTAssertEqual(result, .completed, "Character list table should appear within 50 seconds")
    }

    func testCharacterDetailView() {
            let characterList = app.tables["characterList"]
            
            // Wait for the table to appear
            XCTAssertTrue(characterList.waitForExistence(timeout: 50), "Character list table should appear within 30 seconds")
        XCTAssertTrue(characterList.cells.count > 0, "Character list should have at least one cell")

        let firstCell = characterList.cells.firstMatch
        print("First cell exists: \(firstCell.exists)")
        firstCell.tap()

          

            let detailView = app.staticTexts["detailViewCharacterName"]
            XCTAssertTrue(detailView.waitForExistence(timeout: 50), "Detail view should appear within 30 seconds")
        }
}
