//
//  KatViewModel.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

let katFactErrorResultString = "No new cat facts this time!"
let placeholderImage = UIImage(systemName: "questionmark.app.dashed")!


/// <#Description#>
@MainActor
class KatViewModel: ObservableObject {
    @Published var catImage: UIImage = placeholderImage
    @Published var catFactString: String = katFactErrorResultString
    
    let restClient = KatServerClient()
    
    /// <#Description#>
    ///
    ///
    func fetchCatFact() async -> String {
        guard let catFact = try? await restClient.get(.catFact),
              let newCatFact = catFact.data.first else {
            return katFactErrorResultString
        }
        return newCatFact
    }
    
    func fetchCatImage() async -> UIImage {
        guard let fetchedCatImage = try? await restClient.getImage(.catImage) else {
            return placeholderImage
        }
        return fetchedCatImage
    }
    
    func fetchAllData() {
        Task {
            async let factString = fetchCatFact()
            async let image = fetchCatImage()
            
            catFactString = await factString
            catImage = await image
        }
        
    }
    
    func randomizeCatURL() {
        
    }
}
