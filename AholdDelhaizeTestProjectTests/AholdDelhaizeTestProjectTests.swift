//
//  AholdDelhaizeTestProjectTests.swift
//  AholdDelhaizeTestProjectTests
//
//  Created by Sos Avetyan on 8/17/22.
//

import XCTest
@testable import AholdDelhaizeTestProject

class AholdDelhaizeTestProjectTests: XCTestCase {
    var sut: URLSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
      
        let urlString =  "\(AppConstants.Urls.baseUrl)/\(AppConstants.Urls.collectionTail)?key=0fiuZFh4&involvedMaker=Rembrandt+van+Rijn"
        let url = URL(string: urlString)!
      
      let promise = expectation(description: "Status code: 200")

      let dataTask = sut.dataTask(with: url) { _, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }
    
    func testApiCallCompletes() throws {
      let urlString = "\(AppConstants.Urls.baseUrl)/\(AppConstants.Urls.collectionTail)?key=0fiuZFh4&involvedMaker=Rembrandt+van+Rijn"
      let url = URL(string: urlString)!
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      let dataTask = sut.dataTask(with: url) { _, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)

      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
