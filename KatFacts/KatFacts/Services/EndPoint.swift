//
//  EndPoint.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import Foundation

struct Endpoint<T: Decodable> {
    var url: URL?
    var type: T.Type
}

extension Endpoint where T == CatFact {
    static let catFact = Endpoint(url: URL(string: "https://meowfacts.herokuapp.com/"), type: CatFact.self)
}

struct ImageEndpoint {
    var urlBase: URL?
    var urlComponents: [String]?
}

extension ImageEndpoint {
    static var catImage = ImageEndpoint(urlBase: URL(string: "http://placekitten.com/200/300"))
}
