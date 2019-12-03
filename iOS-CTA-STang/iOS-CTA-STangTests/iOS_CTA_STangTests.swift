//
//  iOS_CTA_STangTests.swift
//  iOS-CTA-STangTests
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import XCTest
@testable import iOS_CTA_STang

class iOS_CTA_STangTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Event Model
    func testEventModelDecode() {
        guard let jsonPath = Bundle.main.path(forResource: "eventJSON", ofType: "json") else {
            XCTFail("Could not find eventJSON file")
            return
        }
        
        let jsonURL = URL(fileURLWithPath: jsonPath)
        var eventJSONData = Data()
        
        do {
            eventJSONData = try Data(contentsOf: jsonURL)
        } catch {
            XCTFail("\(error)")
        }
        
        // Act
        var events = [Event]()
        
        do {
            let eventInfo = try TicketmasterResponse.decodeEventsFromData(from: eventJSONData)
            events = eventInfo
        } catch {
            XCTFail("\(error)")
        }
        
        // Assert
        XCTAssertTrue(events.count == 20, "Was expecting 20 best sellers, but found \(events.count)")
    }

}
