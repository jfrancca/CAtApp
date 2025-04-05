//
//  CatBreedsViewModelTests.swift
//  CatAPP
//
//  Created by juan camilo on 4/04/25.
//

import XCTest

@testable import CatAPP

@MainActor
final class CatBreedsViewModelTests: XCTestCase {
    
    var networkingServiceMock: NetworkingServiceMock!
    var viewModel: CatBreedsViewModel!
    
    override func setUp() {
        super.setUp()
        
        networkingServiceMock = NetworkingServiceMock()
        viewModel = CatBreedsViewModel(serviceNetworking: networkingServiceMock!)
    }
    
    override func tearDown() {
        viewModel = nil
        networkingServiceMock = nil
        
        super.tearDown()
    }
    
    // Test: fetch success
    func testFetchCatBreedsSuccess() async throws {
        networkingServiceMock.mockData = [
            CatBreedInfo(id: "idTest",
                         name: "nameTest",
                         temperament: "temperamentTest",
                         origin: "originTest",
                         description: "descriptionTest",
                         lifeSpan: "lifeSpanTest",
                         referenceImageID: "referenceImageIDTest"),
            CatBreedInfo(id: "idTest2",
                         name: "nameTest2",
                         temperament: "temperamentTest",
                         origin: "originTest",
                         description: "descriptionTest",
                         lifeSpan: "lifeSpanTest",
                         referenceImageID: "referenceImageIDTest")
        ]

        let viewModel = CatBreedsViewModel(serviceNetworking: networkingServiceMock)
        
        await viewModel.fetchCatBreeds()
        
        XCTAssertEqual(viewModel.catsBreedInfo.count, 2)
        XCTAssertEqual(networkingServiceMock.fetchCatBreedsCount, 1)
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
    }
    
    // Test: fetch failure
    func testFetchCatBreedsFailure() async {
        networkingServiceMock.shouldThrowError = true
        
        await viewModel.fetchCatBreeds()
        
        XCTAssertTrue(viewModel.catsBreedInfo.isEmpty)
        XCTAssertEqual(networkingServiceMock.fetchCatBreedsCount, 1)
    }
    
    // Test: searchText filtering
    func testSearchTextFiltering() {
        let viewModel = CatBreedsViewModel()
        
        viewModel.catsBreedInfo = [
            CatBreedInfo(id: "idTest",
                         name: "nameTest",
                         temperament: "temperamentTest",
                         origin: "originTest",
                         description: "descriptionTest",
                         lifeSpan: "lifeSpanTest",
                         referenceImageID: "referenceImageIDTest"),
            CatBreedInfo(id: "idTest2",
                         name: "nameTest2",
                         temperament: "temperamentTest",
                         origin: "originTest",
                         description: "descriptionTest",
                         lifeSpan: "lifeSpanTest",
                         referenceImageID: "referenceImageIDTest")
        ]
        
        viewModel.searchText = "nameTest2"
        
        let filtered = viewModel.filteredCatsBreed
        
        XCTAssertEqual(filtered.count, 1)
        XCTAssertEqual(filtered.first?.name, "nameTest2")
        
        viewModel.searchText = "nonexistent"
        
        XCTAssertTrue(viewModel.filteredCatsBreed.isEmpty)
    }
}
