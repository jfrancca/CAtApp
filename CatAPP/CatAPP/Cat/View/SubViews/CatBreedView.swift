//
//  CatBreedView.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatBreedView: View {
    
    let catBreed: CatBreedInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let url = catBreed.imageURL {
                WebImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(.gray)
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.4)
                        .clipped()
                }
            }
            
            VStack(alignment: .leading) {
                Text(catBreed.name)
                    .font(.headline)
                Text(catBreed.origin)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(catBreed.temperament)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

                
