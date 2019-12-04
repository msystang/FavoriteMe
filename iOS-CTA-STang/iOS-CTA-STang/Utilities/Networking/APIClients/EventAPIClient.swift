//
//  EventAPIClient.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/3/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

class EventAPIClient {
    
    // MARK: - Static Properties
    
    static let manager = EventAPIClient()
    
    // MARK: - Instance Methods
    
    static func getSearchResultsURLStr(from searchString: String) -> String {
        return "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=\(Secrets.ticketmasterAPIKey)&keyword=\(searchString)&&city=New%20York"
    }
    
    func getEvent(urlStr: String, completionHandler: @escaping (Result<[Event], AppError>) -> ())  {
        
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
                    let eventInfo = try TicketmasterResponse.decodeEventsFromData(from: data)
                    completionHandler(.success(eventInfo))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
                
            }
        }
    }
    
    // MARK: - Private Properties and Initializers
    
    private init() {}
}
