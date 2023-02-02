//
//  KatServerClient.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

/// Server client for network requests composed for this simple app.
/// Function signature will give a hint to the nature of the network call.
/// A kind of composition.
class KatServerClient {
    /// This is the coolest call. Given a relatively simple endpoint with Type,
    /// returns a Decodable using `async throws` semantics.
    public func get<T: Decodable>(_ endpoint: Endpoint<T>) async throws -> T? {
        guard let url = endpoint.url else { return nil }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    /// This is a more pedestrain call to fetch an image using `async throws` semantics.
    public func getImage(_ imageEndpoint: ImageEndpoint) async throws -> UIImage? {
        guard let url = imageEndpoint.url else { return nil }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return UIImage(data: data)
    }
}
