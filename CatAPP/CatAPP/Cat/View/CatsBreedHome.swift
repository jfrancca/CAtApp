//
//  CatsBreedHome.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import SwiftUI

struct CatsBreedHome: View {
    
    @StateObject var viewModel = CatBreedsViewModel()

    var body: some View {
        NavigationView {
            if !viewModel.errorMessage.isEmpty {
                VStack(spacing: 8) {
                        Image(systemName: "tray")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        Text(viewModel.errorMessage)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                VStack {
                    TextField("Search by race", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.filteredCatsBreed) { breed in
                                NavigationLink(destination: CatBreedDetailView(catBreed: breed)) {
                                    CatBreedView(catBreed: breed)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Cat Breeds")
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .task {
            await viewModel.fetchCatBreeds()
        }
    }
}
