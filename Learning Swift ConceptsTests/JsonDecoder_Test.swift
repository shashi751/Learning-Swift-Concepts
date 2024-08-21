//
//  JsonDecoder_Test.swift
//  Learning Swift ConceptsTests
//
//  Created by Shashi Gupta on 20/08/24.
//

import XCTest
@testable import Learning_Swift_Concepts

final class JsonDecoder_Test: XCTestCase {
    
    func test_ValidUser_Decoding(){
        
        guard let url = Bundle.main.url(forResource: "User", withExtension: "jsons") else {
            return
        }
        
        let expectation = XCTestExpectation(description: "Decoding should succeed")
        
        do{
            let data = try Data(contentsOf: url)
            
            // When
            ResponseHandler().getModelFromResponse(data: data, type: [ResponseElement].self) { result in
                // Then
                switch result {
                case .success(let model):
                    XCTAssertNotNil(model)
                    expectation.fulfill()
                case .failure:
                    XCTFail("Decoding should not fail")
                }
            }
        }
        catch let error{
            print(error.localizedDescription)
        }
        
        
        
        wait(for: [expectation], timeout: 1.0)
    }
}
