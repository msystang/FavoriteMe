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

struct Event: Codable, Favoritable {
    private let name: String
    let id: String
    private let url: String
    private let images: [EventImage]
    private let dates: EventDateWrapper
    private let priceRanges: [EventPrice]?
    
    private var formattedDate: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "MMM d yyyy, h:mm a"
        
        guard let unformattedDate = dateFormatterGet.date(from: self.dates.start.dateTime ?? "") else { return "No Date Posted" }
        return dateFormatterSet.string(from: unformattedDate)
    }
    
    private var priceRange: String {
        guard let priceRanges = priceRanges,
        let minPrice = priceRanges[0].min,
        let maxPrice = priceRanges[0].max else { return "No Price Posted" }
        
        let minFormatted = String(format: "%.2f", minPrice)
        let maxFormatted = String(format: "%.2f", maxPrice)
        return "$\(minFormatted) - $\(maxFormatted)"
    }
    
    //Protocol Properties
    var photoUrl: String {
        return self.images[3].url
    }
    
    var isEvent: Bool? {
        return true
    }
    
    var eventName: String? {
        return self.name
    }
    
    var eventTimeDate: String? {
        return self.formattedDate
    }
    
    var eventPrice: String? {
        //TODO: Create computed property for price range
        return self.priceRange
    }
    
    var eventLink: String? {
        return self.url
    }
    
    internal var isMuseumItem: Bool? {
        return false
    }
    
    internal var itemName: String? {
        return nil
    }
    
    internal var itemDescription: String? {
        return nil
    }
    
    internal var itemDateCreated: String? {
        return nil
    }
    
    internal var itemPlaceProduced: String? {
        return nil
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
    let dateTime: String?
}

struct EventPrice: Codable {
    let min: Double?
    let max: Double?
}
