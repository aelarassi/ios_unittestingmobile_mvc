//
//  SignupPresenter.swift
//  Unit Testing Swift
//
//  Created by ABDELAZiZ EL ARASSi on 9/5/2024.
//

// import Foundation

// class SignupPresenter {
    
//     private var formModelValidator:SignupModelValidatorProtocol
    
//     init(formModelValidator: SignupModelValidatorProtocol) {
//         self.formModelValidator = formModelValidator
//     }
    
//     func processUserSignup(formModel: SignupFormModel) {
//         if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
//             return
//         }
        
//         if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
//             return
//         }
        
//         if !formModelValidator.isEmailValidFormat(email: formModel.email) {
//             return
//         }
        
//         if !formModelValidator.isPasswordValid(password: formModel.password) {
//             return
//         }
        
//         if !formModelValidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
//             return
//         }
//     }
// }
