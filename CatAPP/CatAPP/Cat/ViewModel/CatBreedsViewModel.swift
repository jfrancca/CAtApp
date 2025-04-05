//
//  CatBreedsViewModel.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import Foundation

@MainActor
class CatBreedsViewModel: ObservableObject {
    
    @Published var catsBreedInfo: [CatBreedInfo] = []
    @Published var searchText = ""
    @Published var errorMessage = ""
    
    lazy var serviceNetworking: NetworkingServiceProvider = NetworkingService()

    init(serviceNetworking: NetworkingServiceProvider = NetworkingService()) {
        self.serviceNetworking = serviceNetworking
    }

    var filteredCatsBreed: [CatBreedInfo] {
        if searchText.isEmpty {
            return catsBreedInfo
        } else {
            return catsBreedInfo.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func fetchCatBreeds() async {
        do {
            self.catsBreedInfo = try await serviceNetworking.fetchCatBreeds()
        } catch {
            errorMessage = "Error loading cat breeds"
        }
    }
}
