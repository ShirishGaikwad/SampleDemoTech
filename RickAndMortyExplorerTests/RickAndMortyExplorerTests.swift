//
//  RickAndMortyExplorerTests.swift
//  RickAndMortyExplorerTests
//
//  Created by shirish gayakawad on 30/03/25.
//

//import XCTest
//
//final class RickAndMortyExplorerTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
// RickAndMortyExplorerTests.swift
import XCTest
@testable import RickAndMortyExplorer

final class RickAndMortyExplorerTests: XCTestCase {
    func testFetchCharactersSuccess() {
        let viewModel = ContentViewModel()
        let expectation = XCTestExpectation(description: "Fetch characters")

        APIClient.fetchData(url: "https://rickandmortyapi.com/api/character") { (response: APIResponse?) in
            XCTAssertNotNil(response, "API response should not be nil")
            XCTAssertTrue(response?.results.count ?? 0 > 0, "API response should have characters")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testContentViewModelFetchCharacters() {
        let viewModel = ContentViewModel()
        let expectation = XCTestExpectation(description: "ViewModel fetches characters")

        viewModel.fetchCharacters()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertFalse(viewModel.characters.isEmpty, "ViewModel's characters should not be empty after fetching")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
