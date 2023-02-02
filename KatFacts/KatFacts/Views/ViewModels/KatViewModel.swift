//
//  KatViewModel.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

/// Make cats facts retrieval errors silent while giving the user appropriate feedback
let catFactErrorResultString = "No new cat facts this time, try again!"

/// This is forced unwrapping (bad in almost aways) but it works here because if the runtime
/// cannot do this then it is a general program failure and is covered by a unit test.
let placeholderImage = UIImage(systemName: "questionmark.app.dashed")!

/// The KatView model contains the published data for the KatView
/// Modifying published properties require being on the main thread.
@MainActor
class KatViewModel: ObservableObject {
    @Published var catImage: UIImage = placeholderImage
    @Published var catFactString: String = catFactErrorResultString
    
    let restClient = KatServerClient()
    
    /// Return a new cat fact while returning a generic cat facte error string if
    /// something goes wrong
    func fetchCatFact() async -> String {
        guard let catFact = try? await restClient.get(.catFact),
              let newCatFact = catFact.data.first else {
            return catFactErrorResultString
        }
        return newCatFact
    }
    
    /// Return a new cat image while returning a generic image empty image if
    /// something goes wrong
    func fetchCatImage() async -> UIImage {
        ImageEndpoint.randomizeCatImage()
        guard let fetchedCatImage = try? await restClient.getImage(.catImage) else {
            return placeholderImage
        }
        return fetchedCatImage
    }
    
    /// Fetches both the random cat image and cat fact
    /// - NOTE: This use `async let` to ensure that all data from disparate sources are delivered simultaneously
    func fetchAllData() {
        Task {
            async let factString = fetchCatFact()
            let image = await fetchCatImage()
            
            catFactString = await factString
            catImage = image
        }
    }
}
