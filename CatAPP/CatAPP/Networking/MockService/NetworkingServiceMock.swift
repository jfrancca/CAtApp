//
//  NetworkingServiceMock.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import Foundation

final class NetworkingServiceMock: NetworkingServiceProvider {
    
    var fetchCatBreedsCount = 0
    var shouldThrowError = false
    var mockData: [CatBreedInfo] = []
    
    func fetchCatBreeds() async throws -> [CatBreedInfo] {
        fetchCatBreedsCount += 1
        
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        
        return mockData
    }
}
