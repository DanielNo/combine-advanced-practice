//
//  CountriesViewModelTests.swift
//  rxswiftpracticeTests
//
//  Created by Daniel No on 11/7/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import XCTest
@testable import rxswiftpractice

class CountriesViewModelTests: XCTestCase {
    let viewModel = CountriesViewModel()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchCount() {
        viewModel.searchText(searchText: "united states")
        XCTAssert(viewModel.shownCountryData.value.count == 1)
        
        viewModel.searchText(searchText: "af")
        XCTAssert(viewModel.shownCountryData.value.count == 3)

        viewModel.searchText(searchText: "us")
        XCTAssert(viewModel.shownCountryData.value.count == 7)
        
        viewModel.searchText(searchText: "rus")
        XCTAssert(viewModel.shownCountryData.value.count == 3)

    }
    
    func testSearchContents(){
        viewModel.searchText(searchText: "us")
        print(viewModel.shownCountryData.value)
        XCTAssertEqual(viewModel.shownCountryData.value[0], "Australia")
        XCTAssertEqual(viewModel.shownCountryData.value[1], "Austria")
        XCTAssertEqual(viewModel.shownCountryData.value[2], "Belarus")
        XCTAssertEqual(viewModel.shownCountryData.value[3], "Cyprus")
        XCTAssertEqual(viewModel.shownCountryData.value[4], "Mauritius")
        XCTAssertEqual(viewModel.shownCountryData.value[5], "Russia")
        XCTAssertEqual(viewModel.shownCountryData.value[6], "United States of America (USA)")

        viewModel.searchText(searchText: "ba")
        XCTAssertEqual(viewModel.shownCountryData.value[0], "Albania")
        XCTAssertEqual(viewModel.shownCountryData.value[1], "Antigua and Barbuda")
        XCTAssertEqual(viewModel.shownCountryData.value[2], "Azerbaijan")
        XCTAssertEqual(viewModel.shownCountryData.value[3], "Bahamas")
        XCTAssertEqual(viewModel.shownCountryData.value[4], "Bahrain")
        XCTAssertEqual(viewModel.shownCountryData.value[5], "Bangladesh")
        XCTAssertEqual(viewModel.shownCountryData.value[6], "Barbados")
        XCTAssertEqual(viewModel.shownCountryData.value[7], "Cuba")
        XCTAssertEqual(viewModel.shownCountryData.value[8], "Kiribati")
        XCTAssertEqual(viewModel.shownCountryData.value[9], "Lebanon")
        XCTAssertEqual(viewModel.shownCountryData.value[10], "Trinidad and Tobago")
        XCTAssertEqual(viewModel.shownCountryData.value[11], "Zimbabwe")

    }
    
    
}
