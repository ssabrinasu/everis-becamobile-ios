//
//  AppFilmesTests.swift
//  AppFilmesTests
//
//  Created by Tabata Sabrina Sutili on 29/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import XCTest

@testable import AppFilmes

class AppFilmesTests: XCTestCase {
    var vcDetalhes: DetalhesViewController!
    var api: FilmesAPI!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDetalhesViewController() {
        vcDetalhes = DetalhesViewController()
        vcDetalhes.viewDidLoad()
        XCTWaiterDelegate
    }

    func testRequestNotNil() {
        api = FilmesAPI()
        XCTAssertNotNil(api.makeRequest(), "Not nil")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

