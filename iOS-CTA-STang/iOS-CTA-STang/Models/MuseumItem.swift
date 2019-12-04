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

struct MuseumItem: Codable, Favoritable {
    //MARK: - Codable Properties
    private let longTitle: String
    private let objectNumber: String
    let principalOrFirstMaker: String
    let productionPlaces: [String]
    private let webImage: ItemImage
    
    //MARK: - Favoritable Properties
    var id: String {
        return self.objectNumber
    }
    
    var photoUrl: String {
        return self.webImage.url
    }
    
    var name: String {
        return self.longTitle
    }
    
    var details: String {
        return self.productionPlaces[0]
    }
    
    var isEvent: Bool? {
        return false
    }
    
    var eventPrice: String? {
        return nil
    }
    
    var eventLink: String? {
        return nil
    }
    
    var isMuseumItem: Bool? {
        return true
    }
}

struct Link: Codable {
    let web: String
}

struct ItemImage: Codable {
    let url: String
}
