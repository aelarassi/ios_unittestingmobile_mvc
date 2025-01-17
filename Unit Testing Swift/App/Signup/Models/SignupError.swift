//
//  SignupErrors.swift
//  Unit Testing Swift
//
//  Created by ABDELAZiZ EL ARASSi on 8/5/2024.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case  invalidResponseModel
    case  invalidRequestURLString
    case  failedRequest(description: String)
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidRequestURLString, .invalidResponseModel:
            return ""
        }
    }
}
