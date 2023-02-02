//
//  EndPoint.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import Foundation

/// Cool approach to integrate async networking calls with Codables
/// Kudos to Paul Hudson and HackingWithSwift+ live event in the last week or so.
/// Just had to try.
/// See: https://www.hackingwithswift.com/plus/unwrap-live-2023/modern-safe-networking if you have paid for it.
/// This guy is brilliant. And did this owning Samoyed!. Inside joke? Paul would get it. I have 2 and dogsit a third during the weekdays.
/// TREATS!
struct Endpoint<T: Decodable> {
    var url: URL?
    var type: T.Type
}

/// Make a simple endpoint for a HTTP GET where the return will be a Decodable CatFact.
extension Endpoint where T == CatFact {
    static let catFact = Endpoint(url: URL(string: "https://meowfacts.herokuapp.com/"), type: CatFact.self)
}

/// This is specific to grabbing an image for this coding test
/// that approximates the `Endpoint<T: Decodable>` style. Ripe for further development.
/// Arbitary images sizes were not considered in this code example.
struct ImageEndpoint {
    var url: URL?
}

/// Extends ImageEndPoint for this coding challenge. Needed to understand the way to get
/// placekitten image api random image api behavior.
/// Hint: https://webapps.stackexchange.com/questions/79806/can-we-force-a-new-kitten-with-the-same-dimensions
extension ImageEndpoint {
    static var catImage = ImageEndpoint(url: URL(string: "http://placekitten.com/200/300"))
    
    /// Build a new random image ImageEndpoint
    /// Size is constant.
    static func randomizeCatImage() {
        let baseURLStr = "http://placekitten.com/200/300"
        let imageNumber = Int.random(in: 1...16)
        let urlString = baseURLStr + "?image=\(imageNumber)"
        catImage = ImageEndpoint(url: URL(string: urlString))
    }
}
