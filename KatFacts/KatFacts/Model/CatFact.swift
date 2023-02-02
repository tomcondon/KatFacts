//
//  CatFact.swift
//  KatFacts
//
//  Created by Thomas Condon on 2/1/23.
//

import Foundation

/// Struct we decode a cat fact(s) into.
/// - Note: The REST API is capable of returning multiple facts in a single call
/// decoding this data structure.
struct CatFact: Decodable {
    let data: [String]
}
