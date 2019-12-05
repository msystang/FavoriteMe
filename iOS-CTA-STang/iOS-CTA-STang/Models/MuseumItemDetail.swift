//
//  MuseumItemDetail.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/4/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct MuseumItemDetailWrapper: Codable {
    let artObject: MuseumItemDetail
    
    static func decodeMuseumItemDetailsFromData(from jsonData: Data) throws -> MuseumItemDetail {
    let response = try JSONDecoder().decode(MuseumItemDetailWrapper.self, from: jsonData)
        return response.artObject
    }
}

struct MuseumItemDetail: Codable {
    //URL to use: https://www.rijksmuseum.nl/api/en/collection/\(objectNumber)?key=\(Secrets.rijksmuseumAPIKey)
    
    let objectNumber: String
    let plaqueDescriptionEnglish: String
    
}
