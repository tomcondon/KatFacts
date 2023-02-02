//
//  ContentView.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

/// Not much to say here, hope to add a splash screen until the first data loads.
struct ContentView: View {
    var body: some View {
        VStack {
            KatView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
