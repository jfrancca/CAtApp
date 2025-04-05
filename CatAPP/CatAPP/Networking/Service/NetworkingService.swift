//
//  NetworkingService.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import Foundation

final class NetworkingService: NetworkingServiceProvider {
    
    func fetchCatBreeds() async throws -> [CatBreedInfo] {
        guard let url = URL(string: Routes.catBreeds) else { return [] }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([CatBreedInfo].self, from: data)
    }
}
