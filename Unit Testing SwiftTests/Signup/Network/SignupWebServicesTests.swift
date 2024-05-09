//
//  SignupWebServicesTests.swift
//  Unit Testing SwiftTests
//
//  Created by ABDELAZiZ EL ARASSi on 8/5/2024.
//

import XCTest
@testable import Unit_Testing_Swift

final class SignupWebServicesTests: XCTestCase {
    var sut: SignupWebServices!
    var signFormRequestModel: SignFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
         signFormRequestModel = SignFormRequestModel(
            firstName: "abdelaziz",
            lastName: "el arassi",
            email: "abdelaziz@elarassi.com",
            password: "1234567"
        )
        sut = SignupWebServices(url: SignupConstants.SignupUrlString, urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func test_signupWebServices_WhenSuccess_ReturnSuccess() {
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup web services response expection")
        
        // Act
        sut.signup(widthForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func test_signupWebServices_WhenSuccessWithDifferentResponse_ErrorTokePlace() {
        // Arrange
        
        let jsonString = "{\"message\":\"Missing Authentication Token\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                
        let expectation = self.expectation(description: "Signup web services response expection")
        
        // Act
        sut.signup(widthForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.invalidResponseModel)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func test_signupWebServices_WhenEmptyURLStringProvided_ReturnError() {
        // Arrange
        let expectation = self.expectation(description: "Handle Error empty url request")
        sut = SignupWebServices(url: "")
        
        //act
        sut.signup(widthForm: signFormRequestModel) { signupResponseModel, error in
            XCTAssertEqual(error, SignupError.invalidRequestURLString)
            XCTAssertNil(signupResponseModel)
            expectation.fulfill()
        }
        
        //Assert
        self.wait(for: [expectation], timeout: 2)
    }
    
    func test_signupWebServices_WhenURLRequestFails_ReturnErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description: "A failed url request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)

        // Act
        sut.signup(widthForm: signFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription))
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 2)
    }
}
