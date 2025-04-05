//
//  CatBreedDetailView.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatBreedDetailView: View {
    
    let catBreed: CatBreedInfo

    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                if let url = catBreed.imageURL {
                    WebImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .clipped()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .foregroundColor(.gray)
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.4)
                            .clipped()
                    }
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(catBreed.description)
                        
                        HStack {
                            Text("Origin:").bold()
                            Text(catBreed.origin)
                        }.padding(.top, 4)
                        
                        HStack {
                            Text("Temperament:").bold()
                            Text(catBreed.temperament)
                        }
                        
                        HStack {
                            Text("Life expectancy:").bold()
                            Text(catBreed.lifeSpan)
                            Text("years")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(catBreed.name)
    }
}
