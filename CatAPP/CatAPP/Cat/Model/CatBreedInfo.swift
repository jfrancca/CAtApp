//
//  CatBreedInfo.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import Foundation

struct CatBreedInfo: Identifiable, Codable {

    let id: String
    let name: String
    let temperament: String
    let origin: String
    let description: String
    let lifeSpan: String
    let referenceImageID: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case description
        case lifeSpan = "life_span"
        case referenceImageID = "reference_image_id"
    }

    var imageURL: URL? {
        guard let referenceImageID else { return nil }
        
        return URL(string: "\(Routes.catBreedsImages)\(referenceImageID).jpg")
    }
}
