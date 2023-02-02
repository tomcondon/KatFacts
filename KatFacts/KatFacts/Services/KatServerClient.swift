//
//  KatServerClient.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

class KatServerClient {
    public func get<T: Decodable>(_ endpoint: Endpoint<T>) async throws -> T? {
        guard let url = endpoint.url else { return nil }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func getImage(_ imageEndpoint: ImageEndpoint) async throws -> UIImage? {
        
        guard let url = imageEndpoint.urlBase else { return nil }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return UIImage(data: data)
    }
}
