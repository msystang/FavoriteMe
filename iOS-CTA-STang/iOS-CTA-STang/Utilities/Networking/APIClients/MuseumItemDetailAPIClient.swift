//
//  MuseumItemDetailAPIClient.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/5/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

class MuseumItemDetailAPIClient {
    
    //MARK: - Static Properties
    
    static let manager = MuseumItemDetailAPIClient()
    
    //MARK: - Instance Methods
    
    static func getSearchResultsURLStr(from objectNumber: String) -> String {
        return "https://www.rijksmuseum.nl/api/en/collection/\(objectNumber)?key=\(Secrets.rijksmuseumAPIKey)"
    }
    
    func getMuseumItemDetail(urlStr: String, completionHandler: @escaping (Result<MuseumItemDetail, AppError>) -> ())  {
        
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
                    let museumItemDetailInfo = try MuseumItemDetailWrapper.decodeMuseumItemDetailsFromData(from: data)
                    completionHandler(.success(museumItemDetailInfo))
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
