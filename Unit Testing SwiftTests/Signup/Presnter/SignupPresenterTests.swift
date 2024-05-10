//
//  SignupPresenterTests.swift
//  Unit Testing SwiftTests
//
//  Created by ABDELAZiZ EL ARASSi on 9/5/2024.
//

// import XCTest
// @testable import Unit_Testing_Swift

// final class SignupPresenterTests: XCTestCase {

//     override func setUpWithError() throws {
//         // Put setup code here. This method is called before the invocation of each test method in the class.
//     }

//     override func tearDownWithError() throws {
//         // Put teardown code here. This method is called after the invocation of each test method in the class.
//     }
    
    
//     func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
//         // Arrange
        
//         let signupFormModel = SignupFormModel(
//             firstName: "abdelaziz",
//             lastName: "el arassi",
//             email: "abdelaziz@elarassi.com",
//             password: "1234567",
//             repeatPassword: "1234567"
//         )
        
//         let mockSignupModelValidator = MockSignupModelValidator()
        
//         let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
//         // Act
        
//         sut.processUserSignup(formModel: signupFormModel)
        
//         //Assert
        
//         XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated,"First name was not validated")
//         XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
//         XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated, "Email format was not validated")
//         XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
//         XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
        
//     }
    
    
    

// }
