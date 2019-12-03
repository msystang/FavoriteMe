//
//  Event.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct TicketmasterResponse: Codable {
    let response: EventWrapper
    
    static func decodeEventsFromData(from jsonData: Data) throws -> [Event] {
        let response = try JSONDecoder().decode(TicketmasterResponse.self, from: jsonData)
        return response.response.events
    }
    
    private enum CodingKeys: String, CodingKey {
        case response = "_embedded"
    }
}

struct EventWrapper: Codable {
    let events: [Event]
}

struct Event: Codable {
    let name: String
    let id: String
    let url: String
    let images: [EventImage]
    let dates: EventDateWrapper
    let priceRanges: [EventPrice]?
    let venueInfo: EventVenueWrapper
    
    private enum CodingKeys: String, CodingKey {
        case name, id, url, images, dates, priceRanges
        case venueInfo = "_embedded"
    }
}

//Use 4th index
struct EventImage: Codable {
    let url: String
}


struct EventDateWrapper: Codable {
    let start: EventDate
}

struct EventDate: Codable {
    let dateTime: String
    
    var formattedDate: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"

        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "MMM d yyyy, h:mm a"
        
        guard let unformattedDate = dateFormatterGet.date(from: dateTime) else { return "N/A" }
        return dateFormatterSet.string(from: unformattedDate)
    }
}

struct EventPrice: Codable {
    let min: Double?
    let max: Double?
}
struct EventVenueWrapper: Codable {
    let venues: [EventVenue]
}

struct EventVenue: Codable {
    let name: String
    
}
