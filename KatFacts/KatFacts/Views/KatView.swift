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
    
    /// This is our main body always shown after we first load data.
    var mainBody: some View {
        VStack {
            
            Image(uiImage: katViewModel.catImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .shadow(radius: 8)
                .padding(.bottom, 20)
            
            // ScrollView is used here so that arbitraily long facts will
            // be readable.
            ScrollView(.vertical) {
                Text(katViewModel.catFactString)
                    .font(.title2)
                    .foregroundColor(.white)
                
            }
        }
        .padding(20)
    }
    
    var body: some View {
        VStack {
            ZStack {
                //Define a screen color
                LinearGradient (gradient: Gradient(colors:[.blue.opacity(0.2),.blue.opacity(0.9)]),
                                startPoint: .top,
                                endPoint: .bottom)
                    .ignoresSafeArea()
                
                if katViewModel.isCatLoaded {
                    mainBody
                } else {
                    // Our splash screen.
                    Text("KatFacts")
                        .font(.largeTitle)
                        .foregroundColor(.white)
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
}

struct KatView_Previews: PreviewProvider {
    static var previews: some View {
        KatView()
    }
}
