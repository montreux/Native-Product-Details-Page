//
//  Native_Product_Details_PageTests.swift
//  Native Product Details PageTests
//
//  Created by John Holcroft on 22/10/2015.
//  Copyright © 2015 Marks and Spencer. All rights reserved.
//

import XCTest
@testable import Native_Product_Details_Page

class Native_Product_Details_PageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsAlive() {
        
        print("Making request")
        
        let expectation = expectationWithDescription("Getting data")

        let productService = MSProductService(baseURL: "http://product-catalog.mnsdigitallabs.net")
        
        productService.product(productID: "P22386849") {
            (product) -> Void in
            
            if let productDescription = product?.description2 {
                print(productDescription)

                print(product!.priceSummary.description)
            }
            
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(10) { (error) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
