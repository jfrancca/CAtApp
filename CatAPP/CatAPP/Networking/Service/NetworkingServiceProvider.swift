//
//  NetworkingServiceProvider.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

protocol NetworkingServiceProvider {
    
    func fetchCatBreeds() async throws -> [CatBreedInfo]
}
