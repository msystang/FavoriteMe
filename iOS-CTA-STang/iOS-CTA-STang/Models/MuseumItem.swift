//
//  Item.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct RijksmuseumResponse: Codable {
    let museumItems: [MuseumItem]
    
    static func decodeMuseumItemsFromData(from jsonData: Data) throws -> [MuseumItem] {
        let response = try JSONDecoder().decode(RijksmuseumResponse.self, from: jsonData)
        return response.museumItems
    }
    
    private enum CodingKeys: String, CodingKey {
        case museumItems = "artObjects"
    }
}

struct MuseumItem: Codable {
    let links: Link
    let title: String
    let principalOrFirstMaker: String

}

struct Link: Codable {
    let web: String
}
