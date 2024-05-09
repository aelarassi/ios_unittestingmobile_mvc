//
//  SignFormRequestModel.swift
//  Unit Testing Swift
//
//  Created by ABDELAZiZ EL ARASSi on 8/5/2024.
//

import Foundation

struct SignFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
