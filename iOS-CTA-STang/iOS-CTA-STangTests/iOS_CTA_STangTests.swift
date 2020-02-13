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
        XCTAssertTrue(events.count == 20, "Was expecting 20 events, but found \(events.count)")
    }
    
    // MARK: - MuseumItem Model
    func testMuseumItemModelDecode() {
        guard let jsonPath = Bundle.main.path(forResource: "museumItemJSON", ofType: "json") else {
            XCTFail("Could not find museumItemJSON file")
            return
        }
        
        let jsonURL = URL(fileURLWithPath: jsonPath)
        var museumItemJSONData = Data()
        
        do {
            museumItemJSONData = try Data(contentsOf: jsonURL)
        } catch {
            XCTFail("\(error)")
        }
        
        // Act
        var museumItems = [MuseumItem]()
        
        do {
            let museumItemInfo = try RijksmuseumResponse.decodeMuseumItemsFromData(from: museumItemJSONData)
            museumItems = museumItemInfo
        } catch {
            XCTFail("\(error)")
        }
        
        // Assert
        XCTAssertTrue(museumItems.count == 20, "Was expecting 20 museum items, but found \(museumItems.count)")
    }
    
    // MARK: - MuseumItemDetail Model
    func testMuseumItemDetailModelDecode() {
        guard let jsonPath = Bundle.main.path(forResource: "museumItemDetailJSON", ofType: "json") else {
            XCTFail("Could not find museumItemDetailJSON file")
            return
        }
        
        let jsonURL = URL(fileURLWithPath: jsonPath)
        var museumItemDetailJSONData = Data()
        
        do {
            museumItemDetailJSONData = try Data(contentsOf: jsonURL)
        } catch {
            XCTFail("\(error)")
        }
        
        // Act
        var museumItemDetails: MuseumItemDetail?
        
        do {
            let museumItemDetailsInfo = try MuseumItemDetailWrapper.decodeMuseumItemDetailsFromData(from: museumItemDetailJSONData)
            museumItemDetails = museumItemDetailsInfo
        } catch {
            XCTFail("\(error)")
        }
        
        // Assert
        if let museumItemDetails = museumItemDetails {
            XCTAssertTrue(museumItemDetails.objectNumber == "SK-C-5", "Was expecting objectNumber 'SK-C-5', but found \(museumItemDetails.objectNumber)")
        } else {
            XCTFail("Found nil data")
        }
    }

}
