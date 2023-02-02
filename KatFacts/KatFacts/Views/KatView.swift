//
//  KatView.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

/// The main view the user sees. Very simple.
struct KatView: View {
    @StateObject private var katViewModel = KatViewModel()
    var body: some View {
        VStack {
            Image(uiImage: katViewModel.catImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20.0)
            // ScrollView is used here so that arbitraily large facts will
            // be readable.
            ScrollView(.vertical) {
                Text(katViewModel.catFactString)
                    .font(.body)
                    .padding()
            }
        }
        // This will get called exactly once.
        .task {
            katViewModel.fetchAllData()
            
        }
        // This will get called on every "single" tap gesture.
        .onTapGesture {
            katViewModel.fetchAllData()
        }
    }
}

struct KatView_Previews: PreviewProvider {
    static var previews: some View {
        KatView()
    }
}
