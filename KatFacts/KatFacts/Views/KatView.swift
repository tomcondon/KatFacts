//
//  KatView.swift
//  KatFacts
//
//  Created by Thomas Condon on 1/31/23.
//

import SwiftUI

struct KatView: View {
    @StateObject private var katViewModel = KatViewModel()
    var body: some View {
        VStack {
            Image(uiImage: katViewModel.catImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20.0)
            
            ScrollView(.vertical) {
                Text(katViewModel.catFactString)
                    .font(.body)
                    .padding()
            }
        }
        .task {
            katViewModel.fetchAllData()
            
        }
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
