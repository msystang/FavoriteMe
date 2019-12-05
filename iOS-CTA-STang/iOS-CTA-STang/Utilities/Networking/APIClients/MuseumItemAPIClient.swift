//
//  MuseumItemAPIClient.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/3/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

class MuseumItemAPIClient {
    
    //MARK: - Static Properties
    
    static let manager = MuseumItemAPIClient()
    
    //MARK: - Instance Methods
    
    static func getSearchResultsURLStr(from searchString: String) -> String {
        return "https://www.rijksmuseum.nl/api/en/collection?key=\(Secrets.rijksmuseumAPIKey)&format=json&q=\(searchString)&ps=20"
    }
    
    func getMuseumItem(urlStr: String, completionHandler: @escaping (Result<[MuseumItem], AppError>) -> ())  {
        
        guard let url = URL(string: urlStr) else {
            print(AppError.badURL)
            return
        }
        
        NetworkManager.manager.performDataTask(withUrl: url, andMethod: .get) { (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let museumItemInfo = try RijksmuseumResponse.decodeMuseumItemsFromData(from: data)
                    completionHandler(.success(museumItemInfo))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
                
            }
        }
    }
    
    //MARK: - Private Properties and Initializers
    
    private init() {}
}
