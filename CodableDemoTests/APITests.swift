//
//  APITests.swift
//  CodableDemoTests
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import XCTest
@testable import CodableDemo

class APITests: XCTestCase {
 
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
}

//MARK: - Test API

extension APITests {
    
    func testMovieListAPI() {
        
        let viewModel = MovieViewModel()
        
        let expectation = self.expectation(description: "Test Movie API")
        
        MovieProxy.movieList(APIConfiguration(), successCompletion: { (result) in
            
            viewModel.movies = result.movie ?? []
            
            expectation.fulfill()

        }) { (error) in
            print(error)
        }
        
        waitForExpectations(timeout: 30) { (error) in
            
            XCTAssertNotNil(viewModel.movies)
            
            XCTAssertEqual(viewModel.movies.first?.type, "movie")
        }
    }
}
