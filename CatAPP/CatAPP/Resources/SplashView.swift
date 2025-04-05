//
//  SplashView.swift
//  The-cat-api
//
//  Created by juan camilo on 4/04/25.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false

    var body: some View {
        if isActive {
            CatsBreedHome()
        } else {
            VStack {
                Image(systemName: "cat.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Cat Breeds")
                    .font(.largeTitle)
                    .bold()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        }
    }
}
